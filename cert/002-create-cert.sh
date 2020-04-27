
openssl genrsa -out ca.key 2048
openssl req -x509 -new -nodes -key ca.key  -out ca.crt
openssl genrsa -out server.key 2048


# test

openssl x509  -noout -text -in ./ca.crt


# create secret
kubectl create secret tls lisa-tls-secret --key ca.key --cert ca.crt
get secret ssl-key-cert -o yaml
