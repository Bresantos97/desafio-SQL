--Bloco B — JOINs
--1. Relatório com categoria do produto (traduzida), valor do item, cidade do vendedor.
select * from olist_order_items_dataset
select * from olist_products_dataset
select * from olist_sellers_dataset
	
select olist_products_dataset.product_category_name,
olist_order_items_dataset.price,
olist_sellers_dataset.seller_state,
olist_sellers_dataset.seller_id
from olist_order_items_dataset 
inner join olist_products_dataset  
on olist_order_items_dataset.product_id = olist_products_dataset.product_id
inner join olist_sellers_dataset  
on olist_order_items_dataset.seller_id = olist_sellers_dataset.seller_id;

--2. Identificar pedidos com atraso na entrega, comparando data estimada com data real de entrega (join entre orders e customers).
select * from olist_orders_dataset;
select * from olist_customers_dataset;

select olist_orders_dataset.order_id,
olist_orders_dataset.customer_id,
olist_orders_dataset.order_delivered_customer_date,
olist_orders_dataset.order_estimated_delivery_date,
olist_customers_dataset.customer_city,
olist_customers_dataset.customer_state
from olist_orders_dataset
inner join olist_customers_dataset
on olist_orders_dataset.customer_id = olist_customers_dataset.customer_id
where olist_orders_dataset.order_delivered_customer_date > olist_orders_dataset.order_estimated_delivery_date;

--3. Listar pedidos e suas formas de pagamento, incluindo pedidos pagos em mais de uma parcela (join entre orders e order_payments).
select * from olist_orders_dataset;
select * from olist_order_payments_dataset;
select olist_orders_dataset.order_id,
olist_orders_dataset.customer_id,
olist_order_payments_dataset.payment_type,
olist_order_payments_dataset.payment_installments,
olist_order_payments_dataset.payment_value
from olist_orders_dataset
inner join olist_order_payments_dataset
on 	olist_order_payments_dataset.order_id = olist_orders_dataset.order_id; 

--4. Listar produtos junto com a categoria traduzida, incluindo produtos cuja categoria não possui tradução cadastrada (LEFT JOIN com product_category_name_translation).


--5. Identificar pedidos em que o cliente e o vendedor são do mesmo estado (join entre customers, orders, order_items e sellers).