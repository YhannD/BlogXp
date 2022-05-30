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


// Vérification du rôle
if (!UserModel::hasRole(ROLE_ADMIN)) {
    http_response_code(403);
    echo 'Accès interdit';
    exit;
}

// Traitements : récupérer les articles
$articleModel = new ArticleModel();
$articles = $articleModel->getAllArticles();

// Affichage : inclusion du fichier de template
$template = 'admin';
$script = '<script src="js/admin.js" defer></script>';
include '../templates/base_admin.phtml';




