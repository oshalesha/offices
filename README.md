# Course project on the subject "Databases"

---

### Intro

<b><u>Purpose of the work</u>:</b> gaining practical skills in working with industrial DBMS, designing DB (conceptual, logical, physical), creating stored procedures, views,
triggers, indexes. Practice testing queries (DQ — Data Quality).
<b><u>Tools</u>:</b> PostgreSQL 15, Python 3.9, Gitlab CI.

---

### Problem statement
1. Subject area: warehouses, offices, their owners, business centers and product deliveries.
   1. <u>Conceptual model</u>: all entities with links are given in crow's foot notation.
   2. <u>Logical model</u>: description of tables and their attribute composition, as well as links in crow's foot notation. The DB is in 2NF. I used an ER diagram for the description. There is a versioned table.
   3. <u>Physical model</u>: description of table storage in the DBMS. For each entity from p. 1.2, I prepared a table with `PRIMARY KEY`, `FOREIGN KEY` columns with a link to an external table.
2. I prepared DDL scripts and created my own database in the DBMS.
3. I filled the created database with data, ~10 records in each table.
4. Wrote 11 `INSERT`, `SELECT`, `UPDATE`, `DELETE` queries (CRUD queries).
5. Wrote 6 complex `SELECT` queries using:
    1. `GROUP BY + HAVING`
    2. `ORDER BY`
    3. `<func>(...) OVER(...)`:
       1. `PARTITION BY`
       2. `ORDER BY`
       3. `PARTITION BY + ORDER BY`
       4. `<func>` - all 3 types of functions - aggregation, ranking, offsets.
6. Wrote tests for the queries from the previous point + attached a description of the queries themselves.
7. Prepared 6 views:
   1. 2 are obtained by hiding fields, and also by hiding technical fields. As a bonus, along with the code, I attached tests for the views. 
   2. 4 are obtained by joining several tables in order to obtain a meaningful summary table. As a bonus, I added tests for views along with the code. As a bonus, I added tests for views along with the code.
8. Created 5 stored functions.
