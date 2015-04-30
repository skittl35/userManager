/* =====================================================================
-- The code below (ln. 8-13) should only need to be run once, so it is 
-- commented out to allow for easier manipulation of the database as I 
-- create the site.  For a site of this size this realy isn't necessary, 
-- but since your interest is in how I code, I thought I'd do it anyway.
======================================================================*/
/*

Use master;
GO

CREATE DATABASE userManager;

*/

/* =====================================================================
-- Drop all existing objects in userManager database
======================================================================*/

USE userManager;
GO

IF EXISTS(select * from sysobjects where xtype = 'U' and name='users')
BEGIN
	drop table users;
END

IF EXISTS(select * from sysobjects where xtype = 'U' and name='roles')
BEGIN
	drop table roles;
END

IF EXISTS(select * from sysobjects where xtype = 'U' and name='states')
BEGIN
	drop table states;
END

/* =====================================================================
-- Create each table in the userManager database
======================================================================*/

USE userManager;
GO

-- tlkp is a prefix I learned at Capturepoint.  I understand it's not
-- something everyone uses, thought it helps me categorize certain tables
CREATE TABLE roles(
	ID int NOT NULL IDENTITY(1,1),
	roleName varchar(50),
	CONSTRAINT pk_roleID PRIMARY KEY (ID),
)

CREATE TABLE states(
	ID int NOT NULL IDENTITY(1,1),
	fullName varchar(100) NOT NULL,
	shortName varchar(5) NOT NULL
	CONSTRAINT pk_stateID PRIMARY KEY (ID),
)

CREATE TABLE users(
	ID int NOT NULL IDENTITY(1,1),
	name varchar(100) NOT NULL,
	email varchar(60) NOT NULL,
	phoneNumber varchar(15) NOT NULL,
	userAddress varchar(100),
	userCity varchar(50),
	userState int,
	userZip varchar(15),
	username varchar(50) NOT NULL,
	userPassword varchar(255) NOT NULL,
	roleID int NOT NULL,
	CONSTRAINT pk_userID PRIMARY KEY (ID),
	CONSTRAINT fk_userRole FOREIGN KEY (roleID)
	REFERENCES roles(ID),
	CONSTRAINT fk_userState FOREIGN KEY (userState)
	REFERENCES states(ID)
)

/* =====================================================================
-- With tables now created, insert initial data
======================================================================*/
insert into roles(roleName)
	values('Administrator');
insert into roles(roleName)
	values('Read Only');
	
insert into states (fullName, shortName)
	values('Alabama', 'AL');
insert into states (fullName, shortName)
	values('Alaska', 'AK');
insert into states (fullName, shortName)
	values('Arizona', 'AZ');
insert into states (fullName, shortName)
	values('Arkansas', 'AR');
insert into states (fullName, shortName)
	values('California', 'CA');
insert into states (fullName, shortName)
	values('Colorado', 'CO');
insert into states (fullName, shortName)
	values('Connecticut', 'CT');
insert into states (fullName, shortName)
	values('Delaware', 'DE');
insert into states (fullName, shortName)
	values('District of Columbia', 'DC');
insert into states (fullName, shortName)
	values('Florida', 'FL');
insert into states (fullName, shortName)
	values('Georgia', 'GA');
insert into states (fullName, shortName)
	values('Hawaii', 'HI');
insert into states (fullName, shortName)
	values('Idaho', 'ID');
insert into states (fullName, shortName)
	values('Illinois', 'IL');
insert into states (fullName, shortName)
	values('Indiana', 'IN');
insert into states (fullName, shortName)
	values('Iowa', 'IA');
insert into states (fullName, shortName)
	values('Kansas', 'KS');
insert into states (fullName, shortName)
	values('Kentucky', 'KY');
insert into states (fullName, shortName)
	values('Louisiana', 'LA');
insert into states (fullName, shortName)
	values('Maine', 'ME');
insert into states (fullName, shortName)
	values('Maryland', 'MD');
insert into states (fullName, shortName)
	values('Massachusetts', 'MA');
insert into states (fullName, shortName)
	values('Michigan', 'MI');
insert into states (fullName, shortName)
	values('Minnesota', 'MN');
insert into states (fullName, shortName)
	values('Mississippi', 'MS');
insert into states (fullName, shortName)
	values('Missouri', 'MO');
insert into states (fullName, shortName)
	values('Montana', 'MT');
insert into states (fullName, shortName)
	values('Nebraska', 'NE');
insert into states (fullName, shortName)
	values('Nevada', 'NV');
insert into states (fullName, shortName)
	values('New Hampshire', 'NH');
insert into states (fullName, shortName)
	values('New Jersey', 'NJ');
insert into states (fullName, shortName)
	values('New Mexico', 'NM');
insert into states (fullName, shortName)
	values('New York', 'NY');
insert into states (fullName, shortName)
	values('North Carolina', 'NC');
insert into states (fullName, shortName)
	values('North Dakota', 'ND');
insert into states (fullName, shortName)
	values('Ohio', 'OH');
insert into states (fullName, shortName)
	values('Oklahoma', 'OK');
insert into states (fullName, shortName)
	values('Oregon', 'OR');
insert into states (fullName, shortName)
	values('Pennsylvania', 'PA');
insert into states (fullName, shortName)
	values('Rhode Island', 'RI');
insert into states (fullName, shortName)
	values('South Carolina', 'SC');
insert into states (fullName, shortName)
	values('South Dakota', 'SD');
insert into states (fullName, shortName)
	values('Tennessee', 'TN');
insert into states (fullName, shortName)
	values('Texas', 'TX');
insert into states (fullName, shortName)
	values('Utah', 'UT');
insert into states (fullName, shortName)
	values('Vermont', 'VT');
insert into states (fullName, shortName)
	values('Washington', 'WA');
insert into states (fullName, shortName)
	values('West Virginia', 'WV');
insert into states (fullName, shortName)
	values('Wisconson', 'WI');
insert into states (fullName, shortName)
	values('Wyoming', 'WY');
	
insert into users(name, email, phoneNumber, userAddress, userCity, userState, userZip, username, userPassword, roleID)
	values('Tom Gibson', 'gibsont@gmail.com', '551-206-6132', '419 Spring Avenue', 'Ridgewood', 31, '07450', 'tgibson', 'usermanagerPW', 2);
	
insert into users(name, email, phoneNumber, userAddress, userCity, userState, userZip, username, userPassword, roleID)
	values('Chad Pugsley', 'cpugsley@fusionapps.com', '201-537-8023', '110 Meadowlands Parkway #101', 'Secaucus', 31, '07094', 'cpugsley', 'welcomeToUM', 1);
	
select * from users;