
--выводит суммарную площадь, занимаемую команией на складах по убыванию площади, которая > 1000.
SELECT company_id,
       (SELECT companies.name FROM companies WHERE companies.id = warehouses.company_id),
       SUM(area) AS total_area
FROM warehouses
GROUP BY company_id
HAVING SUM(area) > 1000
ORDER BY total_area DESC;

--выводит компанию и id офиса по убыванию цены аренды
SELECT company_id,
       (SELECT companies.name FROM companies WHERE companies.id = offices.company_id),
       id                               AS office_id,
       rent,
       RANK() OVER (ORDER BY rent DESC) AS rent_rank
FROM offices
ORDER BY rent DESC;

--средняя цена для компании и класса
SELECT company_id,
       (SELECT companies.name FROM companies WHERE companies.id = offices.company_id),
       class,
       AVG(rent) AS avg_rent
FROM offices
GROUP BY company_id, class
HAVING AVG(rent) > 500
ORDER BY avg_rent DESC;


--выводит следущую снизу зарплату в компании
WITH selected AS (SELECT company_id,
                         (SELECT companies.name FROM companies WHERE companies.id = employees.company_id),
                         name,
                         salary,
                         LAG(salary) OVER (PARTITION BY company_id ORDER BY salary) AS previous_salary
                  FROM employees)
SELECT *
FROM selected
WHERE selected.previous_salary IS NOT NULL;


--топ-3 бизнес-центров по количеству офисов внутри
SELECT center_id,
       (SELECT name FROM business_centers WHERE business_centers.id = offices.center_id),
       COUNT(id)                                   AS num_of_offices,
       DENSE_RANK() OVER (ORDER BY COUNT(id) DESC) AS office_count_rank
FROM offices
GROUP BY center_id
ORDER BY num_of_offices DESC
LIMIT 3;

--employees которые работают более чем в одной компании
WITH selected AS (SELECT id FROM employees GROUP BY id HAVING (COUNT(id) > 1))
SELECT DISTINCT id, name
FROM employees
WHERE id IN (SELECT * FROM selected);
