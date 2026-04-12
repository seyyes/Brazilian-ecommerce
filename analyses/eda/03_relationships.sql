-------Vérification de la structure des données avant transformation dans dbt----------------
SELECT 
  oi.order_id -- 0
FROM `ecommerce-supply-chain.ecommerce_supply_chain_dataset.olist_order_items_raw` oi
LEFT JOIN `ecommerce-supply-chain.ecommerce_supply_chain_dataset.olist_orders_raw` o 
  ON oi.order_id = o.order_id
WHERE o.order_id IS NULL;
--Conclusion: relation fiable

---------------Vérification de l'intégrité référentielle entre orders et customers----------------
SELECT 
  o.customer_id -- 0
FROM `ecommerce-supply-chain.ecommerce_supply_chain_dataset.olist_orders_raw` o
LEFT JOIN `ecommerce-supply-chain.ecommerce_supply_chain_dataset.olist_customers_raw` c 
  ON o.customer_id = c.customer_id
WHERE c.customer_id IS NULL
--Conclusion: relation fiable

---------------Vérification de l'intégrité référentielle entre orders et order_reviews----------------
SELECT 
  count(o.order_id) AS nb_not_reviewed
FROM `ecommerce-supply-chain.ecommerce_supply_chain_dataset.olist_orders_raw` o
LEFT JOIN `ecommerce-supply-chain.ecommerce_supply_chain_dataset.olist_order_reviews_raw` r 
  ON o.order_id = r.order_id
WHERE r.order_id IS NULL
--Conclusion: Correct car tous les acheteurs ne laissent pas d'avis après achat. Relation optionnelle

---------------Vérification de l'intégrité référentielle entre order_items et sellers----------------
SELECT 
  oi.seller_id -- 0
FROM `ecommerce-supply-chain.ecommerce_supply_chain_dataset.olist_order_items_raw` oi
LEFT JOIN `ecommerce-supply-chain.ecommerce_supply_chain_dataset.olist_sellers_raw` s 
  ON oi.seller_id = s.seller_id
WHERE s.seller_id IS NULL;
--Conclusion: relation fiable

---------------Vérification de l'intégrité référentielle entre order_items et products----------------
SELECT 
  oi.product_id -- 0
FROM `ecommerce-supply-chain.ecommerce_supply_chain_dataset.olist_order_items_raw` oi
LEFT JOIN `ecommerce-supply-chain.ecommerce_supply_chain_dataset.olist_products_raw` p 
  ON oi.product_id = p.product_id
WHERE p.product_id IS NULL;
--Conclusion: relation fiable

