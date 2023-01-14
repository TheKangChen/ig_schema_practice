-- 5 earliest users
select * from users
order by created_at asc
limit 5;

-- when most people join ig
select date_format(created_at, '%a') as day_of_week, count(*) as total from users
group by day_of_week
order by total desc
limit 2;

-- users who have not posted
select
    username
from users
left join photos p on users.id = p.user_id
where image_url is null;

-- most liked photos
select u.username, p.id, p.image_url, count(*) as total
from photos p
inner join likes l on p.id = l.photo_id
inner join users u on p.user_id = u.id
group by p.id
order by total desc
limit 1;

-- find average posts per user
select (select count(*)
        from photos) /
       (select count(*)
        from users) as average_post;

-- find top 5 hashtags used
select tag_name, count(*) as total
from photo_tags
join tags t on photo_tags.tag_id = t.id
group by tag_name
order by total desc
limit 5;

-- find bots who like every single photo
select username
from likes
         join users u on likes.user_id = u.id
group by user_id
having count(*) = (select count(*)
                   from photos);
