SELECT * FROM university.students;

SELECT * 
FROM university.students
WHERE id=2;

SELECT * 
FROM university.students
WHERE email LIKE '%@mail.ru';

SELECT * 
FROM university.students
WHERE email LIKE '%@mail.ru';

-- CREATE TABLE t2(id int --);

INSERT INTO `university`.`students` (`name`, `email`, `phone`, `sddress`) 
VALUES ('Ерополк Хозяин', 'test32@mail.ru', 4846563115, 'Питер');

SELECT * FROM university.students;

update students
set phone = 451212
where id = 4;
SELECT * FROM university.students;

