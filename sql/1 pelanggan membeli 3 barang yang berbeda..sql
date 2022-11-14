CREATE DATABASE camera_db;

USE camera_db;

SHOW TABLES;

CREATE TABLE kategori (
	id int auto_increment PRIMARY KEY,
    nama_kategori varchar(20),
    tipe varchar(20),
    kit varchar(3)
);

INSERT INTO kategori (nama_kategori, tipe, kit) VALUES
("Sony", "Mirrorless", "YA"),
("Olympus", "DSLR", "YA"),
("Canon", "DSLR", "YA"),
("Minolta", "Analog", "YA"),
("Panasonic", "DSLR", "YA"),
("Samsung", "DSLR", "YA"),
("Fujifilm", "Mirrorless", "YA"),
("Nikon", "DSLR", "YA"),
("Pentax", "Analog", "YA"),
("Kodak", "Analog",	"YA");

CREATE TABLE merk (
	id int PRIMARY KEY,
    nama_merk varchar(20),
    id_kategori int,
    FOREIGN KEY (id_kategori) REFERENCES kategori(id),
    harga int
);

INSERT INTO merk (id, nama_merk, id_kategori, harga) VALUES
(11,	"A7S MARK II", 1, 5000000),
(21,	"OM-1", 2, 6000000),
(31,	"700D",	3, 7000000),
(32,	"600D",	3, 7000000),
(33,	"70D",	3, 7000000),
(81,	"D3100",	8, 4000000),
(82,	"D3200",	8, 4000000),
(83,	"D3300",	8, 4000000),
(71,	"XA3",	7, 1000000),
(101,	"FunSaver", 10, 2000000);

CREATE TABLE pembeli (
	id int auto_increment PRIMARY KEY,
    nama varchar(20),
    email varchar(50),
    notelp varchar(20)
);

INSERT INTO pembeli (nama, email, notelp) VALUES
("Rafi",	"rafi@gmail.com",	"(422) 925-9760"),
("Raihan",	"raihan@gmail.com",	"(505) 641-7478"),
("Chandra",	"chandra@gmail.com",	"(486) 513-1706"),
("Aditya",	"aditya@gmail.com",	"(432) 951-7957"),
("Wibawa",	"wibawa@gmail.com",	"(953) 327-4665"),
("Thobie",	"thobie@gmail.com",	"(501) 689-5997"),
("Mahendra",	"mahendra@gmail.com",	"(482) 227-0378"),
("Nabil",	"nabil@gmail.com",	  "(589) 549-0804"),
("Syahputra",	"syahputra@gmail.com", "(631) 623-0961"),
("Rizki",	"rizki@gmail.com",	"(926) 729-4058");

CREATE TABLE pemesanan (
	id int auto_increment PRIMARY KEY,
    id_pembeli int,
    id_merk int,
    metode varchar(20),
    FOREIGN KEY (id_pembeli) REFERENCES pembeli(id),
    FOREIGN KEY (id_merk) REFERENCES merk(id)
);

INSERT INTO pemesanan (id_pembeli, id_merk, metode) VALUES
(1,	11,	"CASH"),
(1,	21,	"CASH"),
(1,	31,	"CASH"),
(2,	31,	"CASH"),
(2,	33,	"CASH"),
(2,	31,	"CASH"),
(3,	82,	"CASH"),
(3,	83,	"CASH"),
(3,	11,	"CASH"),
(4,	21,	"CASH");

SELECT pemesanan.id_pembeli, count(id_merk) AS jumlah_barang_yang_dibeli
FROM pemesanan INNER JOIN merk
ON pemesanan.id_merk = merk.id
GROUP BY pemesanan.id_pembeli;

SELECT id_merk, count(id_merk) as jumlah
FROM pemesanan
GROUP BY id_merk
ORDER BY jumlah DESC LIMIT 3;

SELECT merk.id_kategori, kategori.nama_kategori, count(merk.id_kategori) as jumlah_barang
FROM merk INNER JOIN kategori
ON merk.id_kategori = kategori.id
GROUP BY id_kategori
ORDER BY jumlah_barang DESC LIMIT 1;
 
SELECT pemesanan.id_pembeli, AVG(harga) as rata_rata
FROM pemesanan INNER JOIN merk
ON pemesanan.id_merk = merk.id
GROUP BY pemesanan.id_pembeli;

SELECT * FROM merk;

UPDATE kategori SET nama_kategori = "Sony" WHERE id_kategori = 2;

DELETE FROM kategori WHERE id_kategori = 10;

DROP TABLE kategori;

DROP DATABASE camera_db;
