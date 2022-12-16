-- Databricks notebook source
SELECT 
    descUF,
    COUNT(DISTINCT idClienteUnico) AS qtClienteEstado
    
FROM silver_olist.cliente
GROUP BY descUF
ORDER BY qtClienteEstado

-- COMMAND ----------

-- DBTITLE 1,Primeira forma
SELECT 
    descUF,
    COUNT(DISTINCT idClienteUnico) AS qtClienteEstado
    
FROM silver_olist.cliente
GROUP BY descUF
ORDER BY 2 -- ordena pela segunda coluna da consulta

-- COMMAND ----------

-- DBTITLE 1,Segunda forma
SELECT 
    descUF,
    COUNT(DISTINCT idClienteUnico) AS qtClienteEstado
    
FROM silver_olist.cliente
GROUP BY descUF
ORDER BY qtClienteEstado -- uso do nome da própria coluna

-- COMMAND ----------

-- DBTITLE 1,Terceira forma
SELECT 
    descUF,
    COUNT(DISTINCT idClienteUnico) AS qtClienteEstado
    
FROM silver_olist.cliente
GROUP BY descUF
ORDER BY COUNT(DISTINCT idClienteUnico) -- mesma expressão do SELECT

-- COMMAND ----------

SELECT 
    descUF,
    COUNT(DISTINCT idClienteUnico) AS qtClienteEstado
    
FROM silver_olist.cliente
GROUP BY descUF
ORDER BY qtClienteEstado DESC -- forma decrescente

-- COMMAND ----------

-- DBTITLE 1,Ordena e depois seleciona o ranking
SELECT 
    descUF,
    COUNT(DISTINCT idClienteUnico) AS qtClienteEstado
    
FROM silver_olist.cliente
GROUP BY descUF
ORDER BY qtClienteEstado DESC

LIMIT 5

-- COMMAND ----------


