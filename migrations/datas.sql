SHOW databases;
USE blog_olivier;


SET FOREIGN_KEY_CHECKS = 0;
# TRUNCATE TABLE article;
# TRUNCATE TABLE user ;
# TRUNCATE TABLE categorie;
# TRUNCATE TABLE commentaire;

SET FOREIGN_KEY_CHECKS = 1;



INSERT INTO user (idUser,nomUser, preUser, mailUser, pwdHasheUser, dtUser,roleUser )
VALUES (1, 'Grain de riz', 'Shangai', 'admin@admin.com', '$2y$10$vSXfxvJKKBoImM2Nb3UB9u\/s\/iz4LTHpj57EOyiu3fKsmh2W\/Fvy2', '2022-03-20','ADMIN'),
        (3, 'Grain de blé', 'Campagne', 'admin@mail.com', '$2y$10$lsRUF54UM1dN9yU8LtF.9eKtc.vBwvkkhB3UGTjNlM2whlHdwXnxa', '2022-05-27 14:26:51', 'ADMIN'),
        (4, 'Yhann', 'Champ', 'yhann.delpey@gmail.com', '$2y$10$QGRZA/vFmAaGIqcFGST7NezHdpQ5Z/8JGN9FPMNmpIUs6k2ZvgZ5q', '2022-05-27 14:28:33', 'ADMIN'),
        (5, 'jacob', 'lebruisec', 'jlebruitsec@gamil.com', '$2y$10$5v.tjOjE0Ydbh.i/zTtjPuXfIx.ypxG.lHHbm.q/9yCqaeVdXYgkK', '2022-05-28 13:22:37', 'ADMIN');


INSERT INTO categorie (idCat, libCat)
VALUES (1, 'Kung fu'),
       (2, 'Insolite'),
       (3, 'culture');


INSERT INTO article (idArt,libArt, resArt, txtArt, imgArt, dtArt,idUser,idCat)
VALUES (1, 'La vie avec Macron', 'Nous allons galerer encore pendant 5 ans avec ce fils de put', 'glaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa','images/manif.jpg', '2022-03-20',1,1),
       (2, 'La victoire des AZZURRI sur les BLEUS', 'Les meuilleures joueurs de foot de tous les temps', 'POPOROPOPOPO,POPOROPOPOPOPO,POPOROPOPOPO','images/manif.jpg', '2022-03-20',1,2),
       (3, 'Aixplora un site de dingue!', 'Le plus beau site pour découvrir le patrimoine', 'A vous maintanant de vous balader par les roues d Aix en Provence et découvrir ses secret','images/manif.jpg', '2022-03-20',1,3);


INSERT INTO commentaire (idCom, libCom, dtCom, idArt, idUser)
VALUES (1, 'Très beau article', '2022-03-20', 1,1),
       (2, 'Je ne partage pas votre avis','2022-03-20',3,1),
       (3, 'Une belle découverte, j\'irais voir merci', '2022-03-20',1,1);






