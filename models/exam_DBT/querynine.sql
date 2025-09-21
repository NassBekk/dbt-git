{{ config(tags=["exam_done_tag"]) }}

with spe as (
    select * from {{ source('Exam_STAR_DBT','DIMSPECTRACK') }}
),
art as (
    select * from {{ source('Exam_STAR_DBT','DIMARTIST')}}
),
ft as (
    select * from {{ source('Exam_STAR_DBT','FACTTRACKS')}}
),

final as (
    select  spe.Track_Name
    from ft
    join art on ft.artist_key = art.artist_key
    join spe on ft.spectrack_key = spe.spectrack_key
    where art.country = 'France' and spe.genre = 'Rock'
)
select * from final