-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema student_enrollment_system
-- -----------------------------------------------------
-- this is a student enrollment management system
-- 

-- -----------------------------------------------------
-- Schema student_enrollment_system
--
-- this is a student enrollment management system
-- 
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `student_enrollment_system` DEFAULT CHARACTER SET utf8 COLLATE utf8_bin ;
USE `student_enrollment_system` ;

-- -----------------------------------------------------
-- Table `student_enrollment_system`.`courses`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `student_enrollment_system`.`courses` (
  `course_id` INT NOT NULL AUTO_INCREMENT,
  `course_name` VARCHAR(255) NOT NULL,
  PRIMARY KEY (`course_id`));


-- -----------------------------------------------------
-- Table `student_enrollment_system`.`phone_number`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `student_enrollment_system`.`phone_number` (
  `student_id` INT NOT NULL,
  `phone_number1`  varchar(10) NOT NULL,
  `phone_number2`  varchar(10) default null,
  PRIMARY KEY (`student_id`));


-- -----------------------------------------------------
-- Table `student_enrollment_system`.`student`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `student_enrollment_system`.`student` (
  `student_id` INT NOT NULL AUTO_INCREMENT,
  `student_name` VARCHAR(255) NOT NULL,
  `email` VARCHAR(32) NOT NULL,
  `visting_college` TIMESTAMP NULL DEFAULT CURRENT_TIMESTAMP,
  `city` VARCHAR(20) NOT NULL,
  `state` VARCHAR(20) NOT NULL,
  `country` VARCHAR(20) NOT NULL,
  `pin_code` VARCHAR(10) NOT NULL,
  PRIMARY KEY (`student_id`));


-- -----------------------------------------------------
-- Table `student_enrollment_system`.`enrollment_process`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `student_enrollment_system`.`enrollment_process` (
  `enrollment_id` INT NOT NULL AUTO_INCREMENT,
  `student_id` INT NOT NULL,
  `course_id` INT NOT NULL,
  `courses_course_id` INT NOT NULL,
  `student_student_id` INT NOT NULL,
  PRIMARY KEY (`enrollment_id`),
  INDEX `fk_enrollment_process_courses1_idx` (`courses_course_id` ASC) VISIBLE,
  INDEX `fk_enrollment_process_student1_idx` (`student_student_id` ASC) VISIBLE,
  CONSTRAINT `fk_enrollment_process_courses1`
    FOREIGN KEY (`courses_course_id`)
    REFERENCES `student_enrollment_system`.`courses` (`course_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_enrollment_process_student1`
    FOREIGN KEY (`student_student_id`)
    REFERENCES `student_enrollment_system`.`student` (`student_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
alter table phone_number drop column student_id;
alter table phone_number add column student_id int ;
alter table phone_number add constraint fk_depth foreign key (student_id) references student(student_id); 	
desc enrollment_process;	
desc courses;
insert into phone_number(phone_number1,student_id) values('7652047377',1);

insert into courses(course_id,course_name) values(2,'mca'),(3,'bba'),(4,'mba');
insert into enrollment_process(enrollment_id,student_id,course_id,courses_course_id,student_student_id) values(1,1,1,1,1);	

select phone_number1,phone_number2,student_name,email from student join phone_number p on p.student_id =(select student_id from student where student_id in (select enrollment_id from enrollment_process where enrollment_id=1));								
select student_name from student join enrollment_process e on e.course_id =(select course_id from courses where course_id=1);  							
select * from student;
insert into student(student_name, email,city, state, country, pin_code) values('mohan','123@mohn','kanpur','uttar predesh','india','20002'),('ram','123@ram','kanpur','uttar predesh','india','123');	
select * from student;	
update student set country='insia' ,country='india' where student_id=2;        
select * from enrollment_process;	     
insert into enrollment_process(student_id, course_id, courses_course_id, student_student_id)values(2,1,1,2),(3,1,1,3);	
select student_name from student inner join enrollment_process e on e.course_id =(select course_id from courses where course_id=1);  							

	