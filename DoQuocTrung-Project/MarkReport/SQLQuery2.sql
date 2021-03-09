USE master;
GO

CREATE DATABASE MarkReport;
GO

USE MarkReport;
GO

CREATE TABLE tblStudent
    (
      code VARCHAR(20) PRIMARY KEY ,
      firstName NVARCHAR(30) NOT NULL ,
      lastName NVARCHAR(30) NOT NULL ,
      dateOfBirth DATE NOT NULL ,
      sex BIT NOT NULL ,
      classCode VARCHAR(10) NOT NULL ,
    );
GO

CREATE TABLE tblCourse
    (
      code VARCHAR(10) PRIMARY KEY ,
      name NVARCHAR(20) NOT NULL
    );
GO

CREATE TABLE tblMarkReport
    (
      studentCode VARCHAR(20) NOT NULL ,
      courseCode VARCHAR(10) NOT NULL ,
      mark FLOAT NOT NULL 
    );
GO

INSERT  INTO dbo.tblStudent
        ( code ,
          firstName ,
          lastName ,
          dateOfBirth ,
          sex ,
          classCode 
        )
VALUES  ( 'SE1' , -- code - varchar(20)
          N'Nguyễn' , -- firstName - nvarchar(30)
          N'Hoàng' , -- lastName - nvarchar(30)
          '01/01/1999' , -- dateOfBirth - date
          0 , -- sex - bit 0 - female, 1 - male
          'PRF123'  -- classCode - varchar(10)
        );

INSERT  INTO dbo.tblStudent
        ( code ,
          firstName ,
          lastName ,
          dateOfBirth ,
          sex ,
          classCode 
        )
VALUES  ( 'SE2' , -- code - varchar(20)
          N'Ngô' , -- firstName - nvarchar(30)
          N'Lợi' , -- lastName - nvarchar(30)
          '01/01/1999' , -- dateOfBirth - date
          0 , -- sex - bit 0 - female, 1 - male
          'PRF123'  -- classCode - varchar(10)
        );

INSERT  INTO dbo.tblStudent
        ( code ,
          firstName ,
          lastName ,
          dateOfBirth ,
          sex ,
          classCode 
        )
VALUES  ( 'SE3' , -- code - varchar(20)
          N'Lý' , -- firstName - nvarchar(30)
          N'Hoàng' , -- lastName - nvarchar(30)
          '01/01/1999' , -- dateOfBirth - date
          0 , -- sex - bit 0 - female, 1 - male
          'PRF123'  -- classCode - varchar(10)
        );

INSERT  INTO dbo.tblCourse
        ( code, name )
VALUES  ( 'C1', -- code - varchar(10)
          N'PRN'  -- name - nvarchar(20)
          );

INSERT  INTO dbo.tblCourse
        ( code, name )
VALUES  ( 'C2', -- code - varchar(10)
          N'CSD'  -- name - nvarchar(20)
          );

-- SE1 mark
INSERT INTO dbo.tblMarkReport
        ( studentCode, courseCode, mark )
VALUES  ( 'SE1', -- studentCode - varchar(20)
          'C1', -- courseCode - varchar(10)
          5.0  -- mark - float
          )

		  INSERT INTO dbo.tblMarkReport
        ( studentCode, courseCode, mark )
VALUES  ( 'SE1', -- studentCode - varchar(20)
          'C1', -- courseCode - varchar(10)
          8.0  -- mark - float
          )

		  INSERT INTO dbo.tblMarkReport
        ( studentCode, courseCode, mark )
VALUES  ( 'SE1', -- studentCode - varchar(20)
          'C2', -- courseCode - varchar(10)
          7.0  -- mark - float
          )

		  INSERT INTO dbo.tblMarkReport
        ( studentCode, courseCode, mark )
VALUES  ( 'SE1', -- studentCode - varchar(20)
          'C2', -- courseCode - varchar(10)
          10.0  -- mark - float
          )


-- SE2 mark
INSERT INTO dbo.tblMarkReport
        ( studentCode, courseCode, mark )
VALUES  ( 'SE2', -- studentCode - varchar(20)
          'C1', -- courseCode - varchar(10)
          7.0  -- mark - float
          )

		  INSERT INTO dbo.tblMarkReport
        ( studentCode, courseCode, mark )
VALUES  ( 'SE2', -- studentCode - varchar(20)
          'C1', -- courseCode - varchar(10)
          8.0  -- mark - float
          )

		  INSERT INTO dbo.tblMarkReport
        ( studentCode, courseCode, mark )
VALUES  ( 'SE2', -- studentCode - varchar(20)
          'C2', -- courseCode - varchar(10)
          7.0  -- mark - float
          )

		  INSERT INTO dbo.tblMarkReport
        ( studentCode, courseCode, mark )
VALUES  ( 'SE2', -- studentCode - varchar(20)
          'C2', -- courseCode - varchar(10)
          7.0  -- mark - float
          )

-- SE3 mark
INSERT INTO dbo.tblMarkReport
        ( studentCode, courseCode, mark )
VALUES  ( 'SE3', -- studentCode - varchar(20)
          'C1', -- courseCode - varchar(10)
          5.0  -- mark - float
          )

		  INSERT INTO dbo.tblMarkReport
        ( studentCode, courseCode, mark )
VALUES  ( 'SE3', -- studentCode - varchar(20)
          'C1', -- courseCode - varchar(10)
          9.0  -- mark - float
          )

		  INSERT INTO dbo.tblMarkReport
        ( studentCode, courseCode, mark )
VALUES  ( 'SE3', -- studentCode - varchar(20)
          'C2', -- courseCode - varchar(10)
          8.0  -- mark - float
          )

		  INSERT INTO dbo.tblMarkReport
        ( studentCode, courseCode, mark )
VALUES  ( 'SE3', -- studentCode - varchar(20)
          'C2', -- courseCode - varchar(10)
          10.0  -- mark - float
          )

SELECT  *
FROM    dbo.tblStudent;
SELECT  *
FROM    dbo.tblCourse;
SELECT  *
FROM    dbo.tblMarkReport;


SELECT  tblMark.courseCode ,
        tblCourse.name ,
        tblMark.avgMark
FROM    ( SELECT    courseCode ,
                    AVG(tblMarkReport.mark) AS avgMark
          FROM      dbo.tblMarkReport
          WHERE     studentCode = 'SE1'
          GROUP BY  tblMarkReport.courseCode
        ) AS tblMark
        JOIN dbo.tblCourse ON dbo.tblCourse.code = tblMark.courseCode; 

    
	
	