#!/bin/bash
#set -x
DOMAIN=${1}
TODAY=$(date +"%A")
BACKUPDIR=/mnt/backup
#Check if they passed a argument
echo ${DISK}
if [ -z "$1" ]; then
	echo "Pass a domain as an argument"
	exit 1
fi
if [[ ! -d ${BACKUPDIR}/vm_image ]]; then
	mkdir -p ${BACKUPDIR}/vm_image
fi
if [[ ! -d ${BACKUPDIR}/vm_config ]]; then
	mkdir -p ${BACKUPDIR}/vm_config
fi
if [ ${DOMAIN} == "all" ]; then
	for i in $(virsh list | awk '/[0-9]/ {print $2}'); do
		DISK=$(virsh domblklist ${i} | awk '/images/ {print $1}')
		virsh dumpxml ${i} > ${BACKUPDIR}/vm_config/${i}.xml.${TODAY}
		virsh undefine ${i}
		rm -rf ${BACKUPDIR}/vm_image/${i}.qcow2.${TODAY}
		virsh blockcopy ${i} ${DISK} ${BACKUPDIR}/vm_image/${i}.qcow2.${TODAY} --wait --finish --verbose
		virsh define ${BACKUPDIR}/vm_config/${i}.xml.${TODAY}
	done
else
	DISK=$(virsh domblklist ${DOMAIN} | awk '/images/ {print $1}')
	virsh dumpxml ${DOMAIN} > ${BACKUPDIR}/vm_config/${DOMAIN}.xml.${TODAY}
	virsh undefine ${DOMAIN}
	rm -rf ${BACKUPDIR}/vm_image/${DOMAIN}.qcow2.${TODAY}
	virsh blockcopy ${DOMAIN} ${DISK} ${BACKUPDIR}/vm_image/${DOMAIN}.qcow2.${TODAY} --wait --finish --verbose
	virsh define ${BACKUPDIR}/vm_config/${DOMAIN}.xml.${TODAY}
fi
