#!/bin/bash -x
set -e

sudo apt update
sudo apt install -y nginx

cat << EOF > /home/ubuntu/test.txt
// ARCHIVO DE PRUEBA
   Contenido del archivo de texto.
// FIN DE ARCHIVO DE PRUEBA
EOF