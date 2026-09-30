--Bloco D — Subqueries
-- aqui tive muita dificuldade e enviei ao chat gpt pra corrigir os comandos
-- 1. Clientes cujo gasto total está acima da média geral de gasto por cliente.
SELECT o.customer_id, SUM(p.payment_value) AS total_gasto
FROM olist_orders_dataset 
JOIN olist_order_payments_dataset  ON o.order_id = p.order_id
GROUP BY o.customer_id
HAVING SUM(p.payment_value) 
SELECT AVG(sub.total_cliente)
FROM 
SELECT SUM(p2.payment_value) AS total_cliente
FROM olist_orders_dataset o2
JOIN olist_order_payments_dataset p2 ON o2.order_id = p2.order_id
GROUP BY o2.customer_id
);

--2. Produtos que nunca receberam avaliação (NOT EXISTS / NOT IN).
SELECT p.product_id
FROM olist_products_dataset
WHERE NOT EXISTS (
SELECT 1
FROM olist_order_items_dataset oi
JOIN olist_order_reviews_dataset r ON oi.order_id = r.order_id
WHERE oi.product_id = p.product_id
);

--3. Vendedores que venderam produtos de mais de 5 categorias diferentes (subquery com COUNT(DISTINCT ...)).
SELECT s.seller_id
FROM olist_order_items_dataset 
JOIN olist_products_dataset p ON oi.product_id = p.product_id
JOIN olist_sellers_dataset s ON oi.seller_id = s.seller_id
GROUP BY s.seller_id
HAVING COUNT(DISTINCT p.product_category_name) > 5;

--4. Pedidos cujo valor de frete (freight_value) é maior que o valor total dos itens do próprio pedido (subquery correlacionada comparando as duas somas).
SELECT oi.order_id
FROM olist_order_items_dataset 
GROUP BY oi.order_id
HAVING SUM(oi.freight_value) > SUM(oi.price);