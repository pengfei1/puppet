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

#每个机器的角色分配
pkuph_ks_slave = [
    's12.pkuph-ks.com',        
    's13.pkuph-ks.com',        
    's14.pkuph-ks.com',        
    's15.pkuph-ks.com',        
    's16.pkuph-ks.com',        
    's17.pkuph-ks.com',        
    's18.pkuph-ks.com',        
    's19.pkuph-ks.com',        
    's20.pkuph-ks.com',        
]
server_spec = {
    'm.com' : {
        'puppet_master' : ['dev1.m.com'],
        'hbase_thrift' : ['dev1.m.com'],
        'puppet_agent' : ['dev0.m.com']
    },
    'pkuph-ks.com' : {
        'puppet_master' : ['s11.pkuph-ks.com'],
        'hbase_thrift' : ['s11.pkuph-ks.com'],
        'puppet_agent' : pkuph_ks_slave
    }
}

fqdn = socket.gethostname()
domain = '.'.join(fqdn.split('.')[-2:])

if domain in server_spec:
    for server_type, hosts in server_spec[domain].iteritems():
        if fqdn in hosts:
            print 'is_%s=%s' % (server_type, server_type)

