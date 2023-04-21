import psycopg2
import pytest


def db_connect():
    return psycopg2.connect(
        host="localhost",
        database="pg_db",
        user="postgres",
        password="postgres"
    )


def test_warehouses_query():  # выводит суммарную площадь, занимаемую команией на складах по убыванию площади, которая > 1000.
    conn = db_connect()
    cur = conn.cursor()
    cur.execute(
        "SELECT warehouse_company_id, (SELECT company_name FROM companies WHERE "
        "company_id = warehouse_company_id), SUM(warehouse_area) AS total_area FROM warehouses "
        "GROUP BY warehouse_company_id HAVING SUM(warehouse_area) > 1000 ORDER BY total_area DESC"
    )
    rows = cur.fetchall()
    assert len(cur.description) == 3
    assert rows == sorted(rows, key=lambda item: item[2], reverse=True)
    cur.close()
    conn.close()


def test_offices_query():  # выводит компанию и id офиса по убыванию цены аренды
    conn = db_connect()
    cur = conn.cursor()
    cur.execute("SELECT office_company_id,"
                "(SELECT company_name FROM companies WHERE company_id = office_company_id), "
                "office_id, office_rent, "
                "RANK() OVER (ORDER BY office_rent DESC) AS rent_rank "
                "FROM offices WHERE office_rent IS NOT NULL "
                "ORDER BY office_rent DESC")
    rows = cur.fetchall()
    assert len(cur.description) == 5
    for i in range(1, len(rows)):
        assert rows[i][3] <= rows[i - 1][3]
        assert rows[i][4] == rows[i - 1][4] + 1
    cur.close()
    conn.close()


def test_offices_avg_price_query():  # средняя цена для компании и класса
    conn = db_connect()
    cur = conn.cursor()
    cur.execute("SELECT office_company_id, "
                "(SELECT company_name FROM companies WHERE company_id = office_company_id), "
                "office_class, "
                "AVG(office_rent) AS avg_rent "
                "FROM offices "
                "GROUP BY office_company_id, office_class "
                "HAVING AVG(office_rent) > 500 "
                "ORDER BY avg_rent DESC")
    rows = cur.fetchall()
    assert len(cur.description) == 4
    assert rows == sorted(rows, key=lambda item: item[3], reverse=True)
    cur.close()
    conn.close()


def test_employees_query():  # выводит следущую снизу зарплату в компании
    conn = db_connect()
    cur = conn.cursor()
    cur.execute("WITH selected AS (SELECT emp_company_id, "
                "(SELECT company_name FROM companies WHERE company_id = emp_company_id), "
                "employee_name, "
                "employee_salary, "
                "LAG(employee_salary) "
                "OVER (PARTITION BY emp_company_id ORDER BY employee_salary) AS previous_salary "
                "FROM employees) "
                "SELECT * FROM selected "
                "WHERE selected.previous_salary IS NOT NULL;")
    rows = cur.fetchall()
    assert len(cur.description) == 5
    for item in rows:
        assert item[3] >= item[4]
    cur.close()
    conn.close()


def test_centers_query():  # топ-3 бизнес-центров по количеству офисов внутри
    conn = db_connect()
    cur = conn.cursor()
    cur.execute("SELECT office_center_id, "
                "(SELECT center_name FROM business_centers WHERE center_id = office_center_id), "
                "COUNT(office_id)                                   AS num_of_offices, "
                "DENSE_RANK() OVER (ORDER BY COUNT(office_id) DESC) AS office_count_rank "
                "FROM offices "
                "GROUP BY office_center_id "
                "ORDER BY num_of_offices DESC "
                "LIMIT 3")
    rows = cur.fetchall()
    assert len(rows) == 3
    assert len(cur.description) == 4
    assert rows == sorted(rows, key=lambda item: item[2], reverse=True)
    assert rows == sorted(rows, key=lambda item: item[3])
    cur.close()
    conn.close()


def test_employees_quantity():  # компании с указанными employees в их количестве
    conn = db_connect()
    cur = conn.cursor()
    cur.execute("WITH selected AS (SELECT company_id, company_name FROM companies) "
                "SELECT company_name, COUNT(employee_id) AS emp_count "
                "FROM employees "
                "JOIN selected ON selected.company_id = emp_company_id "
                "GROUP BY company_name "
                "ORDER BY emp_count DESC, company_name;")
    rows = cur.fetchall()
    assert len(cur.description) == 2
    assert rows == sorted(rows, key=lambda item: item[1], reverse=True)
    cur.close()
    conn.close()


if __name__ == '__main__':
    pytest.main()

