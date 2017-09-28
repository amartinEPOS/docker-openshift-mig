#!/bin/sh

# OC_RSYNC_SRC: rsync source target
# OC_LOGIN_TOKEN: login token

/oc-client/oc login 10.131.0.1:8443 --token=$OC_LOGIN_TOKEN
/oc-client/oc project atlassian-epos-docker-test

if [ -z "$(ls -A /data)" ]; then
	exec /oc-client/oc rsync $OC_RSYNC_SRC /data --progress=true
fi
