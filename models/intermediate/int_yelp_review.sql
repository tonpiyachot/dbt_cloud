{{ config(materialized="view") }}

select *
from {{ref("src_yelp_review")}} as main
where
    datastream_metadata.source_timestamp in (
        select max(datastream_metadata.source_timestamp)
        from {{ref("src_yelp_review")}} as sub
        where main.review_id = sub.review_id
    )
