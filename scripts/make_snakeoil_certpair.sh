#!/bin/bash

name=$1

pattern=$( ./common/scripts/determine-pattern-name.sh )
domain=$( oc get ingresses.config/cluster -o jsonpath={.spec.domain} )

certname="$pattern-$name"
cert_path="$HOME/$pattern-$name.crt"
key_path="$HOME/$pattern-$name.key"

if [[ -f "$cert_path" && -f "$key_path" ]]; then
    echo "Snakeoil certpair $certname already exists, not re-creating"
else
    openssl req -x509 -newkey rsa:4096 -sha256 -days 365 \
        -nodes -keyout "$key_path" -out "$cert_path" -subj "/CN=$certname" \
        -addext "subjectAltName=DNS:$name.$domain"
fi

echo "Key Path: $key_path"
echo "Cert Path: $cert_path"
