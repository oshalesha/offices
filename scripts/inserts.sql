
INSERT INTO companies (id, name, address, type)
VALUES (1, 'Google', '1600 Amphitheatre Parkway, Mountain View, CA', 'Technology'),
       (2, 'Apple', '1 Apple Park Way, Cupertino, CA', 'Technology'),
       (3, 'Dole food', '383 Madison Ave, New York, NY', 'Food'),
       (4, 'Coca-Cola', 'One Coca-Cola Plaza, Atlanta, GA', 'Beverage'),
       (5, 'Ford', 'Ford Motor Company, Dearborn, MI', 'Automotive'),
       (6, 'Joe''s ware', '100 N Riverside Plaza, Chicago, IL', 'Warehouses'),
       (7, 'American ware', '702 SW 8th St, Bentonville, AR', 'Warehouses'),
       (8, 'Regus', '1 P&G Plaza, Cincinnati, OH', 'Offices'),
       (9, 'WeWork', '1 P&G Plaza, Cincinnati, OH', 'Offices');



INSERT INTO employees (id, name, company_id, post, salary)
VALUES (1, 'Joseph Smith', 1, 'Software Engineer', 120000),
       (2, 'Jane Doe', 1, 'Product Manager', 150000),
       (3, 'Bob Johnson', 2, 'Senior iOS Developer', 130000),
       (1, 'Joseph Smith', 2, 'Software Engineer', 130000),
       (5, 'Tom Davis', 3, 'Investment Banker', 180000),
       (6, 'Amy Lee', 3, 'Compliance Officer', 90000),
       (7, 'Mark Brown', 5, 'Marketing Coordinator', 80000),
       (8, 'Laura Garcia', 4, 'Manager', 100000);


INSERT INTO business_centers (id, name, address)
VALUES (1, 'Silicon Valley Center', '2560 N 1st St, San Jose, CA 95131'),
       (2, 'Empire State Center', '350 5th Ave, New York, NY 10118'),
       (3, 'Windy City Center', '227 W Monroe St, Chicago, IL 60606'),
       (4, 'Lone Star Center', '2000 E Lamar Blvd, Arlington, TX 76006'),
       (5, 'Sunshine State Center', '200 S Orange Ave, Orlando, FL 32801'),
       (6, 'Mile High Center', '410 17th St, Denver, CO 80202'),
       (7, 'Golden Gate Center', '101 California St, San Francisco, CA 94111'),
       (8, 'Space Needle Center', '1420 5th Ave, Seattle, WA 98101');

INSERT INTO offices (id, company_id, provider_id, center_id, area, floors, rent, class)
VALUES (1, 1, 9, 4, 200, 10, 10000, 'A'),
       (2, 2, 8, 7, 150, 5, 7500, 'B'),
       (3, 3, 8, 2, 250, 12, 15000, 'A'),
       (4, 3, 9, 4, 180, 8, 9000, 'B'),
       (5, 5, 9, 1, 175, 6, 7000, 'A'),
       (6, 6, 9, 5, 300, 14, 21000, 'A'),
       (7, 7, 8, 3, 220, 9, 11000, 'B'),
       (8, 6, 8, 7, 260, 11, 13000, 'A');

INSERT INTO offices_versions (office_id, updated_at, history)
VALUES (1, '2023-04-12', 'Initial version'),
       (2, '2023-04-12', 'Initial version'),
       (3, '2023-04-12', 'Initial version'),
       (4, '2023-04-12', 'Initial version'),
       (5, '2023-04-12', 'Initial version'),
       (6, '2023-04-12', 'Initial version'),
       (7, '2023-04-12', 'Initial version'),
       (8, '2023-04-12', 'Initial version');

INSERT INTO warehouses (id, name, provider_id, company_id, address, area, rent, class, weight, rail, temp)
VALUES (1, 'ABC Warehouse', 6, 5, '123 Main St, Anytown, USA', 5000, 7500, 'A', 100000, 1, 'Dry'),
       (2, 'Acme Storage', 6, 5, '456 Elm St, Anytown, USA', 10000, 10000, 'B', 200000, 0, 'Dry'),
       (3, 'Big Box Storage', 7, 3, '789 Oak St, Anytown, USA', 15000, 12500, 'A', 300000, 1, 'Cool'),
       (4, 'City Storage', 7, 3, '321 Maple St, Anytown, USA', 8000, 9000, 'B', 150000, 0, 'Cool'),
       (5, 'Global Warehouse', 7, 3, '654 Pine St, Anytown, USA', 12000, 11000, 'A', 250000, 1, 'Cool'),
       (6, 'Metro Storage', 6, 5, '987 Cedar St, Anytown, USA', 18000, 15000, 'A', 400000, 0, 'Dry'),
       (7, 'Prime Warehouse', 6, 4, '234 Birch St, Anytown, USA', 10000, 8000, 'B', 175000, 1, 'Dry'),
       (8, 'Total Storage', 7, 4, '567 Willow St, Anytown, USA', 20000, 20000, 'A', 500000, 0, 'Cool');

INSERT INTO supplies (id, warehouse_id, name, created_at, delivered_at)
VALUES (1, 3, 'Fruit Supply Co.', '2022-01-01', '2022-01-05'),
       (2, 3, 'Tasty Treats', '2022-02-01', '2022-02-05'),
       (3, 3, 'Exotic Fruits', '2022-03-01', '2022-03-05'),
       (4, 4, 'Berry Best', '2022-04-01', '2022-04-05'),
       (5, 4, 'Berry Fresh', '2022-05-01', '2022-05-05'),
       (6, 5, 'Sweet and Juicy', '2022-06-01', '2022-06-05'),
       (7, 5, 'Farm to Table', '2022-07-01', '2022-07-05'),
       (8, 5, 'Organic Harvest', '2022-08-01', '2022-08-05');

INSERT INTO goods (name, id, warehouse_id, supply_id, area)
VALUES ('Apples', 1, 3, 5, 50),
       ('Bananas', 2, 3, 7, 30),
       ('Oranges', 3, 3, 8, 25),
       ('Grapes', 4, 4, 6, 40),
       ('Grapes', 4, 4, 4, 40),
       ('Strawberries', 6, 5, 3, 20),
       ('Blueberries', 7, 5, 2, 15),
       ('Raspberries', 8, 5, 1, 10);
