<?php

class UserModel extends AbstractModel
{
    function getAllUsers(): array
    {
        $sql = 'SELECT *
            FROM user AS U
            ORDER BY U.idUser DESC';

//        $db = new Database();

        // Sinon on retourne directement notre tableau de users
        return $this->db->getAllResults($sql);
    }

    function getUserByEmail(string $email)
    {
        // Préparation de la requête SQL
        $sql = 'SELECT * 
            FROM user
            WHERE mailUser = ?';

//        $db = new Database();

        // On retourne ce résultat
        return $this->db->getOneResult($sql,[$email]);
    }

    function addUser(string $firstname, string $lastname, string $email, string $hash)
    {
        // On commence par récupérer tous les articles
//        $users = $this->getAllUsers();
        $role = ROLE_ADMIN;


        $sql = 'INSERT INTO user (nomUser, preUser, mailUser, pwdHasheUser, dtUser, roleUser)  /*Le insert into est une requête d action donc il ny a pas besoin de fecth contrairement aux requêtes de séléctions */ 
            VALUES (?,?,?,?,NOW(),?)';

//        $db = new Database();

        return $this->db->executeQuery($sql,[$firstname, $lastname, $email, $hash, $role]);
    }

    function checkUser(string $email, string $password)
    {
        // On récupère l'utilisateur à partir de son email
        $user = $this->getUserByEmail($email);
        // Si on trouve bien un utilisateur...
        if ($user) {

            // On vérifie son mot de passe
            if (password_verify($password, $user['pwdHasheUser'])) {

                // Tout est ok, on retourne l'utilisateur
//            return var_dump($user);
                return $user;
            }
        }

        // Si l'email ou le mot de passe est incorrect...
        return false;
    }

    function registerUser(string $idUser, string $firstname, string $lastname, string $email, string $role)
    {
        // On commence par vérifier qu'une session est bien démarrée
        if (session_status() == PHP_SESSION_NONE) {
            session_start();
        }

        // Puis on enregistre les données de l'utilisateur en session
        $_SESSION['user'] = [
            'idUser' => $idUser,
            'preUser' => $firstname,
            'nomUser' => $lastname,
            'mailUser' => $email,
            'roleUser' => $role
        ];
    }

    /**
     * Détermine si l'utilisateur est connecté ou non
     * @return bool - true si l'utilisateur est connecté, false sinon
     */
    static public function isConnected(): bool
    {
        // On commence par vérifier qu'une session est bien démarrée
        if (session_status() == PHP_SESSION_NONE) {
            session_start();
        }

        return array_key_exists('user', $_SESSION) && isset($_SESSION['user']);
    }

    /**
     * Déconnecte l'utilisateur
     */
    static public function logout()
    {
        // Si l'utilisateur est connecté...
        if (UserModel::isConnected()) {

            // On efface nos données en session
            $_SESSION['user'] = null;

            // On ferme la session
            session_destroy();
        }
    }

    /**
     * Retourne l'id de l'utilisateur connecté
     */
    static public function getUserId()
    {
        // Si l'utilisateur est connecté...
        if (!UserModel::isConnected()) {
            return null;
        }

        return $_SESSION['user']['idUser'];
    }

    /**
     * Retourne le prénom de l'utilisateur connecté
     */
    static public function getUserFirstname()
    {
        // Si l'utilisateur est connecté...
        if (!UserModel::isConnected()) {
            return null;
        }

        return $_SESSION['user']['preUser'];
    }

    /**
     * Retourne le nom de l'utilisateur connecté
     */
    static public function getUserLastname()
    {
        // Si l'utilisateur est connecté...
        if (!UserModel::isConnected()) {
            return null;
        }

        return $_SESSION['user']['nomUser'];
    }

    /**
     * Retourne l'email de l'utilisateur connecté
     */
    static public function getUserEmail()
    {
        // Si l'utilisateur est connecté...
        if (!UserModel::isConnected()) {
            return null;
        }

        return $_SESSION['user']['mailUser'];
    }

    /**
     * Retourne le rôle de l'utilisateur connecté
     */
    static public function getUserRole()
    {
        // Si l'utilisateur est connecté...
        if (!UserModel::isConnected()) {
            return null;
        }
//    return var_dump($_SESSION['user']['roleUser']);
        return $_SESSION['user']['roleUser'];
    }

    /**
     * Vérifie si l'utilisateur possède un rôle particulier
     */
    static public function hasRole(string $role)
    {
        if (!UserModel::isConnected()) {
            return false;
        }

        return UserModel::getUserRole() == $role;
    }
}
