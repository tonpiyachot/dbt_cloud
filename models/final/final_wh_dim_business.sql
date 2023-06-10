{{ config(materialized="table") }}

select *, dbt_valid_to is null as is_current_version
from {{ ref("scd2_yelp_business") }}
where dbt_valid_to is null
