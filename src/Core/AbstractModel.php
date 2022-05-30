<?php

abstract class AbstractModel // On dit que cette classe fait de la 'composition, car elle stock un objet qui provient d'une autre classe sans en être un enfant.
{
    protected Database $db; // On déclare la variable $db qui revient souvent en propriété et on va l'initialiser dans le constructeur. Le fait de le mettre directement dans la classe induit que l'on va avoir qu'une seule connection à la BDD ou lieu de faire une nouvelle connection à chaque requête. On met la propriété en protected pour pouvoir récupérer les données dans les enfants de la classe.

    function __construct()
    {
        $this->db = new Database();

    }
}