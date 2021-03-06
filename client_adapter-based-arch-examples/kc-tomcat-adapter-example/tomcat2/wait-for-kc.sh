#!/bin/bash

MAX_LOOP=30
CNT_LOOP=1

while [ $CNT_LOOP -lt $MAX_LOOP ]; do

    echo "Keycloak HTTP connection check for $CNT_LOOP times"
    ret=`curl -k http://sso.example.com/auth/realms/demo-authz/.well-known/uma2-configuration --silent -o /dev/null -w '%{http_code}\n'`

    if [ $ret -ne 200 ]; then
        CNT_LOOP=$((CNT_LOOP+1))
    else
        echo "Keycloak HTTP connection OK!"
        /usr/local/tomcat/bin/catalina.sh run
    fi
    echo "waiting 10 sec ... "
    sleep 10

done

echo "Keycloak HTTP connection check error"
echo "Tomcat couldn't start"


