#!/bin/bash

# Paths to the new certificate and key files issued by Certbot
new_tls_chain="/etc/letsencrypt/live/mail.firstchecker.com/fullchain.pem"
new_tls_cert="/etc/letsencrypt/live/mail.firstchecker.com/cert.pem"
new_tls_key="/etc/letsencrypt/live/mail.firstchecker.com/privkey.pem"

# Base64 encode the new certificate and key files
base64_tls_chain=$(base64 -w 0 "$new_tls_chain")
base64_tls_cert=$(base64 -w 0 "$new_tls_cert")
base64_tls_key=$(base64 -w 0 "$new_tls_key")

# Update the YAML file with the new certificate and key data
sed -i "s|tls.chain:.*|tls.chain: $base64_tls_chain|" /path/to/your/yamlfile.yaml
sed -i "s|tls.crt:.*|tls.crt: $base64_tls_cert|" /path/to/your/yamlfile.yaml
sed -i "s|tls.key:.*|tls.key: $base64_tls_key|" /path/to/your/yamlfile.yaml

# Restart the relevant Kubernetes pods or services to apply the updated certificate and key
#kubectl -n mailserver rollout restart deployment/mail-pod
