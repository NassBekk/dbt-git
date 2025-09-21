{{ config(materialized='table', tags=["exam_table_tag"]) }}

with track as (
    select * from {{ source('Exam_DBT','TRACK') }}
),
album as (
    select * from {{ source('Exam_DBT','ALBUM') }}
),
artist as (
    select * from {{ source('Exam_DBT','ARTIST') }}
),

final as (
    select
        album.albumid as album_key,
        artist.artistid as artist_key,
        track.trackid as spectrack_key
    from track
    join album on track.albumid = album.albumid
    join artist on album.artistid = artist.artistid
)

select * from final