USE blog_Olivier;

DROP TABLE IF EXISTS commentaire;
DROP TABLE IF EXISTS article;
DROP TABLE IF EXISTS categorie;
DROP TABLE IF EXISTS user;


CREATE TABLE user
(
    idUser       INT(3) UNSIGNED NOT NULL AUTO_INCREMENT,
    nomUser      VARCHAR(128)    NOT NULL,
    preUser      VARCHAR(128)    NOT NULL,
    mailUser     VARCHAR(128)    NOT NULL,
    pwdHasheUser VARCHAR(128)    NOT NULL,
    dtUser       DATETIME        NULL,
    roleUser     VARCHAR(128)    NOT NULL,
    PRIMARY KEY (idUser),
    INDEX (nomUser)
) ENGINE = innodb;

CREATE TABLE categorie
(
    idCat  INT(3) UNSIGNED NOT NULL AUTO_INCREMENT,
    libCat VARCHAR(128)    NOT NULL,
    PRIMARY KEY (idCat)
) ENGINE = innodb;


CREATE TABLE article
(
    idArt  INT(3) UNSIGNED NOT NULL AUTO_INCREMENT,
    libArt VARCHAR(128)    NOT NULL,
    resArt VARCHAR(128)    NOT NULL,
    txtArt VARCHAR(20000)  NOT NULL,
    imgArt VARCHAR(128)    NOT NULL,
    dtArt  DATETIME        NULL,
    idUser INT(3) UNSIGNED NOT NULL,
    idCat  INT(3) UNSIGNED NOT NULL,
    PRIMARY KEY (idArt),
    CONSTRAINT FK_user
        FOREIGN KEY (idUser)
            REFERENCES user (idUser)
            ON UPDATE CASCADE
            ON DELETE CASCADE,
    CONSTRAINT FK_categorie
        FOREIGN KEY (idCat)
            REFERENCES categorie (idCat)
            ON UPDATE CASCADE
            ON DELETE CASCADE,
    INDEX (dtArt)
) ENGINE = innodb;

CREATE TABLE commentaire
(
    idCom  INT(3) UNSIGNED NOT NULL AUTO_INCREMENT,
    libCom VARCHAR(1500)   NOT NULL,
    dtCom  DATETIME        NULL,
    idArt  INT(3) UNSIGNED NOT NULL,
    idUser INT(3) UNSIGNED NOT NULL,
    PRIMARY KEY (idCom),
    CONSTRAINT FK_article
        FOREIGN KEY (idArt)
            REFERENCES article (idArt)
            ON UPDATE CASCADE
            ON DELETE CASCADE,
    CONSTRAINT FK_userCommentaire
        FOREIGN KEY (idUser)
            REFERENCES user (idUser)
            ON UPDATE CASCADE
            ON DELETE CASCADE
) ENGINE = innodb;







