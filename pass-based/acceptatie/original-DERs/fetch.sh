#!/bin/sh
#
# Fetch all (test) certs.
#
set -e 
curl --silent https://acceptatie.zorgcsp.nl/ca-certificaten |\
	grep href= | grep /cacerts/ | sed -e 's/.*href="//' -e 's/".*//' |\
while read url
do
	curl -O "$url"
done

