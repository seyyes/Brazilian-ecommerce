-------Vérification de la structure des données avant transformation dans dbt (Fait avec Big query)----------------
---------------Vérification de l'intégrité référentielle entre order_items et products----------------
SELECT 
  oi.product_id -- 0
FROM `ecommerce-supply-chain.ecommerce_supply_chain_dataset.olist_order_items_raw` oi
LEFT JOIN `ecommerce-supply-chain.ecommerce_supply_chain_dataset.olist_products_raw` p 
  ON oi.product_id = p.product_id
WHERE p.product_id IS NULL;
--Conclusion: relation fiable
