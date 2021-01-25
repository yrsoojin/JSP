create database bbs;
use bbs;

create database jsptest;
use jsptest;

create table user (userID varchar(20),
				   userPassword varchar(20),
                   userName varchar(20),
                   userGender varchar(10),
                   userEmail varchar(50),
                   primary key(userID));
select * from user;

create table bbs (bbsID int,
				  bbsTitle varchar(50),
                  userID varchar(20),
                  bbsDate datetime,
                  bbsContent varchar(2048),
                  bbsAvailable int,
                  primary key (bbsID) );
select * from bbs;
select * from bbs where bbsID < 4 and bbsAvailable = 1 order by bbsID desc limit 10;
select bbsID from bbs order by bbsID desc;

drop table product;
create table product (productID varchar(10),
					  productName varchar(30),
					  productUnitPrice int,
                      productDescription text,
                      productCategory varchar(30),
                      productManufacturer varchar(30),
                      productUnitsInStock long,
                      productCondition varchar(20),
                      productFilename varchar(20),
                      primary key (productID) );
select * from product;