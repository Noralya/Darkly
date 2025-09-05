## **Manipulation de Cookie (Élevation de privilèges)**

### **Description**
Le site utilise un cookie nommé `i_am_admin` dont la valeur est un hash MD5 de la chaîne `"false"`.
**Problème :** Il est possible de modifier manuellement la valeur de ce cookie pour y insérer le hash MD5 de `"true"`, ce qui permet d’obtenir des privilèges administrateur sans authentification valide.

### **Exemples d’exploitation**
- **Élevation de privilèges** : Un attaquant peut éditer le cookie pour se faire passer pour un administrateur et accéder à des fonctionnalités réservées.
- **Contournement de protections** : Si le site utilise ce cookie comme seule vérification d’accès, la sécurité est totalement compromise.

### **Recommandations**
- **Ne jamais stocker d’informations sensibles ou de privilèges dans des cookies non sécurisés.**
- **Privilégier l’utilisation de sessions chiffrées côté serveur** pour gérer les droits d’accès.
- **Mettre en place un système de gestion des droits basé sur l’identité de l’utilisateur** (exemple : base de données des rôles, JWT sécurisé).
- **Utiliser des cookies signés ou chiffrés** si leur utilisation est indispensable, et toujours valider leur intégrité côté serveur.

### **Exemple de code sécurisé (PHP)**
```php
// Exemple d'utilisation de session sécurisée
session_start();
if (!isset(\$_SESSION['is_admin']) || \$_SESSION['is_admin'] !== true) {
    die("Accès refusé.");
}
// Logique pour les administrateurs
