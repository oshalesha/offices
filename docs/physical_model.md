# Физическая модель

Таблица `offices`:

| Название        | Описание              | Тип данных     | Ограничение   |
|-----------------|-----------------------|----------------|---------------|
| `id`            | Идентификатор офиса   | `INTEGER`      | `PRIMARY KEY` |
| `company_id`    | ID компании           | `INTEGER`      | `FOREIGN KEY` |
| `provider_id`   | ID наймодателя        | `INTEGER`      | `FOREIGN KEY` |
| `center_id`     | ID бизнес-центра      | `INTEGER`      | `FOREIGN KEY` |
| `area`          | Площадь, м^2          | `INTEGER`      | `NOT NULL`    |
| `floors`        | Кол-во этажей         | `INTEGER`      |               |
| `rent`          | Арендуется за, руб.   | `INTEGER`      |               |
| `class`         | Класс офиса           | `CHAR`         | `NOT NULL`    |


Таблица `offices_versions`:

| Название        | Описание              | Тип данных     | Ограничение   |
|-----------------|-----------------------|----------------|---------------|
| `office_id`     | Идентификатор офиса   | `INTEGER`      | `FOREIGN KEY` |
| `updated_at`    | Изменен               | `DATE`         | `NOT NULL`    |
| `history`       | История               | `VARCHAR(200)` | `NOT NULL`    |


Таблица `buisness_centers`:

| Название        | Описание              | Тип данных     | Ограничение   |
|-----------------|-----------------------|----------------|---------------|
| `id`            | Идентификатор центра  | `INTEGER`      | `PRIMARY KEY` |
| `name`          | Название              | `VARCHAR(200)` | `NOT NULL`    |
| `address`       | Адрес                 | `VARCHAR(255)` |               |


Таблица `goods`:

| Название        | Описание              | Тип данных     | Ограничение   |
|-----------------|-----------------------|----------------|---------------|
| `name`          | Название              | `VARCHAR(200)` | `NOT NULL`    |
| `id`            | ID                    | `INTEGER`      | `NOT NULL`    |
| `warehouse_id`  | ID склада             | `INTEGER`      | `FOREIGN KEY` |
| `supply_id`     | ID поставки           | `INTEGER`      | `FOREIGN KEY` |
| `area`          | Занимаемая площадь    | `INTEGER`      |               |


Таблица `companies`:

| Название        | Описание              | Тип данных     | Ограничение   |
|-----------------|-----------------------|----------------|---------------|
| `id`            | ID компании           | `INTEGER`      | `PRIMARY KEY` |
| `name`          | Название              | `VARCHAR(200)` | `NOT NULL`    |
| `address`       | Адрес                 | `VARCHAR(255)` |               |
| `type`          | Тип компании          | `VARCHAR(20)`  |               |


Таблица `employees`:

| Название        | Описание           | Тип данных     | Ограничение   |
|-----------------|--------------------|----------------|---------------|
| `id`            | Идентификатор      | `INTEGER`      | `NOT NULL`    |
| `name`          | Имя                | `VARCHAR(200)` | `NOT NULL`    |
| `company_id`    | ID компании        | `INTEGER`      | `FOREIGN KEY` |
| `post`          | Должность          | `VARCHAR(300)` |               |
| `salary`        | Зарплата, руб.     | `INTEGER`      |               |


Таблица `warehouses`:

| Название        | Описание              | Тип данных     | Ограничение   |
|-----------------|-----------------------|----------------|---------------|
| `id`            | ID склада             | `INTEGER`      | `PRIMARY KEY` |
| `name`          | Название              | `VARCHAR(200)` | `NOT NULL`    |
| `provider_id`   | ID наймодателя        | `INTEGER`      | `FOREIGN KEY` |
| `company_id`    | ID компании           | `INTEGER`      | `FOREIGN KEY` |
| `address`       | Адрес                 | `VARCHAR(20)`  |               |
| `area`          | Площадь, м^2          | `INTEGER`      | `NOT NULL`    |
| `rent`          | Арендуется за, руб.   | `INTEGER`      |               |
| `class`         | Класс офиса           | `CHAR`         | `NOT NULL`    |
| `weight`        | Нагрузка на пол, т    | `INTEGER`      |               |
| `rail`          | Наличие рельс         | `INTEGER`      |               |
| `temp`          | Температура           | `VARCHAR(100)` |               |

Таблица `supplies`:

| Название        | Описание           | Тип данных     | Ограничение   |
|-----------------|--------------------|----------------|---------------|
| `wharehouse_id` | ID склада          | `INTEGER`      | `FOREIGN KEY` |
| `id`            | ID                 | `INTEGER`      | `PRIMARY KEY` |
| `name`          | Название           | `VARCHAR(200)` | `NOT NULL`    |
| `created_at`    | Дата заказа        | `DATE`         | `NOT NULL`    |
| `delivered_at`  | Дата доставки      | `DATE`         |               |
