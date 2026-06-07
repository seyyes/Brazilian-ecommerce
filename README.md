# Optimizing E-commerce Logistics Performance: Delivery Delays & Seller Analysis (Olist Dataset)


## 1. Project Overview
## Summary
Olist is one of Brazil's largest e-commerce marketplaces, connecting customers, sellers, and logistics partners across the country.
As order volumes grow, maintaining reliable delivery performance becomes critical to customer satisfaction and seller performance.
This project analyzes Olist's logistics operations to answer a key business question:
**How do delivery performance issues impact customer experience, and where should operational improvement efforts be prioritized?**
Using SQL, BigQuery, dbt and Power BI, I built an end-to-end analytics solution to evaluate delivery reliability, identify the main drivers of delays, assess seller performance, and quantify the impact of logistics performance on customer satisfaction.


## Resources:
- Dataset (https://www.kaggle.com/datasets/olistbr/brazilian-ecommerce) 


## 2. Business Problem
This analysis focuses on five strategic questions:

- Is Olist meeting its delivery commitments?
- Where are delivery delays concentrated?
- Which sellers contribute most to logistics issues?
- How does delivery performance affect customer satisfaction?
- Where should Olist prioritize operational improvements?

## Project Architecture
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
- promised_delivery_time_days
- delay_days
- delivery_status
- ...


## 6. Dashboard (Power BI)

### 6.1 KPIs
- **Delayed Order Rate** to quantity service failures
- **On Time Delivery Rate** to measure delivery reliability
- **Avg delivery time** to measure actual delivery time
- **Total orders**
- **Avg delay (days)** to measure delay severity
- **Delivery Prediction Error** to assess promise accuracy
- **Delivery Variability** to evaluate delivery consistency
- **Delay contribution by seller** 
- **Avg Review Score** to measure satisfation
- **Low review rate** (% of reviews <= 2)
- **#Sellers for Pareto** To measure number of sellers driving 80% of delays
- ...

[Power BI report](https://app.powerbi.com/groups/9416cacc-2758-4c86-862a-3ff396d0efd2/reports/6cb78111-db36-40d3-825b-6e99b96e41f8?ctid=4098d4d7-784b-4d99-a74e-86960f12748a&pbi_source=linkShare)

[Complete report in pdf](https://github.com/seyyes/Brazilian-ecommerce/blob/master/assets/Olist_Brazilian_Ecommerce_Dashboard.pdf)


### 6.2 Logistics Overview
To Evaluate overall delivery performance and identify logistics bottlenecks.
### Key Insights
- 

### Business Interpretation


![Logistics overview](https://github.com/seyyes/Brazilian-ecommerce/blob/master/assets/logistics_overview.png)


### 6.3 Seller Performance
To Identify sellers with the greatest impact on logistics performance.
### Key Insights
- 

### Business Interpretation


![Seller performance](https://github.com/seyyes/Brazilian-ecommerce/blob/master/assets/seller_performance.png)

### 6.4 Customer Satisfaction
It helps understanding how logistics performance affects customer experience.
### Key Insights
- 

### Business Interpretation


![Customer satisfaction](https://github.com/seyyes/Brazilian-ecommerce/blob/master/assets/customer_satisfaction.png)


## 7. Additional Business Impact Analysis

### 7.1 Satisfaction Loss by Delay Bucket
To better understand the customer impact of delays, customer ratings were analyzed across delivery delay categories.

![Satisfaction Loss by Delay Bucket](https://github.com/seyyes/Brazilian-ecommerce/blob/master/assets/DelayBucketVSReviewLoss.png)

#### Observation


#### Insight


#### Recommendation


### 7.2 Delivery Variability Risk Analysis

![Delivery Variability Risk Analysis](https://github.com/seyyes/Brazilian-ecommerce/blob/master/assets/Variability_segment.png)

#### Insight


#### Recommendation


### 7.3 States to prioritize

![States to prioritize](https://github.com/seyyes/Brazilian-ecommerce/blob/master/assets/States_to_prioritize.png)

### 7.4 Strategic Recommendations


## 8. Project Structure

models/
  - staging/
  - intermediate/
  - marts/

analyses/
- eda/ (contains exploratory analysis)

assets/
- dashboard screenshots and pdf