🚀 Ravenstack SaaS Executive Dashboard
End-to-End SQL & Power BI Analytics Project
📌 Project Overview
This project provides a comprehensive analysis of Ravenstack, a fictional SaaS company. The goal was to transform raw, fragmented data into an interactive Executive Dashboard that tracks Monthly Recurring Revenue (MRR), Customer Retention, and Support Performance.

Key Questions Addressed:

- What is our current Annual Recurring Revenue (ARR)?
- Which industries are driving the most growth?
- Why are customers churning, and what is the financial impact?
- Is there a correlation between support ticket priority and customer satisfaction (CSAT)?

🛠️ Tech Stack
- Database: SQL Server (SSMS)
- Data Visualization: Power BI Desktop
- Language: SQL (Complex Joins & Aggregations), DAX (Calculated Measures)
- Data Modeling: Star Schema

🏗️ The Data Pipeline
1. SQL Architecture
I imported 5 raw datasets into a SQL Server instance and developed a Master Analysis Script to validate the data.
- Tables used: accounts, subscriptions, churn_events, feature_usage, and support_tickets.
- Key SQL Techniques: Inner/Left Joins, Date formatting, and SUM/AVG aggregations.

2. Data Modeling (Star Schema)
In Power BI, I established a One-to-Many relationship model. The accounts table acts as the central Dimension table, linked to the Fact tables via account_id.

3. DAX Measures (The Logic)
- I authored custom DAX formulas to calculate high-level business KPIs:
- Total MRR: $SUM(ravenstack_subscriptions[mrr_amount])$
- ARPU (Avg Revenue Per User): $DIVIDE([Total MRR], [Total Customers])$
- Avg Support Time: $AVERAGE(resolution_time_hours)$

📊 Dashboard Insights
- Revenue Leadership: The FinTech and DevTools sectors are the highest contributors to MRR, representing over 40% of total revenue.
- Churn Analysis: While the customer churn rate remains stable, "Features" and "Pricing" are the leading causes of revenue leakage, totaling over $1.9K in refunds.
- Support Efficiency: The average resolution time is 35.9 hours. Interestingly, "Urgent" tickets maintain a high CSAT (~4.2), indicating the support team prioritizes high-stakes issues effectively.

📸 Final Dashboard

<img width="1159" height="651" alt="image" src="https://github.com/user-attachments/assets/107dfe24-4bca-4644-86c3-00d3da469896" />
