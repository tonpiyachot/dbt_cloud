{{ config(materialized="table", tags = ['monthly_avg_star']) }}

select
    b.business_id,
    b.name,
    avg(r.stars) as avg_star,
    extract(month from r.date) as month,
from {{ref("int_yelp_review")}} as r
join
    {{ref("int_yelp_business")}} as b
    on r.business_id = b.business_id
group by b.business_id, b.name, month
order by b.business_id, b.name, month, avg(r.stars) desc
