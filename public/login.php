<?php

// Inclusion du fichier d'autoload de composer
require '../vendor/autoload.php';

// On démarre la session pour être certain qu'elle est démarrée
session_start();

// Inclusion des dépendances
include '../app/config.php';
include '../src/Core/Database.php';
include '../src/Core/AbstractModel.php';
include '../src/Model/ArticleModel.php';
include '../src/Model/CommentModel.php';
include '../src/Model/UserModel.php';
include '../lib/functions.php';

// Initialisations
$email = '';

// Si le formulaire est soumis...
if (!empty($_POST)) {

    // On récupère les données du formulaire
    $email = $_POST['email'];
    $password = $_POST['password'];

    // On vérifie les identifiants
    $userModel = new UserModel();
    $user = $userModel->checkUser($email, $password);

    // On a trouvé l'utilisateur, les identifiants sont corrects...
    if ($user) {

        // Enregistrement du user en session
        $userModel = new UserModel();
        $user = $userModel->registerUser($user['idUser'], $user['preUser'], $user['nomUser'], $user['mailUser'], $user['roleUser']);
    
        // Redirection pour le moment vers la page d'accueil du site
        header('Location: home.php');
        exit;
    } 
        
    $error = 'Identifiants incorrects';
}

// Inclusion du template
$template = 'login';
include "../templates/base.phtml";