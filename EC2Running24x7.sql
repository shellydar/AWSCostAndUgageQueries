select product_operating_system,
product_region, 
line_item_resource_id,
resource_tags_user_name,   
sum(line_item_usage_amount)    from cur2
where product_product_name= 'Amazon Elastic Compute Cloud' 
and line_item_operation  like '%Run%' 
and  line_item_usage_type NOT LIKE '%Spot%'
and line_item_unblended_cost > 0 
and line_item_resource_id is not NULL 
and line_item_usage_type like '%Usage%'
group by  1,2,3,4 order by 5 desc;