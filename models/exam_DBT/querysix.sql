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
    select  count(spe.Track_Name) as nb_morceaux, art.name as Artist
    from ft
    join art on ft.artist_key = art.artist_key
    join spe on ft.spectrack_key = spe.spectrack_key
    group by art.name
)
select * from final