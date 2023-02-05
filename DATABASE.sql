CREATE TABLE PATIENT (
	patient_id int PRIMARY KEY ,
	firstNname varchar(10),
    lastNname varchar(10) NOT NULL,
	fullName nvarchar(20),
	nationalid char(11),
    gender bit,
    phone_no varchar(11),
    addres varchar(MAX),
    age int
    );

CREATE TABLE STAFF (
	employee_id int PRIMARY KEY,
	salary float(10),
	department_id varchar(45),
	firstName varchar(45),
    lastName varchar(45) NOT NULL,
    phone_no varchar(11),
	addres varchar(MAX),
	age int,
	gender bit,
	position varchar(10),
    );
    
CREATE TABLE DEPARTMENT (
	department_id varchar(45) PRIMARY KEY,
    head_doctor varchar(45),
    );    

CREATE TABLE DOCTOR (
	doctor_id varchar(45) PRIMARY KEY,
    employee_id int,
    department_id varchar(45),
	firstNname varchar(10),
    lastName varchar(10) NOT NULL,
	fullName nvarchar(20),
	nationalid char(11),
    gender bit,
    phone_no varchar(11),
    addres varchar(MAX),
    age int
    
    CONSTRAINT doctor_fk1 FOREIGN KEY(employee_id) REFERENCES STAFF(employee_id),
    CONSTRAINT doctor_fk2 FOREIGN KEY(department_id) REFERENCES DEPARTMENT(department_id)
    );    

CREATE TABLE ROOM (
	room_no int NOT NULL ,
    department_id varchar(45),
    levell char,    
    avaliable char,
    
    PRIMARY KEY (room_no),
    CONSTRAINT room_fk FOREIGN KEY(department_id) REFERENCES DEPARTMENT(department_id)
    );
    
CREATE TABLE APPOINTMENT (
	appointment_id int NOT NULL ,
    doctor_id varchar(45),
    patient_id int,
    room int,
    date_and_time datetime,
    
    PRIMARY KEY (appointment_id),
    CONSTRAINT appintment_fk1 FOREIGN KEY(patient_id) REFERENCES PATIENT(patient_id),
    CONSTRAINT appintment_fk2 FOREIGN KEY(room) REFERENCES ROOM(room_no),
    CONSTRAINT appintment_fk3 FOREIGN KEY(doctor_id) REFERENCES DOCTOR(doctor_id)
    );


CREATE TABLE MEDICATION (
	medication_id varchar(45) PRIMARY KEY,
    med_description varchar(45),
    );