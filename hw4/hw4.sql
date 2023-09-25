/*
Подсчитать количество групп, в которые вступил каждый пользователь.
Подсчитать количество пользователей в каждом сообществе.
Пусть задан некоторый пользователь. Из всех пользователей соц. сети найдите человека, который больше всех общался 
с выбранным пользователем (написал ему сообщений).
* Подсчитать общее количество лайков, которые получили пользователи младше 18 лет.
* Определить кто больше поставил лайков (всего): мужчины или женщины.
*/

USE vk;
#Задача 1

SELECT users.firstname, users.lastname, COUNT(users_communities.community_id) AS 'count_group'
FROM users
LEFT JOIN users_communities ON users.id = users_communities.user_id 
GROUP BY users.id;

#Задача 2

SELECT c.name, COUNT(uc.user_id) AS 'count_user'
FROM communities c 
LEFT JOIN users_communities uc ON c.id  = uc.community_id 
GROUP BY c.id;

#Задача 3

SELECT
	m.from_user_id,
	u.firstname,
	u.lastname,
	COUNT(*) AS 'message_count'
FROM  messages m
JOIN users u ON u.id = m.from_user_id 
WHERE to_user_id = 1
GROUP BY from_user_id
ORDER BY count(*) DESC
LIMIT 1;

#Задача 4

SELECT  COUNT(*) AS 'count_likes_user_before_18'
FROM likes l
JOIN media m ON l.media_id = m.id
JOIN profiles p ON p.user_id = m.user_id
WHERE  YEAR(CURDATE()) - YEAR(birthday) < 18;

#Задача 5

SELECT  gender, COUNT(*) AS 'count_likes'
FROM likes l
JOIN profiles p ON l.user_id = p.user_id
GROUP BY gender;




