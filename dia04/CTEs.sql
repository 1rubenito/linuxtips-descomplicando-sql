-- Databricks notebook source
-- lista de vendedores que estão com mais clientes


SELECT idVendedor, descUF
FROM silver_olist.vendedor
WHERE descUF = (

  SELECT descUF
  FROM silver_olist.cliente
  GROUP BY descUF
  ORDER BY COUNT(DISTINCT idClienteUnico) DESC
  LIMIT 1
  
)


-- COMMAND ----------

-- lista de vendedores que estão nos 2 estados com mais clientes

SELECT idVendedor, descUF
FROM silver_olist.vendedor
WHERE descUF IN (

  SELECT descUF
  FROM silver_olist.cliente
  GROUP BY descUF
  ORDER BY COUNT(DISTINCT idClienteUnico) DESC
  LIMIT 2
  
)

-- COMMAND ----------

WITH tb_estados AS (

  SELECT descUF
  FROM silver_olist.cliente
  GROUP BY descUF
  ORDER BY COUNT(DISTINCT idClienteUnico) DESC
  LIMIT 2
  
),

tb_vendedores AS (

  SELECT idVendedor, 
         descUF   
  FROM silver_olist.vendedor
  WHERE descUF IN (SELECT descUF FROM tb_estados)
)

SELECT * FROM tb_vendedores

-- COMMAND ----------

-- nota média dos pedidos dos vendedores de cada estado

WITH tb_pedido_nota AS (
  
    SELECT T1.idVendedor,
           T2.vlNota
    FROM silver_olist.item_pedido AS T1
    
    LEFT JOIN silver_olist.avaliacao_pedido T2
    ON T1.idPedido = T2.idPedido
),

tb_avg_vendedor AS (

    SELECT idVendedor, 
          ROUND(AVG(vlNota),2) AS mediaNotaVendedor
    FROM tb_pedido_nota
    
    GROUP BY idVendedor
),

tb_vendedor_estado AS (

    SELECT T1.*,
           T2.descUF
    FROM tb_avg_vendedor AS T1
    
    LEFT JOIN silver_olist.vendedor AS T2
    ON T1.idVendedor = T2.idVendedor
)

SELECT descUF,
       AVG(mediaNotaVendedor) AS avgNotaEstado
FROM tb_vendedor_estado

GROUP BY descUF
ORDER BY avgNotaEstado DESC

-- COMMAND ----------

