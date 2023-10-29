Select  
case when  line_item_usage_type like '%EBS:SnapshotUsage%' then 'EBS Snapshot'
when (line_item_usage_type like '%Out-Bytes%' or line_item_usage_type like '%In-Bytes%')  then 'Data transfer'
when line_item_line_item_description  like '%hours purchased%' and line_item_resource_id is null then 'RI'
when line_item_usage_type like '%VPN%' then 'VPN'
when line_item_product_code like 'Amazon Simple Notification Service' then 'SNS'
when line_item_product_code like 'Amazon Simple Email Service' then 'SES'
when line_item_product_code like 'Amazon Simple Email Service' then 'SES'
when line_item_product_code like 'AmazonCloudWatch' then 'CloudWatch'
when line_item_product_code like 'AWS CloudTrail' then 'CloudTrail'
when line_item_product_code like 'AWS Key Management Service' then 'KMS'
when line_item_product_code like 'AWS Lambda' then 'AWS Lambda'
when line_item_product_code like 'AWS Directory Service' then 'AWS Directory Service'
when line_item_product_code like 'AWS Directory ServiceAmazon Simple Notification Service' then 'SNS'
when line_item_product_code like 'Amazon Route 53' then 'Amazon Route 53'
when line_item_usage_type like '%EBS:Volume%' then 'EBS'
when line_item_usage_type like '%HeavyUsage%' and line_item_resource_id is not null then 'EC2'
when line_item_usage_type like '%BoxUsage%' and line_item_resource_id is not null then 'EC2'
when line_item_usage_type like '%RDS:ChargedBackupUsage%' then 'RDS snapshots'
when line_item_product_code like 'Amazon RDS Service' and (line_item_usage_type like '%nstanceUsage%' or line_item_usage_type like '%HeavyUsage%')and line_item_resource_id is not null then 'RDS'
when line_item_usage_type like '%CW:%'  then 'CloudWatch'
when line_item_usage_type like '%LoadBalancer%' or line_item_usage_type like '%DataProcessing-Bytes%' then 'ELB'
when line_item_product_code like 'Amazon Simple Storage Service' and line_item_usage_type like '%Reques%' then 'S3 Data Transfer'
when line_item_product_code like  'Amazon RDS Service' and line_item_usage_type like '%torage%' then 'RDS Storage'
when line_item_usage_type like '%ElasticIP%' then 'EIP'
when line_item_product_code like 'Amazon Simple Storage Service' and line_item_usage_type like '%TimedStorage%' then 'S3'
when line_item_product_code like 'Amazon DynamoDB'  then 'Amazon DynamoDB'
when line_item_product_code='Amazon QuickSight'  then 'Amazon QuickSight'
else line_item_usage_type
end ,
sum(line_item_unblended_cost) from cur2 
and <TAG> is null
group by 1 order by 2 desc   ;