#!/bin/sh
#
# Original certificates can be found at 
#   https://acceptatie.zorgcsp.nl/ca-certificaten
#
# Generate the access chains for all 3 classes
# of cards; and two aggregated classes.
#
#
concat_as_pem() {
	for i in $*
	do
		if grep -q BEGIN "original-DERs/$i"; then
			openssl x509 -in "original-DERs/$i" 
		else
			openssl x509 -in "original-DERs/$i" -inform DER 
		fi
	done
}

	
concat_as_pem \
	test_uzi-register_zorgverlener_ca_g3.cer \
	20190501_test_uzi-register_zorgverlener_ca_g3.cer \
	test_zorg_csp_level_2_persoon_ca_g3.cer \
	test_zorg_csp_root_ca_g3.cer \
		>> zorgverlener-chain.pem

concat_as_pem \
	test_uzi-register_medewerker_op_naam_ca_g3.cer \
	20190501_test_uzi-register_medewerker_op_naam_ca_g3.cer \
	test_zorg_csp_level_2_persoon_ca_g3.cer \
	test_zorg_csp_root_ca_g3.cer \
		>> medewerker-op-naam-chain.pem

concat_as_pem \
	test_uzi-register_medewerker_niet_op_naam_ca_g3.cer \
	20190501_test_uzi-register_medewerker_niet_op_naam_ca_g3.cer \
	test_zorg_csp_level_2_persoon_ca_g3.cer \
	test_zorg_csp_root_ca_g3.cer \
		>> medewerker-niet-op-naam-chain.pem

concat_as_pem \
	test_uzi-register_medewerker_op_naam_ca_g3.cer \
	test_uzi-register_zorgverlener_ca_g3.cer \
	20190501_test_uzi-register_medewerker_op_naam_ca_g3.cer \
	20190501_test_uzi-register_zorgverlener_ca_g3.cer \
	test_zorg_csp_level_2_persoon_ca_g3.cer \
	test_zorg_csp_root_ca_g3.cer \
		>> named-person-chain.pem

concat_as_pem \
	test_uzi-register_medewerker_op_naam_ca_g3.cer \
	test_uzi-register_medewerker_niet_op_naam_ca_g3.cer \
	test_uzi-register_zorgverlener_ca_g3.cer \
	20190501_test_uzi-register_medewerker_op_naam_ca_g3.cer \
	20190501_test_uzi-register_medewerker_niet_op_naam_ca_g3.cer \
	20190501_test_uzi-register_zorgverlener_ca_g3.cer \
	test_zorg_csp_level_2_persoon_ca_g3.cer \
	test_zorg_csp_root_ca_g3.cer \
		>> anything-chain.pem

