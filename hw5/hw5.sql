/*Создайте представление с произвольным SELECT-запросом из прошлых уроков [CREATE VIEW]
Выведите данные, используя написанное представление [SELECT]
Удалите представление [DROP VIEW]
* Сколько новостей (записей в таблице media) у каждого пользователя? Вывести поля: news_count (количество новостей),
*  user_id (номер пользователя), user_email (email пользователя). Попробовать решить с помощью CTE или с помощью обычного JOIN.
*/

#Задача 1

CREATE VIEW hw_view AS
	SELECT  gender, COUNT(*) AS 'count_likes'
	FROM likes l
	JOIN profiles p ON l.user_id = p.user_id
	GROUP BY gender;

#Задача 2

SELECT *
FROM hw_view;

#Задача 3

DROP VIEW hw_view;

#Задача 4
#JOIN

SELECT 
	u.id,
	concat(u.firstname, " ", u.lastname) AS Name,
	u.email,
	COUNT(m.user_id ) AS news_count
	
FROM users u 
JOIN media m ON u.id = m.user_id
GROUP BY m.user_id;


#Задача 4
#CTE

WITH news_count AS (
	SELECT media.user_id,
	COUNT(media.id) AS count
	FROM media
	GROUP BY media.user_id
)
SELECT 
	users.id,
	users.email,
	ifnull(news_count.count, 0) AS news_count
FROM users
LEFT JOIN news_count ON users.id = news_count.user_id
ORDER BY users.id;
