SELECT merk.id_kategori, kategori.nama_kategori, count(merk.id_kategori) as jumlah_barang
FROM merk INNER JOIN kategori
ON merk.id_kategori = kategori.id
GROUP BY id_kategori
ORDER BY jumlah_barang DESC LIMIT 1;
