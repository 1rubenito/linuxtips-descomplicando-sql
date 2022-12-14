-- Databricks notebook source
SELECT
  *,
  CASE
    WHEN descUF = 'SP' THEN 'paulista'
    WHEN descUF = 'RJ' THEN 'fluminense'
    WHEN descUF = 'PR' THEN 'paranaense'
    WHEN descUF = 'MG' THEN 'mineiro'
    WHEN descUF = 'RS' THEN 'gaúcho'
    WHEN descUF = 'PA' THEN 'paraense'
    WHEN descUF = 'GO' THEN 'goiano'
    WHEN descUF = 'BA' THEN 'baiano'
    WHEN descUF = 'MA' THEN 'maranhense'
    WHEN descUF = 'MS' THEN 'sul-matogressense'
    ELSE 'outros'
  END AS descNacionalidade
FROM
  silver_olist.cliente

-- COMMAND ----------

SELECT
  *,
  CASE
    WHEN descUF = 'SP' THEN 'paulista'
    WHEN descUF = 'RJ' THEN 'fluminense'
    WHEN descUF = 'PR' THEN 'paranaense'
    WHEN descUF = 'MG' THEN 'mineiro'
    WHEN descUF = 'RS' THEN 'gaúcho'
    WHEN descUF = 'PA' THEN 'paraense'
    WHEN descUF = 'GO' THEN 'goiano'
    WHEN descUF = 'BA' THEN 'baiano'
    WHEN descUF = 'MA' THEN 'maranhense'
    WHEN descUF = 'MS' THEN 'sul-matogressense'
    ELSE 'outros'
  END AS descNacionalidade,
  
  CASE 
    WHEN descCidade LIKE '%sao%' THEN 'Tem são no nome'
    ELSE 'Não tem são no nome'
  END descCidade
  
FROM
  silver_olist.cliente

-- COMMAND ----------

SELECT *,
      CASE 
        WHEN descUF IN ('SP', 'MG', 'RJ', 'ES') THEN 'sudeste'
      END AS descRegiao
      
FROM silver_olist.vendedor

-- COMMAND ----------


