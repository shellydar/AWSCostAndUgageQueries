select line_item_usage_start_date, line_item_usage_account_id ,product_purchase_option, sum(line_item_unblended_cost)  
from cur2
where  
line_item_product_code = 'Amazon RDS Service' 
and line_item_unblended_cost > 0 
and line_item_resource_id is not NULL 
and line_item_usage_type like '%Usage%'
and line_item_usage_type like '%db%'
group by 1,2,3 order by 1,2,3