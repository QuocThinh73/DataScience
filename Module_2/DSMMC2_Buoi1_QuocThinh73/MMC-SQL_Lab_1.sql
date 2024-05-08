CREATE DATABASE Testing_System_Db;
USE Testing_System_Db;

CREATE TABLE Department(
    DepartmentID        INT AUTO_INCREMENT PRIMARY KEY,
    DepartmentName      VARCHAR(50)
);

CREATE TABLE Pos(
    PositionID          INT AUTO_INCREMENT PRIMARY KEY,
    PositionName        VARCHAR(50)
);

CREATE TABLE Account(
    AccountID           INT AUTO_INCREMENT PRIMARY KEY,
    Email               VARCHAR(50),
    Username            VARCHAR(50),
    FullName            VARCHAR(50),
    DepartmentID        VARCHAR(50),
    PositionID          VARCHAR(50),
    CreateDate          DATE
);

CREATE TABLE GroupGroup(
    GroupID             INT AUTO_INCREMENT PRIMARY KEY,
    GroupName           VARCHAR(50),
    CreatorID           INT,
    CreateDate          DATE
);

CREATE TABLE GroupAccount(
    GroupID             INT AUTO_INCREMENT PRIMARY KEY,
    AccountID           INT,
    JoinDate            DATE
);

CREATE TABLE TypeQuestion(
    TypeID              INT AUTO_INCREMENT PRIMARY KEY,
    TypeName            VARCHAR(50)
);

CREATE TABLE CategoryQuestion(
    CategoryID          INT AUTO_INCREMENT PRIMARY KEY,
    CategoryName        VARCHAR(50)
);

CREATE TABLE Question(
    QuestionID          INT AUTO_INCREMENT PRIMARY KEY,
    Content             VARCHAR(100),
    CategoryID          INT,
    TypeID              INT,
    CreatorID           INT,
    CreateDate          DATE
);

CREATE TABLE Answer(
    AnswerID            INT AUTO_INCREMENT PRIMARY KEY,
    Content             VARCHAR(100),
    QuestionID          INT,
    isCorrect           BOOL
);

CREATE TABLE Exam(
    ExamID              INT AUTO_INCREMENT PRIMARY KEY,
    Code                VARCHAR(10),
    Title               VARCHAR(50),
    CategoryID          INT,
    Duration            INT,
    CreatorID           INT,
    CreateDate          DATE
);

CREATE TABLE ExamQuestion(
    ExamID              INT,
    QuestionID          INT
);