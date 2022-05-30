<?php

class CommentModel extends AbstractModel
{
    function insertComment(string $content, int $idUser, int $idArticle)// Le nom des variables et le nom des paramètres n'a aucun lien avec les autres variables en dehors de la fonction pour php.
    {

        // Préparation de la requête
        $sql = 'INSERT INTO commentaire (libcom, idArt, idUser, dtCom)  /*Le insert into est une requête d action donc il ny a pas besoin de fecth contrairement aux requêtes de séléctions */ 
                VALUES (?,?,?,NOW())';

//        $db = new Database(); // Le new Database vient désormais de la class abstract Model.

        return $this->db->executeQuery($sql,[$content, $idArticle, $idUser]);

    }

    function getCommentsByArticleId( int $idArticle){
//        $pdo=getPDOConnection();
        $sql = 'SELECT libCom, dtCom, preUser, nomUser
                FROM commentaire com
                INNER JOIN user usr on com.idUser = usr.idUser
                WHERE idArt = ?
                ORDER BY com.dtCom DESC';

//        $db = new Database();

        return $this->db->getAllResults($sql,[$idArticle]);
    }
}