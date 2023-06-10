{% snapshot scd2_yelp_business %}

    {{
        config(
          target_schema='snapshots',
          strategy='check',
          unique_key='business_id',
          check_cols=['name'],
          invalidate_hard_deletes=True,
        )
    }}

    select * from {{ref("int_yelp_business")}}

{% endsnapshot %}