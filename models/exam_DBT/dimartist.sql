{{ config(materialized='table', tags=["exam_table_tag"],
post_hook="ALTER TABLE {{ this }} ADD CONSTRAINT {{ this.name }}_pk PRIMARY KEY (Artist_key)") }}

with artist as (
    select * from {{ source('Exam_DBT','ARTIST') }}
),
final as (
    select  artistId as Artist_key,
            name as Name,
            birthyear as prod_year,
            country as Country
    from artist
)
select * from final