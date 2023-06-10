{{ config(materialized = 'view') }}

select
    * except (datastream_metadata, postal_code),
    if(postal_code = "", null, postal_code) as postal
from {{ref("src_yelp_business")}} as b
join
    {{ref("src_master_state_us")}} as s on s.string_field_1 = b.state
where
    datastream_metadata.is_deleted = false
    and datastream_metadata.source_timestamp in (
        select max(datastream_metadata.source_timestamp)
        from {{ref("src_yelp_business")}}
    )
