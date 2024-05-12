DROP DATABASE IF EXISTS Testing_System_Db;
CREATE DATABASE IF NOT EXISTS Testing_System_Db;
USE Testing_System_Db;

DROP TABLE IF EXISTS Department;
CREATE TABLE Department(
    DepartmentID        TINYINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    DepartmentName      NVARCHAR(50)
);

DROP TABLE IF EXISTS Pos;
CREATE TABLE Pos(
    PositionID          TINYINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    PositionName        ENUM('Dev', 'Test', 'Scrum Master', 'PM')
);

DROP TABLE IF EXISTS Account;
CREATE TABLE Account(
    AccountID           TINYINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    Email               VARCHAR(50),
    Username            VARCHAR(50),
    FullName            NVARCHAR(50),
    DepartmentID        VARCHAR(50),
    PositionID          VARCHAR(50),
    CreateDate          DATE
);

DROP TABLE IF EXISTS GroupTable;
CREATE TABLE GroupTable(
    GroupID             INT AUTO_INCREMENT PRIMARY KEY,
    GroupName           VARCHAR(50),
    CreatorID           INT,
    CreateDate          DATE
);

DROP TABLE IF EXISTS GroupAccount;
CREATE TABLE GroupAccount(
    GroupID             TINYINT UNSIGNED NOT NULL,
    AccountID           TINYINT UNSIGNED NOT NULL,
    JoinDate            DATETIME DEFAULT NOW(),
    PRIMARY KEY(GroupID, AccountID),
    FOREIGN KEY(GroupID) REFERENCES GroupTable(GroupID),
    FOREIGN KEY(AccountID) REFERENCES Account(AccountID)
);

DROP TABLE IF EXISTS TypeQuestion;
CREATE TABLE TypeQuestion(
    TypeID              INT AUTO_INCREMENT PRIMARY KEY,
    TypeName            VARCHAR(50)
);

DROP TABLE IF EXISTS CategoryQuestion;
CREATE TABLE CategoryQuestion(
    CategoryID          INT AUTO_INCREMENT PRIMARY KEY,
    CategoryName        VARCHAR(50)
);

DROP TABLE IF EXISTS Question;
CREATE TABLE Question(
    QuestionID          TINYINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    Content             VARCHAR(100),
    CategoryID          INT,
    TypeID              INT,
    CreatorID           INT,
    CreateDate          DATE
);

DROP TABLE IF EXISTS Answer;
CREATE TABLE Answer(
    AnswerID            INT AUTO_INCREMENT PRIMARY KEY,
    Content             VARCHAR(100),
    QuestionID          TINYINT UNSIGNED,
    isCorrect           BIT,
    FOREIGN KEY(QuestionID) REFERENCES Question(QuestionID)
);

DROP TABLE IF EXISTS Exam;
CREATE TABLE Exam(
    ExamID              INT AUTO_INCREMENT PRIMARY KEY,
    Code                VARCHAR(10),
    Title               VARCHAR(50),
    CategoryID          INT,
    Duration            INT,
    CreatorID           INT,
    CreateDate          DATE
);

DROP TABLE IF EXISTS ExamQuestion;
CREATE TABLE ExamQuestion(
    ExamID              INT,
    QuestionID          INT
);