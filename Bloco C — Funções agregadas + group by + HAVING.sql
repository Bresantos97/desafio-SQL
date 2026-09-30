--Bloco C — Funções agregadas + group by + HAVING
--1. Faturamento total por estado do cliente.
select c.customer_state, SUM(p.payment_value) AS faturamento_total
from olist_orders_dataset o
join olist_customers_dataset c ON o.customer_id = c.customer_id
join olist_order_payments_dataset p ON o.order_id = p.order_id
group by c.customer_state
order by faturamento_total DESC;

--2. Top 10 vendedores por faturamento.
select s.seller_id, s.seller_city, SUM(oi.price) AS faturamento
from olist_order_items_dataset oi
join olist_sellers_dataset s ON oi.seller_id = s.seller_id
group by s.seller_id, s.seller_city
order by faturamento DESC
limit 10;

--3. Ticket médio por categoria de produto.
select p.product_category_name, AVG(oi.price) AS ticket_medio
from olist_order_items_dataset oi
join olist_products_dataset p ON oi.product_id = p.product_id
group by p.product_category_name
group by ticket_medio DESC;

--4. Vendedores com nota média de avaliação abaixo de 3 (HAVING AVG(...) < 3).
select s.seller_id, AVG(r.review_score) AS media_nota
from olist_order_items_dataset oi
join olist_sellers_dataset s ON oi.seller_id = s.seller_id
join olist_order_reviews_dataset r ON oi.order_id = r.order_id
group by s.seller_id
HAVING AVG(r.review_score) < 3
order by media_nota;

--5. Quantidade de pedidos por forma de pagamento (group by payment_type).
select payment_type, COUNT(*) AS qtd_pedidos
from olist_order_payments_dataset
group by payment_type
group by qtd_pedidos DESC;

--6. Peso médio dos produtos por categoria.
select product_category_name, AVG(product_weight_g) AS peso_medio
from olist_products_dataset
group by product_category_name
group by peso_medio DESC;

--7. Número médio de parcelas (AVG(payment_installments)) por categoria de produto.
select p.product_category_name, AVG(ped.payment_installments) AS media_parcelas
from olist_order_items_dataset oi
join olist_products_dataset p ON oi.product_id = p.product_id
join olist_order_payments_dataset ped ON oi.order_id = ped.order_id
group by p.product_category_name
group by media_parcelas DESC;
