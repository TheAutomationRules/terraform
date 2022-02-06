#!/bin/bash -x
set -e

sudo apt update
sudo apt install -y unzip

cat << EOF > /home/ubuntu/test.txt
// ARCHIVO DE PRUEBA
   Contenido del archivo de texto.
// FIN DE ARCHIVO DE PRUEBA
<<<<<<< HEAD
EOF
=======
EOF
>>>>>>> origin/main
