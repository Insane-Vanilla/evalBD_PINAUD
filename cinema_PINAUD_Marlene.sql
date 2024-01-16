-- BASE DE DONNEES : "pinaud_cinema"

-- --------------------------------------------------------------

-- Structure table administrateur : 
DROP TABLE IF EXISTS administrateur;
CREATE TABLE administrateur 
(
    idAdmin INTEGER PRIMARY KEY AUTO_INCREMENT,
    email_admin VARCHAR(50) NOT NULL UNIQUE,
    password_admin VARCHAR (50) NOT NULL
);
-- Alimentation table administrateur : 

INSERT INTO administrateur ('idAdmin', 'email_admin', 'password_admin') 
VALUE (1, 'admin@cinema.com', '$2a$04$6WMe41lU6QDWj5q8txj3r.CjFHGZShni3Mwmb5CJ4L65SUEt/Q6Xi');

-- ----------------------------------------------------------------

-- Création table cinema : 
DROP TABLE IF EXISTS cinema;
CREATE TABLE cinema
(
    idCinema INTEGER PRIMARY KEY NOT NULL  AUTO_INCREMENT,
    nom_cinema VARCHAR (50),
    adresse_cinema VARCHAR (255),
    email_utilisateur VARCHAR(50) NOT NULL UNIQUE,
    password_utilisateur VARCHAR(50) NOT NULL,
    FOREIGN KEY (idAdmin) REFERENCES administrateur(idAdmin)
);

-- Alimentation table cinema :

INSERT INTO cinema ('idCinema', 'nom_cinema', 'adresse_cinema', 'email_utilisateur',
'password_utilisateur', 'idAdmin') 
VALUES 
(1, 'Iron Cinema', 'Grenoble', 'ironcinema@cinema.com','$2a$04$y9xcKdF.OWTMJSIutVPJf.YDWamKRoq1DExo3l/Ym29NuJfBbGJzS', '1'),
(2, 'Bush Cinema', 'Chicago', 'bushcinema@cinema.com','$2a$04$PpfDBq27c9iTBjXlzfR56eLbwSfErKH7jPgzm.SSI7i7/hTfKrENa', '1'),
(3, 'Floyd Cinema', 'Nairobi', 'floydcinema@cinema.com','$2a$04$4KUid1Gv0TLJvhjxjP3f6uL6VvVxlhGFgQOM5ObQ9XXUiV.mGA.wq', '1'),
(4, 'Beach Cinema', 'Minsk', 'beachcinema@cinema.com','$2a$04$Yk/90fNgcxrAlUFDvg9raO/a6oY2TQP61NCysbBDHJ8hsUXC7t1WO', '1'),
(5, 'Morrison Cinema', 'Shanghai', 'morrisoncinema@cinema.com','$2a$04$CcuNME6f/MtYHFExG59caOScmNLGzfD22BDsLBfHbVdfEzzy8pg2a', '1'),
(6, 'Chopin Cinema', 'Wellington', 'chopincinema@cinema.com','$2a$04$OTK9k7g./HzAWo43P4v4Req4swIDZdNcWUEW8S0kBNG1EZD0DlKSm', '1');

-- ----------------------------------------------------------------


-- Structure table salle :
DROP TABLE IF EXISTS salle; 
CREATE TABLE salle 
( 
    idSalle INTEGER PRIMARY KEY AUTOINCREMENT,
    nombre_places INT,
    FOREIGN KEY (idCinema) REFERENCES cinema(idCinema)
);

-- Alimentation table salle : 

INSERT INTO salle('idSalle', 'nombre_places', 'idCinema' ) 
VALUES
(1, 417, 5),
(2, 228, 2),
(3, 362, 1),
(4, 397, 2),
(5, 418, 5),
(6, 320, 4),
(7, 258, 4),
(8, 298, 6),
(9, 426, 4),
(10, 170, 6),
(11, 373, 2),
(12, 200, 6),
(13, 234, 1),
(14, 159, 4),
(15, 252, 4),
(16, 379, 6),
(17, 228, 1),
(18, 338, 5),
(19, 327, 2),
(20, 404, 1);


