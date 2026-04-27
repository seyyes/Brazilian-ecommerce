# Optimizing E-commerce Logistics Performance: Delivery Delays & Seller Analysis (Olist Dataset)


## 1. Project Overview
## Objective

Analyze and optimize logistics performance and customer satisfaction by identifying delays, seller inefficiencies, and operational bottlenecks.
This project focuses on **operations and supply chain performance**, not marketing.


## Resources:
- Dataset (https://www.kaggle.com/datasets/olistbr/brazilian-ecommerce) 


## 2. Business Problem

How can we improve delivery performance and customer satisfaction by:

- reducing delivery delays
- evaluating seller performance
- identifying operational inefficiencies

## 3. Tech Stack

- BigQuery : data exploration & SQL
- dbt : data modeling (staging, intermediate, marts)
- Power BI : dashboard & business insights
- GitHub : version control & documentation

## 4. Data Modeling

Star schema:

- Fact table: fct_olist_order_items

- Dimensions:
  - dim_customers
  - dim_sellers
  - dim_products

- Additional Dimensions (Used for time-series analysis and delay segmentation): 
    - dim_date
    - dim_delay_bucket

![Data model](https://github.com/seyyes/Brazilian-ecommerce/blob/master/assets/data_model.png)

## 5. Data Transformations

- cleaning & standardization (staging layer)
- enrichment with delivery KPIs (intermediate layer)
- creation of business-ready tables (marts)

Key metrics created:

- delivery_time_days
- handling_time_days
- delay_days
- delivery_status

## 6. Advanced Analytics

- cumulative delay contribution (Pareto analysis)
- window functions (ranking, cumulative metrics)
- delay distribution analysis
- seller performance ranking 
- delay segmentation (on-time vs delayed)
- correlation between handling time and delays

## 7. Dashboard (Power BI)

### 7.1 Logistics Overview
- delivery performance
- delay trends
- geographic distribution

![Logistics overview](https://github.com/seyyes/Brazilian-ecommerce/blob/master/assets/logistics_overview.png)


### 7.2 Seller Performance
- top delayed sellers
- Important seller with delays and bad handling
- Pareto analysis

![Seller performance](https://github.com/seyyes/Brazilian-ecommerce/blob/master/assets/seller_performance.png)

### 7.3 Customer Satisfaction
- impact of delays on reviews
- satisfaction vs delivery time

![Customer satisfaction](https://github.com/seyyes/Brazilian-ecommerce/blob/master/assets/customer_satisfaction.png)

### 7.4 KPIs
- % of delayed orders
- Avg delay (days)
- Avg delivery time
- Total orders
- Delay contribution by seller 
- Low review rate (% of reviews <= 2)
- ...

[Power BI report](https://app.powerbi.com/groups/9416cacc-2758-4c86-862a-3ff396d0efd2/reports/6cb78111-db36-40d3-825b-6e99b96e41f8?ctid=4098d4d7-784b-4d99-a74e-86960f12748a&pbi_source=linkShare)

[Complete report in pdf](https://github.com/seyyes/Brazilian-ecommerce/blob/master/assets/Olist_Brazilian_Ecommerce_Dashboard.pdf)

## 8. Key Insights

- Delivery delays are NOT concentrated ==> indicates a systemic issue rather than isolated seller problems (cf.pareto)
- Globaly 341 sellers are needed to reach 80% of delays ==> No concentration
- Handling time strongly impacts delivery performance
- Delays significantly reduce customer satisfaction (lower review scores) 

## 9. Business Impact

This analysis helps:

- identify systemic inefficiencies in logistics operations
- prioritize high-impact improvements
- reduce delivery delays
- improve customer satisfaction and retention

## 10. Recommendations

- improve global logistics processes (not only sellers)
- optimize handling time (seller preparation)
- review delivery time estimations
- monitor logistics partners performance

## 11. Project Structure

models/
  - staging/
  - intermediate/
  - marts/

analyses/
- eda/ (contains exploratory analysis)

assets/
- dashboard screenshots and pdf