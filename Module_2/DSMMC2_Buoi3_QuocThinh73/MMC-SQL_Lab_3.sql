USE Testing_System_Db;

# Question 2
SELECT  *
FROM    Department;

# Question 3
SELECT  *
FROM    Department
WHERE   DepartmentName = N'Sale';

# Question 4
SELECT  *
FROM    `Account`
WHERE   LENGTH(FullName) = (SELECT  MAX(LENGTH(FullName)) 
                            FROM    `Account`);

# Question 5
SELECT  *
FROM    `Account`
WHERE   LENGTH(FullName) = (SELECT  MAX(LENGTH(FullName)) 
                            FROM    `Account`)
AND     `DepartmentID` = 3;

# Question 6
SELECT  *
FROM    `Group`
WHERE   CreateDate < '2019-12-20';

# Question 7
SELECT      COUNT(AnswerID), QuestionID
FROM        Answer
GROUP BY    QuestionID
HAVING      COUNT(AnswerID) >= 4;

# Question 8
SELECT  *
FROM    Exam
WHERE   Duration >= 60 AND CreateDate < '2019-12-20';

# Question 9
SELECT      *
FROM        `Group`
ORDER BY    CreateDate DESC
LIMIT       5;

# Question 10
SELECT  COUNT(AccountID)
FROM    `Account`
WHERE   DepartmentID = 2;

# Question 11
SELECT  *
FROM    `Account`
WHERE   FullName LIKE N'D%o';

# Question 12
DELETE FROM Exam
WHERE       CreateDate < '2017-12-20';

# Question 13
DELETE FROM Question
WHERE       `Content` LIKE N'câu hỏi%';

# Question 14
UPDATE  `Account`
SET     FullName = N'Lô Văn Đề', email = 'lo.vande@mmc.edu.vn'
WHERE   AccountID = 5;

# Question 15
UPDATE  `Account`
SET     GroupID = 4
WHERE   AccountID = 5;