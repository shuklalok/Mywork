# Simple TLS server and client

Example Reference: https://gist.github.com/denji/12b3a568f092ab951456


## Error(s) that I was facing:
```bash
go run client.go
client.go:26: x509: certificate relies on legacy Common Name field, use SANs instead
```

## Solution:
Reference: https://stackoverflow.com/questions/64814173/how-do-i-use-sans-with-openssl-instead-of-common-name

## Explanation:
You must have a CA
```bash
openssl genrsa -out ca.key 2048
openssl req -new -x509 -days 365 -key ca.key -subj "/C=IN/ST=KA/L=BL/O=MyOrg, Inc./CN=MyOrg Root CA" -out ca.crt
```
Create a server CSR with 'localhost' in CN
```bash
openssl req -newkey rsa:2048 -nodes -keyout server.key -subj "/C=IN/ST=KA/L=BL/O=MyOrg, Inc./CN=localhost" -out server.csr
```
Finally sign server cert by CA and pass the subjectAltName when you signing server cert
```bash
openssl x509 -req -extfile <(printf "subjectAltName=DNS:localhost") -days 365 -in server.csr -CA ca.crt -CAkey ca.key -CAcreateserial -out server.crt
```
