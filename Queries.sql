select salary as 'dolar',fullName, salary*44 as 'toman'
from STAFF

SELECT levell, COUNT(r.avaliable) FROM room r WHERE avaliable = 'true' GROUP BY r.levell

select date_and_time,year(date_and_time) as 'year',day(date_and_time) as 'day'
from APPOINTMENT

SELECT levell, COUNT(r.avaliable) FROM room r WHERE avaliable = 'true' GROUP BY r.levell

select *
from PATIENT

 select fullName,position
 from STAFF

 select distinct doctor_id
 from APPOINTMENT

 select top 5 med_description
 from MEDICATION


 select firstName,position
 from STAFF
 where position='Nurse' and 
 salary>=205.0000

 --نام کارکنانی که پرستار هستند و در اسمشان n یا a دارند
  select firstName,position
 from STAFF
 where position='Nurse' and 
 FirstName like '%n%' or FirstName like '%a%'

 --کارکنانی که پزشک نیستند
 SELECT * 
 FROM STAFF
 WHERE employee_id NOT IN (SELECT employee_id FROM DOCTOR);

 --میانگین حقوق کارکنان به تفکیک شغل از کم به زیاد
 select avg(salary) as 'average salary',position
 from STAFF 
 group by position
 order by avg(salary) asc

 ----بیمارانی که بستری نشدند
 select patient_id,room_no
 from APPOINTMENT
 where room_no is null

 --لیست بیماران به ترتیب سن
 select fullName,patient_id,age
 from PATIENT
 order by age asc
  
  ----جوین دکتر آی دی و دپارتمان آن در جدول دپارتمان
  select DOCTOR.doctor_id ,DEPARTMENT.department_id
  from DOCTOR
  inner join DEPARTMENT
  on DOCTOR.department_id=DEPARTMENT.department_id
 
 select DOCTOR.doctor_id, APPOINTMENT.appointment_id
 from DOCTOR
 full  join APPOINTMENT
 on DOCTOR.doctor_id=APPOINTMENT.appointment_id

 --منصفانه بودن حقوق کارکنان
 select salary,employee_id,
 case 
 when salary>205.0000 then 'Fair'
 WHEN salary<205.0000 then 'unfair'
 else 'others'
 END as 'isFair?'
 from STAFF

SELECT doctor.fullName, patient.fullName
FROM doctor
left  JOIN patient ON doctor.fullName = patient.fullName;

--پراسیجر نمایش 20 تا بیمار آخیر 
CREATE PROCEDURE show_last20_appoitmnets
AS
select top 20 patient_id,date_and_time,doctor_id
from APPOINTMENT
GO;
EXEC show_last20_appoitmnets


--اتاق های واقع در طبقه 5
select room_no,levell
from ROOM
where levell='5'

--view level
CREATE VIEW available_room_in_each_level AS
SELECT levell,room_no
FROM ROOM
WHERE avaliable = 'true'
order by levell asc


UPDATE APPOINTMENT
SET room_no = '62806'
WHERE patient_id='5445734188'             


select fullName,age
from PATIENT
where age<20

--CREATE DATABASE HOTELDB

CREATE TABLE ROOMTYPE (
RoomType VARCHAR(10) PRIMARY KEY ,
BasePrice DECIMAL(5,2) NOT NULL,
)

--DROP TABLE ROOMTYPE;

ALTER TABLE ROOMTYPE
ADD ExtraPersonFee DECIMAL(5,2) NOT NULL,


CREATE TABLE Persons (
    ID int NOT NULL UNIQUE,
    LastName varchar(255) NOT NULL,
    FirstName varchar(255),
    Age int
);

CREATE TABLE Orders (
    OrderID int NOT NULL,
    OrderNumber int NOT NULL,
    PersonID int,
    PRIMARY KEY (OrderID),
    FOREIGN KEY (PersonID) REFERENCES Persons(PersonID)
);
