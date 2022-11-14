SELECT id_merk, count(id_merk) as jumlah
FROM pemesanan
GROUP BY id_merk
ORDER BY jumlah DESC LIMIT 3;
