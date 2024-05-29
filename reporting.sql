-- Calcu du chiffre d'affaire mensuel
SELECT
    MONTH(date_commande) AS numero_mois,
    SUM(quantite * prix_unitaire) AS chiffre_affaires
FROM
    Commandes
    JOIN Produits ON Commandes.id_produit = Produits.id_produit
GROUP BY
    MONTH(date_commande)
ORDER BY
    mois;

-- Chiffre d'affaires hebdomadaire
SELECT
    YEAR(date_commande) AS annee,
    WEEK(date_commande) AS semaine,
    SUM(quantite * prix_unitaire) AS chiffre_affaires
FROM
    Commandes
    JOIN Produits ON Commandes.id_produit = Produits.id_produit
GROUP BY
    YEAR(date_commande),
    WEEK(date_commande)
ORDER BY
    annee,
    semaine;

-- Chiffre d'affaires mensuel
SELECT
    DATE_FORMAT(date_commande, '%Y-%m') AS mois,
    SUM(quantite * prix_unitaire) AS chiffre_affaires
FROM
    Commandes
    JOIN Produits ON Commandes.id_produit = Produits.id_produit
GROUP BY
    DATE_FORMAT(date_commande, '%Y-%m')
ORDER BY
    mois;

-- Le top 5 de sproduits
SELECT
    Produits.id_produit as ID_PRODUI,
    nom_produit as NOM_PRODUIT,
    SUM(quantite) AS QUANTITE_VENDUE
FROM
    Commandes
    JOIN Produits ON Commandes.id_produit = Produits.id_produit
GROUP BY
    ID_PRODUI,
    NOM_PRODUIT
ORDER BY
    quantite_vendue DESC
LIMIT
    5;

-- Top 5 des clients
SELECT
    Clients.id_client,
    Clients.nom_client,
    Clients.prenom_client,
    SUM(quantite * prix_unitaire) AS chiffre_affaires
FROM
    Commandes
    JOIN Clients ON Commandes.id_client = Clients.id_client
    JOIN Produits ON Commandes.id_produit = Produits.id_produit
GROUP BY
    id_client,
    nom_client,
    prenom_client
ORDER BY
    chiffre_affaires DESC
LIMIT
    5;

-- Chiffre d'affaire par moyen de paiement
SELECT
    Moyens_Paiement.id_moyen_paiement as ID_MOYEN_PAIEMENT,
    Moyens_Paiement.nom_moyen_paiement as NOM_MOYEN_PAIEMENT,
    SUM(quantite * prix_unitaire) AS CHIFFRE_AFFAIRE
FROM
    Commandes
    JOIN Moyens_Paiement ON Commandes.id_moyen_paiement = Moyens_Paiement.id_moyen_paiement
    JOIN Produits ON Commandes.id_produit = Produits.id_produit
GROUP BY
    id_moyen_paiement,
    nom_moyen_paiement
ORDER BY
    CHIFFRE_AFFAIRE DESC;

-- Moyen de paiement le plus utilisé
SELECT
    Moyens_Paiement.id_moyen_paiement,
    Moyens_Paiement.nom_moyen_paiement as NOM_MOYEN_PAIEMENT,
    COUNT(*) AS nombre_utilisations
FROM
    Commandes
    JOIN Moyens_Paiement ON Commandes.id_moyen_paiement = Moyens_Paiement.id_moyen_paiement
GROUP BY
    id_moyen_paiement,
    nom_moyen_paiement
ORDER BY
    nombre_utilisations DESC
LIMIT
    1;

-- CHiffres d'affaires par tranches haoraires
-- 08H-11H
SELECT
    SUM(quantite * prix_unitaire) AS chiffre_affaires_08_11
FROM
    Commandes
    JOIN Produits ON Commandes.id_produit = Produits.id_produit
WHERE
    TIME(date_commande) >= '08:00:00'
    AND TIME(date_commande) < '11:00:00';

-- 12H-15H
SELECT
    SUM(quantite * prix_unitaire) AS chiffre_affaires_12_15
FROM
    Commandes
    JOIN Produits ON Commandes.id_produit = Produits.id_produit
WHERE
    TIME(date_commande) >= '12:00:00'
    AND TIME(date_commande) < '15:00:00';

-- 15H-18H
SELECT
    SUM(quantite * prix_unitaire) AS chiffre_affaires_15h_18h
FROM
    Commandes
    JOIN Produits ON Commandes.id_produit = Produits.id_produit
WHERE
    TIME(date_commande) >= '15:00:00'
    AND TIME(date_commande) < '18:00:00';

-- 19H-23H
SELECT
    SUM(quantite * prix_unitaire) AS chiffre_affaires_19h_23h
FROM
    Commandes
    JOIN Produits ON Commandes.id_produit = Produits.id_produit
WHERE
    TIME(date_commande) >= '19:00:00'
    AND TIME(date_commande) < '23:00:00';

-- Chiffre affaires par mois
SELECT
    DATE_FORMAT(date_commande, '%Y-%m') AS mois,
    Produits.id_produit,
    Produits.nom_produit,
    SUM(quantite * prix_unitaire) AS chiffre_affaires
FROM
    Commandes
    JOIN Produits ON Commandes.id_produit = Produits.id_produit
GROUP BY
    DATE_FORMAT(date_commande, '%Y-%m'),
    id_produit,
    nom_produit
ORDER BY
    mois,
    chiffre_affaires DESC;

-- Chiffre d'affare des categories produits 
SELECT
    Categories.id_categorie,
    nom_categorie,
    SUM(quantite * prix_unitaire) AS chiffre_affaires
FROM
    Commandes
    JOIN Produits ON Commandes.id_produit = Produits.id_produit
    JOIN Categories ON Produits.id_categorie = Categories.id_categorie
GROUP BY
    Categories.id_categorie,
    nom_categorie
ORDER BY
    chiffre_affaires DESC;

-- Chiffre affaires
SELECT
    Produits.id_produit,
    Produits.nom_produit,
    SUM(quantite) AS total_ventes
FROM
    Commandes
    JOIN Produits ON Commandes.id_produit = Produits.id_produit
GROUP BY
    id_produit,
    nom_produit
HAVING
    total_ventes < 10;