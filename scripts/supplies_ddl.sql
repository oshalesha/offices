CREATE TABLE supplies
(
    id           INTEGER PRIMARY KEY,
    warehouse_id INTEGER,
    name         VARCHAR(200) NOT NULL,
    created_at   DATE         NOT NULL,
    delivered_at   DATE
);
