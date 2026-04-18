-------Vérification de la structure des données avant transformation dans dbt (Fait avec Big query)----------------
---------------Vérification de l'intégrité référentielle entre orders et order_reviews----------------
SELECT 
  count(o.order_id) AS nb_not_reviewed
FROM `ecommerce-supply-chain.ecommerce_supply_chain_dataset.olist_orders_raw` o
LEFT JOIN `ecommerce-supply-chain.ecommerce_supply_chain_dataset.olist_order_reviews_raw` r 
  ON o.order_id = r.order_id
WHERE r.order_id IS NULL
--Conclusion: Correct car tous les acheteurs ne laissent pas d'avis après achat. Relation optionnelle