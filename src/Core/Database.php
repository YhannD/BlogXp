<?php

class Database
{
    static private ?PDO $pdo = null; // Ici, on met le typage null de l'objet donc on met un '?' devant l'objet.
    // Ici, c'est la même chose que pour la classe abstractModel on va factoriser $pdo avec une propriété et un constructeur.
//    static private int $countPDO = 0; // On rajoute cette propriété pour savoir le nombre de fois que l'on va créer l'objet PDO et donnc savoir le nombre de fois où l'on va se connecter dans la BDD. On le supprime car avec la dernière méthode on aura toujours une seule requête pour la base de données.

    function __construct(){

        if (self::$pdo == null) {// Si l'objet PDO est null, on va appeler la méthode etPDOConnection(). De  cette manière, on appelle une seule fois la BDD au lieu de créer plusieurs objets qui vont faire plusieurs requêtes.
            self::$pdo = $this->getPDOConnection();
//        $this->pdo = $this->getPDOConnection(); //Cette ligne appel plusieurs fois la BDD, donc on en a plus besoin.
//        self::$countPDO++;
        }
    }

//    static function getCountPDO(){
//        return self::$countPDO;
//    } // Donc, là il faudra fair un var dump à la fin des pages php pour savoir combien de fois on va dans la BDD

    function getPDOConnection()
    {
        // Connexion à la base de données
        $dsn = 'mysql:dbname=' . DB_NAME . ';host=' . DB_HOST . ';charset=utf8'; // DSN : Data Source Name (informations de connexion à la BDD)
        $user = DB_USER; // Utilisateur
        $password = DB_PASS; // Mot de passe
        $options = [
            PDO::ATTR_ERRMODE => PDO::ERRMODE_EXCEPTION, // Pour afficher les erreurs SQL
            PDO::ATTR_DEFAULT_FETCH_MODE => PDO::FETCH_ASSOC // Mode de récupération des résultats
        ];

        $pdo = new PDO($dsn, $user, $password, $options); // Création d'un objet de la classe PDO

        return $pdo;
    }

    function executeQuery(string $sql, array $values = []) // On met $sql en paramètre, car on ne la connait pas et elle change en fonction des besoins. Le 2ème paramètre est un tableau dont on ne connait pas les paramètres on lui donne une initialisation de tableau vide [] pour les situations où on n'a pas de paramètres.
    {

//        $pdo = $this->getPDOConnection(); // Ici getPdoConnection est une méthode il fait un $this-> pour l'appeler

        $pdoStatement = self::$pdo->prepare($sql); // Ici il faut changer le $this en self::.

        // 2. Je l'exécute en lui donnant dans un tableau les valeurs qui vont remplacer les "?"
        $pdoStatement->execute($values);

        return $pdoStatement;
    }

    function getAllResults(string $sql, array $values = [])// On met $sql en paramètre, car on ne la connait pas et elle change en fonction des besoins. Le 2ᵉ paramètre est un tableau dont on ne connait pas les paramètres on lui donne une initialisation de tableau vide [] pour les situations où on n'a pas de paramètres. On a les mêmes paramètres que executeQuery().
    {
        $pdoStatement = $this->executeQuery($sql, $values);

        return $pdoStatement->fetchAll(); // On retourne le résultat du $pdoStatement.
    }

    function getOneResult(string $sql, array $values = [])
    {
        $pdoStatement = $this->executeQuery($sql, $values);

        return $pdoStatement->fetch();
    }
    // Le ->query contrairement à ->prepare et ->execute ne protège pas des injections SQL. Donc, on ne l'utilise que lorsque l'on est sûr qu'il n'y aura pas d'injection.
}