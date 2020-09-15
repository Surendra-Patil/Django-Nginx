#!/usr/bin/env bash

# Specify where we will install
SSL_DIR="/etc/ssl/example.com"

# Set the wildcarded domain
# we want to use
DOMAIN="*example.com"

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
openssl genrsa -out "$SSL_DIR/example.com.key" 2048
openssl req -new -subj "$(echo -n "$SUBJ" | tr "\n" "/")" -key "$SSL_DIR/example.com.key" -out "$SSL_DIR/example.com.csr" -passin pass:$PASSPHRASE
openssl x509 -req -days 365 -in "$SSL_DIR/example.com.csr" -signkey "$SSL_DIR/example.com.key" -out "$SSL_DIR/example.com.crt"
