Задания на написание запросов к БД:								
1. Отобрать из таблицы user всех пользователей, у которых level_id=1, skill > 799000 и в имени встречается буква а								
2. Удалить всех пользователей, у которых skill меньше 100000								
3. Вывести все данные из таблицы user в порядке убывания по полю skill 								
4. Добавить в таблицу user нового пользователя по имени Oleg, с уровнем 4 и skill =10								
5. Обновить данные в таблице user -  для пользователей с level_id меньше 2 проставить skill 2000000								
6. Выбрать user_name всех пользователей уровня admin используя подзапрос								
7. Выбрать user_name всех пользователей уровня admin используя join								

CREATE TABLE LEVEL ( 
	ID INT PRIMARY KEY,
	LEVEL_NAME VARCHAR (50)
);

CREATE TABLE USERS ( 
	ID INT PRIMARY KEY,
	USER_NAME VARCHAR (50),
	LEVEL_ID INT ,
	SKILL INT);

INSERT INTO USERS ( ID,USER_NAME,LEVEL_ID,SKILL) VALUES
( 1,'ANTON',1,900000),
( 2,'DENIS',3,4000),
( 3, 'PETR',2,50000),
( 4, 'ANDREY',4,20),
( 5, 'OLGA',1,600000),
( 6, 'ANNA',1,1600000);

INSERT INTO LEVEL ( ID,LEVEL_NAME) VALUES
( 1, 'ADMIN'),
( 2, 'POWER_USER'),
( 3, 'USER'),
( 4, 'GUEST');
SELECT * FROM USERS WHERE LEVEL_ID = 1 ;

SELECT * FROM USERS
WHERE LEVEL_ID = 1
AND SKILL > 799000 AND USER_name LIKE '%A%' ; 

DELETE FROM USERS
WHERE SKILL < 100000;

SELECT * FROM USERS ORDER BY SKILL DESC;

INSERT INTO USERS ( ID,USER_NAME, LEVEL_ID, SKILL)
VALUES ( 7,'Oleg', 4, 10);

UPDATE USERS
SET SKILL = 2000000
WHERE LEVEL_ID < 2;

SELECT USER_NAME 
FROM USERS 
WHERE LEVEL_ID = (SELECT id FROM level WHERE level_name = 'ADMIN');

SELECT u.USER_NAME
FROM USERS u
JOIN level l ON u.LEVEL_ID = l.id
WHERE l.LEVEL_NAME = 'ADMIN';
