#!/bin/bash
# This is the old image, see Makefile
# $ curl -O -L https://releases-art-rhcos.svc.ci.openshift.org/art/storage/releases/rhcos-4.6/46.82.202007051540-0/x86_64/rhcos-46.82.202007051540-0-qemu.x86_64.qcow2.gz
# $ mv rhcos-46.82.202007051540-0-qemu.x86_64.qcow2.gz /tmp
# $ sudo gunzip /tmp/rhcos-46.82.202007051540-0-qemu.x86_64.qcow2.gz

RHCOS_ISO="/tmp/images/installer-SNO-image.iso"
VM_NAME="sno-test"
OS_VARIANT="rhel8.1"
RAM_MB="30000"
DISK_GB="50"
CPU_CORE="10"

kcli create vm -P nets=['{"name":"test-net","mac":"52:54:00:ee:42:e1"}'] -P iso=${RHCOS_ISO} -P memory=${RAM_MB} -P numcpus=${CPU_CORE} -P disks=[${DISK_GB},10,10,10,10,10] ${VM_NAME}
