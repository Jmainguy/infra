#!/usr/bin/env python2

import argparse
import subprocess
import sys
import os

parser = argparse.ArgumentParser(description='Update ssl certs with Lets Encrypt as needed')
parser.add_argument('domain', help='domain to update')
parser.add_argument('certbotdir', help='directory for certbot')
args = parser.parse_args()
domain = args.domain

def bash(cmd):
    p = subprocess.Popen(cmd, shell=True, stdout=subprocess.PIPE, stderr=subprocess.PIPE)
    stdout, stderr = p.communicate()
    rc = p.wait()
    return stdout, stderr, rc

# Run check_ssl.py

cmd = '/opt/infra/letsencrypt/check_ssl.py %s' % domain
stdout, stderr, rc = bash(cmd)
if rc == 2:
    print stdout
    sys.exit(1)
elif rc == 0:
    print stdout
    print "Cert does not need an udate"
    sys.exit(0)
# Bak working haproxy.cfg
cmd = 'bak -f /etc/haproxy/haproxy.cfg'
bash(cmd)
cmd = 'cp %s/haproxy.cfg /etc/haproxy/haproxy.cfg' % certbotdir
bash(cmd)
cmd = 'systemctl restart haproxy'
bash(cmd)

# Create certs
cmd = '%s/run.sh %s' % (certbotdir, domain)
stdout, stderr, rc = bash(cmd)
print rc
print stdout

# Copy certs to haproxy location
dir = '%s/etc/letsencrypt/live/%s' % (certbotdir, domain)
cmd = 'cat %s/fullchain.pem %s/privkey.pem > %s/certs/%s.pem' % (dir, dir, domain, certbotdir)
bash(cmd)

# restore haproxy
cmd = 'unbak /etc/haproxy/haproxy.cfg.bak'
bash(cmd)
cmd = 'systemctl restart haproxy'
bash(cmd)
