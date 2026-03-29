/*
================================================================================
PROJECT: Ravenstack SaaS Revenue & Churn Analysis
AUTHOR: Ranginov Ngongo
DATE: March 2026
DESCRIPTION: 
    Comprehensive analysis of SaaS business health including Revenue (MRR), 
    Feature Engagement, and Churn Correlations using the Ravenstack dataset.
================================================================================
*/

-- SECTION 1: DATA CLEANING & PREPARATION
-- Checking for accounts with missing industries or invalid signup dates
SELECT 
    account_id, 
    account_name, 
    industry, 
    signup_date
FROM ravenstack_accounts
WHERE industry IS NULL OR signup_date IS NULL;

-- Standardizing 'is_trial' to ensure boolean consistency
-- (Useful if your raw data has mixed formats)
SELECT 
    account_id,
    CASE WHEN is_trial = 'TRUE' THEN 1 ELSE 0 END AS trial_indicator
FROM ravenstack_subscriptions;


-- SECTION 2: REVENUE ANALYSIS (MRR & Plan Performance)
-- Calculating Total Monthly Recurring Revenue (MRR) by Plan Tier
-- This shows which plan is the "bread and butter" of the company.
SELECT 
    plan_tier,
    COUNT(subscription_id) AS active_subscriptions,
    SUM(mrr_amount) AS total_mrr,
    AVG(seats) AS avg_seats_per_plan
FROM ravenstack_subscriptions
WHERE churn_flag = 'FALSE'
GROUP BY plan_tier
ORDER BY total_mrr DESC;


-- SECTION 3: FEATURE ENGAGEMENT INSIGHTS
-- Identifying the most used features and their average duration.
-- Shows which parts of the software provide the most value.
SELECT 
    feature_name,
    SUM(usage_count) AS total_usage,
    ROUND(AVG(usage_duration_secs / 60), 2) AS avg_usage_minutes,
    SUM(error_count) AS total_errors
FROM ravenstack_feature_usage
GROUP BY feature_name
ORDER BY total_usage DESC;


-- SECTION 4: CUSTOMER SUPPORT & SATISFACTION
-- Finding the relationship between high-priority tickets and satisfaction.
-- A key metric for Customer Success teams.
SELECT 
    priority,
    COUNT(ticket_id) AS ticket_volume,
    AVG(resolution_time_hours) AS avg_res_time,
    AVG(satisfaction_score) AS avg_csat
FROM ravenstack_support_tickets
WHERE satisfaction_score IS NOT NULL
GROUP BY priority;


-- SECTION 5: THE "HERO QUERY" - CHURN CORRELATION
-- Does high support volume correlate with churn?
-- This query uses a CTE to join support tickets with churn events.
WITH AccountSupport AS (
    SELECT 
        account_id,
        COUNT(ticket_id) AS total_tickets
    FROM ravenstack_support_tickets
    GROUP BY account_id
)
SELECT 
    a.churn_flag,
    AVG(s.total_tickets) AS avg_tickets_per_account,
    COUNT(a.account_id) AS account_count
FROM ravenstack_accounts a
LEFT JOIN AccountSupport s ON a.account_id = s.account_id
GROUP BY a.churn_flag;

-- FINAL INSIGHT: Reason for Churn vs Refund Amounts
SELECT 
    reason_code,
    COUNT(churn_event_id) AS total_churned,
    SUM(refund_amount_usd) AS total_refunded,
    feedback_text
FROM ravenstack_churn_events
WHERE feedback_text IS NOT NULL
GROUP BY reason_code, feedback_text
ORDER BY total_refunded DESC;