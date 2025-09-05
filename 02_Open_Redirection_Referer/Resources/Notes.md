## **Open Redirection (BornToSec)**

### **Description**
Dans le pied de page, un lien nommé "bornToSec" pointe vers une page contenant une musique. Dans les commentaires du code source, des indications suggèrent de modifier les en-têtes HTTP (Referer et User-Agent) pour simuler une provenance depuis le site https://www.nsa.gov/ et un navigateur personnalisé nommé "ft_bornToSec".

### **Exemples d’exploitation**
Contournement de protections basiques : Cette méthode pourrait être utilisée comme "protection" supplémentaire pour un web service, mais elle est facilement contournable.
Automatisation via script : Un script shell est possible pour envoyer une requête avec les en-têtes modifiés.

### **Recommandations**
Remplacer cette "protection" par une authentification robuste (page de connexion admin, gestion de session sécurisée).
Si cette méthode est utilisée pour un web service, ajouter un token ou un passcode supplémentaire dans les paramètres, et ne jamais se fier uniquement aux en-têtes HTTP.
