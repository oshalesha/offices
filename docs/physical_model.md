# Физическая модель

Таблица `offices`:

| Название               | Описание              | Тип данных     | Ограничение   |
|------------------------|-----------------------|----------------|---------------|
| `office_id`            | Идентификатор офиса   | `INTEGER`      | `PRIMARY KEY` |
| `office_company_id`    | ID компании           | `INTEGER`      | `FOREIGN KEY` |
| `office_provider_id`   | ID наймодателя        | `INTEGER`      | `FOREIGN KEY` |
| `office_center_id`     | ID бизнес-центра      | `INTEGER`      | `FOREIGN KEY` |
| `office_area`          | Площадь, м^2          | `INTEGER`      | `NOT NULL`    |
| `office_floors`        | Кол-во этажей         | `INTEGER`      |               |
| `office_rent`          | Арендуется за         | `INTEGER`      |               |
| `office_class`         | Класс офиса           | `CHAR NOT NULL CHECK (office_class IN ('A', 'B', 'C'))`         | `NOT NULL`    |

Таблица `offices_owners`:

| Название                | Описание               | Тип данных     | Ограничение   |
|-------------------------|------------------------|----------------|---------------|
| `office_own_id`         | Идентификатор офиса    | `INTEGER`      | `NOT NULL`    |
| `office_own_company_id` | Идентификатор компании | `INTEGER`      | `NOT NULL`    |
| `valid_from`            | Действует от           | `DATE`         | `NOT NULL`    |
| `valid_to`              | Действует до           | `DATE`         | `NOT NULL`    |


Таблица `buisness_centers`:

| Название         | Описание              | Тип данных     | Ограничение   |
|------------------|-----------------------|----------------|---------------|
| `center_id`      | Идентификатор центра  | `INTEGER`      | `PRIMARY KEY` |
| `center_name`    | Название              | `VARCHAR(200)` | `NOT NULL`    |
| `center_address` | Адрес                 | `VARCHAR(255)` | `NOT NULL`    |


Таблица `goods`:

| Название              | Описание              | Тип данных     | Ограничение   |
|-----------------------|-----------------------|----------------|---------------|
| `goods_name`          | Название              | `VARCHAR(200)` | `NOT NULL`    |
| `goods_id`            | ID                    | `INTEGER`      | `PRIMARY KEY` |
| `goods_warehouse_id`  | ID склада             | `INTEGER`      | `FOREIGN KEY` |
| `goods_supply_id`     | ID поставки           | `INTEGER`      | `FOREIGN KEY` |
| `goods_area`          | Занимаемая площадь    | `INTEGER`      |               |


Таблица `companies`:

| Название                | Описание              | Тип данных     | Ограничение   |
|-------------------------|-----------------------|----------------|---------------|
| `company_id`            | ID компании           | `INTEGER`      | `PRIMARY KEY` |
| `company_name`          | Название              | `VARCHAR(200)` | `NOT NULL`    |
| `company_address`       | Адрес                 | `VARCHAR(255)` |               |
| `company_type`          | Тип компании          | `VARCHAR(20)`  |               |


Таблица `employees`:

| Название                 | Описание           | Тип данных     | Ограничение   |
|--------------------------|--------------------|----------------|---------------|
| `employee_id`            | Идентификатор      | `INTEGER`      | `PRIMARY KEY` |
| `employee_name`          | Имя                | `VARCHAR(200)` | `NOT NULL`    |
| `emp_company_id`         | ID компании        | `INTEGER`      | `FOREIGN KEY` |
| `employee_post`          | Должность          | `VARCHAR(30)`  |               |
| `employee_salary`        | Зарплата           | `INTEGER`      |               |


Таблица `warehouses`:

| Название                  | Описание              | Тип данных     | Ограничение   |
|---------------------------|-----------------------|----------------|---------------|
| `warehouse_id`            | ID склада             | `INTEGER`      | `PRIMARY KEY` |
| `warehouse_name`          | Название              | `VARCHAR(200)` | `NOT NULL`    |
| `warehouse_provider_id`   | ID наймодателя        | `INTEGER`      | `FOREIGN KEY` |
| `warehouse_company_id`    | ID компании           | `INTEGER`      | `FOREIGN KEY` |
| `warehouse_address`       | Адрес                 | `VARCHAR(200)` |               |
| `warehouse_area`          | Площадь, м^2          | `INTEGER`      | `NOT NULL`    |
| `warehouse_rent`          | Арендуется за, руб.   | `INTEGER`      |               |
| `warehouse_class`         | Класс офиса           | `CHAR NOT NULL CHECK (warehouse_class IN ('A', 'B', 'C'))`         | `NOT NULL`    |
| `warehouse_weight`        | Нагрузка на пол, т    | `INTEGER`      |               |
| `warehouse_rail`          | Наличие рельс         | `BOOLEAN`      |               |
| `warehouse_temp`          | Температура           | `VARCHAR(100)` |               |

Таблица `supplies`:

| Название               | Описание           | Тип данных     | Ограничение   |
|------------------------|--------------------|----------------|---------------|
| `supply_wharehouse_id` | ID склада          | `INTEGER`      | `FOREIGN KEY` |
| `supply_id`            | ID                 | `INTEGER`      | `PRIMARY KEY` |
| `supply_name`          | Название           | `VARCHAR(200)` | `NOT NULL`    |
| `supply_created_at`    | Дата заказа        | `DATE`         | `NOT NULL`    |
| `supply_delivered_at`  | Дата доставки      | `DATE`         |               |
