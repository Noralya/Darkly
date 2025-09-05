## **File Upload Insecure (Téléchargement de fichiers malveillants)**

### **Description**
La page d’upload d’images permet d’envoyer des fichiers via un formulaire POST. **Problème :** Il est possible d’uploader un fichier `.php` en le faisant passer pour une image (en modifiant le nom ou le type MIME).

**Exploitation**
- Un attaquant peut utiliser un script ou un outil comme Tamper Data pour modifier le nom du fichier lors de l’envoi.
- Une fois le fichier `.php` uploadé, il peut être exécuté côté serveur, ouvrant la porte à une prise de contrôle totale du site.

### **Exemples d’exploitation**
- **Exécution de code arbitraire** : Upload d’un shell PHP pour prendre le contrôle du serveur.
- **Défiguration du site** : Remplacement des pages existantes par du contenu malveillant.
- **Vol de données** : Récupération de fichiers sensibles ou d’informations d’utilisateurs.

### **Recommandations**
- **Ne jamais faire confiance aux extensions ou types MIME** fournis par l’utilisateur.
- **Stocker les fichiers uploadés hors de la racine web** ou dans un dossier protégé.
- **Utiliser des noms de fichiers aléatoires** (UUID) et une base de données pour gérer les accès.
- **Vérifier le contenu réel du fichier** (via des bibliothèques comme `getimagesize()` pour les images).
- **Restreindre les types de fichiers autorisés** via un `.htaccess` :
```apache
  deny from all
      <Files ~ "^\w+\.(gif|jpe?g|png)\$">
      order deny,allow
      allow from all
      </Files>
```
Servir les fichiers via un script PHP qui force le bon Content-Type et empêche l’exécution de code.

### **Exemple de code sécurisé (PHP)**

```php
\$allowed_types = ['image/jpeg', 'image/png', 'image/gif'];
\$max_size = 2 * 1024 * 1024; // 2 Mo

if (isset(\$_FILES['image']) && in_array(\$_FILES['image']['type'], \$allowed_types)) {
    \$file_tmp = \$_FILES['image']['tmp_name'];
    \$file_info = getimagesize(\$file_tmp);
    if (\$file_info === false) {
        die("Fichier invalide.");
    }
    \$new_filename = uniqid() . '.' . pathinfo(\$_FILES['image']['name'], PATHINFO_EXTENSION);
    move_uploaded_file(\$file_tmp, "uploads/" . \$new_filename);
} else {
    die("Type de fichier non autorisé.");
}
