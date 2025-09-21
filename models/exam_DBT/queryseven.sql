{{ config(tags=["exam_done_tag"]) }}


with al as (
    select * from {{ source('Exam_STAR_DBT','DIMALBUM') }}
),
spe as (
    select * from {{ source('Exam_STAR_DBT','DIMSPECTRACK')}}
),
ft as (
    select * from {{ source('Exam_STAR_DBT','FACTTRACKS')}}
),

final as (
    select  spe.genre 
    from ft
    join spe on ft.spectrack_key = spe.spectrack_key
    join al on ft.album_key = al.album_key
    where al.prod_year = 2000
    group by spe.genre
    order by count(spe.spectrack_key) desc
    limit 1
)
select * from final