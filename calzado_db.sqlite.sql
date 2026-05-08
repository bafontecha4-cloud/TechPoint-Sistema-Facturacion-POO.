BEGIN TRANSACTION;
CREATE TABLE IF NOT EXISTS Users (
    idUsers INTEGER PRIMARY KEY AUTOINCREMENT,
    name VARCHAR(100),
    username VARCHAR(50),
    password VARCHAR(30), -- ampliado
    rol VARCHAR(30)
);
CREATE TABLE IF NOT EXISTS "clients" (
	"idclients"	INTEGER,
	"id_card"	VARCHAR(45) UNIQUE,
	"name"	VARCHAR(45) NOT NULL,
	"phoneNumber"	VARCHAR(45),
	"address"	VARCHAR(45),
	"email"	VARCHAR(45),
	PRIMARY KEY("idclients" AUTOINCREMENT)
);
CREATE TABLE IF NOT EXISTS products (
    idproducts INTEGER PRIMARY KEY AUTOINCREMENT,
    code VARCHAR(45) NOT NULL UNIQUE,
    model VARCHAR(45) NOT NULL UNIQUE,
    brand VARCHAR(45),
    size VARCHAR(45),
    color VARCHAR(45),
    priceSale REAL NOT NULL,
    stock INTEGER NOT NULL
);
CREATE TABLE IF NOT EXISTS sailDetail (
    idsailDetail INTEGER PRIMARY KEY AUTOINCREMENT,
    idsales INTEGER NOT NULL,
    idProducts INTEGER NOT NULL,
    amount INTEGER NOT NULL,
    subTotal REAL NOT NULL,
    FOREIGN KEY(idsales) REFERENCES sales(idsales),
    FOREIGN KEY(idProducts) REFERENCES products(idproducts)
);
CREATE TABLE IF NOT EXISTS sales (
    idsales INTEGER PRIMARY KEY AUTOINCREMENT,
    factura TEXT UNIQUE NOT NULL,
    date TEXT NOT NULL,
    idClients INTEGER,
    total REAL NOT NULL,
    FOREIGN KEY(idClients) REFERENCES clients(idclients)
);
