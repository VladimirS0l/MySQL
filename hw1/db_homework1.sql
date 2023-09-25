SELECT * FROM mobile_phone.phones;

/*
Создайте таблицу с мобильными телефонами, используя графический интерфейс. Необходимые поля таблицы: product_name (название товара), manufacturer (производитель), product_count (количество), price (цена). Заполните БД произвольными данными.
Напишите SELECT-запрос, который выводит название товара, производителя и цену для товаров, количество которых превышает 2
Выведите SELECT-запросом весь ассортимент товаров марки “Samsung”
*/

SELECT product_name, manufacturer, price
FROM mobile_phone.phones
WHERE product_count > 2;

SELECT product_name, manufacturer, product_count, price
FROM mobile_phone.phones
WHERE manufacturer = 'Samsung';

/*
4.* С помощью SELECT-запроса с оператором LIKE / REGEXP найти:
4.1.* Товары, в которых есть упоминание "Iphone"
4.2.* Товары, в которых есть упоминание "Samsung"
4.3.* Товары, в названии которых есть ЦИФРЫ
4.4.* Товары, в названии которых есть ЦИФРА "8"
*/

SELECT product_name, manufacturer, product_count, price
FROM mobile_phone.phones
WHERE product_name LIKE '%Iphone%';

SELECT product_name, manufacturer, product_count, price
FROM mobile_phone.phones
WHERE product_name LIKE '%Samsung%';

SELECT product_name, manufacturer, product_count, price
FROM mobile_phone.phones
WHERE product_name REGEXP '[0-9]';

SELECT product_name, manufacturer, product_count, price
FROM mobile_phone.phones
WHERE product_name REGEXP '[8]';




