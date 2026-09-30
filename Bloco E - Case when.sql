-- Bloco E — CASE WHEN
--1. Classificar pedidos por prazo de entrega: "adiantado", "no prazo" ou "atrasado" (comparando data real x estimada).
select
order_id,
order_estimated_delivery_date,
order_delivered_customer_date,
case
when order_delivered_customer_date <  order_estimated_delivery_date then varchar 'adiantado'
when order_delivered_customer_date =  order_estimated_delivery_date then varchar 'no prazo'
else varchar 'atrasado'
end as classificacao_prazo
from olist_orders_dataset;

--2. Classificar clientes por faixa de gasto total: "bronze", "prata", "ouro".
select
o.customer_id,
SUM(p.payment_value) AS total_gasto,
case
when sum (p.payment_value) < 100 then 'bronze'
when sum (p.payment_value) < 500 then 'prata'
else varchar 'ouro'
end as faixa_cliente
from olist_orders_dataset o
join olist_order_payments_dataset p on o.order_id = p.order_id
group by o.customer_id;

--3. Classificar produtos por faixa de peso: "leve", "médio", "pesado" (com base em product_weight_g).
select
product_id,
product_weight_g,
case
when product_weight_g < 1000 THEN 'leve'
when product_weight_g < 5000 THEN 'médio'
else varchar 'pesado'
end as faixa_peso
from olist_products_dataset;

--4. Classificar pagamentos como "à vista" ou "parcelado", e dentro de parcelado sinalizar parcelamentos longos (payment_installments > 6).
select
order_id,
payment_sequential,
payment_installments,
payment_value,
case
when payment_installments = 1 then varchar 'à vista'
when payment_installments > 6 then varchar 'parcelado longo'
else varchar 'parcelado'
end as classificacao_pagamento
from olist_order_payments_dataset;