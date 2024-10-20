create database InstructorDB
use InstructorDB

CREATE TABLE Instructor (
    ID INT PRIMARY KEY,
    Name VARCHAR(255),
    Salary INT,
    OverTime INT,
    BD DATE,
    First VARCHAR(255),
    Last VARCHAR(255),
    hiredate DATE DEFAULT GETDATE(),
    Address VARCHAR(255),
    Age AS (YEAR(GETDATE()) - YEAR(BD)),
    NetSalary AS (Salary + OverTime)
);
CREATE TABLE Course (
    CID INT PRIMARY KEY,
    CName VARCHAR(255),
    Duration INT
);
CREATE TABLE Lab (
    LID INT PRIMARY KEY,
    Location VARCHAR(255),
    Capacity INT CHECK (Capacity <= 20)
);
CREATE TABLE Teach (
    InstructorID INT,
    CourseID INT,
    PRIMARY KEY (InstructorID, CourseID),
    FOREIGN KEY (InstructorID) REFERENCES Instructor(ID) ON DELETE CASCADE,
    FOREIGN KEY (CourseID) REFERENCES Course(CID) ON DELETE CASCADE
);
CREATE TABLE Has (
    CourseID INT,
    LabID INT,
    PRIMARY KEY (CourseID, LabID),
    FOREIGN KEY (CourseID) REFERENCES Course(CID) ON DELETE CASCADE,
    FOREIGN KEY (LabID) REFERENCES Lab(LID) ON DELETE CASCADE
);
ALTER TABLE Instructor
ADD CONSTRAINT CK_Salary CHECK (Salary BETWEEN 1000 AND 5000);
ALTER TABLE Instructor
ADD CONSTRAINT UQ_OverTime UNIQUE (OverTime);
ALTER TABLE Course
ADD CONSTRAINT UQ_Duration UNIQUE (Duration);

