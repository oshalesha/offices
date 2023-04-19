--выводит суммарную площадь, занимаемую команией на складах по убыванию площади, которая > 1000.
SELECT warehouse_company_id,
       (SELECT company_name FROM companies WHERE company_id = warehouse_company_id),
       SUM(warehouse_area) AS total_area
FROM warehouses
GROUP BY warehouse_company_id
HAVING SUM(warehouse_area) > 1000
ORDER BY total_area DESC;

--выводит компанию и id офиса по убыванию цены аренды
SELECT office_company_id,
       (SELECT company_name FROM companies WHERE company_id = office_company_id),
       office_id,
       office_rent,
       RANK() OVER (ORDER BY office_rent DESC) AS rent_rank
FROM offices
ORDER BY office_rent DESC;

--средняя цена для компании и класса
SELECT office_company_id,
       (SELECT company_name FROM companies WHERE company_id = office_company_id),
       office_class,
       AVG(office_rent) AS avg_rent
FROM offices
GROUP BY office_company_id, office_class
HAVING AVG(office_rent) > 500
ORDER BY avg_rent DESC;


--выводит следущую снизу зарплату в компании
WITH selected AS (SELECT emp_company_id,
                         (SELECT company_name FROM companies WHERE company_id = emp_company_id),
                         employee_name,
                         employee_salary,
                         LAG(employee_salary) OVER (PARTITION BY emp_company_id ORDER BY employee_salary) AS previous_salary
                  FROM employees)
SELECT *
FROM selected
WHERE selected.previous_salary IS NOT NULL;


--топ-3 бизнес-центров по количеству офисов внутри
SELECT office_center_id,
       (SELECT center_name FROM business_centers WHERE center_id = office_center_id),
       COUNT(office_id)                                   AS num_of_offices,
       DENSE_RANK() OVER (ORDER BY COUNT(office_id) DESC) AS office_count_rank
FROM offices
GROUP BY office_center_id
ORDER BY num_of_offices DESC
LIMIT 3;

--компании с указанными employees в количестве > 1.
WITH selected AS (SELECT company_id, company_name FROM companies)
SELECT company_name, COUNT(employee_id) AS emp_count
FROM employees
JOIN selected ON selected.company_id = emp_company_id
GROUP BY company_name
ORDER BY company_name;

