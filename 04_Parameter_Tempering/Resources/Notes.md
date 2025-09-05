## **Parameter Tampering (Manipulation de paramètres)**

### **Description**
Sur la page de sondage (survey), un tableau de formulaires est présenté **sans aucune validation**, ni côté client (front) ni côté serveur (back).
**Problème :** Il est possible de modifier manuellement la valeur d’un champ (par exemple, passer de `5` à `10000`) pour fausser les résultats du sondage.

### **Exemples d’exploitation**
- **Falsification de résultats** : Un utilisateur malveillant peut manipuler les valeurs soumises pour influencer les résultats d’un sondage (exemple : choisir la prochaine musique diffusée par une radio).
- **Abus de système de points** : Si le sondage est lié à un système de récompenses, cette faille permet d’obtenir des avantages indus.

### **Recommandations**
- **Toujours valider les entrées côté serveur** : ne jamais faire confiance aux données envoyées par le client.
- **Ajouter une validation côté client** pour améliorer l’expérience utilisateur, mais ne pas s’y fier pour la sécurité.
- **Limiter les valeurs possibles** à une plage acceptable (exemple : notes entre 1 et 10).

### **Exemple de code corrigé (PHP)**
```php
function check_value(\$value)
{
    return (\$value >= 1 && \$value <= 10);
}

// Utilisation :
if (isset(\$_POST['note']) && check_value(\$_POST['note'])) {
    // Traitement de la note
} else {
    die("Valeur invalide.");
}
