; BIND db file for vpsaddict.com

$TTL 3600
$ORIGIN vpsaddict.com.

@       IN      SOA     ns1.vpsaddict.com.        jon.vpsaddict.com. (
                        2024110201      ; serial number YYYYMMDDNN
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
@               TXT     "v=spf1 include:zoho.com ~all"

                IN      A       144.76.41.204
		IN   AAAA	2a01:4f8:191:4298::2
www             IN      A       144.76.41.204
www		IN   AAAA	2a01:4f8:191:4298::2
ns1             IN      A       139.144.22.238
ns1             IN   AAAA       2600:3c02::f03c:93ff:fec8:ddca
ns2             IN      A       68.183.148.253
ns2             IN   AAAA       2604:a880:800:14::2fda:a000
ns3             IN      A       198.98.59.14
ns3             IN   AAAA       2605:6400:10:675::1
zmail._domainkey IN 	TXT	"v=DKIM1; k=rsa; p=MIGfMA0GCSqGSIb3DQEBAQUAA4GNADCBiQKBgQCQYWxMMDxDyFMVStYQ3b2p+yMrLNUP4SDoOJV31WDfr9jzuhbJAUOA+MsAsgcjRZ2dEs/jcbskRQvMiFshAzsOipvGDvhNHJSiMe0w1SRM+uuXZl95ND8vEYPkt/jbHNlrfckIQ6B9z8k9Qwopuy8124rio89zAeIXQ7RoUclnmwIDAQAB"
