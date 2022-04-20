#!/bin/bash
if [ "$#" -ne 2 ]; then
    /usr/bin/echo "You must enter exactly 2 command line arguments"
    /usr/bin/echo "cron_certs.sh CERTBOTDIR INFRADIR"
    /usr/bin/echo "For example: cron_certs.sh /opt/certbot /opt/infra"
    exit 1
fi
# Podman needs $PATH defined, which we get by sourcing .bashrc
source /root/.bashrc > /dev/null
CERTBOTDIR=$1
INFRADIR=$2
space ()
{ # Print spaces
    /usr/bin/echo ""
    /usr/bin/echo ""
}
# Bak up /etc/hosts so we can check the real connection
/usr/bin/bak -f /etc/hosts
/usr/bin/cp ${CERTBOTDIR}/fake_hosts /etc/hosts
for DOMAIN in $(cat ${CERTBOTDIR}/hostnames); do
    /usr/bin/echo ${DOMAIN}
    ${INFRADIR}/letsencrypt/lets_certs.py ${DOMAIN} ${CERTBOTDIR} ${INFRADIR}
    space
done
/usr/bin/unbak /etc/hosts.bak
