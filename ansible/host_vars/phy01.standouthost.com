backup_dirs:
 - /etc/ssl/
 - /opt/
 - /home/
 - /etc/haproxy/

backup_files:
 - /etc/sysconfig/iptables
