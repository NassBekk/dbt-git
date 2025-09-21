{{ config(tags=["exam_done_tag"]) }}

with al as (
    select * from {{ source('Exam_STAR_DBT','DIMALBUM') }}
),
art as (
    select * from {{ source('Exam_STAR_DBT','DIMARTIST')}}
),
ft as (
    select * from {{ source('Exam_STAR_DBT','FACTTRACKS')}}
),

final as (
    select  count(al.title) as nb_album, art.name as Artist
    from ft
    join art on ft.artist_key = art.artist_key
    join al on ft.album_key = al.album_key
    group by art.name
)
select * from final