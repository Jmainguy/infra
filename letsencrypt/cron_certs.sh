#!/bin/bash
if [ "$#" -ne 2 ]; then
    echo "You must enter exactly 2 command line arguments"
    echo "cron_certs.sh CERTBOTDIR INFRADIR"
    echo "For example: cron_certs.sh /opt/certbot /opt/infra"
    exit 1
fi
CERTBOTDIR=$1
INFRADIR=$2
space ()
{ # Print spaces
    echo ""
    echo ""
}
# Bak up /etc/hosts so we can check the real connection
for DOMAIN in $(cat ${CERTBOTDIR}/hostnames); do
    echo ${DOMAIN}
    ${INFRADIR}/letsencrypt/lets_certs.py ${DOMAIN} ${CERTBOTDIR}
    space
done
