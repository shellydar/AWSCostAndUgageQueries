select DATE_FORMAT((line_item_usage_start_date),'%Y-%m-%d'),line_item_usage_account_id ,sum(line_item_unblended_cost)   from cur2
group by t1,2  order by 1,2 ;