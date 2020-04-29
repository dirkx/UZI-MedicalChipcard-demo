#!/bin/sh
#
# Original certificates can be found at 
#   https://acceptatie.zorgcsp.nl/ca-certificaten
#

for i in \
	test_uzi-register_medewerker_op_naam_ca_g3.cer \
	test_uzi-register_medewerker_niet_op_naam_ca_g3.cer \
	test_uzi-register_zorgverlener_ca_g3.cer \
	20190501_test_uzi-register_medewerker_op_naam_ca_g3.cer \
	20190501_test_uzi-register_medewerker_niet_op_naam_ca_g3.cer \
	20190501_test_uzi-register_zorgverlener_ca_g3.cer \
	test_zorg_csp_level_2_persoon_ca_g3.cer \
	test_zorg_csp_root_ca_g3.cer 
do
	echo $i
	(
		if grep -q BEGIN "original-DERs/$i"; then
			openssl x509 -in "original-DERs/$i" 
		else
			openssl x509 -in "original-DERs/$i" -inform DER 
		fi
	) | openssl x509 -noout -subject -serial
	echo
done
