FROM cloudcustodian/c7n:0.9.12.0

USER root

COPY google.asc /usr/share/keyrings/
COPY google-sdk.list /etc/apt/sources.list.d/

RUN apt-get update && \
    DEBIAN_FRONTEND=noninteractive apt-get install -y --no-install-recommends curl google-cloud-sdk && \
    python3 -m pip install c7n-org==0.6.11 c7n-mailer==0.6.11

USER custodian


