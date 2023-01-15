CREATE TABLE tab_valuta(
    id INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,
    name TEXT,
    code TEXT
);

CREATE TABLE tab_category_refill(
    id INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,
    name TEXT
);

CREATE TABLE tab_category_expence(
    id INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,
    name TEXT
);

CREATE TABLE tab_wallets(
    id INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,
    name TEXT,
    amount REAL,
    id_valuta INTEGER,
    FOREIGN KEY (id_valuta)  REFERENCES tab_valuta (id)
);

CREATE TABLE tab_reffiling(
    id INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,
    date_Time TEXT,
    id_wallet INTEGER,
    id_category_refill INTEGER,
    sum INTEGER,
    FOREIGN KEY (id_category_refill)  REFERENCES tab_category_refill (id),
    FOREIGN KEY (id_wallet)  REFERENCES tab_wallets (id)
);




USE WALLETSDB;
GO
CREATE TRIGGER tab_valuta_INSERT_UPDATE
ON tab_valuta
AFTER INSERT, UPDATE
AS
UPDATE tab_valuta
SET Id = Id + id
WHERE Id = (SELECT Id FROM inserted)


USE WALLETSDB;
GO
CREATE TRIGGER tab_category_refill_INSERT_UPDATE
ON tab_category_refill
AFTER INSERT, UPDATE
AS
UPDATE tab_category_refill
SET Id = Id + id
WHERE Id = (SELECT Id FROM inserted)

USE WALLETSDB;
GO
CREATE TRIGGER tab_category_expence_INSERT_UPDATE
ON tab_category_expence
AFTER INSERT, UPDATE
AS
UPDATE tab_category_expence
SET Id = Id + id
WHERE Id = (SELECT Id FROM inserted)



USE WALLETSDB;
GO
CREATE TRIGGER tab_wallets_INSERT_UPDATE
ON tab_wallets
AFTER INSERT, UPDATE
AS
UPDATE tab_wallets
SET Id = Id + id
WHERE Id = (SELECT Id FROM inserted)



USE WALLETSDB;
GO
CREATE TRIGGER tab_reffiling_INSERT_UPDATE
ON tab_reffiling
AFTER INSERT, UPDATE
AS
UPDATE tab_reffiling
SET Id = Id + id
WHERE Id = (SELECT Id FROM inserted)


USE productsdb
GO
CREATE TRIGGER tab_valuta_DELETE
ON tab_valuta
AFTER DELETE
AS
INSERT INTO History (Id)
SELECT Id
FROM DELETED


USE productsdb
GO
CREATE TRIGGER tab_category_refill_DELETE
ON tab_category_refill
AFTER DELETE
AS
INSERT INTO History (Id)
SELECT Id
FROM DELETED


USE productsdb
GO
CREATE TRIGGER tab_wallets_DELETE
ON tab_wallets
AFTER DELETE
AS
INSERT INTO History (Id)
SELECT Id
FROM DELETED


USE productsdb
GO
CREATE TRIGGERtab_reffiling_DELETE
ON tab_reffiling
AFTER DELETE
AS
INSERT INTO History (Id)
SELECT Id
FROM DELETED





