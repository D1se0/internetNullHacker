#!/bin/bash

# Colores para la salida
RED='\033[31m'
GREEN='\033[32m'
YELLOW='\033[33m'
BLUE='\033[34m'
RESET='\033[0m'

# Función para manejar Ctrl+C
trap ctrl_c INT

function ctrl_c() {
    echo -e "\n${RED}[-] Interrupción detectada. Saliendo del script...${RESET}"
    exit 0
}

# Verificar si arp-scan está instalado
check_dependency() {
    if ! [ -x "$(command -v arp-scan)" ]; then
        echo -e "${RED}[!] No se encontró arp-scan. Instalando...${RESET}"
        sudo apt update -y && sudo apt install -y arp-scan
        if [ $? -eq 0 ]; then
            echo -e "${GREEN}[+] arp-scan instalado correctamente.${RESET}"
        else
            echo -e "${RED}[-] Error al instalar arp-scan. Saliendo...${RESET}"
            exit 1
        fi
    else
        echo -e "${GREEN}[+] arp-scan ya está instalado.${RESET}"
    fi
}

# Función para pedir la interfaz de red
get_interface() {
    echo -e "${YELLOW}[?] Indica la interfaz de red para realizar el escaneo: ${RESET}"
    read -p "> " interface
    if [ -z "$interface" ]; then
        echo -e "${RED}[-] No se ha especificado una interfaz. Saliendo...${RESET}"
        exit 1
    fi
}

# Función para realizar el escaneo de hosts
scan_hosts() {
    echo -e "${BLUE}[+] Desplegando información sobre los hosts en la red...${RESET}"
    arp-scan -I "$interface" --localnet
    if [ $? -eq 0 ]; then
        echo -e "${GREEN}[+] Escaneo completado con éxito.${RESET}"
    else
        echo -e "${RED}[-] Hubo un error al realizar el escaneo. Asegúrate de que la interfaz esté correcta y conectada.${RESET}"
        exit 1
    fi
}

# Inicio del script
echo -e "${BLUE}[!] Bienvenido al escáner de red. Este script ayudará a descubrir hosts activos en tu red.${RESET}"

# Verificar dependencias
check_dependency

# Pedir la interfaz de red
get_interface

# Realizar el escaneo de hosts
scan_hosts

