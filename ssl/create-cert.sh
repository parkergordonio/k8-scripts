openssl req -x509 -nodes -newkey rsa:2048 -days 365 \
    -keyout privkey.pem -out cert.pem -subj "/CN=$EXTERNAL_IP"