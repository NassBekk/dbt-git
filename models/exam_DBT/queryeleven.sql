
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
    select  spe.playlist
    from ft
    join art on ft.artist_key = art.artist_key
    join spe on ft.spectrack_key = spe.spectrack_key
    where art.birthyear < 1990
    group by spe.playlist
)
select * from final