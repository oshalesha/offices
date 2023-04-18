CREATE TABLE offices
(
    id          INTEGER PRIMARY KEY,
    company_id  INTEGER,
    provider_id INTEGER,
    center_id   INTEGER,
    area        INTEGER NOT NULL,
    floors      INTEGER,
    rent        INTEGER,
    class       CHAR    NOT NULL
);