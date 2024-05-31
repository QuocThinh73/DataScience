DROP DATABASE IF EXISTS Testing_System_Db;
CREATE DATABASE IF NOT EXISTS Testing_System_Db;
USE Testing_System_Db;

DROP TABLE IF EXISTS Department;
CREATE TABLE Department(
    DepartmentID        TINYINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    DepartmentName      NVARCHAR(50)
);

DROP TABLE IF EXISTS `Position`;
CREATE TABLE `Position`(
    PositionID          TINYINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    PositionName        ENUM('Dev', 'Test', 'Scrum Master', 'PM')
);

DROP TABLE IF EXISTS `Account`;
CREATE TABLE `Account`(
    AccountID           TINYINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    Email               VARCHAR(50),
    Username            VARCHAR(50),
    FullName            NVARCHAR(50),
    DepartmentID        TINYINT UNSIGNED NOT NULL,
    PositionID          TINYINT UNSIGNED NOT NULL,
    CreateDate          DATETIME DEFAULT NOW(),
    FOREIGN KEY(DepartmentID) REFERENCES Department(DepartmentID),
    FOREIGN KEY(PositionID) REFERENCES `Position`(PositionID)
);

DROP TABLE IF EXISTS `Group`;
CREATE TABLE `Group`(
    GroupID             TINYINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    GroupName           VARCHAR(50),
    CreatorID           TINYINT UNSIGNED NOT NULL,
    CreateDate          DATETIME DEFAULT NOW(),
    FOREIGN KEY(CreatorID) REFERENCES `Account`(AccountID)
);

DROP TABLE IF EXISTS GroupAccount;
CREATE TABLE GroupAccount(
    GroupID             TINYINT UNSIGNED NOT NULL,
    AccountID           TINYINT UNSIGNED NOT NULL,
    JoinDate            DATETIME DEFAULT NOW(),
    PRIMARY KEY(GroupID, AccountID),
    FOREIGN KEY(GroupID) REFERENCES `Group`(GroupID),
    FOREIGN KEY(AccountID) REFERENCES `Account`(AccountID)
);

DROP TABLE IF EXISTS TypeQuestion;
CREATE TABLE TypeQuestion(
    TypeID              TINYINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    TypeName            ENUM('Essay', 'Multiple-Choice')
);

DROP TABLE IF EXISTS CategoryQuestion;
CREATE TABLE CategoryQuestion(
    CategoryID          TINYINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    CategoryName        ENUM('Java', '.NET', 'SQL', 'Postman', 'Ruby', '...')
);

DROP TABLE IF EXISTS Question;
CREATE TABLE Question(
    QuestionID          TINYINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    `Content`           NVARCHAR(100),
    CategoryID          TINYINT UNSIGNED NOT NULL,
    TypeID              TINYINT UNSIGNED NOT NULL,
    CreatorID           TINYINT UNSIGNED NOT NULL,
    CreateDate          DATETIME DEFAULT NOW(),
    FOREIGN KEY(CategoryID) REFERENCES CategoryQuestion(CategoryID),
    FOREIGN KEY(TypeID) REFERENCES TypeQuestion(TypeID),
    FOREIGN KEY(CreatorID) REFERENCES `Account`(AccountID)
);

DROP TABLE IF EXISTS Answer;
CREATE TABLE Answer(
    AnswerID            INT AUTO_INCREMENT PRIMARY KEY,
    `Content`             NVARCHAR(100),
    QuestionID          TINYINT UNSIGNED NOT NULL,
    isCorrect           BIT,
    FOREIGN KEY(QuestionID) REFERENCES Question(QuestionID)
);

DROP TABLE IF EXISTS Exam;
CREATE TABLE Exam(
    ExamID              TINYINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    `Code`              VARCHAR(10),
    Title               NVARCHAR(50),
    CategoryID          TINYINT UNSIGNED NOT NULL,
    Duration            INT,
    CreatorID           TINYINT UNSIGNED NOT NULL,
    CreateDate          DATETIME DEFAULT NOW(),
    FOREIGN KEY(CategoryID) REFERENCES CategoryQuestion(CategoryID),
    FOREIGN KEY(CreatorID) REFERENCES `Account`(AccountID)
);

