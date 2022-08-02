package main

import (
	"crypto/tls"
	"crypto/x509"
	"io/ioutil"
	"log"
)

func main() {
	log.SetFlags(log.Lshortfile)

	cert, err := ioutil.ReadFile("server.crt")
	if err != nil {
		log.Fatalf("Couldn't load file: %v", err)
	}
	certPool := x509.NewCertPool()
	certPool.AppendCertsFromPEM(cert)

	conf := &tls.Config{
		RootCAs: certPool,
	}

	conn, err := tls.Dial("tcp", "localhost:5000", conf)
	if err != nil {
		log.Println(err)
		return
	}
	defer conn.Close()

	n, err := conn.Write([]byte("hello\n"))
	if err != nil {
		log.Println(n, err)
		return
	}

	buf := make([]byte, 100)
	n, err = conn.Read(buf)
	if err != nil {
		log.Println(n, err)
		return
	}

	println(string(buf[:n]))
}