-- ----------------------------------------------------------------

-- Structure table film :
DROP TABLE IF EXISTS film; 
CREATE TABLE film
(
    idFilm INTEGER PRIMARY KEY AUTOINCREMENT,
    nom_film VARCHAR(50),
    duree_film TIME
);

-- Alimentation table film :
INSERT INTO film ('idFilm', 'nom-film', 'duree_film') 
VALUES
(1, 'Boulevard de la mort', '01:50:05'),
(2, 'Alabama Monroe', '01:55:45'),
(3, 'Wayne\'s Wordl 2', '02:15:30'),
(4, 'The Mask', '01:35:15'),
(5, 'Princess Bride', '03:05:25'),
(6, 'Anatomie d\'une chute', '02:40:00'),
(7, 'La leçon de piano', '02:55:05'),
(8, 'Highlander', '1:40:20'),
(9, 'Billy Elliot', '2:25:05'),
(10, 'Last days of Summer', '02:05:15');

-- ----------------------------------------------------------------

-- Structure table seance : 
DROP TABLE IF EXISTS seance;
CREATE TABLE seance 
(
    idSeance INTEGER PRIMARY KEY AUTOINCREMENT,
    date_seance DATE,
    horaire_seance TIME,
    tarif_seance DECIMAL,
    FOREIGN KEY (idSalle) REFERENCES salle(idSalle),
    FOREIGN KEY (idFilm) REFERENCES film(idFilm),
    FOREIGN KEY (idAdmin) REFERENCES administrateur(idAdmin)
);

-- Alimentation table seance : 
 
INSERT INTO seance ('idSeance', 'date_seance', 'horaire_seance', 'tarif_seance', 'idSalle', 'idFilm', 'idAdmin') 
VALUES 
(1, '07/01/2024', '3:37 PM', 57, 9.20, 9, 1),
(2, '23/01/2024', '7:48 PM', 4, 7.60, 2, 1),
(3, '02/01/2024', '1:32 PM', 11, 5.90, 8, 1),
(4, '14/01/2024', '4:06 PM', 62, 5.90, 4, 1),
(5, '24/01/2024', '12:09 PM', 50, 9.20, 1, 1),
(6, '27/01/2024', '11:55 AM', 36, 5.90, 2, 1),
(7, '04/01/2024', '2:25 PM', 68, 7.60, 8, 1),
(8, '31/01/2024', '1:49 PM', 98, 7.60, 8, 1),
(9, '23/01/2024', '6:20 PM', 84, 9.20, 2, 1),
(10, '01/01/2024', '6:01 PM', 78, 5.90, 2, 1),
(11, '18/01/2024', '1:40 PM', 53, 9.20, 8, 1),
(12, '10/01/2024', '5:41 PM', 46, 7.60, 9, 1),
(13, '10/01/2024', '5:46 PM', 86, 9.20, 4, 1),
(14, '14/01/2024', '8:35 PM', 22, 5.90, 4, 1),
(15, '11/01/2024', '6:09 PM', 48, 9.20, 9, 1),
(16, '26/01/2024', '12:48 PM', 69, 7.60, 5, 1),
(17, '18/01/2024', '3:06 PM', 77, 7.60, 1, 1),
(18, '26/01/2024', '11:53 AM', 4, 5.90, 4, 1),
(19, '26/01/2024', '12:19 PM', 91, 5.90, 4, 1),
(20, '01/01/2024', '11:10 AM', 74, 9.20, 8, 1),
(21, '02/01/2024', '8:36 PM', 5, 9.20, 3, 1),
(22, '01/01/2024', '10:22 AM', 69, 7.60, 9, 1),
(23, '02/01/2024', '4:09 PM', 24, 9.20, 8, 1),
(24, '26/01/2024', '9:02 PM', 65, 5.90, 1, 1),
(25, '25/01/2024', '11:43 AM', 71, 7.60, 3, 1),
(26, '01/01/2024', '5:15 PM', 19, 5.90, 10, 1),
(27, '29/01/2024', '12:44 PM', 89, 9.20, 1, 1),
(28, '16/01/2024', '5:21 PM', 40, 9.20, 7, 1),
(29, '07/01/2024', '9:40 AM', 72, 7.60, 1, 1),
(30, '01/01/2024', '8:29 PM', 91, 5.90, 2, 1);

