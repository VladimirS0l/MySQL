#Задача 1

DELIMITER //
CREATE FUNCTION del_user(check_user_id BIGINT UNSIGNED)
RETURNS INT READS SQL DATA
BEGIN
   	DELETE FROM likes
   	WHERE user_id = check_user_id;

   	DELETE FROM media
   	WHERE user_id = check_user_id;
   
   	DELETE FROM profiles 
   	WHERE user_id = check_user_id;
  
  	DELETE FROM messages
	WHERE from_user_id = check_user_id;

	DELETE FROM users 
	WHERE id;
RETURN users.id;
END//
DELIMITER ;

START TRANSACTION;
	SELECT del_user(1);
COMMIT;

#Задача 2

DELIMITER $$
CREATE PROCEDURE del_user(IN check_user_id INT)
BEGIN
    DECLARE EXIT HANDLER FOR SQLEXCEPTION
    BEGIN
        ROLLBACK;
    END;

    START TRANSACTION;

    DELETE FROM likes WHERE user_id = check_user_id;
    DELETE FROM media WHERE user_id = check_user_id;
    DELETE FROM messages WHERE from_user_id = check_user_id OR to_user_id = check_user_id;
    DELETE FROM entries WHERE user_id = check_user_id;
    DELETE FROM profiles WHERE user_id = check_user_id;
    DELETE FROM users WHERE id = check_user_id;

    COMMIT;
END$$

DELIMITER ;

CALL del_user(1);

#Задача 3

DELIMITER //
CREATE TRIGGER check_community_name
BEFORE INSERT ON communities
FOR EACH ROW
BEGIN
  IF CHAR_LENGTH(NEW.name) > 4 THEN
    SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Длина названия сообщества должна быть не менее 5 символов';
  END IF;
END//
DELIMITER ;