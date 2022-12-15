-- Databricks notebook source
SELECT COUNT(*) AS numeroLinhasNaoNulas -- linhas não nulas
FROM silver_olist.cliente

-- COMMAND ----------

SELECT 
  COUNT(*) AS numeroLinhasNaoNulas, -- linhas não nulas
  COUNT(idCliente) AS numeroIdClienteNaoNulo -- id de cliente não nulos
  
FROM silver_olist.cliente

-- COMMAND ----------

SELECT 
  COUNT(*) AS numeroLinhasNaoNulas, -- linhas não nulas
  COUNT(idCliente) AS numeroIdClienteNaoNulo, -- id de cliente não nulos
  COUNT(distinct idCliente) AS numeroIdClienteDistintos -- id de clientes distintos
  
FROM silver_olist.cliente

-- COMMAND ----------

SELECT 
  COUNT(*) AS numeroLinhasNaoNulas, -- linhas não nulas
  COUNT(idCliente) AS numeroIdClienteNaoNulo, -- id de cliente não nulos
  COUNT(DISTINCT idCliente) AS numeroIdClienteDistintos, -- id de clientes distintos
  
  COUNT(idClienteUnico) AS numeroIdClienteUnico,
  COUNT(DISTINCT idClienteUnico) As numeroIdClienteUnicoDistintos -- conta id de clientes unicos distintos
  
FROM silver_olist.cliente

-- COMMAND ----------

SELECT 
    COUNT(*) AS qtLinhas,
    COUNT(DISTINCT idCliente) As qtClientes,
    COUNT(DISTINCT idClienteUnico) As qtClientesUnicos
    
FROM silver_olist.cliente

WHERE descCidade IN ('presidente prudente', 'sao paulo', 'franca')

-- COMMAND ----------

SELECT
    ROUND(AVG(vlPreco),2) AS avgPreco, -- media da coluna vlPreco (preço médio dos produtos)
    
    INT(PERCENTILE (vlPreco, 0.5)) As medianPreco, -- preco mediano dos produtos 
    
    
    ROUND(AVG(vlFrete),2) AS avgFrete, -- media da coluna vlFrete
    MAX(vlPreco) AS maxPreco, -- maximo da coluna vlPreco
    MAX(vlFrete) AS maxFrete, -- maximo da coluna vlFrete
    MIN(vlFrete) AS minFrete -- minimo da coluna vlFrete
     
FROM silver_olist.item_pedido

-- COMMAND ----------

SELECT COUNT(*)
from silver_olist.cliente
WHERE descUF = 'SP'

-- COMMAND ----------


