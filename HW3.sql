USE my_first_db;
CREATE TABLE IF NOT EXISTS staff
(
	id INT AUTO_INCREMENT PRIMARY KEY,
    first_name VARCHAR(45),
    last_name VARCHAR(45),
    post VARCHAR(45),
    seniority INT,
    salary DECIMAL(8, 2),
    age INT
);

INSERT staff(first_name, last_name, post, seniority, salary,age)
VALUES
	("Пользователь", "Тестовый", "Тест", 30, 50000, 50);

INSERT  staff (first_name, last_name, post, seniority, salary, age)
VALUES
	 ('Вася', 'Петров', 'Начальник', 40, 100000, 60),
	 ('Петр', 'Власов', 'Начальник', 8, 70000, 30),
	 ('Катя', 'Катина', 'Инженер', 2, 70000, 25),
	 ('Саша', 'Сасин', 'Инженер', 12, 50000, 35),
	 ('Иван', 'Петров', 'Рабочий', 40, 30000, 59),
	 ('Петр', 'Петров', 'Рабочий', 20, 55000, 60),
	 ('Сидр', 'Сидоров', 'Рабочий', 10, 20000, 35),
	 ('Антон', 'Антонов', 'Рабочий', 8, 19000, 28),
	 ('Юрий', 'Юрков', 'Рабочий', 5, 15000, 25),
	 ('Максим', 'Петров', 'Рабочий', 2, 11000, 19),
	 ('Юрий', 'Петров', 'Рабочий', 3, 12000, 24),
	 ('Людмила', 'Маркина', 'Уборщик', 10, 10000, 49);
 
SELECT *
FROM staff;

SELECT *
FROM staff
ORDER BY salary; -- сортировка по возрастанию salary

SELECT *
FROM staff
ORDER BY salary DESC; -- сортировка по убыванию salary

SELECT salary
FROM staff
ORDER BY salary DESC
LIMIT 5;  -- выборка 5 максимальных зарплат

SELECT 
	post,
    SUM(salary) AS "Суммарная зп по специальностям"
FROM staff
GROUP BY post; -- выборка суммарной зарплаты по категориям

SELECT 
	post,
    COUNT(salary) AS "Количество сотрудников"
FROM staff
WHERE post = "рабочий" AND age BETWEEN 24 AND 49 
GROUP BY post; -- выбока колличества сотрудников "Рабочий" в возрастной категории от 24 до 49 включительно

SELECT 
    COUNT(DISTINCT post) AS "Количество специальностей"
FROM staff; -- выборка по количеству специальностей

SELECT 
	post, AVG(age)
FROM staff    
GROUP BY post
HAVING AVG(age) < 30; -- Выборка специальностей по среднему возрасту который ниже 30
