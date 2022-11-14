SELECT pemesanan.id_pembeli, AVG(harga) as rata_rata
FROM pemesanan INNER JOIN merk
ON pemesanan.id_merk = merk.id
GROUP BY pemesanan.id_pembeli;
