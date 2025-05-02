
CREATE TABLE Country (
    id INT PRIMARY KEY,
    country_name VARCHAR(100),
    country_name_eng VARCHAR(100),
    country_code VARCHAR(10)
);

INSERT INTO Country (id, country_name, country_name_eng, country_code) VALUES
(1, 'Deutschland', 'Germany', 'DEU'),
(2, 'Srbija', 'Serbia', 'SRB'),
(3, 'Hrvatska', 'Croatia', 'HRV'),
(4, 'United States of America', 'United States of America', 'USA'),
(5, 'Polska', 'Poland', 'POL'),
(6, 'España', 'Spain', 'ESP'),
(7, 'Rossiya', 'Russia', 'RUS');


CREATE TABLE City (
    id INT PRIMARY KEY,
    city_name VARCHAR(100),
    lat DECIMAL(10,6),
    _long DECIMAL(10,6),
    country_id INT,
    FOREIGN KEY (country_id) REFERENCES Country(id)
);

INSERT INTO City (id, city_name, lat,_long, country_id) VALUES
(1, 'Berlin', 52.520008, 13.404954, 1),
(2, 'Belgrade', 44.787197, 20.457273, 2),
(3, 'Zagreb', 45.815399, 15.966568, 3),
(4, 'New York', 40.730610, -73.935242, 4),
(5, 'Los Angeles', 34.052235, -118.243683, 4),
(6, 'Warsaw', 52.237049, 21.017532, 5);

CREATE TABLE Customer (
    id INT PRIMARY KEY,
    name VARCHAR(100),
    city_id INT,
    customer_address VARCHAR(200),
    next_call_date DATE,
    ts_inserted DATETIME,
    FOREIGN KEY (city_id) REFERENCES City(id)
);

INSERT INTO Customer (id, name, city_id, customer_address, next_call_date, ts_inserted) VALUES
(1, 'Jewelry Store', 4, 'Long Street 120', '2020-01-21', '2020-01-09 14:01:20'),
(2, 'Bakery', 1, 'Kurfürstendamm 25', '2020-01-21', '2020-01-09 17:52:15'),
(3, 'Café', 1, 'Tauentzienstraße 44', '2020-01-21', '2020-01-10 08:02:49'),
(4, 'Restaurant', 3, 'Ulica Ipa 15', '2020-01-21', '2020-01-10 09:20:21');
-- 1
select co.country_name_eng as country , ci.city_name as city , cu.name as customer
from Country as co
left join City  as ci on co.id = ci.country_id
left join Customer as cu on ci.id =cu.city_id;


-- 2 
select 
co.id as country_id,co.country_name,ci.id as city_id,ci.city_name,cu.id as costomer_id,cu.name as customer_name
from country as co
inner join 
city as ci on co.id = ci.country_id
left join
customer as cu on ci.id = cu.city_id
order by co.country_name,ci.city_name,cu.name;


