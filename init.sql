-- Table for order.csv
CREATE TABLE orders (
    order_id INT PRIMARY KEY,
    customer_id INT,
    trip_id INT,
    price_eur VARCHAR(10),
    seat_no VARCHAR(5),
    status VARCHAR(25)

);

-- Table for trip.csv
CREATE TABLE trip (
    trip_id INT PRIMARY KEY,
    origin_city VARCHAR(50),
    destination_city VARCHAR(50),
    airplane_id INT,
    start_time TIMESTAMP,
    end_time TIMESTAMP
);

-- Table for aeroplane.csv
CREATE TABLE aeroplane (
    airplane_id INT PRIMARY KEY,
    airplane_model VARCHAR(100),
    manufacturer VARCHAR(100)
);

-- Table for customer_group.csv
CREATE TABLE customer_group (
    id INT PRIMARY KEY,
    type VARCHAR(50),
    name VARCHAR(200),
    registry_no VARCHAR(100)
);

-- Table for customer.csv
CREATE TABLE customer (
    customer_id INT PRIMARY KEY,
    name VARCHAR(100),
    customer_group_id int,
    email VARCHAR(100),
    phone VARCHAR(100)
);

-- Table for aeroplane_model.json
CREATE TABLE aeroplane_model (data JSONB);



