-- Databricks notebook source
--ordenar do melhor para o pior vendedor 

WITH tb_vendas_vendedores AS (

  SELECT 
        idVendedor,
        COUNT(*) AS qtVendas
  FROM silver_olist.item_pedido

  GROUP BY idVendedor
  ORDER BY qtVendas DESC

)

SELECT T1.*,
       T2.descUF,
       row_number() OVER (PARTITION BY T2.descUF ORDER BY qtVendas DESC) AS RN
       
FROM tb_vendas_vendedores AS t1

LEFT JOIN silver_olist.vendedor AS T2
ON T1.idVendedor = T2.idVendedor

QUALIFY RN <= 10

ORDER BY descUF, qtVendas DESC

-- COMMAND ----------


