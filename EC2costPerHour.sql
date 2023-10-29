select line_item_usage_start_date,
line_item_usage_account_id ,   
 CASE
    WHEN (savings_plan_savings_plan_a_r_n <> '') THEN 'SavingsPlan'
    WHEN (reservation_reservation_a_r_n <> '') THEN 'Reserved'
    WHEN (line_item_usage_type LIKE '%Spot%') THEN 'Spot'
    ELSE 'OnDemand' 
  END AS purchase_option
     count(distinct line_item_resource_id), 
     sum(line_item_unblended_cost)    
      from cur2
where line_item_product_code= 'Amazon Elastic Compute Cloud' 
and line_item_operation like '%Run%' 
 and line_item_resource_id is not NULL 
 and line_item_usage_type like '%Usage%' 
 and line_item_unblended_cost>0
group by 1,2,3
 order by 1,2,3 ;