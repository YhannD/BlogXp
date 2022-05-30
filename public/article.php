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

// Traitements 

// Validation du paramètre id de l'URL
if (!array_key_exists('id', $_GET) || !$_GET['id'] || !ctype_digit($_GET['id'])) {

    http_response_code(404);
    echo 'Article introuvable';
    exit; // Si pas d'id dans l'URL => message d'erreur et on arrête tout ! 
}

// On récupère l'id de l'article à afficher depuis la chaîne de requête
$idArticle = (int) $_GET['id'];
$idUser = getUserId();
dump([$idUser,$idArticle]);
var_dump([$idUser,$idArticle]);

// On va chercher l'article correspondant
//$article = getOneArticle($idArticle);
$articleModel = new ArticleModel();
$article = $articleModel->getOneArticle($idArticle);

// On vérifie qu'on a bien récupéré un article, sinon => 404
if (!$article) {

    http_response_code(404);
    echo 'Article introuvable';
    exit; // Si pas d'article => message d'erreur et on arrête tout ! 
}

//Validation idArticle si c'est sur la meme page on met un if sinon c'est pas nécessaire.
$error=[];
if(!empty ($_POST)){
    $idUser = UserModel::getUserId();
    if ($idUser == null) {
        header('Location: login.php');
        exit;
    }
    $content =trim($_POST['content']); // Les clefs du tableau associatif sont les memes que celles du fichier phtml.
    if(!$content){
        $error['content']= 'Le champ commentaire est obligatoire'; // Validation coté serveur mais il fait en faire un aussi coté client.
    }
    if(empty($error)){
        $commentModel = new CommentModel();
        $comments = $commentModel->insertComment ($content, $idUser, $idArticle);
    }
    //Redirection il faut la faire systématique lorsque l'on est en POST pour rediriger vers du GET et de perdre les données du POST.
    header('Location: article.php?id='.$idArticle);
    exit; // Ces commandes de redirections doivent être faite en dernier pour être sûr que la page fonctionne sinon les var dump etc ne seront pas pris en compte.
}
//$comments = getCommentsByArticleId($idArticle);
$commentModel = new CommentModel();
$comments = $commentModel->getCommentsByArticleId($idArticle);

//var_dump(Database::getCountPDO());

// Affichage : inclusion du fichier de template
$template = 'article';
include '../templates/base.phtml';
