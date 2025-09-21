{{ config(materialized='table', tags=["exam_table_tag"],
post_hook="ALTER TABLE {{ this }} ADD CONSTRAINT {{ this.name }}_pk PRIMARY KEY (SpecTrack_key)") }}

with track as (
    select * from {{ source('Exam_DBT','TRACK') }}
),
genre as (
    select * from {{ source('Exam_DBT','GENRE') }}
),
Mediatype as (
    select * from {{ source('Exam_DBT','MEDIATYPE') }}
),
playlist as (
    select * from {{ source('Exam_DBT','PLAYLIST') }}
),
playlisttrack as (
    select * from {{ source('Exam_DBT','PLAYLISTTRACK') }}
),

final as (
    select  track.TrackId as SpecTrack_key,
            track.Name as Track_Name,
            genre.Name as Genre,
            mediatype.Name as Mediatype,
            playlist.Name as Playlist,
            track.Composer as Composer,
            track.milliseconds as milliseconds,
            track.bytes as bytes
    from track
    join genre on track.genreid = genre.genreid
    join mediatype on track.mediatypeid = mediatype.mediatypeid
    join playlisttrack on track.TrackId = playlisttrack.TrackId
    join playlist on playlisttrack.playlistid = playlist.playlistid
)
select * from final