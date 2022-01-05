#!/bin/bash
# Backup everything
/usr/bin/ansible-playbook -i /root/infra/ansible/hosts /root/infra/ansible/backup-local.yml
# Delete old copies
/usr/bin/find /mnt/backup/vm_image/ -mtime +2 -type f -delete
