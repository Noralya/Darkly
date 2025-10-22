# <p align="center">🔎 Darkly 🔎</p>
<div align=center><img src="https://github.com/Noralya/Darkly/blob/main/assets/logo.jpg" alt="Darkly Logo" width="200"></div>
<h3 align="center">An introduction on web security</h3>
<p align="center">🇫🇷 Bienvenue sur Darkly ! Dans ce projet, nous allons apprendre les bases de la cybersécurité sur le web. L'objectif est de trouver 14 failles de sécurité sur un faux site local afin d'en comprendre les dangers et les solutions. Les voici, accompagnées de captures d'écran et des scripts qui nous ont permis de les trouver, ainsi que de quelques conseils pour les exploiter.</p>

<p align="center">🇬🇧 Welcome to Darkly! In this project, we'll learn the basics of cybersecurity on the web. The goal is to find 14 security vulnerabilities on a fake local site to understand the dangers and solutions. Here they are, along with screenshots and scripts that helped us find them, along with some notes on how to exploit them.</p>

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

The goal is to discover, exploit (safely, locally) and fully document 14 web vulnerabilities that appear in a purposely vulnerable web application. This exercise focuses on

- recognizing real-world web weaknesses (OWASP mindset),

- practicing safe exploitation and proof collection,

- explaining root causes and proposing fixes.

---

### **⚙️ Compilation & Setup**

1. Clone the repository:
```bash
git clone https://github.com/Noralya/Darkly.git
cd Darkly/
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

You must find, exploit and document the following vulnerabilities. The table below shows their descriptions and gives a short hint for each.

| **Breach name** |		 **Description**			|
| ------------ | ---------------------------------- |
| IDOR    | Insecure Direct Object Reference: changing numeric IDs or filenames in URLs gives access to other users' data. Try editing id= or user= parameters. Tools: Burp, browser address bar. Mitigation: server-side access control / indirect references. | 
| Open redirection    | A parameter accepts a URL and redirects the user to it. Exploit for phishing or to bypass filters. Test ?redirect=https://evil.example. Mitigation: use allowlist or relative paths. | 
| Reader open redirection    | Same class as open redirect but triggered from a "reader"/RSS or preview feature. Check source= or next= parameters used by the reader. | 
| Sensitive information disclosure     | Exposed files, stack traces, .git, backups, commented credentials or debug pages. Look for /.git/, /backup/, .env. Mitigation: remove files, environment secrets, proper server config. |
| Parameter Tempering      | Manipulate client-controlled parameters (price, role, flags). Try changing price fields, roles in requests or tampering signed tokens. Mitigation: server-side validation and integrity checks. | 
| XSS - media image    | Cross-site scripting via image metadata or filename (e.g. <img alt="..."> injection). Test image upload names & metadata. Mitigation: sanitize and encode filenames, serve images with safe headers. |
| XSS - feedback    | Reflected or stored XSS in feedback/comments. Try script payloads in feedback forms and review pages. Mitigation: output encoding, input sanitization, CSP. |
| Cookie i_am_admin    | Application trusts a client cookie like i_am_admin=true. Set it and test privileged pages. Mitigation: never trust client-side flags; use server-side sessions and signed cookies |
| Spamming folder    | An unprotected mailer or form that allows bulk email sending or an open directory that can be abused. Test forms for mass send and open directory listings. Mitigation: rate limits, auth, CAPTCHA. |
| Include page (LFI/RFI)    | Include/require parameter reads local files or fetches remote files. Test ?page=../../etc/passwd or remote URLs if enabled. Mitigation: whitelist pages, disable remote includes, validate inputs. |
| File upload vulnerability    | Uploads accept dangerous files (webshells) or store inside webroot. Try uploading .php disguised or a simple PHP webshell. Mitigation: validate MIME & extension, store outside webroot, rename files, scan uploads. |
| SQL injection - members    | SQLi in a members search/login endpoint. Try ' OR '1'='1 or time-based payloads. Tools: sqlmap (only in lab), Burp, manual payload. Mitigation: parameterized queries / prepared statements. |
| SQL injection - image    | SQL injection exposed via image id, tag, or comment fields. Same mitigations as above. |
| Brute force    | Weak authentication allows password guessing. Try automated attempts (carefully in lab) and observe lockout absence. Mitigation: rate-limiting, lockout, 2FA, password policies.|

**Folders contain:**
- Founded flag.
- Screenshots for proof.
- Scripts for specific breaches.
- Explaining notes

---

### **🌟 Bonus Part**

For the bonus, pick a subset of the most interesting breaches (e.g., LFI → RCE, file upload → webshell, SQLi blind union, XSS stored) and provide an advanced write-up including:

- Root cause analysis (which code/config failed),

- Full step-by-step exploit chain, commands & payloads,

- Proof of concept code (small and easy to review),

- Concrete, deployable mitigation and detection guidance

---

### **🧪 Testing**

![demo](./assets/darkly.gif)

---

### **🧰 Resources**

**Web & training platforms**

- [PortSwigger Web Security Academy — interactive labs & learning path](https://portswigger.net/web-security)
- [OWASP Juice Shop — intentionally vulnerable app for practise](https://owasp.org/www-project-juice-shop/)
- [Damn Vulnerable Web App (DVWA)](https://github.com/digininja/DVWA)

**Guides & Cheat sheets**

- [OWASP Top Ten](https://owasp.org/www-project-top-ten/) and [testing guide](https://owasp.org/www-project-web-security-testing-guide/)
- [OWASP Cheat Sheet Series (XSS, SQLi, Session Management...)](https://cheatsheetseries.owasp.org/)
- [PentestMonkey SQL Injection Cheat Sheet](http://pentestmonkey.net/cheat-sheet/sql-injection)
- [OWASP Unrestricted File Upload (concepts and mitigations)](https://owasp.org/www-community/vulnerabilities/Unrestricted_File_Upload)

**Must use**
- [Md5 Encrypt & Decrypt](https://md5decrypt.net/)
- [Free Password Hash Cracker](https://crackstation.net/)

**Tools**

- [Burp Suite (intercept & modify requests)](https://portswigger.net/burp)
- [OWASP ZAP (intercepting proxy & scanner)](https://www.zaproxy.org/)
- [sqlmap (SQLi automation)](https://sqlmap.org/)
- [nikto (web server scanner)](https://cirt.net/Nikto2)
- [nmap (network & port scanner)](https://nmap.org/)
- [gobuster / dirbuster (content discovery)](https://github.com/OJ/gobuster)

**Reading & payload collections**

- [XSS Filter Evasion / Prevention](https://owasp.org/www-community/xss)
- [HackTricks (practical exploitation cheats)](https://book.hacktricks.xyz/web)
