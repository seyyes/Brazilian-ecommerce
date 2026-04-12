SELECT 
  'customers' AS table_name,
  count(*) AS total_rows -- 112650
FROM `ecommerce-supply-chain.ecommerce_supply_chain_dataset.olist_customers_raw` 

UNION ALL  

SELECT 
  'order_items' AS table_name,
  count(*) AS total_rows -- 3095
FROM `ecommerce-supply-chain.ecommerce_supply_chain_dataset.olist_order_items_raw`

UNION ALL  

SELECT 
  'orders' AS table_name,
  count(*) AS total_rows -- 99441
FROM `ecommerce-supply-chain.ecommerce_supply_chain_dataset.olist_orders_raw`

UNION ALL  

SELECT 
  'products' AS table_name,
  count(*) AS total_rows -- 32951
FROM `ecommerce-supply-chain.ecommerce_supply_chain_dataset.olist_products_raw`

UNION ALL  

SELECT 
  'sellers' AS table_name,
  count(*) AS total_rows -- 99441
FROM `ecommerce-supply-chain.ecommerce_supply_chain_dataset.olist_sellers_raw`