# gerar chave privada
openssl genrsa -out selfsigned.key 2048

# criar arquivo de configuração de domínios para incluir os símbolos no SAN
[req]
default_bits = 2048
prompt = no
default_md = sha256
distinguished_name = dn
req_extensions = req_ext

[dn]
C = BR
ST = Mato Grosso do Sul
L = Campo Grande
O = SENAI
OU = SENAI
CN = chatbot.msq

[req_ext]
subjectAltName = @alt_names

[alt_names]
DNS.1 = localhost
DNS.2 = chatbot.msq
DNS.3 = n8n.chatbot.msq

# Gerar uma solicitação de assinatura de certificado (CSR)
openssl req -new -key selfsigned.key -out selfsigned.csr -config openssl.cnf

# Criar certificado autoassinado
openssl x509 -req -in selfsigned.csr -signkey selfsigned.key -out selfsigned.crt -days 365 -extensions req_ext -extfile openssl.cnf

# Verificar certificado
openssl x509 -in selfsigned.crt -text -noout

# configuração de hosts
sudo chmod +=x uhosts.sh

# execução de hosts
sudo ./uhosts.sh