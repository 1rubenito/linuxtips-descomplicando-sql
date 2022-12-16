-- Databricks notebook source
SELECT descUF,
        COUNT(idVendedor) As qtVendedor

FROM silver_olist.vendedor
WHERE descUF IN ('SP', 'MG', 'RJ', 'ES')
GROUP BY descUF
HAVING qtVendedor >= 100
ORDER BY qtVendedor DESC

-- COMMAND ----------


