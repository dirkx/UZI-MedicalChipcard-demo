#!/bin/sh
echo 'Content-type: text/plain; charset=utf-8' 
echo
echo "Welcome ${SSL_CLIENT_S_DN_CN}"
echo
echo "And this person is a ${SSL_CLIENT_S_DN_T}"
echo
echo Last lines of the log
tail -5 logs/ssl.log
echo
echo Relevant vars
echo
env |grep SSL_CLIENT |sort
echo


