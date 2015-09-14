#!/usr/bin/env python
#coding=utf8
"""
# Author: f
# Created Time : Sat 12 Sep 2015 12:49:32 AM CST

# File Name: get_server_type.py
# Description:

"""

import sys
reload(sys)
sys.setdefaultencoding('utf-8')
import socket
import json
import os
import os.path

__path__ = os.path.dirname(os.path.abspath(__file__))

#每个机器的角色分配
#pkuph_ks_slave = [
#    's12.pkuph-ks.com',        
#    's13.pkuph-ks.com',        
#    's14.pkuph-ks.com',        
#    's15.pkuph-ks.com',        
#    's16.pkuph-ks.com',        
#    's17.pkuph-ks.com',        
#    's18.pkuph-ks.com',        
#    's19.pkuph-ks.com',        
#    's20.pkuph-ks.com',        
#]
#server_spec = {
#    'm.com' : {
#        'puppet_master' : ['dev1.m.com'],
#        'hbase_thrift' : ['dev1.m.com'],
#        'puppet_agent' : ['dev0.m.com'],
#        'puppetdb_server' : ['dev1.m.com']
#    },
#    'pkuph-ks.com' : {
#        'puppet_master' : ['s11.pkuph-ks.com'],
#        'hbase_thrift' : ['s11.pkuph-ks.com'],
#        'puppet_agent' : pkuph_ks_slave
#    }
#}
server_spec = {}
with open(os.path.join(__path, 'server_spec.json')) as df:
    content = df.read()
    server_spec = json.loads(content)

fqdn = socket.gethostname()
domain = '.'.join(fqdn.split('.')[-2:])

if domain in server_spec:
    #当前机器的角色
    if fqdn in server_spec[domain]:
        for role in server_spec[domain][fqdn].get('roles'):
            print 'is_%s=%s' % (role, role)
    for fqdn in server_spec[domain]:
        if 'puppetdb_server' in server_spec[domain][fqdn].get('roles'):
            print 'puppetdb_server=%s' % fqdn
