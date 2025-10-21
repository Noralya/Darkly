## **Spamming de Dossiers (Obscurcissement inefficace)**

### **Description**
Dans le fichier `robots.txt`, un dossier `.hidden` est mentionné en `Disallow`. En y accédant, on découvre une arborescence de dossiers imbriqués les uns dans les autres, sans contenu visible directement.
**Problème :** Cette méthode d’obscurcissement est inefficace : un attaquant peut facilement écrire un script (crawler) pour parcourir récursivement tous les dossiers et fichiers, et ainsi découvrir des informations sensibles.

### **Exemples d’exploitation**
- **Découverte de données sensibles** : Un attaquant peut automatiser la recherche de fichiers cachés dans cette arborescence.
- **Exploitation de fichiers oubliés** : Des sauvegardes, logs ou fichiers de configuration peuvent être exposés par erreur.

### **Recommandations**
- **Ne jamais compter sur l’obscurcissement** (dossiers imbriqués, noms de fichiers complexes) pour protéger des données.
- **Utiliser un fichier `.htaccess`** pour restreindre l’accès aux dossiers sensibles.
- **Stocker les données sensibles hors de la racine web** ou les protéger par authentification.
- **Supprimer les fichiers et dossiers inutiles** pour réduire la surface d’attaque.

### **Exemple de configuration `.htaccess` sécurisée**
```apache
# Interdire l'accès à tout le dossier .hidden
Order deny,allow
Deny from all
