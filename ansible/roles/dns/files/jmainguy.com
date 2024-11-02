; BIND db file for jmainguy.com

$TTL 3600
$ORIGIN jmainguy.com.

@       IN      SOA     ns1.vpsaddict.com.        jon.jmainguy.com. (
                        2024102902      ; serial number YYYYMMDDnn
                        14400           ; Refresh
                        3600            ; Retry
                        1209600         ; Expire
                        3600            ; Min TTL
                        )

@               IN         NS      ns1.vpsaddict.com.
@               IN         NS      ns2.vpsaddict.com.
@               IN         NS      ns3.vpsaddict.com.
@               IN         MX      10 ASPMX.L.GOOGLE.COM.
@               IN         MX      20 ALT1.ASPMX.L.GOOGLE.COM.
@               IN         MX      20 ALT2.ASPMX.L.GOOGLE.COM.
@               IN         MX      30 ASPMX2.GOOGLEMAIL.COM.
@               IN         MX      30 ASPMX3.GOOGLEMAIL.COM.
@               IN         MX      30 ASPMX4.GOOGLEMAIL.COM.
@               IN         MX      30 ASPMX5.GOOGLEMAIL.COM.

                IN      A       68.183.148.253
                IN      AAAA    2604:a880:800:14::2fda:a000
www             IN	CNAME	homelab.soh.re.
mail            IN      CNAME   ghs.google.com.
ip		IN	CNAME	homelab.soh.re.
