-- Databricks notebook source
--listar pedidos feitas em dez de 2017 e entregues com atraso

SELECT *
FROM silver_olist.pedido
--WHERE dtPedido LIKE '%2017-12%'
WHERE YEAR(dtPedido) = 2017
AND MONTH(dtPedido) = 12
AND descSituacao = 'delivered'
AND date(dtEntregue) > date(dtEstimativaEntrega)

-- COMMAND ----------

-- lista de pedidos com 2 ou mais parcelas menores que R$ 20,00

SELECT *
FROM silver_olist.pagamento_pedido
WHERE nrPacelas >= 2 
AND vlPagamento / nrPacelas < 20

-- COMMAND ----------

-- CASE 02

-- SELECIONE OS PEDIDOS E DEFINA OS GRUPOS EM UMA NOVA COLUNA
-- para frete inferior à 10% 
-- para frete entre 10% e 25% 
-- para frete entre 25% e 50%
-- para frete maior que 50%

SELECT *,
       vlPreco + vlFrete as vlTotal,
       ROUND(vlFrete / (vlPreco + vlFrete), 2) AS pctFrete,
       
       CASE
         WHEN vlFrete / (vlPreco + vlFrete) <= 0.1 THEN '10%'
         WHEN vlFrete / (vlPreco + vlFrete) <= 0.25 THEN '10% A 25%'
         WHEN vlFrete / (vlPreco + vlFrete) <= 0.5 THEN '25% A 50%'
         ELSE '+50%'
       END AS descFretePct
         
FROM silver_olist.item_pedido

-- COMMAND ----------


