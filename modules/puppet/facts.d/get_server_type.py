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
server_spec = {
    'm.com' : {
        'puppet-master' : ['dev1.m.com'],
        'thrift' : ['dev1.m.com'],
        'puppet-agent' : ['dev0.m.com']
    }        
}

fqdn = socket.gethostname()
domain = '.'.join(fqdn.split('.')[-2:])

if domain in server_spec:
    for server_type, hosts in server_spec[domain].iteritems():
        if fqdn in hosts:
            print '%s=%s' % (server_type, server_type)

