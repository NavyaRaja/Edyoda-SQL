create database Assignment
use Assignment
create table SalesPeople(
Snum int not null,
Sname varchar(20) UNIQUE,
City varchar(20),
Comm int,
primary key (Snum)
);

insert into SalesPeople values(
1001,'Peel','London',.12
);
insert into SalesPeople values(
1002,'Serres','Sanjose',.13
);
insert into SalesPeople values(
1004,'Motika','London',.11
);
insert into SalesPeople values(
1007,'Rifkin','Barcelona',.15
);
insert into SalesPeople values(
1003,'Axelrod','Newyork',.10
);
select * from SalesPeople;

create table Customers(
Cnum int,
Cname varchar(20),
City varchar(20) NOT NULL,
Snum int
primary key (Cnum),
foreign key (Snum) references SalesPeople (Snum)
);

insert into Customers values(
2001,'Hoffman','London',1001
);
insert into Customers values(
2002,'Giovanni','Rome',1003
);
insert into Customers values(
2003,'Liu','Sanjose',1002
);
insert into Customers values(
2004,'Grass','Berlin',1002
);
insert into Customers values(
2006,'Clemens','London',1001
);
insert into Customers values(
2008,'Cisneros','Sanjose',1007
);
insert into Customers values(
2007,'Pereira','Rome',1004
);
select * from Customers;

create table Orders(
Onum int,
Amt int,
Odate date,
Cnum int,
Snum int,
primary key (Onum),
foreign key (Cnum) references Customers(Cnum),
foreign key (Snum) references SalesPeople(Snum)
);

insert into Orders values(
3001,18.69,'1990-10-3',2008,1007
);
insert into Orders values(
3003,767.19,'1990-10-3',2001,1001
);
insert into Orders values(
3002,1900.10,'1990-10-3',2007,1004
);
insert into Orders values(
3005,5160.45,'1990-10-3',2003,1002
);
insert into Orders values(
3006,1098.16,'1990-10-3',2008,1007
);
insert into Orders values(
3009,1713.23,'1990-10-4',2002,1003
);
insert into Orders values(
3007,75.75,'1990-10-4',2004,1002
);
insert into Orders values(
3008,4273.00,'1990-10-5',2006,1001
);
insert into Orders values(
3010,1309.95,'1990-10-6',2004,1002
);
insert into Orders values(
3011,9891.88,'1990-10-6',2006,1001
);
select * from Orders;

select count(*) from Salespeople where Sname like 'a%';

select Sname from SalesPeople Inner Join Orders on SalesPeople.snum=Orders.snum where Amt>2000;

select count(Sname) from SalesPeople  where City = 'Newyork';

select Sname from SalesPeople  where City = 'London';
select Sname from SalesPeople  where City = 'Paris';

select SalesPeople.Snum, Orders.Odate 
from SalesPeople 
inner join Orders on SalesPeople.Snum = Orders.Snum
order by SalesPeople.Snum;