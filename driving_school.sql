create database if not exists driving_school;
use driving_school;

SET FOREIGN_KEY_CHECKS=0;
DROP TABLE IF EXISTS coaches;
CREATE TABLE coaches (
    id int,
    first_name varchar(50),
    last_name varchar(50),
    salary real,
    PRIMARY KEY(id)
);

DROP TABLE IF EXISTS car_types;
CREATE TABLE car_types (
    type_name VARCHAR(10),
    PRIMARY KEY(type_name)
);

INSERT INTO car_types (type_name) VALUES 
('A1'), 
('A2'), 
('B'), 
('B-Auto'), 
('C'), 
('D1'), 
('D1-Auto'), 
('D2'), 
('D2-Auto'), 
('E+C');

DROP TABLE IF EXISTS coach_car_types;
CREATE TABLE coach_car_types (
    coach_id INT,
    car_type varchar(10),
    PRIMARY KEY(coach_id, car_type),
    FOREIGN KEY(coach_id) REFERENCES coaches(id),
    FOREIGN KEY(car_type) REFERENCES car_types(type_name)
);

DROP TABLE IF EXISTS vehichles;
CREATE TABLE vehichles (
    license_plate varchar(8),
    car_type varchar(10),
    brand varchar(24),
    model varchar(24),
    status varchar(8), -- normal, broken
    PRIMARY KEY(license_plate),
    FOREIGN KEY(car_type) REFERENCES car_types(type_name)
);

DROP TABLE IF EXISTS  student;
CREATE TABLE student (
    id int,
    first_name varchar(50),
    last_name varchar(50),
    train_hours real,
    primary key(id)
);

DROP TABLE IF EXISTS offices;
CREATE TABLE offices (
    id int,
    address_line1 varchar(99),
    address_line2 varchar(99),
    address_line3 varchar(99)
);

DROP TABLE IF EXISTS registrations;
CREATE TABLE registrations (
    student_id int,
    license_type varchar(10),
    primary key(student_id, license_type),
    foreign key(student_id) references student (id)
);

DROP TABLE IF EXISTS license_car;
CREATE TABLE license_car (
    license_type varchar(10),
    car_type varchar(10),
    primary key(license_type)
);

DROP TABLE IF EXISTS theory_test_schedule;
CREATE TABLE theory_test_schedule(
	day date,
    start_time time,
    student_id int,
    primary key(day, start_time, student_id),
    foreign key(student_id) references student (id)
    );

DROP TABLE IF EXISTS train_schedule;
CREATE TABLE train_schedule (
    `date` date,
    start_time time,
    duration time,
    student_id int,
    coach_id int,
    car varchar(8),
    primary key(`date`, start_time, student_id),
    foreign key(student_id) references student (id),
    foreign key(coach_id) references coaches (id),
    foreign key(car) references vehichles (license_plate)
);

DROP TABLE IF EXISTS driving_test_schedule;
CREATE TABLE driving_test_schedule (
    -- no theory no this
    `date` date,
    start_time time,
    student_id int,
    status varchar(8),
    primary key(`date`, start_time, student_id),
    foreign key(student_id) references student (id)
);
show tables
