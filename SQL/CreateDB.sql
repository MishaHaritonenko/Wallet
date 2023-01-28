CREATE INDEX tab_currencies(
    id INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,
    name TEXT,
    code TEXT,
    currency_id INTEGER
);

CREATE TABLE tab_wallets(
    id INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,
    name TEXT,
    balance REAL,
    currency_id INTEGER,
    wallet_id INTEGER
);

CREATE TABLE tab_categories(
    id INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,
    name TEXT,
    type BOOLEAN,
    category_id INTEGER
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

