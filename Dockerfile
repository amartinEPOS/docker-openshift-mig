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

ENTRYPOINT ["/bin/bash"]
