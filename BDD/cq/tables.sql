USE blog_Olivier;

DROP TABLE IF EXISTS Article;
DROP TABLE IF EXISTS User;
DROP TABLE IF EXISTS Comment;
#DROP TABLE IF EXISTS articleAuteur;
#DROP TABLE IF EXISTS auteurRole;

#CREATE TABLE role
#(
#    idRole  INT(3) UNSIGNED NOT NULL AUTO_INCREMENT,
#    libRole VARCHAR(128) NOT NULL,
#    PRIMARY KEY (idRole)
#)ENGINE = innodb;


CREATE TABLE user
(
    idUser  INT(3) UNSIGNED NOT NULL AUTO_INCREMENT,
    nomUser VARCHAR(128) NOT NULL,
    preUser VARCHAR(128) NOT NULL,
    mailUser VARCHAR(128) NOT NULL,
    pwdHasheUser VARCHAR(128) NOT NULL,
    dtUser DATETIME NULL,
    roleUser VARCHAR(128) NOT NULL,
    PRIMARY KEY (idUser),
    INDEX (nomUser)
)ENGINE = innodb;

CREATE TABLE categorie
(
    idCat INT(3) UNSIGNED NOT NULL AUTO_INCREMENT,
    libCat VARCHAR(128) NOT NULL,
     PRIMARY KEY (idCat)
    ) ENGINE = innodb;

CREATE TABLE commentaire
(
    idCom INT(3) UNSIGNED NOT NULL AUTO_INCREMENT,
    libCom VARCHAR(1500) NOT NULL,
    dtCom DATETIME NULL,
    idArt INT(3) UNSIGNED NOT NULL,
    idUser INT(3) UNSIGNED NOT NULL,
    PRIMARY KEY (idCom),
    CONSTRAINT FK_article
    FOREIGN KEY (idArt)
    REFERENCES article(idArt),
    CONSTRAINT FK_userCommentaire
    FOREIGN KEY (idUser)
    REFERENCES user (idUser)
    ) ENGINE = innodb;

CREATE TABLE article
(
    idArt  INT(3) UNSIGNED NOT NULL AUTO_INCREMENT,
    libArt VARCHAR(128) NOT NULL,
    resArt VARCHAR(128) NOT NULL,
    txtArt VARCHAR (20000) NOT NULL,
    imgArt VARCHAR(128) NOT NULL,
    dtArt DATETIME NULL,
    idUser INT(3) UNSIGNED NOT NULL,
    idCat INT(3) UNSIGNED NOT NULL,
    PRIMARY KEY (idArt),
    CONSTRAINT FK_user
    FOREIGN KEY (idUser)
    REFERENCES user(idUser),
    CONSTRAINT FK_categorie
    FOREIGN KEY (idCat)
    REFERENCES categorie (idCat),
    INDEX (dtArt)
) ENGINE = innodb;






#CREATE TABLE articleAuteur
#(
# idArt INT UNSIGNED NOT NULL,
# idAut INT UNSIGNED NOT NULL,
#CONSTRAINT fk_auteur
 #       FOREIGN KEY (idAut)
 #           REFERENCES auteur (idAut),
# UNIQUE (idArt, idAut)
# )ENGINE = innodb;


#CREATE TABLE auteurRole
# (
# idAut INT UNSIGNED NOT NULL,
# idRole INT UNSIGNED NOT NULL,
# CONSTRAINT fk_role
 #       FOREIGN KEY (idRole)
#            REFERENCES role (idRole),
 #UNIQUE (idAut, idRole)
# )ENGINE = innodb;



