select  
    DATE_FORMAT((line_item_usage_start_date),'%Y-%m-%d'),
    line_item_usage_account_id, 
    sum(line_item_unblended_cost)  
from cur2
where 
    line_item_product_code= 'Amazon Elastic Compute Cloud'  
    and line_item_usage_type like '%EBS%'  
    and line_item_usage_type like  '%napshot%' 
group by  1,2 
order by 1


