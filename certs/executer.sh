#!/bin/bash

# Verifica se o diretório atual contém arquivos .cnf
if [ ! -d "cnf" ]; then
  echo "Diretório 'cnf' não encontrado. Certifique-se de que o diretório exista."
  exit 1
fi

# Percorre todos os arquivos .cnf dentro do diretório cnf
for config_file in cnf/*.cnf; do
  if [ -f "$config_file" ]; then
    # Extrair nome base do arquivo sem extensão para uso posterior
    base_name=$(basename "$config_file" .cnf)

    echo "Gerando chave e certificado para: $base_name"

    # Gerar chave privada
    openssl genrsa -out "$base_name.key" 2048

    # Gerar solicitação de assinatura de certificado (CSR)
    openssl req -new -key "$base_name.key" -out "$base_name.csr" -config "$config_file"

    # Gerar certificado autoassinado
    openssl x509 -req -in "$base_name.csr" -signkey "$base_name.key" -out "$base_name.crt" -days 365 -extensions req_ext -extfile "$config_file"

    # Remover CSR
    rm -f "$base_name.csr"

    # Verificar o certificado gerado
    openssl x509 -in "$base_name.crt" -text -noout

    echo "Certificado e chave gerados para: $base_name"
    echo "-------------------------------------------------"
  else
    echo "Arquivo de configuração não encontrado: $config_file"
  fi
done

echo "Processo concluído!"
