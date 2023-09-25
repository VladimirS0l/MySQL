USE vk;
/*
1 - Написать скрипт, возвращающий список имен (только firstname) пользователей без повторений в алфавитном порядке. [ORDER BY]
2 - Выведите количество мужчин старше 35 лет [COUNT].
3 - Сколько заявок в друзья в каждом статусе? (таблица friend_requests) [GROUP BY]
4 - Выведите номер пользователя, который отправил больше всех заявок в друзья (таблица friend_requests) [LIMIT].
5 - Выведите названия и номера групп, имена которых состоят из 5 символов [LIKE].
*/

#ЗАДАЧА №1

SELECT DISTINCT firstname
FROM users
ORDER BY firstname;

#ЗАДАЧА №2

SELECT
	COUNT(*)
	gender
FROM profiles
WHERE gender LIKE 'm' AND  (birthday + INTERVAL 35 YEAR) > NOW();

#ЗАДАЧА №3

SELECT
	COUNT(*)
	status,
	status 
FROM friend_requests
GROUP BY status;

#ЗАДАЧА №4

SELECT 
	COUNT(*),
	initiator_user_id 
FROM friend_requests
GROUP BY initiator_user_id 
HAVING count(*) > 1

#ЗАДАЧА №5

SELECT *
FROM communities
WHERE name  LIKE '_____';











