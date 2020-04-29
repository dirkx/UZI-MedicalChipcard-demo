#!/bin/sh
#
# 1 to 6 Hourly crontab.
#
OUTDIR="<path>"
set -e
(
for url in \
        http://www.uzi-register-test.nl/cdp/test_uzi-register_zorgverlener_ca_g3.crl \
	http://www.uzi-register-test.nl/cdp/test_zorg_csp_level_2_persoon_ca_g3.crl \
        http://www.uzi-register-test.nl/cdp/test_zorg_csp_root_ca_g3.crl 
do
	/usr/local/bin/curl --silent $url | /usr/bin/openssl crl -inform DER 
done
) > "$OUTDIR/last.crl.new"
mv  "$OUTDIR/last.crl.new" "$OUTDIR/last.crl"

sudo apachectl restart

