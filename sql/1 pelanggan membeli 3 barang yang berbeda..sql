SELECT pemesanan.id_pembeli, count(id_merk) AS jumlah_barang_yang_dibeli
FROM pemesanan INNER JOIN merk
ON pemesanan.id_merk = merk.id
GROUP BY pemesanan.id_pembeli
