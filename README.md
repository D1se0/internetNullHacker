# Internet Null Hacker

## 🛠️ Herramientas de Seguridad en Redes Privadas

Este repositorio contiene dos potentes herramientas escritas en `Bash` diseñadas para mejorar la seguridad de tu `red WiFi privada`. 

1. **KnowARPHosts**: Identifica las direcciones `IP` conectadas a tu `red local`, permitiéndote detectar posibles intrusos.

2. **InternetNullHacker**: Realiza un ataque de **ARP Spoofing** para desconectar dispositivos sospechosos y proteger tu `red`.

---

## 📜 Características de las Herramientas

### 🔍 **KnowARPHosts**

- Escanea la red local utilizando `arp-scan`.
- Identifica todas las direcciones `IP` activas en `tu red privada`.
- Ayuda a detectar dispositivos `desconocidos o no autorizados`.

### 🛡️ **InternetNullHacker**

- Realiza un ataque de **ARP Spoofing** dirigido a un dispositivo específico.
- Desconecta a posibles intrusos de tu `red WiFi`.
- Automatiza la configuración y validación de dependencias como `dsniff`.

---

## 🚀 Instalación y Uso

### Pre-requisitos

Antes de comenzar, asegúrate de tener instalado lo siguiente en tu sistema:

- **Bash** (generalmente preinstalado en sistemas Linux).
- Herramientas necesarias como `arp-scan` y `dsniff`. Si no están instaladas, las herramientas lo manejarán automáticamente.

### 1️⃣ KnowARPHosts - Descubre dispositivos en tu red

1. **Ejecuta el script**:

   ```bash
   ./knowARPHosts.sh
   ```
   
2. **Selecciona la interfaz de red**:

Introduce la interfaz de `red` activa (por ejemplo, `wlan0` para `WiFi`).

3. **Observa los resultados**:

Verás una lista completa de direcciones `IP` y dispositivos conectados.

## 2️⃣ InternetNullHacker - Desconecta intrusos

1. **Ejecuta el script**:

```bash
./internetNullHacker.sh
```

2. **Introduce los datos solicitados**:

Interfaz de red (por ejemplo, `wlan0`).
`Dirección IP` del dispositivo objetivo.

3. **Inicia el ataque ARP Spoofing**:

El dispositivo objetivo será desconectado de la `red`.

## ⚠️ Advertencia

Estas herramientas están diseñadas para ser utilizadas exclusivamente con fines educativos o en pruebas de seguridad autorizadas en `tu propia red`. El uso indebido puede ser ilegal. Asegúrate de contar con los permisos adecuados antes de usarlas.

## 🎨 Ejemplo de Uso

Escaneo de la Red

```bash
./knowARPHosts.sh
```
Info:

```
[!] Bienvenido al escáner de red. Este script ayudará a descubrir hosts activos en tu red.
[+] arp-scan ya está instalado.
[?] Indica la interfaz de red para realizar el escaneo:
> wlan0
[+] Desplegando información sobre los hosts en la red...
Interface: wlan0, Datapath ID: 12:34:56:78:9a:bc
192.168.1.1    12:34:56:78:9a:bc    Router
192.168.1.2    98:76:54:32:10:aa    Desconocido
192.168.1.3    88:99:77:66:55:44    Laptop
```

### Ataque de ARP Spoofing

```bash
./internetNullHacker.sh
```
Info:

```
[!] Bienvenido. Por favor, proporciona los siguientes datos:
[?] Inserte la interfaz de red que deseas analizar: wlan0
[?] Inserte la IP objetivo: 192.168.1.2
[+] IP objetivo 192.168.1.2 encontrada y activa.
[+] Iniciando ARP Spoofing en la interfaz wlan0 hacia la IP objetivo 192.168.1.2...
[+] Presiona Ctrl+C para parar el ataque...
```

## 🌟 Contribuciones

Las contribuciones son bienvenidas. Si tienes ideas o mejoras, no dudes en enviar un `pull request` o abrir un `issue`.

## 📄 Licencia

Este proyecto está bajo la Licencia `MIT`. Consulta el archivo `LICENSE` para más detalles.