-- ----------------------------------------------------------------

-- Structure table client : 

CREATE TABLE client
(
    idClient INTEGER PRIMARY KEY AUTOINCREMENT,
    nom_client VARCHAR(50) NOT NULL,
    prenom_client VARCHAR(50) NOT NULL,
    email_client VARCHAR(255) NOT NULL UNIQUE,
    password_client VARCHAR(50) NOT NULL
);

-- Alimentation table client : 

INSERT INTO client ('idClient', 'nom_client', 'prenom_client', 'email_client', 'password_client' ) 
VALUES
(1, 'Ingaborg', 'Adélie', 'ivonoertzen0@auda.org.au', '$2a$04$yRq.PVw9AQF50S.ity7rcO8QoKrS0BnH87sPI0740Rpfd0pQExGk6'),
(2, 'Loren', 'Angélique', 'lsmallshaw1@go.com', '$2a$04$pFnuJdF.YN.ZUfDrqvq3kOni5tUdrVVG4vzYmY4hR0emcPmoSlQqe'),
(3, 'Vern', 'Agnès', 'vmarchand2@addtoany.com', '$2a$04$iwtPS6WvXkDGvftQiVSbcedfCUWN6DupVUIeNxXZoDmSBj0jZyFAO'),
(4, 'Enos', 'Yénora', 'ecowthard3@a8.net', '$2a$04$.QgD4eTitusKVdnXm2o.XezueR9aSPHGYqJrWNJGZ16lEKIypW9sW'),
(5, 'Hilton', 'Fèi', 'hthornally4@artisteer.com', '$2a$04$02yyzUnb.C8/CZTfWNvpOeqWFzYhhdRbdK7c2ERE6c9vYqNtBqvxe'),
(6, 'Margalit', 'Nuó', 'mriep5@furl.net', '$2a$04$sfGo83D6lNKIEkYN.oHvT.FQKYq5e5UJBjZFu4vySXI41z9OkQ2e2');
(7, 'Kerwin', 'Audréanne', 'kdownham6@yellowpages.com', '$2a$04$T1eOVxJpi0dJR/mlCjiEHe7JavHb3GS/8UbMXq5KbUcnGSHbYV15m'),
(8, 'Jordan', 'Méng', 'jswinburn7@jigsy.com', '$2a$04$0x7K.FY4.9uZoE5ymEOjA.Edfs7p7BdozlCC1QS6TPTrNAhjNWu8G'),
(9, 'Catlin', 'Eléa', 'cbon8@sina.com.cn', '$2a$04$nYaW36nEYcqk/EQZU2TVReuhDKEb/GNQedfE2XuYdsGCtc02MPD5u'),
(10, 'Ellwood', 'Naéva', 'ebowdrey9@scientificamerican.com', '$2a$04$I//o0neP3y92vfJtOikjZ.iQQXmb5.71h4fMszia1I/9Ib3iKuDXO'),
(11, 'Kimmie', 'Pò', 'kbrittiana@opera.com', '$2a$04$5sgPtUmMpRocbDxMXGVPWeo4846OixF5FqpJNjSjEgzJnu1xZmaba'),
(12, 'Udale', 'Léana', 'ubiersb@soup.io', '$2a$04$G6XZxVDMwNP19kYFNz.p6O02NOW8AEQP9nSsjXda5kjZMPHcC8T0S'),
(13, 'Huberto', 'Åke', 'hblunsomc@salon.com', '$2a$04$6X3Uj07DtNiWdp8BRlcDfuaAY/Yrsi8AUTESnGf..hwbNpbAKht1C'),
(14, 'Sharon', 'Renée', 'sdesforgesd@acquirethisname.com', '$2a$04$Lop6P02F2lkU60Po20HdNOg1Y.Ki7Q418Ea/BnPbLBISjBFefxEgy'),
(15, 'Vania', 'Alizée', 'vsalmone@harvard.edu', '$2a$04$hAiLimL5b5q8RW4tYQWRFOS1qYE2gKTSsrI74czrxNNKlL00ohoQG'),
(16, 'Geoffrey', 'Dù', 'gducrowf@gravatar.com', '$2a$04$F.QaV5R0wW.mVQ/vQggIi.ojzJfp02F4wx02LHUn4CjQ/Db9WOYeC'),
(17, 'Herby', 'Mélys', 'hgaddesg@opera.com', '$2a$04$sOo.dudOMOVLKltbDp2g8.cIYA8FDp2YF.1Ak1i4Sr68mK/fPlHdK'),
(18, 'Shawn', 'Dà', 'schomleyh@ebay.co.uk', '$2a$04$lpXpZsn891.TXZDSJ9ebIOns6/m9gieA5oZ.ry/UbSYVEY2175Kmu'),
(19, 'Bidget', 'Lyséa', 'bpringeri@house.gov', '$2a$04$1yqp20m6l0vYks1sOBW9VeTWAT4/LXE1tuLTkHDixVik/dJmhjn1q'),
(20, 'Graig', 'Lauréna', 'gsichj@nps.gov', '$2a$04$2T2I3bAVJqW7qaQVGvirh.VygeJXqtpv0OO.zBkvTN8FM7JEKCf2S'),
(21, 'Lorne', 'Yénora', 'lwressellk@redcross.org', '$2a$04$9dv.cOsEx6JrHdlQTl99q.YihTJKo/5TtXhBPGDJrVtAFMlpgg3t2'),
(22, 'Birch', 'Josée', 'bbowkettl@discovery.com', '$2a$04$uqW3C186/MYN4Z0tbb/rmO33b3n0lH7xgjf/xcUa6UMNDA8qGcXTO'),
(23, 'Gabey', 'Kuí', 'grobiotm@theguardian.com', '$2a$04$3BA.6N.gxC.7yZbeRL7VUurtQHmkLlNweyB2xx1AewgDLRYfgjdfC'),
(24, 'Natividad', 'Marie-noël', 'ngroocockn@cyberchimps.com', '$2a$04$gSc/stAcLJp5nBRBB/EIc.DiRwh8X5Dk2uTFDwySDVSSAsLk/Lhb.'),
(25, 'Carmita', 'Médiamass', 'ckmicickio@macromedia.com', '$2a$04$RTZIjREWZwBBiIIxisGe6eYwr1BsMVQZJdw6xguBgs7rXqP/HRu4i'),
(26, 'Hammad', 'Irène', 'hwinscump@netvibes.com', '$2a$04$lAR3488rZlwkTLAyIihZsOUgJSsvuBkQnSYs2zcEa8dAlqDhhDwmG'),
(27, 'Matthieu', 'Gérald', 'mmcsperronq@google.com.au', '$2a$04$DV6xa3NVQQie/JiFbNHDbutC9XCwVlLwIf3AkeR35UfjA7ERo2/b6'),
(28, 'Allard', 'Noémie', 'amacgiollapheadairr@reference.com', '$2a$04$R5hq1V6PocKafVm941AgoOBhcZAl3Pc.TMOhhVY/A0N0l2Qg5FUp2'),
(29, 'Sheffield', 'Mélissandre', 'svillierss@va.gov', '$2a$04$keAEVyWlesxVBjLLrLMXN.8cXUuXP4NcDUpXAFE377CfzkmaRPiD.'),
(30, 'Ashlie', 'Rébecca', 'aosheilst@dedecms.com', '$2a$04$TB5yup81H2zePqEiIHaeJ.xPVa9KZ9FX4uLCK1uh/RVDhG55ETijC'),
(31, 'Far', 'Lauréna', 'fstaggsu@weibo.com', '$2a$04$2kxd/pqSXT/oYBokqFqk4uiuhBFi1/qpF6I5nbw1MRaElqAbVFhKy'),
(32, 'Nissa', 'Anaël', 'ndelaharpev@blog.com', '$2a$04$HmykbIcLjsEbjYivsJT3Set8pzCikKkIdyREnfVBhuMnerSUiIpnW'),
(33, 'Neala', 'Océanne', 'nmctrustramw@jimdo.com', '$2a$04$W0Mh6dIDs.l6gCEqfhG0IO.lEnWNwPSkVfQC3/ykRXkCXccV1lpvS'),
(34, 'Brantley', 'Crééz', 'blivseyx@eepurl.com', '$2a$04$mN2rs54oOfXfRUxEGaqVce5SYrXfI8Gx2GDMu0SDFByXgY.dgAIg.'),
(35, 'Carry', 'Marie-françoise', 'cpegramy@alexa.com', '$2a$04$1c075ZAcTAo34cxdyEX.NuCev5lA.HqYEBT1rfLLwzBQ5a6O8eIKW'),
(36, 'Constanta', 'Méng', 'cwoollettz@ebay.com', '$2a$04$osEmE3/ajmdkEaHJkZKJf.S3DYG0mwZpbC/loo3v1Yzgsadsp.G42'),
(37, 'Lethia', 'Mélina', 'lleguey10@uol.com.br', '$2a$04$D7dp4aKhbxfwvzSR21nVEeSVqptkjO0lUfW7jj7ytsvFgxEeW.mTa'),
(38, 'Bev', 'Cléa', 'bfoskett11@addtoany.com', '$2a$04$VIOyAzTLTCh7bQ92FXv8aOxqBn.0GoCs5JcmGelNLhDCShhYxUdp6'),
(39, 'Charleen', 'Josée', 'cflacknell12@answers.com', '$2a$04$1LRIoroTTdgdYSGKruQX7.QT5OeA.xbGaa0rWFHPEBJ9gBhV3k9s.'),
(40, 'Patty', 'Loïc', 'pbriscam13@icio.us', '$2a$04$lGHGAMT9p/82UviH9jWWVuyHuKK.Cy9NM8vmWGOyW.Z17OVslQgVW'); 

