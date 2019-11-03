-- PERSONAL FINANCIAL STATEMENT (PFS)

DROP DATABASE [PFS];
CREATE DATABASE [PFS]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'PFS', FILENAME = N'C:\Users\tvirdee\Documents\personal\PFS.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'PFS_log', FILENAME = N'C:\Users\tvirdee\Documents\personal\PFS_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO


if object_id('dbo.Assets', 'U') is not null drop table Assets;

if object_id('dbo.SubAssetTypes', 'U') is not null drop table SubAssetTypes;
if object_id('dbo.AssetTypes', 'U') is not null drop table AssetTypes;


if object_id('dbo.Liabilities', 'U') is not null drop table Liabilities;

if object_id('dbo.SubLiabilityTypes', 'U') is not null drop table SubLiabilityTypes;
if object_id('dbo.LiabilityTypes', 'U') is not null drop table LiabilityTypes;

if object_id('dbo.Users', 'U') is not null drop table Users;



create table Users
(
	id numeric not null primary key,
	firstname nvarchar(100) not null,
	middleinitial nvarchar(2) not null,
	lastname nvarchar(100) not null
);

create table AssetTypes 
(
	id numeric not null primary key,
	assetTypeName nvarchar(100) not null
);

create table SubAssetTypes
(
	id numeric not null primary key,
	assetTypeId numeric foreign key references AssetTypes(id),
	subAssetTypeName nvarchar(100) not null
);

create table Assets
(
	id numeric not null primary key,
	subAssetTypeId numeric foreign key references SubAssetTypes(id),
	assetName nvarchar(100) not null,
	amount decimal not null,
	assetYear numeric not null,
	assetMonth numeric not null,
	userid numeric foreign key references Users(id)
);

create table LiabilityTypes
(
	id numeric not null primary key,
	liabilityTypeName nvarchar(100) not null
);

create table SubLiabilityTypes
(
	id numeric not null primary key,
	liabilityTypeId numeric foreign key references LiabilityTypes(id),
	subLiabilityTypesName nvarchar(100) not null
);

create table Liabilities 
(
	id numeric not null primary key,
	subLiabilityTypeId numeric foreign key references SubLiabilityTypes(id),
	liabilityName nvarchar(100) not null,
	amount decimal not null,
	liabilityYear numeric not null,
	liabilityMonth numeric not null
);



insert into AssetTypes values(1, 'Real Estate');
insert into AssetTypes values(2, 'Personal Property');
insert into AssetTypes values(3, 'Investments');
insert into AssetTypes values(4, 'Cash');

insert into SubAssetTypes values(1, 1, 'Home');
insert into SubAssetTypes values(2, 1, 'Other real estate');

insert into SubAssetTypes values(3, 2, 'Automobiles');
insert into SubAssetTypes values(4, 2, 'Other vehicles');
insert into SubAssetTypes values(5, 2, 'Jewelry');
insert into SubAssetTypes values(6, 2, 'Household items');

insert into SubAssetTypes values(7, 3, 'Retirement accounts');
insert into SubAssetTypes values(8, 3, 'Bonds');
insert into SubAssetTypes values(9, 3, 'Stocks');
insert into SubAssetTypes values(10, 3, 'Mutual funds');
insert into SubAssetTypes values(11, 3, 'Cash value of life insurance');
insert into SubAssetTypes values(12, 3, 'Savings bonds');

insert into SubAssetTypes values(13, 4, 'Checking and savings');
insert into SubAssetTypes values(14, 4, 'Cash');
insert into SubAssetTypes values(15, 4, 'Other');


insert into LiabilityTypes values(1, 'Mortgage Principal');
insert into LiabilityTypes values(2, 'Loans and Debt');

insert into SubLiabilityTypes values(1, 1, 'Home mortgage');
insert into SubLiabilityTypes values(2, 1, 'Other mortgage');

insert into SubLiabilityTypes values(3, 2, 'Auto loans');
insert into SubLiabilityTypes values(4, 2, 'Student loans');
insert into SubLiabilityTypes values(5, 2, 'Credit card debt');
insert into SubLiabilityTypes values(6, 2, 'Other loans');


