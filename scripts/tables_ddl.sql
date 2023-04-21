CREATE TABLE business_centers
(
    center_id      INTEGER PRIMARY KEY,
    center_name    VARCHAR(200) NOT NULL,
    center_address VARCHAR(255) NOT NULL
);

CREATE TABLE companies
(
    company_id      INTEGER PRIMARY KEY,
    company_name    VARCHAR(200) NOT NULL,
    company_address VARCHAR(255),
    company_type    VARCHAR(30)
);

CREATE TABLE employees
(
    employee_id     INTEGER PRIMARY KEY,
    employee_name   VARCHAR(200) NOT NULL,
    emp_company_id  INTEGER,
    employee_post   VARCHAR(30),
    employee_salary INTEGER
);

CREATE TABLE goods
(
    goods_name         VARCHAR(200) NOT NULL,
    goods_id           INTEGER PRIMARY KEY,
    goods_warehouse_id INTEGER,
    goods_supply_id    INTEGER,
    goods_area         INTEGER
);

CREATE TABLE offices
(
    office_id          INTEGER PRIMARY KEY,
    office_company_id  INTEGER,
    office_provider_id INTEGER,
    office_center_id   INTEGER,
    office_area        INTEGER,
    office_floors      INTEGER,
    office_rent        INTEGER,
    office_class       CHAR NOT NULL CHECK (office_class IN ('A', 'B', 'C'))
);

CREATE TABLE offices_owners
(
    office_own_id  INTEGER NOT NULL,
    office_own_company_id INTEGER NOT NULL,
    valid_from DATE    NOT NULL,
    valid_to   DATE    NOT NULL
);

CREATE TABLE supplies
(
    supply_id           INTEGER PRIMARY KEY,
    supply_warehouse_id INTEGER,
    supply_name         VARCHAR(200) NOT NULL,
    supply_created_at   DATE         NOT NULL,
    supply_delivered_at DATE
);

CREATE TABLE warehouses
(
    warehouse_id          INTEGER PRIMARY KEY,
    warehouse_name        VARCHAR(200) NOT NULL,
    warehouse_provider_id INTEGER,
    warehouse_company_id  INTEGER,
    warehouse_address     VARCHAR(200),
    warehouse_area        INTEGER      NOT NULL,
    warehouse_rent        INTEGER,
    warehouse_class       CHAR         NOT NULL CHECK (warehouse_class IN ('A', 'B', 'C')),
    warehouse_weight      INTEGER,
    warehouse_rail        BOOLEAN,
    warehouse_temp        VARCHAR(100)
);


ALTER TABLE offices
    ADD FOREIGN KEY (office_company_id) REFERENCES companies (company_id);
ALTER TABLE offices
    ADD FOREIGN KEY (office_provider_id) REFERENCES companies (company_id);
ALTER TABLE offices
    ADD FOREIGN KEY (office_center_id) REFERENCES business_centers (center_id);
ALTER TABLE goods
    ADD FOREIGN KEY (goods_warehouse_id) REFERENCES warehouses (warehouse_id);
ALTER TABLE goods
    ADD FOREIGN KEY (goods_supply_id) REFERENCES supplies (supply_id);
ALTER TABLE employees
    ADD FOREIGN KEY (emp_company_id) REFERENCES companies (company_id);
ALTER TABLE warehouses
    ADD FOREIGN KEY (warehouse_provider_id) REFERENCES companies (company_id);
ALTER TABLE warehouses
    ADD FOREIGN KEY (warehouse_company_id) REFERENCES companies (company_id);
ALTER TABLE supplies
    ADD FOREIGN KEY (supply_warehouse_id) REFERENCES warehouses (warehouse_id);

