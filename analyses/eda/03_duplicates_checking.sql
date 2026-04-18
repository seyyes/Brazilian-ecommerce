------------------ Vérification des doublons dans les clés de grain ------------------
SELECT 
  order_id,
  order_item_id,
  count(*) AS nb_line_orders
FROM `ecommerce-supply-chain.ecommerce_supply_chain_dataset.olist_order_items_raw`
GROUP BY order_id,order_item_id
HAVING count(*) > 1 --0

------Insights:
-- il n’y a pas de doublons dans les clés de grain (order_id, order_item_id) puisque le nombre de lignes correspond au nombre de clés uniques.