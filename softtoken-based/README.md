# Fake UZI tree

## Step one - run 'resign.sh

This will generate a certificate tree that looks a lot like the real thing (see docs); but fake - so you can
issue your own smartcards/client certs.

See the directory out for the results.
 
## Step two - pretend to be a GP

Import the 'chipard' called fake-huisarts.p12 (password 12345678) into your browser or mailtool (for Outlook in a corporate setting - see ``Ondertekenen e-mail met Microsoft Outlook (UZ69 03) 20141124_37585.pdf'' on https://www.uziregister.nl

## Set up an apache web server

Modify the snippet in httpd-snippet.conf by chainging the 'etc/apache2/ path to that of this directory (or by copying the files in 'out' to your apache config.

So they look like:

	    SSLCertificateFile          path/to/this/directory/out/server.pem

and put it into your apache with something like:

    include <path/to/this/directory/httpd.conf
    
## Try

Restart apache and go to https://localhost:4443/ - observe that the log file `with-ssl` now contains entries such as:

	localhost 127.0.0.1 - - [16/Apr/2020:15:48:48 +0200] "GET / HTTP/1.1" 200 203 NL-Arts=<Hermanus Boerhave>
	
this is controlled by:

    LogFormat "%v %h %l %u %t \"%r\" %>s %b NL-Arts=<%{SSL_CLIENT_S_DN_CN}e>" with-ssl

## Caveat

Not fully locked down - we could be explicit about the need for UZI-register Zorgverlener CA and the presence of bit 'Z' or go as far as actually look at the 'beroepencode' value.


 curl --cert out/fake-huisarts --cacert out/server-chain.pem https://uzi-test.webweaving.org:4443/
