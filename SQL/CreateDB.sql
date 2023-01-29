CREATE INDEX tab_currencies(
    id INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,
    name TEXT,
    code TEXT,
    currency_id INTEGER,
    FOREIGN KEY (currency_id)  REFERENCES tab_wallets (currency_id)
);

CREATE TABLE tab_wallets(
    id INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,
    name TEXT,
    balance REAL,
    currency_id INTEGER,
    wallet_id INTEGER,
    FOREIGN KEY (wallet_id)  REFERENCES tab_operations (wallet_id)
);

CREATE TABLE tab_categories(
    id INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,
    name TEXT,
    type BOOLEAN,
    category_id INTEGER,
    FOREIGN KEY (category_id)  REFERENCES tab_categories (category_id)

);


CREATE TABLE tab_wallets(
    id INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,
    name TEXT,
    balance REAL,
    currency_id INTEGER,
    wallet_id INTEGER
);

CREATE TABLE tab_operations(
    id INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,
    date_time TEXT,
    wallet_id INTEGER,
    category_id INTEGER,
    summa REAL,
    operation_id INTEGER
);

