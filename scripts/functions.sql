--1) Подробная информация о сотрудниках
CREATE OR REPLACE FUNCTION get_employee_info()
    RETURNS TABLE
            (
                employee_id     INTEGER,
                employee_name   VARCHAR(200),
                emp_company_id  INTEGER,
                employee_post   VARCHAR(30),
                employee_salary INTEGER,
                company_id      INTEGER,
                company_name    VARCHAR(200),
                company_address VARCHAR(255),
                company_type    VARCHAR(30)
            )
AS
$$
SELECT *
FROM employees e
         LEFT JOIN companies c ON e.emp_company_id = c.company_id
$$ LANGUAGE SQL;


--2) Статистика по складам
CREATE OR REPLACE FUNCTION warehouses_stats()
    RETURNS TABLE
            (
                warehouse_id       INTEGER,
                warehouse_name     VARCHAR(200),
                total_supply_count INTEGER,
                total_goods_area   INTEGER,
                average_rent       INTEGER
            )
AS
$$
SELECT warehouse_id,
       warehouse_name,
       COUNT(DISTINCT supplies.supply_id) AS total_supply_count,
       SUM(goods.goods_area)              AS total_goods_area,
       AVG(warehouse_rent)                AS average_rent
FROM warehouses
         JOIN
     supplies ON warehouse_id = supply_warehouse_id
         JOIN
     goods ON goods_warehouse_id = warehouse_id
GROUP BY warehouses.warehouse_id
$$ LANGUAGE SQL;


--3) Выплаченная зарплата на каждом складе
CREATE OR REPLACE FUNCTION get_warehouses_salaries()
    RETURNS TABLE
            (
                warehouse_id   INTEGER,
                warehouse_name VARCHAR(200),
                total_salary   INTEGER
            )
AS
$$
SELECT w.warehouse_id, w.warehouse_name, SUM(e.employee_salary) AS total_salary
FROM warehouses w
         LEFT JOIN employees e ON e.emp_company_id = w.warehouse_company_id
GROUP BY w.warehouse_name, w.warehouse_id
$$ LANGUAGE SQL;


--4) Средняя цена аренды по складам
CREATE OR REPLACE FUNCTION get_warehouses_avg_rent()
    RETURNS INTEGER
AS
$$
SELECT AVG(warehouse_rent)
FROM warehouses
$$ LANGUAGE SQL;


--5) Средняя цена аренды по офисам
CREATE OR REPLACE FUNCTION get_offices_avg_rent()
    RETURNS INTEGER
AS
$$
SELECT AVG(office_rent)
FROM offices
$$ LANGUAGE SQL;

