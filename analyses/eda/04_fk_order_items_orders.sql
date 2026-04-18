-------Vérification de la structure des données avant transformation dans dbt (Fait avec Big query)----------------
---------------Vérification de l'intégrité référentielle entre orders et order_items----------------
SELECT 
  oi.order_id -- 0
FROM `ecommerce-supply-chain.ecommerce_supply_chain_dataset.olist_order_items_raw` oi
LEFT JOIN `ecommerce-supply-chain.ecommerce_supply_chain_dataset.olist_orders_raw` o 
  ON oi.order_id = o.order_id
WHERE o.order_id IS NULL;
--Conclusion: relation fiable






