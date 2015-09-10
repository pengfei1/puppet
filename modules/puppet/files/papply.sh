#!/bin/bash
sudo puppet apply /etc/puppet/yidu/manifests/site.pp  --modulepath=/etc/puppet/yidu/modules $*