-- ----------------------------------------------------------------

-- Structure table reservation_seance :
DROP TABLE IF EXISTS reservation_seance;
CREATE TABLE reservation_seance
(
    FOREIGN KEY PRIMARY KEY idClient INTEGER,
    FOREIGN KEY PRIMARY KEY idSeance INTEGER,
    achat_online BOOLEAN
);

-- Alimentation table reservation_seance :

INSERT INTO reservation_seance ('idClient', 'idSeance', 'achat_online') 
VALUES
(2, 4, false),
(32, 4, false),
(15, 13, false),
(40, 1, true),
(28, 7, true),
(2, 19, false),
(15, 30, false),
(28, 13, true),
(22, 15, false),
(34, 2, false),
(14, 10, false),
(22, 24, false),
(4, 8, false),
(25, 22, false),
(6, 29, false),
(31, 21, true),
(7, 25, false),
(31, 6, false),
(25, 22, false),
(38, 10, false),
(31, 1, false),
(4, 16, false),
(20, 10, false),
(2, 28, false),
(39, 1, false),
(24, 22, false),
(19, 17, false),
(25, 5, true),
(31, 1, false),
(28, 3, true),
(33, 10, true),
(32, 18, false),
(18, 7, false),
(32, 18, true),
(31, 20, false),
(12, 2, false),
(34, 2, true),
(14, 23, false),
(12, 2, true),
(16, 6, true);

