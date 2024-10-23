-- learnning Management System data base designed by: Mohamed Essam Saeid <m-essam-s> <sir.m.essam.s.g@gmail.com>

Drop Database if exists LMS;
Create Database LMS;
Use LMS;

CREATE TABLE Student (
  Student_ID varchar(7) NOT NULL,
  Student_Name varchar(20) NOT NULL,
  Student_Email varchar(20) NOT NULL,
  Student_Password varchar(20) NOT NULL,
  Student_Phone varchar(20) NOT NULL,
  Student_Address varchar(20) NOT NULL,
  PRIMARY KEY (Student_ID)
);

CREATE TABLE Instructor (
  Instructor_ID varchar(7) NOT NULL,
  Instructor_Name varchar(20) NOT NULL,
  Instructor_Email varchar(20) NOT NULL,
  Instructor_Password varchar(20) NOT NULL,
  Instructor_Phone varchar(20) NOT NULL,
  Instructor_Address varchar(20) NOT NULL,
  PRIMARY KEY (Instructor_ID)
);

CREATE TABLE Field (
  Field_ID varchar(7) NOT NULL,
  Field_Name varchar(20) NOT NULL,
  PRIMARY KEY (Field_ID)
);

CREATE TABLE Program (
  Program_ID varchar(7) NOT NULL,
  Program_Name varchar(20) NOT NULL,
  Field_ID varchar(7) NOT NULL,
  PRIMARY KEY (Program_ID),
  FOREIGN KEY (Field_ID) REFERENCES Field(Field_ID)
);

CREATE TABLE Course (
  Course_ID varchar(7) NOT NULL,
  Course_Name varchar(20) NOT NULL,
  Program_ID varchar(7) NOT NULL,
  Course_Syllabus varchar(1000) NOT NULL,
  Course_Credit INT NOT NULL,
  PRIMARY KEY (Course_ID),
  FOREIGN KEY (Program_ID) REFERENCES Program(Program_ID)
);

CREATE TABLE Semester (
  Semester_ID varchar(7) NOT NULL,
  Semester_Name varchar(20) NOT NULL,
  Semester_Description varchar(1000) NOT NULL,
  Semester_Start_Date DATE NOT NULL,
  Semester_End_Date DATE NOT NULL,
  PRIMARY KEY (Semester_ID)
);

CREATE TABLE Course_Per_Semester (
  Course_ID varchar(7) NOT NULL,
  Semester_ID varchar(7) NOT NULL,
  PRIMARY KEY (Course_ID, Semester_ID),
  FOREIGN KEY (Course_ID) REFERENCES Course(Course_ID),
  FOREIGN KEY (Semester_ID) REFERENCES Semester(Semester_ID)
);

CREATE TABLE Instructor_Per_Course (
  Course_ID varchar(7) NOT NULL,
  Semester_ID varchar(7) NOT NULL,
  Instructor_ID varchar(7) NOT NULL,
  PRIMARY KEY (Instructor_ID, Course_ID),
  FOREIGN KEY (Instructor_ID) REFERENCES Instructor(Instructor_ID),
  FOREIGN KEY (Course_ID) REFERENCES Course_Per_Semester(Course_ID)
);



CREATE TABLE Enrollment (
  Course_ID varchar(7) NOT NULL,
  Student_ID varchar(7) NOT NULL,
  Semester_ID varchar(7) NOT NULL,
  Enrollment_Date DATE NOT NULL,
  PRIMARY KEY (Course_ID, Student_ID),
  FOREIGN KEY (Course_ID) REFERENCES Course_Per_Semester(Course_ID),
  FOREIGN KEY (Student_ID) REFERENCES Student(Student_ID)
);

CREATE TABLE Classes (
  Class_ID varchar(7) NOT NULL,
  Course_ID varchar(7) NOT NULL,
  Semester_ID varchar(7) NOT NULL,
  Instructor_ID varchar(7) NOT NULL,
  Class_Title varchar(20) NOT NULL,
  Class_Date DATE NOT NULL,
  Class_Start_Time TIME NOT NULL,
  Class_End_Time TIME NOT NULL,
  Class_Location varchar(20) NOT NULL,
  PRIMARY KEY (Class_ID, Course_ID, Semester_ID, Instructor_ID),
  FOREIGN KEY (Course_ID) REFERENCES Course_Per_Semester(Course_ID),
  FOREIGN KEY (Instructor_ID) REFERENCES Instructor(Instructor_ID)
);

CREATE TABLE Attendance (
  Class_ID varchar(7) NOT NULL,
  Course_ID varchar(7) NOT NULL,
  Semester_ID varchar(7) NOT NULL,
  Student_ID varchar(7) NOT NULL,
  Attendance_Date DATE NOT NULL,
  Attendance_Status varchar(20) NOT NULL,
  PRIMARY KEY (Class_ID, Course_ID, Semester_ID, Student_ID),
  FOREIGN KEY (Class_ID) REFERENCES Classes(Class_ID),
  FOREIGN KEY (Student_ID) REFERENCES Student(Student_ID)
);

CREATE TABLE Tests (
  Test_ID varchar(7) NOT NULL,
  Course_ID varchar(7) NOT NULL,
  Semester_ID varchar(7) NOT NULL,
  Test_Title varchar(20) NOT NULL,
  Test_Description varchar(1000) NOT NULL,
  Test_Date DATE NOT NULL,
  PRIMARY KEY (Test_ID, Course_ID, Semester_ID),
  FOREIGN KEY (Course_ID) REFERENCES Course_Per_Semester (Course_ID)
);

CREATE TABLE Test_Grade (
  Test_ID varchar(7) NOT NULL,
  Course_ID varchar(7) NOT NULL,
  Semester_ID varchar(7) NOT NULL,
  Student_ID varchar(7) NOT NULL,
  Test_Grade DECIMAL(5,2) NOT NULL,
  PRIMARY KEY (Test_ID, Course_ID, Semester_ID, Student_ID),
  FOREIGN KEY (Test_ID) REFERENCES Tests(Test_ID),
  FOREIGN KEY (Student_ID) REFERENCES Student(Student_ID)
);


CREATE TABLE Course_Grade_History (
  Course_ID varchar(7) NOT NULL,
  Semester_ID varchar(7) NOT NULL,
  Student_ID varchar(7) NOT NULL,
  Course_Grade DECIMAL(5,2) NOT NULL,
  PRIMARY KEY (Course_ID, Semester_ID, Student_ID),
  FOREIGN KEY (Student_ID) REFERENCES Student(Student_ID)
);