DROP TABLE IF EXISTS ExamQuestion;
CREATE TABLE ExamQuestion(
    ExamID              TINYINT UNSIGNED NOT NULL,
    QuestionID          TINYINT UNSIGNED NOT NULL,
    PRIMARY KEY(ExamID, QuestionID),
    FOREIGN KEY(ExamID) REFERENCES Exam(ExamID),
    FOREIGN KEY(QuestionID) REFERENCES Question(QuestionID)
);

DELETE FROM Department;
INSERT INTO Department  (DepartmentID   , DepartmentName)
VALUES                  (1              , N'Marketing'  ),
                        (2              , N'Sale'       ),
                        (3              , N'Bảo vệ'     ),
                        (4              , N'Nhân sự'    ),
                        (5              , N'Kỹ thuật'   ),
                        (6              , N'Tài chính'  ),
                        (7              , N'Thư kí'     );

DELETE FROM `Position`;
INSERT INTO `Position`  (PositionID , PositionName  )
VALUES                  (1          , 'Dev'         ),
                        (2          , 'Test'        ),
                        (3          , 'Scrum Master'),
                        (4          , 'PM'          );

DELETE FROM `Account`;
INSERT INTO `Account`   (AccountID  , Email                     , Username      , FullName          , DepartmentID  , PositionID    )
VALUES                  (1          , 'account1@gmail.com'      , 'account1'    , N'Uzumaki Naruto' , 3             , 2             ),
                        (2          , 'account2@gmail.com'      , 'account2'    , N'Uchiha Sasuke'  , 2             , 3             ),
                        (3          , 'account3@gmail.com'      , 'account3'    , N'Rock Lee'       , 3             , 1             ),
                        (4          , 'account4@gmail.com'      , 'account4'    , N'Haruno Sakura'  , 1             , 1             ),
                        (5          , 'account5@gmail.com'      , 'account5'    , N'Hatake Kakashi' , 5             , 3             ),
                        (6          , 'account6@gmail.com'      , 'account6'    , N'Uchiha Itachi'  , 6             , 4             ),
                        (7          , 'account7@gmail.com'      , 'account7'    , N'Yuhi Kurenai'   , 5             , 3             ),
                        (8          , 'account8@gmail.com'      , 'account8'    , N'Hyaga Hinata'   , 5             , 3             ),
                        (9          , 'account9@gmail.com'      , 'account9'    , N'Aburame Shino'  , 4             , 4             ),
                        (10         , 'account10@gmail.com'     , 'account10'   , N'Inuzuka Kiba'   , 1             , 4             ),
                        (11         , 'account11@gmail.com'     , 'account11'   , N'Sarutobi Asuma' , 2             , 1             ),
                        (12         , 'account12@gmail.com'     , 'account12'   , N'Akimichi Choji' , 2             , 3             ),
                        (13         , 'account13@gmail.com'     , 'account13'   , N'Yamanaka Ino'   , 3             , 2             ),
                        (14         , 'account14@gmail.com'     , 'account14'   , N'Might Guy'      , 6             , 2             ),
                        (15         , 'account15@gmail.com'     , 'account15'   , N'Hyuga Neji'     , 7             , 1             ),
                        (16         , 'account16@gmail.com'     , 'account16'   , N'Tenten'          , 3             , 2             ),
                        (17         , 'account17@gmail.com'     , 'account17'   , N'Nara Shikamaru' , 5             , 3             ),
                        (18         , 'account18@gmail.com'     , 'account18'   , N'Yahiko'         , 6             , 1             ),
                        (19         , 'account19@gmail.com'     , 'account19'   , N'Dahiko'         , 3             , 2             );

DELETE FROM `Group`;
INSERT INTO `Group` (GroupID    , GroupName     , CreatorID , CreateDate    )
VALUES              (1          , N'Đội 7'      , 5         , '2019-03-01'  ),
                    (2          , N'Đội 8'      , 7         , '2020-03-01'  ),
                    (3          , N'Đội 10'     , 11        , '2019-05-01'  ),
                    (4          , N'Akatsuki'   , 18        , '2019-01-01'  ),
                    (5          , N'Taka'       , 2         , '2018-07-09'  );
