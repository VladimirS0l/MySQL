#ЗАДАЧА №2

DROP TABLE IF EXISTS address;
CREATE TABLE address(
	address_id BIGINT auto_increment primary key,
	user_addr_id BIGINT UNSIGNED NOT NULL,
	index_city INT UNSIGNED NOT NULL,
	city VARCHAR(30),
	street VARCHAR(60),
	building VARCHAR(10),
	apartament VARCHAR(5),
	
	INDEX user_city (index_city, city)	
	FOREIGN KEY (user_addr_id) REFERENCES profiles(user_id)
);


DROP TABLE IF EXISTS vk_pay;
CREATE TABLE vk_pay(
	pay_id SERIAL,
	card_number INT UNSIGNED NOT NULL,
	card_holder VARCHAR(50),
	date_card DATE
);

ALTER TABLE profiles ADD COLUMN pay_user_id BIGINT UNSIGNED NOT NULL;

ALTER TABLE profiles ADD CONSTRAINT fk_profiles_pui
FOREIGN KEY (pay_user_id) REFERENCES vk_pay(pay_id);

#ЗАДАЧА №3

USE vk;

INSERT INTO address (user_addr_id, index_city, city, street, building, apartament)
VALUES 
(000100, "Moskow", "Tverskaya", "1A", "5"),
(000300, "Saint-Petersburg", "Nevskiy p-t", "20D", "12"),
(040000, "Tver", "Tverskaya", "15A", "9"),
(102020, "Nizhniy Novgorod", "Komsomolskaya", "45", "75R"),
(454545, "Ekaterinburg", "Malysheva", "150", "45"),
(454177, "Perm", "Lenina", "84", "85"),
(000100, "Moskow", "Kremlevskaya", "45", "75"),
(000100, "Moskow", "Teatralniy", "49", "32"),
(000100, "Moskow", "Bolotnaya", "96", "52"),
(000100, "Moskow", "Moskvoretskaya", "2", "9"),
(000100, "Moskow", "Kotelnicheskaya", "65", "78");

INSERT INTO vk_pay (card_number, card_holder, date_card)
VALUES
(1234567890123456, Ivan Ivanov, 02/26),
(1234567890116565, Ivan Petrov, 07/26),
(1234567484127412, Ivan Vasilev, 02/29),
(1234588549843456, Petr Petrov, 12/26),
(1156857890123456, Petr Ivanov, 07/27),
(1234567890123456, Petr Vasilev, 03/26),
(1215615890123456, Vasiliy Vasilev, 08/26),
(1487215286253456, Vasiliy Ivanov, 01/26),
(1234154654848456, Nikita Ivanov, 06/26),
(1234567890123456, Roman Romanov, 11/25),
(1234567148648211, Kirill Vasilev, 01/24);

#ЗАДАЧА №4

ALTER TABLE vk.profiles 
ADD COLUMN is_active BIT DEFAULT 1;

UPDATE profiles
SET is_active = 0
WHERE (birthday + INTERVAL 18 YEAR) > NOW();

SELECT *
FROM profiles
WHERE is_active = 0
ORDER BY birthday;

SELECT *
FROM profiles
WHERE is_active = 1
ORDER BY birthday;

#ЗАДАЧА №5

DELETE FROM messages
WHERE created_at > NOW()










