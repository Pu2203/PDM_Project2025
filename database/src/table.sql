create database Digital_Bus_Pass;

USE Digital_Bus_Pass;

CREATE TABLE User
(
  user_id INT NOT NULL,
  DoB DATE,
  user_phone_number VARCHAR(10),
  full_name VARCHAR(50),
  user_mail VARCHAR(255),
  gender VARCHAR(10),
  PRIMARY KEY (user_id)
);

CREATE TABLE BusPass
(
  pass_id INT NOT NULL,
  pass_status VARCHAR(50),
  pass_expired_date DATE,
  pass_start_date DATE,
  pass_price INT,
  PRIMARY KEY (pass_id)
);

CREATE TABLE Ticket
(
  ticket_id INT NOT NULL,
  ticket_status VARCHAR(50),
  ticket_price INT,
  ticket_status_date DATE,
  ticket_expired_date DATE,
  PRIMARY KEY (ticket_id)
);

CREATE TABLE BusRoute
(
  route_id VARCHAR(255) NOT NULL,
  pass_id INT NOT NULL,
  ticket_id INT NOT NULL,
  sequence_stop LONGTEXT,
  destination VARCHAR(255),
  route_name VARCHAR(255),
  origin VARCHAR(255),
  direction VARCHAR(20),
  PRIMARY KEY (route_id),
  FOREIGN KEY (pass_id) REFERENCES BusPass(pass_id),
  FOREIGN KEY (ticket_id) REFERENCES Ticket(ticket_id)
);

CREATE TABLE Schedule
(
  schedule_id INT NOT NULL,
  route_id VARCHAR(255) NOT NULL,
  direction VARCHAR(20),
  date DATE,
  start_time TIME,
  end_time TIME,
  PRIMARY KEY (schedule_id),
  FOREIGN KEY (route_id) REFERENCES BusRoute(route_id)
);

CREATE TABLE Account
(
  account_id INT NOT NULL,
  user_id INT NOT NULL,
  pass_id INT NOT NULL,
  balance INT,
  account_type VARCHAR(255),
  username VARCHAR(50),
  password VARCHAR(255),
  PRIMARY KEY (account_id),
  FOREIGN KEY (user_id) REFERENCES User(user_id),
  FOREIGN KEY (pass_id) REFERENCES BusPass(pass_id)
);

CREATE TABLE Payment
(
  payment_id INT NOT NULL,
  account_id INT NOT NULL,
  ticket_id INT NOT NULL,
  pass_id INT NOT NULL,
  payment_date DATE,
  payment_method VARCHAR(255),
  payment_status VARCHAR(255),
  PRIMARY KEY (payment_id),
  FOREIGN KEY (account_id) REFERENCES Account(account_id),
  FOREIGN KEY (ticket_id) REFERENCES Ticket(ticket_id),
  FOREIGN KEY (pass_id) REFERENCES BusPass(pass_id)
);

CREATE TABLE AccountTicket
(
  account_ticket_id INT NOT NULL,
  account_id INT NOT NULL,
  ticket_id INT NOT NULL,
  PRIMARY KEY (account_ticket_id),
  FOREIGN KEY (account_id) REFERENCES Account(account_id),
  FOREIGN KEY (ticket_id) REFERENCES Ticket(ticket_id)
);

CREATE TABLE Cart
(
  cart_id INT NOT NULL,
  payment_id INT NOT NULL,
  account_id INT NOT NULL,
  cart_status VARCHAR(255),
  PRIMARY KEY (cart_id),
  FOREIGN KEY (payment_id) REFERENCES Payment(payment_id),
  FOREIGN KEY (account_id) REFERENCES Account(account_id)
);

CREATE TABLE Bus
(
	bus_id INT NOT NULL,
	route_id VARCHAR(255) NOT NULL,
	capacity INT NOT NULL,
	year INT,
	model VARCHAR(255),
	license_plate VARCHAR(255),
	bus_status VARCHAR(255),
	PRIMARY KEY (bus_id),
	FOREIGN KEY (route_id) REFERENCES BusRoute(route_id)
);