DELETE FROM GroupAccount;
INSERT INTO GroupAccount    (GroupID    , AccountID )
VALUES                      (1          , 5         ),
                            (2          , 7         ),
                            (3          , 11        ),
                            (4          , 18        ),
                            (5          , 2         ),
                            (1          , 1         ),
                            (1          , 2         ),
                            (1          , 4         ),
                            (2          , 8         ),
                            (2          , 9         ),
                            (2          , 10        ),
                            (3          , 12        ),
                            (3          , 13        ),
                            (3          , 17        ),
                            (4          , 6         );

DELETE FROM TypeQuestion;
INSERT INTO TypeQuestion    (TypeID , TypeName          )
VALUES                      (1      , 'Essay'           ),
                            (2      , 'Multiple-Choice' );

DELETE FROM CategoryQuestion;
INSERT INTO CategoryQuestion    (CategoryID , CategoryName  )
VALUES                          (1          , 'Java'        ),
                                (2          , '.NET'        ),
                                (3          , 'SQL'         ),
                                (4          , 'Postman'     ),
                                (5          , 'Ruby'        ),
                                (6          , '...'         );

DELETE FROM Question;
INSERT INTO Question    (QuestionID , `Content`                                         , CategoryID    , TypeID    , CreatorID )
VALUES                  (1          , N'Tìm x biết x + 3 = 2^3'                         , 1             , 2         , 3         ),
                        (2          , N'Tìm x biết x - 3 = 99'                          , 3             , 1         , 17        ),
                        (3          , N'Tìm x biết x^2 - 3x + 2 = 12'                   , 2             , 2         , 11        ),
                        (4          , N'Tính diện tích hình tròn có bán kính r = 11cm'  , 6             , 1         , 8         ),
                        (5          , N'Tính chu vi hình tròn có đường kính bằng 13cm'  , 5             , 2         , 3         );

DELETE FROM Answer;
INSERT INTO Answer  (AnswerID   , `Content`                 , QuestionID    , isCorrect     )
VALUES              (1          , N'x = 5'                  , 1             , 1             ),
                    (2          , N'x = 3'                  , 1             , 0             ),
                    (3          , N'x = 102'                , 2             , 1             ),
                    (4          , N'x = 2 và x = 1'         , 3             , 1             ),
                    (5          , N'x = -2 và x = -1'       , 3             , 0             ),
                    (6          , N'S = 102 cm^2'           , 4             , 0             ),
                    (7          , N'P = 13picm'             , 5             , 1             ),
                    (8          , N'Không biết làm'         , 5             , 0             ),
                    (9          , N'Lạc đề'                 , 5             , 0             ),
                    (10         , N'Vẽ bậy'                 , 5             , 0             ),
                    (11         , N'Đáp án sai'             , 5             , 0             ),
                    (12         , N'x = -1'                 , 3             , 0             );

DELETE FROM Exam;
INSERT INTO Exam    (ExamID , `Code`    , Title             , CategoryID    , Duration  , CreatorID , CreateDate    )
VALUES              (1      , 'E101'    , N'Kì thi số 1'    , 1             , 90        , 3         , '2018-12-12'  ),
                    (2      , 'E101'    , N'Kì thi số 2'    , 2             , 45        , 14        , '2019-12-21'  ),
                    (3      , 'E101'    , N'Kì thi số 3'    , 3             , 180       , 10        , '2019-12-09'  ),
                    (4      , 'E101'    , N'Kì thi số 4'    , 4             , 90        , 5         , '2019-12-21'  ),
                    (5      , 'E101'    , N'Kì thi số 5'    , 5             , 75        , 3         , '2019-12-19'  ),
                    (6      , 'E101'    , N'Kì thi số 6'    , 6             , 15        , 1         , '2020-05-05'  );

DELETE FROM ExamQuestion;
INSERT INTO ExamQuestion    (ExamID , QuestionID    )
VALUES                      (1      , 1             ),
                            (1      , 2             ),
                            (2      , 1             ),
                            (2      , 5             ),
                            (3      , 2             ),
                            (3      , 4             ),
                            (3      , 5             ),
                            (4      , 1             ),
                            (5      , 3             ),
                            (6      , 3             );