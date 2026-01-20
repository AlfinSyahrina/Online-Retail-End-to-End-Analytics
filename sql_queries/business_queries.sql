-- ==========================================================
-- ANALISIS BISNIS RETAIL (VERIFIKASI DATABASE)
-- ==========================================================

-- 1. Ringkasan Pendapatan per Negara (Top 5)
-- Memastikan data pendapatan telah teragregasi dengan benar di level database.
SELECT "Country", SUM("TotalAmount") as Total_Revenue
FROM online_retail_clean
GROUP BY "Country"
ORDER BY Total_Revenue DESC
LIMIT 5;

-- 2. Distribusi Segmen Pelanggan (Hasil Integrasi Python-SQL)
-- Menampilkan jumlah pelanggan per segmen hasil dari analisis RFM.
SELECT "Segment", COUNT("CustomerID") as Jumlah_Pelanggan
FROM rfm_analysis_results
GROUP BY "Segment"
ORDER BY Jumlah_Pelanggan DESC;

-- 3. Identifikasi Produk Terlaris
-- Memvalidasi produk dengan volume transaksi tertinggi.
SELECT "Description", SUM("Quantity") as Total_Terjual
FROM online_retail_clean
GROUP BY "Description"
ORDER BY Total_Terjual DESC
LIMIT 10;