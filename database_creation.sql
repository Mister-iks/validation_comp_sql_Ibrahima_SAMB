-- Création de la base de données "dbauchan"
CREATE DATABASE dbauchan;

-- Sélection de la base de données
USE dbauchan;

-- Création de la table "Moyens_Paiement"
CREATE TABLE Moyens_Paiement (
    id_moyen_paiement INT PRIMARY KEY,
    nom_moyen_paiement VARCHAR(255)
) ENGINE = InnoDB;

-- Création de la table "Categories"
CREATE TABLE Categories (
    id_categorie INT PRIMARY KEY,
    nom_categorie VARCHAR(255)
) ENGINE = InnoDB;

-- Création de la table "Magasins"
CREATE TABLE Magasins (
    id_magasin INT PRIMARY KEY,
    nom_magasin VARCHAR(255),
    adresse VARCHAR(255),
    ville VARCHAR(100),
    code_postal VARCHAR(10)
) ENGINE = InnoDB;

-- Création de la table "Produits"
CREATE TABLE Produits (
    id_produit INT PRIMARY KEY,
    nom_produit VARCHAR(255),
    prix_unitaire DECIMAL(10, 2),
    id_categorie INT,
    CONSTRAINT fk_categorie FOREIGN KEY (id_categorie) REFERENCES Categories(id_categorie) ON DELETE
    SET
        NULL ON UPDATE CASCADE
) ENGINE = InnoDB;

-- Création de la table "Clients"
CREATE TABLE Clients (
    id_client INT PRIMARY KEY,
    nom_client VARCHAR(255),
    prenom_client VARCHAR(255),
    email VARCHAR(255),
    telephone VARCHAR(20)
) ENGINE = InnoDB;

CREATE TABLE Employes (
    id_employe INT PRIMARY KEY,
    nom_employe VARCHAR(255),
    prenom_employe VARCHAR(255),
    email VARCHAR(255),
    telephone VARCHAR(20)
) ENGINE = InnoDB;

-- Création de la table "Commandes"
CREATE TABLE Commandes (
    id_commande INT PRIMARY KEY,
    id_client INT,
    id_produit INT,
    quantite INT,
    date_commande DATE,
    id_magasin INT,
    id_moyen_paiement INT,
    id_employe INT,
    CONSTRAINT fk_client FOREIGN KEY (id_client) REFERENCES Clients(id_client) ON DELETE CASCADE ON UPDATE CASCADE,
    CONSTRAINT fk_produit FOREIGN KEY (id_produit) REFERENCES Produits(id_produit) ON DELETE CASCADE ON UPDATE CASCADE,
    CONSTRAINT fk_magasin FOREIGN KEY (id_magasin) REFERENCES Magasins(id_magasin) ON DELETE
    SET
        NULL ON UPDATE CASCADE,
        CONSTRAINT fk_moyen_paiement FOREIGN KEY (id_moyen_paiement) REFERENCES Moyens_Paiement(id_moyen_paiement) ON DELETE
    SET
        NULL ON UPDATE CASCADE,
        CONSTRAINT fk_employe FOREIGN KEY (id_employe) REFERENCES Employes(id_employe) ON DELETE
    SET
        NULL ON UPDATE CASCADE
) ENGINE = InnoDB;