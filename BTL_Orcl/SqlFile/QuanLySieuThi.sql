create user QLST identified by abc123;
grant dba to QLST with admin option;
connect QLST/abc123;

create tablespace Staff_TS datafile '/BTL_Orcl/Oradata/Staff_TS/Staff_TS01.dbf' size 50m autoextend on next 10m maxsize 200m;
create tablespace Product_TS datafile '/BTL_Orcl/Oradata/Product_TS/Product_TS01.dbf' size 50m autoextend on next 10m maxsize 200m;
create tablespace Client_TS datafile '/BTL_Orcl/Oradata/Client_TS/Client_TS01.dbf' size 50m autoextend on next 10m maxsize 200m;
create tablespace Invoice_TS datafile '/BTL_Orcl/Oradata/Invoice_TS/Invoice_TS01.dbf' size 50m autoextend on next 10m maxsize 200m;
create tablespace Supplier_TS datafile '/BTL_Orcl/Oradata/Supplier_TS/Supplier_TS01.dbf' size 50m autoextend on next 10m maxsize 200m;

create table Admins (
    AdminID varchar2(30) not null,
    Name varchar2(50) not null,
    Password varchar2(50) not null,
    Role varchar2(50) not null,
    CreateDate date not null,
    ModifyDate date,
    primary key (AdminID)
) tablespace Staff_TS;
create table Categories (
    CategoryID varchar2(30) not null,
    CategoryTitle varchar2(30) not null,
    Description varchar2(500),
    primary key (CategoryID)
) tablespace Product_TS;

create table Clients (
    ClientID varchar2(30) not null,
    FullName varchar2(50) not null,
    PhoneNumber varchar2(20) not null,
    Email varchar2(50),
    Address varchar2(300),
    primary key (ClientID)
) tablespace Client_TS;

create table Invoices (
    InvoiceID varchar2(30) not null,
    CreateDate date not null,
    TotalAmount number not null,
    StaffID varchar2(30) not null,
    ClientID varchar2(30) not null,
    primary key (InvoiceID)
) tablespace Invoice_TS;

create table InvoiceDetails (
    Quantity int not null,
    UnitPrice number not null,
    Discount int,
    InvoiceID varchar2(30) not null,
    ProductID varchar2(30) not null,
    primary key (InvoiceID, ProductID)
) tablespace Invoice_TS;

create table Jobs (
    JobID varchar2(30) not null,
    JobName varchar2(100) not null,
    Salary number not null,
    primary key (JobID)
) tablespace Staff_TS;

create table Orders (
    OrderID varchar2(30) not null,
    OrderDate date,
    Status int not null,
    TotalAmount number not null,
    ClientID varchar2(30) not null,
    primary key (OrderID)
) tablespace Invoice_TS;

create table OrderDetail (
    Quantity int not null,
    UnitPrice number not null,
    Discount int not null,
    OrderID varchar2(30) not null,
    ProductID varchar2(30) not null,
    primary key (OrderID, ProductID)
) tablespace Invoice_TS;

create table Products (
    ProductID varchar2(30) not null,
    ProductName varchar2(100) not null,
    Description varchar2(1000),
    Detail varchar2(1000),
    LinkProduct varchar2(100),
    SellingPrice number not null,
    Status int,
    CostPrice number,
    UnitsInStock int not null,
    WarrantyPeriod int,
    ExpirationDate date,
    CategoryID varchar2(30) not null,
    SupplierID varchar2(30) not null,
    primary key (ProductID)
) tablespace Product_TS;

create table PurchaseOrders (
    PurchaseOrderID varchar2(30) not null,
    CreateDate date not null,
    TotalAmount number not null,
    SupplierID varchar2(30) not null,
    StaffID varchar2(30) not null,
    primary key (PurchaseOrderID)
) tablespace Invoice_TS;

create table PurchaseOrderDetails (
    Quantity int not null,
    UnitPrice number not null,
    PurchaseOrderID varchar2(30) not null,
    ProductID varchar2(30) not null,
    primary key (PurchaseOrderID, ProductID)
) tablespace Invoice_TS;

create table Staffs (
    StaffID varchar2(30) not null,
    StaffName varchar2(50) not null,
    DateOfBirth date,
    PhoneNumber varchar2(20) not null,
    Email varchar2(50),
    StartDate date not null,
    EndDate date,
    JobID varchar2(30) not null,
    primary key (StaffID)
) tablespace Staff_TS;

create table Suppliers (
    SupplierID varchar2(30) not null,
    SupplierName varchar2(100) not null,
    PhoneNumber varchar2(20) not null,
    Email varchar2(50) not null,
    Address varchar2(300) not null,
    Note varchar2(1000),
    primary key (SupplierID)
) tablespace Supplier_TS;

alter table Invoices add foreign key (ClientID) references Clients (ClientID);
alter table Invoices add foreign key (StaffID) references Staffs (StaffID);
alter table InvoiceDetails add foreign key (InvoiceID) references Invoices (InvoiceID);
alter table InvoiceDetails add foreign key (ProductID) references Products (ProductID);
alter table Orders add foreign key (ClientID) references Clients (ClientID);
alter table OrderDetail add foreign key (OrderID) references Orders (OrderID);
alter table OrderDetail add foreign key (ProductID) references Products (ProductID);
alter table Products add foreign key (CategoryID) references Categories (CategoryID);
alter table Products add foreign key (SupplierID) references Suppliers (SupplierID);
alter table PurchaseOrders add foreign key (SupplierID) references Suppliers (SupplierID);
alter table PurchaseOrders add foreign key (StaffID) references Staffs (StaffID);
alter table PurchaseOrderDetails add foreign key (PurchaseOrderID) references PurchaseOrders (PurchaseOrderID);
alter table PurchaseOrderDetails add foreign key (ProductID) references Products (ProductID);
alter table Staffs add foreign key (JobID) references Jobs (JobID);
