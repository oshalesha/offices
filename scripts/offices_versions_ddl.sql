CREATE TABLE offices_versions
(
    office_id  INTEGER,
    updated_at DATE         NOT NULL,
    history    VARCHAR(200) NOT NULL
);