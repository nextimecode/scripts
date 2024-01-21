#!/bin/bash

# Obtém os caminhos de instalação do OpenSSL e do MySQL usando o Homebrew
openssl_path=$(brew --prefix openssl@1.1)
mysql_path=$(brew --prefix mysql)

# Constrói os caminhos para as bibliotecas e headers
openssl_lib="$openssl_path/lib"
openssl_include="$openssl_path/include"
mysql_lib="$mysql_path/lib"
mysql_include="$mysql_path/include"
mysql_config="$mysql_path/bin/mysql_config"

# Instala a gem mysql2 usando os caminhos dinâmicos
gem install mysql2 -- \
  --with-openssl-dir="$openssl_path" \
  --with-openssl-include="$openssl_include" \
  --with-openssl-lib="$openssl_lib" \
  --with-mysql-dir="$mysql_path" \
  --with-mysql-include="$mysql_include" \
  --with-mysql-lib="$mysql_lib" \
  --with-mysql-config="$mysql_config"
