FROM debian:stable

ENV \ 
  OC_RSYNC_SRC=/invalid \ 
  OC_LOGIN_TOKEN=xxx

RUN \
  # this script calls apt-get update
  apt-get update && \ 
  apt-get install -y --no-install-recommends \
    wget \ 
	ca-certificates \ 
	rsync \ 
  && rm -rf /var/lib/apt/lists/*

RUN \ 
  wget https://github.com/openshift/origin/releases/download/v3.6.0/openshift-origin-client-tools-v3.6.0-c4dd4cf-linux-64bit.tar.gz && \ 
  mkdir -p /oc-client && \ 
  tar xfz openshift-origin-client-tools-v3.6.0-c4dd4cf-linux-64bit.tar.gz -C /oc-client --strip=1 && \ 
  rm openshift-origin-client-tools-v3.6.0-c4dd4cf-linux-64bit.tar.gz

VOLUME ["/data"]
WORKDIR /data

COPY data/docker-entrypoint.sh /docker-entrypoint.sh

ENTRYPOINT ["/docker-entrypoint.sh"]
