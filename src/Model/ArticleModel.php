<?php

class ArticleModel extends AbstractModel // Ne pas oublier de faire un extend de la classe.

/* Cette classe représentante le CRUD */

{
    function getAllArticles(): array
    {
        $sql = 'SELECT *
            FROM article AS A
            ORDER BY A.dtArt DESC';

//        $db = new Database(); //Cette variable est toujours présente dans chaque méthode et elle vient de Database. Le mettre en propriété veut dire qu'on va le mutualiser dans la classe.

        return $this->db->getAllResults($sql);
    }

    function getOneArticle(int $idArticle): bool|array
    {
        // Connexoin à la base de données

        // Préparation de la requête SQL
        $sql = 'SELECT * 
            FROM article
            WHERE idArt = ?';

//        $db = new Database();

        return $this->db->getOneResult($sql, [$idArticle]);

    }

    function addArticle(string $title, string $abstract, string $content, string $image)
    {

        // Préparation de la requête
        $sql = 'INSERT INTO article (libArt, resArt, txtArt, imgArt, dtArt,idUser, idCat)  /*Le insert into est une requête d action donc il ny a pas besoin de fecth contrairement aux requêtes de séléctions */ 
            VALUES (?,?,?,?,NOW(),1,1)';

//        $db = new Database();

        return $this->db->executeQuery($sql, [$title, $abstract, $content, $image]);

    }

    function editArticle(string $title, string $abstract, string $content, string $image, string $idArticle)
    {

        $sql = 'UPDATE article 
                SET libArt = ?, resArt = ?, txtArt = ?, imgArt = ?
                WHERE idArt = ?';

//        $db = new Database();

        return $this->db->executeQuery($sql, [$title, $abstract, $content, $image, $idArticle]);
    }


    function deleteArticle(string $idArticle)
    {

        $sql = 'DELETE FROM article
                WHERE idArt = ?';

        $this->db->executeQuery($sql, [$idArticle]);

    }

}