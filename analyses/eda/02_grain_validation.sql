--------------------- Validation de la granularité de la table order_items ---------------------
SELECT 
  count(*) AS total_rows, --112650
  count(distinct order_id) AS nb_orders,-- 98666
  count(distinct order_item_id) AS nb_items,-- 21
  count(distinct concat(order_id, '_',order_item_id)) AS unique_order_items_keys --112650
FROM `ecommerce-supply-chain.ecommerce_supply_chain_dataset.olist_order_items_raw`;

------------------ Vérification des doublons dans les clés de grain ------------------
SELECT 
  order_id,
  order_item_id,
  count(*) AS nb_line_orders
FROM `ecommerce-supply-chain.ecommerce_supply_chain_dataset.olist_order_items_raw`
GROUP BY order_id,order_item_id
HAVING count(*) > 1 --0


--Insights:
-- order_item_id n’est PAS un identifiant unique global mais il représente la position de l’item dans une commande d'où la valeur 21 dans le décompte des items uniques.
-- =>  de manière générale, les commandes ont maximum 21 items différents
-- => la clé primaire réelle est (order_id, order_item_id)
-- il n’y a pas de doublons dans les clés de grain (order_id, order_item_id) puisque le nombre de lignes correspond au nombre de clés uniques.