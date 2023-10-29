select to_char(line_item_usage_start_date, 'mm/dd/yyyy HH24'),line_item_usage_account_id ,  
     count(distinct line_item_resource_id), 
     sum(line_item_unblended_cost)    
      from cur2
where line_item_product_code= 'Amazon Elastic Compute Cloud' 
and line_item_operation like '%Run%' 
 and line_item_resource_id is not NULL 
 and line_item_usage_type like '%Usage%' 
 and line_item_unblended_cost>0
group by 1,2
 order by 1,2 ;