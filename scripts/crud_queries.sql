--CRUD-запросы соответствуют CREATE TABLE, SELECT(read), UPDATE и DELETE.

INSERT INTO employees (employee_id, employee_name, emp_company_id, employee_post, employee_salary)
VALUES (9, 'Maria Sokolova', 1, 'Business analyst', 120000);

UPDATE offices_owners
SET valid_to='1978-02-18'
WHERE office_own_id = 9;

SELECT * FROM offices_owners;

UPDATE offices
SET office_company_id = 1
WHERE office_company_id = 10;

INSERT INTO offices_owners (office_own_id, office_own_company_id, valid_from, valid_to)
VALUES (9, 1, '1978-02-18', '9999-12-31');

SELECT employee_name, employee_salary
FROM employees
ORDER BY employee_salary;

DELETE
FROM companies
WHERE company_name = 'TikTok';

UPDATE warehouses
SET warehouse_rail= TRUE
WHERE warehouse_id = 9;

INSERT INTO supplies (supply_id, supply_warehouse_id, supply_name, supply_created_at, supply_delivered_at)
VALUES (9, 4, 'Fruit Supply Co.', '2022-01-01', '2022-01-05');

INSERT INTO goods (goods_name, goods_id, goods_warehouse_id, goods_supply_id, goods_area)
VALUES ('Grapes', 9, 4, 9, 20);

SELECT DISTINCT goods_name
FROM goods;

