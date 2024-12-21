; BIND db file for soh.re

$TTL 3600
$ORIGIN soh.re.

@       IN      SOA     ns1.vpsaddict.com.        jon.soh.re. (
                        2024122102      ; serial number YYYYMMDDnn
                        14400           ; Refresh
                        3600            ; Retry
                        1209600         ; Expire
                        3600            ; Min TTL
                        )

@               IN         NS      ns1.vpsaddict.com.
@               IN         NS      ns2.vpsaddict.com.
@               IN         NS      ns3.vpsaddict.com.
@               MX      10 mx.zoho.com.
@               MX      20 mx2.zoho.com.
@               MX      50 mx3.zoho.com.
@               IN      TXT     "v=spf1 include:zoho.com ~all"

		IN      A	68.183.148.253
		IN      AAAA	2604:a880:800:14::2fda:a000
www		IN      CNAME   homelab.soh.re.
nextcloud	IN	CNAME   homelab.soh.re.
etherpad	IN	CNAME   homelab.soh.re.
statuscode	IN	CNAME   homelab.soh.re.
hey		IN	CNAME   homelab.soh.re.
mail		IN	CNAME	mail.zoho.com.
status		IN	CNAME	fragrant-waterfall-5930.fly.dev.
vm1		IN	A	130.61.159.173
vm2		IN	A	138.2.152.196
vm3		IN	A	10.0.0.20
vm4		IN	A	10.0.0.21
spam		IN	CNAME   homelab.soh.re.
argocd		IN	CNAME   homelab.soh.re.
flights		IN	CNAME   homelab.soh.re.
longhorn	IN	CNAME   homelab.soh.re.
zot		IN	CNAME	homelab.soh.re.
homelab		IN	A	68.183.148.253
homelab		IN      AAAA    2604:a880:800:14::2fda:a000
k3s		IN	A	130.61.223.167

zmail._domainkey IN      TXT     "v=DKIM1; k=rsa; p=MIGfMA0GCSqGSIb3DQEBAQUAA4GNADCBiQKBgQCQM6Lyr97m44C/MTkPTpfMMnD+w4jti214gL7Ml7z+sI1CoGNpPOlxod7GqduOywXumEHlzwylvHbsgtU7OnW6jgme7lzAu8zIFAxDbt19IoUTVBFUrg6tGWYorxTPW5rpF3dlCYSZ0pzNohS0WZEVnYcr0aeJrxUgIZHoS3egBQIDAQAB"
