## **Hidden Field Manipulation (Password Recovery)**

### **Description**
La page de récupération de mot de passe (?page=recover) présente un formulaire contenant uniquement un bouton "Submit", sans champ visible pour saisir une adresse e-mail. Cette absence de champ est suspecte, car une procédure classique de récupération de mot de passe nécessite généralement que l’utilisateur fournisse son adresse e-mail.

### **Analyse technique**
En inspectant le code source de la page, on découvre un champ caché (hidden field) nommé mail dans le formulaire. Ce champ contient par défaut l’adresse e-mail de l’administrateur qui reçoit les demandes de réinitialisation de mot de passe. Ce champ est modifiable côté client, ce qui permet à un attaquant de le manipuler à volonté.

### **Exemple d’exploitation**
Envoyer massivement des demandes de réinitialisation de mot de passe à une adresse cible (flood/mail bomb), en automatisant l’envoi via un script.
Usurper l’identité d’un utilisateur légitime en modifiant l’adresse e-mail du champ caché pour rediriger les demandes vers une adresse contrôlée par l’attaquant.

### **Recommandations**
Ne jamais stocker d’informations sensibles ou critiques dans des champs de formulaire côté client, surtout s’ils sont cachés.
Gérer la logique de récupération de mot de passe entièrement côté serveur : l’adresse e-mail doit être saisie par l’utilisateur dans un champ visible et validée côté serveur avant tout envoi.
Implémenter des mécanismes anti-flood (CAPTCHA, limite de tentatives, délai entre les envois).

### **Exemple de code corrigé (PHP)**

```php
function request_password($user_email)
{
    // Vérification et validation de l'e-mail côté serveur
    if (!filter_var($user_email, FILTER_VALIDATE_EMAIL)) {
        die("Adresse e-mail invalide.");
    }

    // Envoi de l'e-mail à l'administrateur
    mail(
        "admin@mail.fr",
        "Demande de réinitialisation de mot de passe",
        "Bonjour,\n\nL'utilisateur {$user_email} a demandé une réinitialisation de mot de passe.\n\nCordialement,"
    );
}
```