## **Open Redirection (BornToSec)**

### **Description**
Dans le pied de page, un lien nommé "bornToSec" pointe vers une page contenant une musique. Dans les commentaires du code source, des indications suggèrent de modifier les en-têtes HTTP (Referer et User-Agent) pour simuler une provenance depuis le site https://www.nsa.gov/ et un navigateur personnalisé nommé "ft_bornToSec".

![Alt text](Resources/1.png)
![Alt text](Resources/2.png)
![Alt text](Resources/3.png)
![Alt text](Resources/4.png)

---

![Alt text](Resources/5.png)
![Alt text](Resources/6.png)
![Alt text](Resources/7.png)

Referer : contient l'adresse de la page web précédente à partir de laquelle un lien a été suivi pour demander la page courante, il permet aux serveurs d'identifier la provenance des visiteurs d'une page.

User-Agent : chaîne de caractères envoyée par un client, comme un navigateur web, dans l'en-tête pour identifier le logiciel client auprès du serveur web, cette information permet au serveur de reconnaître le type de navigateur, la version du système d'exploitation, le type d'appareil (ordinateur, mobile, etc.)

### **Exemples d’exploitation**
Contournement de protections basiques : Cette méthode pourrait être utilisée comme "protection" supplémentaire pour un web service, mais elle est facilement contournable.
Automatisation via script : Un script shell est possible pour envoyer une requête avec les en-têtes modifiés.

### **Recommandations**
Remplacer cette "protection" par une authentification robuste (page de connexion admin, gestion de session sécurisée).
Si cette méthode est utilisée pour un web service, ajouter un token ou un passcode supplémentaire dans les paramètres, et ne jamais se fier uniquement aux en-têtes HTTP.
