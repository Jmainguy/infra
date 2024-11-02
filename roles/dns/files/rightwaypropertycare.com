; BIND db file for rightwaypropertycare.com

$TTL 3600
$ORIGIN rightwaypropertycare.com.

@       IN      SOA     ns1.vpsaddict.com.        jon.soh.re. (
                        2024102903      ; serial number YYYYMMDDNN
                        14400           ; Refresh
                        3600            ; Retry
                        1209600         ; Expire
                        3600            ; Min TTL
                        )

@               IN         NS      ns1.vpsaddict.com.
@               IN         NS      ns2.vpsaddict.com.
@               IN         NS      ns3.vpsaddict.com.
@		MX	10 mx.zoho.com.
@		MX	20 mx2.zoho.com.
@		MX	50 mx3.zoho.com.
@               IN      TXT     "v=spf1 include:zoho.com ~all"

                IN      A       68.183.148.253
                IN      AAAA    2604:a880:800:14::2fda:a000
www             IN	CNAME	homelab.soh.re.

zoho._domainkey	IN	TXT 	"v=DKIM1; k=rsa; p=MIGfMA0GCSqGSIb3DQEBAQUAA4GNADCBiQKBgQC9sDfKCSTn8nWfhWbLkuARjqFAEXmg3xmu5fqb+J5bUoyyxYCGDrQimQn3cqFSs6sOIILU2w4yJSSlHXUhBpxMXAVsDtginV6IJjO2rNXGlOJwgFNJ3b0kahGliqaopSlgXFk1+5KByDoeg4sDncyMJB294SoYMVHAzxbE2crqIwIDAQAB"
