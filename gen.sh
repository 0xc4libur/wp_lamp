rm *.pem

# Generate CA's private key and self-signed certificate
openssl req -x509 -newkey rsa:2048 -days 365 -keyout ca-key.pem -out ca-cert.pem -subj "/C=PH/ST=Manila/L=Manila/O=DLSU/OU=Education/CN=*.dlsu.com/emailAddress=jma@dlsu.com"

echo "CA's self-signed certificate"
openssl x509 -in ca-cert.pem -noout -text

# Generate web server's private key and certificate signing request
openssl req -newkey rsa:2048 -keyout server-key.pem -out server-req.pem -subj "/C=PH/ST=Manila/L=Manila/O=DLSU/OU=Education/CN=*.s3ntinel.local/emailAddress=jma@s3ntinel.local"

# Use CA's private key to sign web server's CSR and get back the signed certficate
openssl x509 -req -in server-req.pem -days 60 -CA ca-cert.pem -CAkey ca-key.pem -CAcreateserial -out server-cert.pem

echo "Server's signed certificate"
openssl x509 -in server-cert.pem -nouout -text

