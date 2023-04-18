CREATE TABLE warehouses
(
    id          INTEGER PRIMARY KEY,
    name        VARCHAR(200) NOT NULL,
    provider_id INTEGER,
    company_id  INTEGER,
    address     VARCHAR(200),
    area        INTEGER      NOT NULL,
    rent        INTEGER,
    class       CHAR         NOT NULL,
    weight      INTEGER,
    rail        INTEGER,
    temp        VARCHAR(100)
);