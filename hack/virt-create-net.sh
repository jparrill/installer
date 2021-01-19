#!/bin/bash

sudo virsh net-create ./hack/net.xml
sudo tee /etc/NetworkManager/dnsmasq.d/aio.conf > /dev/null << EOL
resolv-file=/etc/resolv.upstream.conf
domain=test-cluster.e2e.bos.redhat.com,192.168.126.0/24,local
address=/.apps.test-cluster.e2e.bos.redhat.com/192.168.126.10
address=/api.test-cluster.e2e.bos.redhat.com/192.168.126.10
address=/api-int.test-cluster.e2e.bos.redhat.com/192.168.126.10
EOL
echo -e "[main]\ndns=dnsmasq" | sudo tee /etc/NetworkManager/conf.d/aio.conf
systemctl reload NetworkManager.service
