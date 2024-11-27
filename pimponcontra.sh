#!/bin/bash

echo -e "\e[32m╔═══╗╔═══╗╔═══╗╔═══╗     ╔═══╗╔═══╗╔═╗─╔╗
║╔═╗║║╔═╗║║╔═╗║║╔═╗║     ║╔═╗║║╔══╝║║╚╗║║
║╚═╝║║║─║║║╚══╗║╚══╗     ║║─╚╝║╚══╗║╔╗╚╝║
║╔══╝║╚═╝║╚══╗║╚══╗║     ║║╔═╗║╔══╝║║╚╗║║
║║───║╔═╗║║╚═╝║║╚═╝║     ║╚╩═║║╚══╗║║─║║║
╚╝───╚╝─╚╝╚═══╝╚═══╝     ╚═══╝╚═══╝╚╝─╚═╝\e[0m"

echo -e "\e[31mGENERADOR DE CONTRASEÑAS PiMpOnMx\e[0m"

# Directorio de la tarjeta SD para guardar las contraseñas
SDCARD_DIR="/sdcard/contrasenas"

# Crear directorio si no existe
mkdir -p $SDCARD_DIR

# Solicitar al usuario cuántas contraseñas desea generar
read -p "¿Cuántas contraseñas quieres generar? " NUM_CONTRASENAS

# Longitud de cada contraseña
LONGITUD=12

# Caracteres para generar las contraseñas
CARACTERES="0123456789ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz!@#$%^&*()_+-="

# Generar las contraseñas y guardarlas en archivos
for ((i=1; i<=$NUM_CONTRASENAS; i++)); do
    CONTRASENA=$(head /dev/urandom | tr -dc "$CARACTERES" | head -c $LONGITUD)
    echo $CONTRASENA > $SDCARD_DIR/contrasena_$i.txt
done

echo "$NUM_CONTRASENAS contraseñas generadas y guardadas en $SDCARD_DIR"