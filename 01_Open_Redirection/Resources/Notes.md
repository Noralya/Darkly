## **Open Redirection (Réseaux Sociaux)**

### **Description**
Dans le pied de page (footer) du site, trois liens vers les réseaux sociaux (Facebook, Twitter, Instagram) sont présents. Ces liens utilisent une page de redirection interne qui accepte un paramètre `site` dans l’URL.
**Problème :** Il est possible de passer n’importe quelle URL externe en paramètre, par exemple : `http://www.google.fr/`.

### **Exemples d’exploitation**
Un attaquant pourrait exploiter cette faille pour :
- **Rediriger les utilisateurs vers un site malveillant** (phishing), en leur faisant croire qu’ils cliquent sur un lien légitime.
- **Envoyer des campagnes de mass-mailing** avec des liens semblant provenir du site officiel (exemple : une banque), augmentant ainsi le taux de succès d’une attaque de phishing.

### **Recommandations**
- **Limiter les redirections à une liste blanche** de sites autorisés.
- **Ne jamais rediriger vers une URL fournie directement par l’utilisateur** sans validation stricte.

### **Exemple de code corrigé (PHP)**
```php
function check_site(\$site)
{
    \$allowed_redirect = array("facebook", "twitter", "instagram");
    if (in_array(\$site, \$allowed_redirect)) {
        function_qui_redirige(\$site);
    } else {
        return false;
    }
}

if (isset(\$_GET['site'])) {
    check_site(\$_GET['site']);
}
```