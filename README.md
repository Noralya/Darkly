# <p align="center">(emoji a cchoisir) Darkly </p>
<div align=center><img src="https://github.com/Noralya/Libasm/blob/main/assets/logo.png" alt="ASM Logo" width="200"></div>
<h3 align="center">A 64-bit Assembly Library Implementation</h3>
<p align="center">🇫🇷 Bienvenue dans Darkly ! Dans ce projet nous allons apprendre les bases de la cybersecuritee sur le web. Le but est de trouver 14 failles de securitee sur un faux site local pour en comprendre les dangers et les resolutions. Les voici avec screenshots et script qui m'ont permis de les trouver, avec quelque notes sur leur exploitation.</p>

<p align="center">🇬🇧 Welcome to LibASM! This project aims to create a library of fundamental functions written in 64-bit assembly (Intel syntax), using NASM. It will enhance your understanding of low-level programming, memory management, and system calls. So here is my version of the project!</p>

---

### **📋 Table of Contents**

- [📚 Project Overview](#-project-overview)
- [⚙️ Compilation & Setup](#%EF%B8%8F-compilation--setup)
- [🚀 Mandatory Part](#-mandatory-part)
- [🌟 Bonus Part](#-bonus-part)
- [🧪 Testing](#-testing)
- [📜 Common Instructions](#-common-instructions)
- [🧰 Resources](#-resources)

---

### **📚 Project Overview**

This project aims to introduce you to cybersecurity in the field of the WWW. You will discover OWASP, which is simply the largest cybersecurity project to date. You will also learn what many frameworks do for you, automatically and transparently.

Apres avoir telecharger le .iso et l'avoir lancer sur une VM, you will get a simple prompt with an IP a executer sur un moteur de recherche pour y trouver les 14 failles de securitee. Your turn-in folder will only include the files that allowed you to solve each of the exploited breaches.

---

### **⚙️ Compilation & Setup**

1. Clone the repository:
```bash
git clone https://github.com/Noralya/Darkly.git
```

2. Open VirtualBox && use the .iso:
```bash
File -> Tools -> Network Manager
Create Host-only Networks (vboxnet0)
Create NAT Networks
VM Settings -> Network
Adapter 1 : Host-only Adapter (vboxnet0)
Adapter 2 : NAT
```

3. Open a browser:
```bash
http://192.168.56.101/
```

---

### **🚀 Mandatory Part**

You need to find all 14 breaches and return your solution in a resources folder folders, here are they listed

| **Breach name** |		 **Description**			|
| ------------ | ---------------------------------- |
| IDOR    | / 	| 
| Open redirection    | /						| 
| Reader open redirection    | / 				| 
| Sensitive information disclosure     | /	|
| Parameter Tempering      | /	| 
| XSS media image    | /	|
| XSS feedback    | /	|
| Cookie i_am_admin    | /	|
| Spamming folder    | /	|
| Include page    | /	|
| File upload vulnerability    | /	|
| SQL injection members    | /	|
| SQL injection image    | /	|
| Brute force    | /	|

**Folders contain:**
- Founded flag.
- Screenshots for proof.
- Scripts for specific breaches.
- Explaining notes

---

### **🌟 Bonus Part**

For the bonus part, you will only need to provide advanced explanations for the most recognized breaches you have identified.

---

### **🧪 Testing**

![demo](./assets/darkly.gif)

---

### **🧰 Resources**

- [42 Doc](https://harm-smits.github.io/42docs/projects/libasm)
- add more doc
