FROM debian:stable

RUN \
  # this script calls apt-get update
  apt-get update && \ 
  apt-get install -y --no-install-recommends \
    wget \ 
	ca-certificates \ 
	rsync \ 
  && rm -rf /var/lib/apt/lists/*

WORKDIR /root

RUN \ 
  wget https://github.com/openshift/origin/releases/download/v3.6.0/openshift-origin-client-tools-v3.6.0-c4dd4cf-linux-64bit.tar.gz && \ 
  tar xfz openshift-origin-client-tools-v3.6.0-c4dd4cf-linux-64bit.tar.gz

ENTRYPOINT ["/bin/bash"]
