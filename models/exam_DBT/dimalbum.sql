{{ config(materialized='table', tags=["exam_table_tag"],
post_hook="ALTER TABLE {{ this }} ADD CONSTRAINT {{ this.name }}_pk PRIMARY KEY (album_key)") }}

with album as (
    select * from {{ source('Exam_DBT','ALBUM') }}
),
final as (
    select  albumid as Album_key,
            title as title,
            prodyear as prod_year,
            cdyear as nb_cd
    from album
)
select * from final