--Bloco A — SELECT básico
--1. Listar os 20 pedidos com status delivered mais recentes, ordenados pela data de entrega.
select * from olist_orders_dataset 
where order_status = 'delivered'
order by order_delivered_customer_date DESC 
limit 20;


--2. Listar todos os produtos de uma categoria específica (usando a tabela de traduçãopara filtrar pelo nome em português).
select * from olist_products_dataset
where product_category_name = 'instrumentos_musicais';

--3. Listar os métodos de pagamento distintos utilizados na base (SELECT DISTINCTpayment_type).
select distinct payment_type from olist_order_payments_dataset;

--4. Listar os produtos com peso (product_weight_g) acima de 10kg, ordenados domais pesado para o mais leve.
select * from olist_products_dataset
where product_weight_g > 10000
order by product_weight_g DESC;