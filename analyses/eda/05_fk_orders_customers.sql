-------Vérification de la structure des données avant transformation dans dbt (Fait avec Big query)----------------
---------------Vérification de l'intégrité référentielle entre orders et customers----------------
SELECT 
  o.customer_id -- 0
FROM `ecommerce-supply-chain.ecommerce_supply_chain_dataset.olist_orders_raw` o
LEFT JOIN `ecommerce-supply-chain.ecommerce_supply_chain_dataset.olist_customers_raw` c 
  ON o.customer_id = c.customer_id
WHERE c.customer_id IS NULL

--Conclusion: relation fiable