#!/bin/sh

# OC_RSYNC_SRC: rsync source target
# OC_LOGIN_TOKEN: login token

/oc-client/oc login https://master8.tsi-af.de --token=$OC_LOGIN_TOKEN
/oc-client/oc project atlassian-epos-docker-test

if [ -z "$(ls -A /data)" ]; then
	exec /oc-client/oc rsync $OC_RSYNC_SRC /data --progress=true
fi
