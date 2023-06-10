{{ config(materialized = 'view') }}

select *
from {{ source('madt7102_bronze', 'yelp_review') }}