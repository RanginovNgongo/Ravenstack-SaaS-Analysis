# 🚀 Ravenstack SaaS Executive Performance Hub
## End-to-End SQL & Power BI Analytics Project

## 📌 Project Overview
This project features a comprehensive executive-level dashboard for Ravenstack, a high-growth SaaS company. By integrating multiple data streams, this dashboard provides a "Single Source of Truth" for revenue health, customer retention, and operational efficiency.

### Key Performance Indicators (KPIs):
- **Total MRR:** $11M (Annualized)
- **Total Customers:** 500
- **ARPU (Avg Revenue Per User):** $23K
- **Avg Support Resolution:** 35.9 hours

## 🏗️ Technical Architecture

### 1. Data Engineering (SQL Server)
The foundation of this project is a relational database containing five core tables: `accounts`, `subscriptions`, `churn_events`, `feature_usage`, and `support_tickets`.

- **Data Cleaning:** Used SQL to handle null values in `resolution_time` and normalized currency fields.
- **Aggregation:** Developed complex queries to calculate monthly recurring revenue and churn flags.

### 2. Data Modeling (Star Schema)
Implemented a Star Schema in Power BI to optimize performance.

- **Fact Tables:** `subscriptions`, `support_tickets`, `churn_events`
- **Dimension Tables:** `accounts`, `Date` (Auto-generated calendar table)
- **Relationships:** Established 1:Many relationships using `account_id` as the primary key.

### 3. DAX Calculations
Authored custom measures to provide deeper business insights:

- **Net Expansion:** `[Upgrades] - [Downgrades]` to track organic account growth.
- **CSAT Performance:** `AVERAGE(support_tickets[satisfaction_score])` segmented by urgency.
- **ARPU:** `DIVIDE([Total MRR], [Total Customers])` to measure unit economics.

## 📊 Strategic Insights

### 💰 Revenue & Market Share
- **Industry Leadership:** FinTech is the strongest sector, contributing **$2.7M** to Total MRR, followed closely by DevTools ($2.4M).
- **Billing Strategy:** Revenue is split almost perfectly 50/50 between Monthly and Annual billing, indicating a balanced cash flow and customer commitment model.

### 📉 Churn & Revenue Leakage
- **Primary Churn Driver:** Product Features are the #1 cause of revenue leakage ($1.9K), suggesting that expanding the product roadmap is a higher priority than lowering prices.
- **Competitive Pressure:** Roughly 104 customers left for competitors, signaling a need for improved "sticky" features.

### 🛠️ Support & Customer Success
- **Expert Intervention:** Tickets escalated to "Expert" status (Tier 2) consistently achieve higher CSAT scores (4.2) compared to standard tickets (4.0).
- **Efficiency:** Despite handling urgent issues, the team maintains a steady satisfaction score around 4.1, proving high operational resilience.

### 📈 Growth Trends
- **Expansion Flow:** The Upgrade vs Downgrade monthly view shows a strong "Green" trend, with upgrades significantly outperforming downgrades in almost every month of 2024.

## 📸 Dashboard Preview
- Executive Overview

<img width="1178" height="661" alt="image" src="https://github.com/user-attachments/assets/2d9dfc9d-fe2d-4299-9a9b-18dca2605382" />

- Revenue & Support Deep-Dive

<img width="1172" height="665" alt="image" src="https://github.com/user-attachments/assets/15f3d078-4787-43f4-a78a-90287219a448" />
