create database digital_bus_pass;
USE digital_bus_pass;
CREATE TABLE user (
    user_id INT PRIMARY KEY,
    user_name VARCHAR(100) UNIQUE NOT NULL,
    user_password VARCHAR(255) UNIQUE NOT NULL,
    account_type VARCHAR(50) NOT NULL,
    user_phonenumber VARCHAR(15) UNIQUE NOT NULL,
    user_email VARCHAR(100) UNIQUE NOT NULL,
    gender VARCHAR(10) NOT NULL,
    DoB DATE NOT NULL,
    balance FLOAT
);

CREATE TABLE cart (
    cart_id INT PRIMARY KEY,
    user_id INT,
    cart_status VARCHAR(50),
    FOREIGN KEY (user_id) REFERENCES user(user_id) ON DELETE CASCADE
);

CREATE TABLE bus_pass (
    pass_id INT PRIMARY KEY,
    user_id INT,
    cart_id INT,
    pass_type VARCHAR(50),
    pass_price FLOAT,
    pass_status_date DATE,
    pass_expired_date DATE,
    pass_status VARCHAR(50),
    FOREIGN KEY (user_id) REFERENCES user(user_id) ON DELETE CASCADE,
    FOREIGN KEY (cart_id) REFERENCES cart(cart_id) ON DELETE CASCADE
);

CREATE TABLE ticket (
    ticket_id INT PRIMARY KEY,
    user_id INT,
    cart_id INT,
    ticket_type VARCHAR(50),
    ticket_price FLOAT,
    ticket_status_date DATE,
    ticket_expired_date DATE,
    ticket_status VARCHAR(50),
    FOREIGN KEY (user_id) REFERENCES user(user_id) ON DELETE CASCADE,
    FOREIGN KEY (cart_id) REFERENCES cart(cart_id) ON DELETE CASCADE
);

CREATE TABLE payment (
    payment_id INT PRIMARY KEY,
    user_id INT,
    payment_method VARCHAR(100),
    payment_date DATE,
    payment_status VARCHAR(100),
    FOREIGN KEY (user_id) REFERENCES user(user_id) ON DELETE CASCADE,
    FOREIGN KEY (payment_id) REFERENCES bus_pass(pass_id) ON DELETE CASCADE,
	FOREIGN KEY (payment_id) REFERENCES ticket(ticket_id) ON DELETE CASCADE,
    FOREIGN KEY (payment_id) REFERENCES cart(cart_id) ON DELETE CASCADE
);

-- bỏ address
CREATE TABLE bus_route (
    route_id VARCHAR(10) PRIMARY KEY, -- đổi thành varchar
    pass_id INT,
    ticket_id INT,
    route_number INT NOT NULL,
    route_name VARCHAR(100) NOT NULL,
    origin VARCHAR(100) NOT NULL,
    destination VARCHAR(100) NOT NULL,
    distance FLOAT NOT NULL,
    direction VARCHAR(20), -- thêm direction
	sequence_stop LONGTEXT, -- đổi thành longtext
    FOREIGN KEY (pass_id) REFERENCES bus_pass(pass_id) ON DELETE CASCADE,
    FOREIGN KEY (ticket_id) REFERENCES ticket(ticket_id) ON DELETE CASCADE
);

CREATE TABLE bus (
    bus_id INT PRIMARY KEY,
    route_id VARCHAR(10),
    license_plate VARCHAR(20) NOT NULL,
    model VARCHAR(50) NOT NULL,
    year INT NOT NULL,
    capacity INT NOT NULL,
    bus_status VARCHAR(50) NOT NULL,
    FOREIGN KEY (route_id) REFERENCES bus_route(route_id) ON DELETE CASCADE
);

CREATE TABLE schedule (
    schedule_id INT PRIMARY KEY, -- sai chính tả
    route_id VARCHAR(10),
    date DATE,
    direction VARCHAR(100) NOT NULL,
    start_time TIME,
    end_time TIME,
    FOREIGN KEY (route_id) REFERENCES bus_route(route_id) ON DELETE CASCADE
);