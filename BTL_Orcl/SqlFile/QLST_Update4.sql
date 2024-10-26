alter table Attendance rename to Attendances;
alter table PriceHistory rename to PriceHistories;
alter table SalaryHistory rename to SalaryHistories;

alter table Attendances modify Shift nvarchar2(30);

alter table Categories modify (
    CategoryTitle nvarchar2(50),
    Description nvarchar2(500)
);

alter table Clients modify (
    ClientName nvarchar2(50),
    Address nvarchar2(300),
    ClientType nvarchar2(50)
);

alter table Jobs modify (
    JobName nvarchar2(100),
    Description nvarchar2(200)
);

alter table Products modify (
    ProductName nvarchar2(100),
    Description nvarchar2(1000)
);

alter table Staffs modify (
    StaffName nvarchar2(50),
    Address nvarchar2(300)
);

alter table Suppliers modify (
    SupplierName nvarchar2(100),
    Address nvarchar2(300),
    Note nvarchar2(1000)
);

alter table Users modify Role nvarchar2(50);