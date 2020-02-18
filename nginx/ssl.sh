#!/usr/bin/env bash

# Specify where we will install
SSL_DIR="/etc/ssl/surendra.com"

# Set the wildcarded domain
# we want to use
DOMAIN="*surendra.com"

# A blank passphrase
PASSPHRASE=""

# Set our CSR variables
SUBJ="
C=IN
ST=Maharashtra
O=
localityName=Mumbai
commonName=$DOMAIN
organizationalUnitName=
emailAddress=
"

# Create our SSL directory
# in case it doesn't exist
sudo mkdir -p "$SSL_DIR"

# Generate our Private Key, CSR and Certificate
openssl genrsa -out "$SSL_DIR/surendra.com.key" 2048
openssl req -new -subj "$(echo -n "$SUBJ" | tr "\n" "/")" -key "$SSL_DIR/surendra.com.key" -out "$SSL_DIR/surendra.com.csr" -passin pass:$PASSPHRASE
openssl x509 -req -days 365 -in "$SSL_DIR/surendra.com.csr" -signkey "$SSL_DIR/surendra.com.key" -out "$SSL_DIR/surendra.com.crt"
