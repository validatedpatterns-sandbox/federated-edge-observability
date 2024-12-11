#!/bin/bash

pattern=$1
name=$2
domain=$3

openssl req -x509 -newkey rsa:4096 -sha256 -days 365 \
  -nodes -keyout "~/$pattern-$name.key" -out "~/$pattern-$name.crt" -subj "/CN=$pattern-$name" \
  -addext "subjectAltName=DNS:$name.$domain"
