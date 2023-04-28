--1) Подробная информация о сотрудниках
CREATE VIEW verbose_employees AS
SELECT *
FROM employees e
         LEFT JOIN companies c ON e.emp_company_id = c.company_id;


--2) Сотрудники со скрытой зарплатой
CREATE VIEW employees_view AS
SELECT employee_id, employee_name, emp_company_id, employee_post, '*********' AS employee_salary
FROM employees;


--3) Поставки со скрытым адресом поставщика
CREATE VIEW supplies_view AS
SELECT supply_id, supply_name, supply_warehouse_id, supply_created_at, '***' AS supplier_address
FROM supplies;


--4) Количество указанных сотрудников на каждом складе
CREATE VIEW employees_per_warehouse AS
SELECT w.warehouse_id, w.warehouse_name, COUNT(e.employee_id) AS employee_count
FROM warehouses w
         LEFT JOIN employees e ON e.emp_company_id = w.warehouse_company_id
GROUP BY w.warehouse_name, w.warehouse_id;


--5) Выплаченная зарплата на каждом складе
CREATE VIEW salary_per_warehouse AS
SELECT w.warehouse_id, w.warehouse_name, SUM(e.employee_salary) AS total_salary
FROM warehouses w
         LEFT JOIN employees e ON e.emp_company_id = w.warehouse_company_id
GROUP BY w.warehouse_name, w.warehouse_id;


--6) Статистика по складам
CREATE VIEW warehouse_stats AS
SELECT warehouses.warehouse_name,
       COUNT(DISTINCT supplies.supply_id) AS total_supply_count,
       SUM(goods.goods_area)              AS total_goods_area,
       AVG(warehouse_rent)                AS average_rent
FROM warehouses
         JOIN
     supplies ON warehouses.warehouse_id = supplies.supply_warehouse_id
         JOIN
     goods ON goods.goods_warehouse_id = warehouses.warehouse_id
GROUP BY warehouses.warehouse_id;

