; BIND db file for southridingagents.com

$TTL 3600
$ORIGIN southridingagents.com.

@       IN      SOA     ns1.vpsaddict.com.        jon.soh.re. (
                        2022010101      ; serial number YYYYMMDDNN
                        14400           ; Refresh
                        3600            ; Retry
                        1209600         ; Expire
                        3600            ; Min TTL
                        )

@               IN         NS      ns1.vpsaddict.com.
@               IN         NS      ns2.vpsaddict.com.
@               IN         NS      ns3.vpsaddict.com.
@		IN	MX	10	4bf2b18cc0b54a8335eaf73810007e.pamx1.hotmail.com.
@               IN      MX	30	4bf2b18cc0b54a8335eaf73810007e.msv1.invalid.
@		IN	TXT	"google-site-verification=dWjJ0HfhsChaHHTTS_2fh-QJcjRYST-g1N-KR3o0TSY"
		IN	TXT	"v=spf1 include:hotmail.com ~all"
                IN      A       144.76.41.204
www             IN      A       144.76.41.204
_sipfederationtls._tcp.southridingagents.com 3600    IN  SRV 0   10  5061 federation.messenger.msn.com.
mail 		IN	CNAME	go.domains.live.com.
