with bob as (
    select * from {{ source('COVID19_Epidemiological_Data', 'DEMOGRAPHICS') }}
),
jimbo as (
    select * from{{ ref('country_code')}}
)

final as (
    select
        bob.state,
        jimbo.name
    from bob
    left join jimbo 
        on jimbo.code = bob.ISO3166_1
)

select * from final