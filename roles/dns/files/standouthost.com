; BIND db file for standouthost.com

$TTL 3600
$ORIGIN standouthost.com.

@       IN      SOA     ns1.vpsaddict.com.        jon.standouthost.com. (
                        2024111502      ; serial number YYYYMMDDnn
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
@		TXT	"v=spf1 include:zohomail.com ~all"
@		TXT	"zoho-verification=zb39519014.zmverify.zoho.com"

                IN      A       68.183.148.253
                IN      AAAA    2604:a880:800:14::2fda:a000
www             IN      CNAME   homelab.soh.re.
augustine	IN	A	44.204.12.80
zmail._domainkey IN	TXT "v=DKIM1; k=rsa; p=MIGfMA0GCSqGSIb3DQEBAQUAA4GNADCBiQKBgQC0/4ia1N2XVfTw7emk6dqbjvIatRK3RipuYGQ56obm0ueYRDOxnnvRp/i0/UCYvdY6dDGhI4CGpKoGg7C1mxCZRv6yGHirxCm2rAFo3rT0Z0yR+aVLF6WcUUW4Efb+XUVbWRYxrCSP/4BBfIEauab2Lgcq0sI1/9vLhDt0NkBYYwIDAQAB"
