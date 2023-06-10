{{ config(materialized = 'view') }}

select *
from {{ source('madt7102_bronze', 'master_state_us') }}
