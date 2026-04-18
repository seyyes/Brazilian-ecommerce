-------Vérification de la structure des données avant transformation dans dbt (Fait avec Big query)----------------
---------------Vérification de l'intégrité référentielle entre order_items et sellers----------------
SELECT 
  oi.seller_id -- 0
FROM `ecommerce-supply-chain.ecommerce_supply_chain_dataset.olist_order_items_raw` oi
LEFT JOIN `ecommerce-supply-chain.ecommerce_supply_chain_dataset.olist_sellers_raw` s 
  ON oi.seller_id = s.seller_id
WHERE s.seller_id IS NULL;
--Conclusion: relation fiable
