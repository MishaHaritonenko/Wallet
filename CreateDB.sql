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

USE walletsdb
GO
CREATE TRIGGER tab_category_refill_INSERT
ON tab_category_refill
AFTER INSERT
AS
INSERT INTO tab_category_refill ( Operation)
SELECT Id, 'Поступление на счет денежных средств'
FROM INSERTED


USE walletsdb
GO
CREATE TRIGGER tab_reffiling_INSERT
ON tab_reffiling
AFTER INSERT
AS
INSERT INTO tab_reffiling ( Operation)
SELECT Id, 'Поступление на счет денежных средств'
FROM INSERTED




USE walletsdb
GO
CREATE TRIGGER tab_category_expence_DELETE
ON tab_category_expence
AFTER DELETE
AS
INSERT INTO tab_category_expence ( Operation)
SELECT Id, 'Списание со счета денежных средств'
FROM DELETED


USE walletsdb
GO
CREATE TRIGGER tab_wallets_DELETE
ON tab_wallets
AFTER DELETE
AS
INSERT INTO tab_wallets ( Operation)
SELECT Id, 'Списание со счета денежных средств'
FROM DELETED

