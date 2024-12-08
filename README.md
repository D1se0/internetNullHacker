# Internet Null Hacker

## 🛠️ Security Tools for Private Networks

This repository contains two powerful tools written in `Bash` designed to improve the security of your `private WiFi network`. 

1. **KnowARPHosts**: Identify the `IP` addresses connected to your `local network`, allowing you to detect possible intruders.

2. **InternetNullHacker**: Perform an **ARP Spoofing** attack to disconnect suspicious devices and protect your 'network'.

---

## 📜 Tool Features

### 🔍 **KnowARPHosts**

- Scan the local network using `arp-scan`.
- Identify all active `IP` addresses on `your private network`.
- Helps detect 'unknown or unauthorized' devices.

### 🛡️ **InternetNullHacker**

- Performs an **ARP Spoofing** attack targeting a specific device.
- Disconnect possible intruders from your 'WiFi network'.
- Automates the configuration and validation of dependencies like `dsniff`.

---

## 🚀 Installation and Use

### Prerequisites

Before you begin, make sure you have the following installed on your system:

- **Bash** (usually pre-installed on Linux systems).
- Necessary tools such as `arp-scan` and `dsniff`. If they are not installed, the tools will handle it automatically.

### 1️⃣ KnowARPHosts - Discover devices on your network

1. **Run the script**:

   ```bash
   ./knowARPHosts.sh
   ```

2. **Select the network interface**:

Enter the active `network` interface (e.g. `wlan0` for `WiFi`).

3. **See the results**:

You will see a complete list of IP addresses and connected devices.

## 2️⃣ InternetNullHacker - Disconnect intruders

1. **Run the script**:

```bash
./internetNullHacker.sh
```

2. **Enter the requested data**:

Network interface (for example, `wlan0`).
`IP address` of the target device.

3. **Starts the ARP Spoofing attack**:

The target device will be disconnected from the `network`.

## ⚠️ Warning

These tools are intended to be used exclusively for educational purposes or in authorized security testing on 'your own network'. Misuse may be illegal. Make sure you have the proper permissions before using them.

## 🎨 Example of Use

Network Scan

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

### ARP Spoofing Attack

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

## 🌟 Contributions

Contributions are welcome. If you have ideas or improvements, feel free to submit a pull request or open an issue.

## 📄 License

This project is licensed under the `MIT` License. See the `LICENSE` file for more details.
