# E-commerce Logistics Analytics: Linking Delivery Performance, Customer Experience and Operational Priorities at Olist


## 1. Project Overview
## Summary
Olist is one of Brazil's largest e-commerce marketplaces, connecting customers, sellers, and logistics partners across the country.
As order volumes grow, maintaining reliable delivery performance becomes critical to customer satisfaction and seller performance.
This project analyzes Olist's logistics operations to answer a key business question:
**How do delivery performance issues impact customer experience, and where should operational improvement efforts be prioritized?**
Using SQL, BigQuery, dbt and Power BI, I built an end-to-end analytics solution to evaluate delivery reliability, identify the main drivers of delays, assess seller performance, and quantify the impact of logistics performance on customer satisfaction.


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
  - dim_olist_customers
  - dim_olist_sellers
  - dim_olist_products

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


## 6. Analysis and Findings

[Power BI report](https://app.powerbi.com/groups/9416cacc-2758-4c86-862a-3ff396d0efd2/reports/6cb78111-db36-40d3-825b-6e99b96e41f8?ctid=4098d4d7-784b-4d99-a74e-86960f12748a&pbi_source=linkShare)

[Complete report in pdf](https://github.com/seyyes/Brazilian-ecommerce/blob/master/assets/Olist_Brazilian_Ecommerce_Dashboard.pdf)


### 6.1 Logistics Overview
**Objective**: To Evaluate overall delivery performance and identify logistics bottlenecks.
### KPIs
- **Delayed Order Rate**: to quantity service failures
- **On Time Delivery Rate**: to measure delivery reliability
- **Avg delivery time**: to measure actual delivery time
- **Total orders**
- **Avg delay (days)**: to measure delay severity
- **Delivery Prediction Error**: to assess promise accuracy

### Key Insights
- Olist achieves a strong delivery performance, with 93.55% of orders delivered on or before the promised date.
- Only 6.45% of deliveries are delayed, indicating a generally reliable logistics network.
- Orders are delivered on average earlier than promised, suggesting conservative delivery commitments.
- Delivery performance varies significantly across states, highlighting regional logistics disparities.

### Business Interpretation
Overall logistics performance is strong, however, performance is not evenly distributed across the network.
The combination of high on-time delivery rates and early deliveries suggests that delivery promises may be **overly conservative**. Even if this protects service levels, it may also be wise to reconsider them and provide more accurate ones.
Regional disparities indicate that improvement efforts should focus on specific areas rather than the entire logistics network.

![Logistics overview](https://github.com/seyyes/Brazilian-ecommerce/blob/master/assets/logistics_overview.png)


### 6.2 Seller Performance
**Objective**: To Identify sellers with the greatest impact on logistics performance.
### KPIs
- **Delayed Order Rate**: to quantity service failures
- **Avg Handling Time**: to measure handling time
- **#Sellers for Pareto**: To measure number of sellers driving 80% of delays
- **Avg delay (Late only)**: to measure delay severity (focussing only on delayed orders)
- **Total Sellers**
- **Delivery Variability**: to evaluate delivery consistency

### Key Insights
- Delivery delays are highly concentrated among a relatively small group of sellers.
- A limited number of sellers (341) account for the majority of delayed orders, revealing a strong Pareto effect.
- Seller performance varies considerably, even among sellers with similar order volumes.
- Some high-volume sellers combine long handling times and elevated delay rates, creating a disproportionate impact on overall logistics performance.
- Longer handling times are consistently associated with higher delays, suggesting that seller operations play an important role in delivery performance.

### Business Interpretation
The analysis suggests that logistics improvement initiatives should prioritize seller-level interventions.
Delays are concentrated among a small subset of sellers and targeted improvement programs could generate a larger impact than broad network-wide actions.
This finding provides a clear opportunity to improve service quality while minimizing operational effort.

![Seller performance](https://github.com/seyyes/Brazilian-ecommerce/blob/master/assets/seller_performance.png)

### 6.3 Customer Satisfaction
**Objective**: understanding how logistics performance affects customer experience.
### KPIs
- **Delayed Order Rate**: to quantity service failures
- **Avg Review Score**: to measure satisfation
- **Low review rate**: % of reviews <= 2
- **Total orders**
- **On Time Delivery Rate** to measure delivery reliability


### Key Insights
- Customer satisfaction declines as delivery delays increase.
- Delayed orders generate significantly more low ratings than on-time deliveries.
- The relationship between logistics performance and review scores is strongly negative.
- Severe delays have a disproportionately large impact on customer perception.

### Business Interpretation
Logistics performance directly influences customer experience.
While small delays have a limited impact, longer delays lead to a deterioration in customer satisfaction.
Reducing severe delays is therefore likely to generate greater customer experience improvements than marginally accelerating already on-time deliveries.

![Customer satisfaction](https://github.com/seyyes/Brazilian-ecommerce/blob/master/assets/customer_satisfaction.png)


## 7. Additional Business Impact Analysis

### 7.1 Satisfaction Loss by Delay Bucket
To better understand the customer impact of delays, customer ratings were analyzed across delivery delay buckets.

![Satisfaction Loss by Delay Bucket](https://github.com/seyyes/Brazilian-ecommerce/blob/master/assets/DelayBucketVSReviewLoss.png)

#### Observation
Average review scores decline consistently as delivery delays increase.
The largest drop in customer satisfaction occurs in the longest delay categories.

#### Insight
Not all delays have the same business impact.
Long delays generate a disproportionately higher level of customer dissatisfaction compared to short delays.

#### Recommendation
To improve logistic performances and customer satisfaction, it would be better to prioritize the reduction of severe delays. Targeting the longest delays is likely to generate the highest customer satisfaction gains.

### 7.2 Delivery Variability Risk Analysis

![Delivery Variability Risk Analysis](https://github.com/seyyes/Brazilian-ecommerce/blob/master/assets/Variability_segment.png)

#### Insight
Most Brazilian states receive deliveries earlier than the promised delivery date.
However, average delivery performance can hide significant operational risks. Delivery performance is not equally predictable and several states such as SP, PR and MG demonstrate a high level of delivery reliability due to low variability.Unfortunately, states such as AP, RR and SE are showing high delivery variability, indicating inconsistent service levels.
High variability reduces the reliability of delivery promises and increases operational uncertainty.

#### Recommendation
It would be better to monitor regions with elevated delivery variability and provide more accurate delivery promises where actual performance is highly inconsistent.

### 7.3 States to prioritize
Where should Olist prioritize operational improvements?
#### Insight
States combining high order volumes, elevated delay rates such as SP and RJ represent a large opportunity for operational improvement.
In contrast, some low-volume states such as SE and PB exhibit higher delay rates but contribute relatively little to overall network performance.

#### Business Impact
Prioritizing high-volume, high-delay regions allows Olist to maximize the operational impact of improvement initiatives.

![States to prioritize](https://github.com/seyyes/Brazilian-ecommerce/blob/master/assets/States_to_prioritize.png)

### 7.4 Strategic Recommendations
#### 7.4.1 Reduce Severe Delivery Delays
Target the longest delays first, as they generate the largest decline in customer satisfaction.

#### 7.4.2 Prioritize High-Impact Sellers
Focus improvement initiatives on the small group of sellers responsible for the majority of delayed orders.

#### 7.4.3 Focus on High-Impact Regions
Prioritize operational improvements in states combining high order volumes and elevated delay rates.

#### 7.4.4 Improve Delivery Predictability
Review delivery commitments in regions exhibiting high delivery variability and inconsistent service levels.



## 8. Conclusion
This analysis shows that Olist maintains strong overall logistics performance, with more than 93% of orders delivered on time.
However, delivery issues are concentrated among a limited number of sellers and regions, creating clear opportunities for targeted operational improvements.
The analysis also highlights that severe delivery delays have a disproportionate impact on customer satisfaction, making them a higher priority than marginal improvements in already reliable deliveries.
By reducing severe delays, focusing on high-impact sellers, critical regions, and delivery predictability, Olist could improve both logistics performance and customer experience.

## 9. Project Structure

models/
  - staging/
  - intermediate/
  - marts/

analyses/
- eda/ (contains exploratory analysis)

assets/
- dashboard screenshots and pdf


## Resources:
- Dataset (https://www.kaggle.com/datasets/olistbr/brazilian-ecommerce) 
