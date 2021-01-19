#!/bin/bash
VM_NAME=`awk -F'"' '/^VM_NAME/ {print $(NF-1)}' hack/virt-install-sno-iso-ign.sh`
NET_NAME=`xmllint  --xpath 'string(//network/name)' hack/net.xml`
kcli delete vm ${VM_NAME} -y
kcli delete network ${NET_NAME} -y
