create database Homeworks
use Homeworks

-- Homework 1

create table Student
(
	Id int identity(1,1),
	FirstName nvarchar(100) not null,
	LastName nvarchar(100) not null,
	DateOfBirth datetime2,
	 EnrolledDate datetime2,
	Gender nchar(1),
	NationalIdNumber char(15),
	StudentCardNumber char(10),
)

create table Teacher
(
	Id int identity(1,1),
	FirstName nvarchar(100) not null,
	LastName nvarchar(100) not null,
	DateOfBirth datetime2,
	AcademicRank nvarchar(100) not null,
	HireDate datetime2,
)

create table Grades
(
	Id int identity(1,1),
	StudentId int not null,
	CourseId int not null,
	TeacherId int not null,
	Grade int,
	Comment nvarchar(MAX),
	CreatedDate datetime2
	
)

create table Courses
(
	Id int identity(1,1),
	[Name] nvarchar(255) not null,
	Credit decimal(18,2),
	AcademicYear int,
	Semester varchar(20)
)

create table GradeDetails
(
	Id int identity(1,1),
	GradeId int not null,
	AchievementTypeId int not null,
	AchievementPoints decimal(18,2),
	AchievementMax decimal(18,2),
	AchievementDate datetime2
)

create table AchievementTypes
(
Id int identity(1,1),
[Name] nvarchar(255) not null,
[Description] nvarchar(MAX),
ParticipationRate decimal(18,2)
)

-- Homework 2

select * from Student
select * from Teacher
select * from Grades
select * from GradeDetails
select * from Courses
select * from AchievementTypes

SELECT * FROM Student
WHERE FirstName = 'Antonio'


SELECT * FROM Student
WHERE DateOfBirth > '01.01.1999'

SELECT * FROM Student
WHERE LastName like 'J%' 
and 
EnrolledDate >= '01.01.1998'  
and 
EnrolledDate <= '01.31.1998'

SELECT * FROM Student
ORDER BY FirstName

SELECT LastName FROM Teacher
UNION
SELECT LastName FROM Student


ALTER TABLE Grade
ADD CONSTRAINT FK_Grade_Student
Foreign Key(StudentId) references [Student](Id)

ALTER TABLE Grade
ADD CONSTRAINT FK_Grade_Course
Foreign Key(CourseId) references [Course](Id)

ALTER TABLE Grade
ADD CONSTRAINT FK_Grade_Teacher
Foreign Key(TeacherId) references [Teacher](Id)

ALTER TABLE GradeDetails
ADD CONSTRAINT FK_GradeDetails_Grade
Foreign Key(GradeId) references Grade(Id)

ALTER TABLE GradeDetails
ADD CONSTRAINT FK_GradeDetails_AchievementType
Foreign Key(AchievementTypeId) references AchievementType(Id)