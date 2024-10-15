rename Admins to Users;
alter table Users rename column AdminID to UserID;
alter table Users rename column Name to Username;
alter table Users drop column ModifyDate;
alter table Users drop column CreateDate;
alter table Users add(
    Email varchar2(50) not null,
    LastLogin date
)

alter table Products drop column Detail;
alter table Products drop column LinkProduct;
alter table Products drop column Status;
alter table Products drop column SellingPrice;
alter table Products drop column CostPrice;
alter table Products rename column UnitsInStock to StockQuantity;
alter table Products drop column WarrantyPeriod;
alter table Products drop column ExpirationDate;
alter table Products add(
    ProductionDate date not null,
    ExpirationDate date not null
)

create table PriceHistory(
    PriceID varchar2(30) not null,
    Price number not null,
    StartDate date not null,
    EndDate date,
    ProductID varchar2(30) not null
)

alter table Clients add ClientType int not null;
alter table Clients rename column FullName to ClientName;

alter table Staffs add Address varchar2(300) not null;

alter table Jobs add Description varchar2(200);
alter table Jobs rename column Salary to SalaryMin;
alter table Jobs add SalaryMax number;

create table SalaryHistory(
    SalaryID varchar2(30) not null,
    Salary number not null,
    StartDate date not null,
    EndDate date,
    StaffID varchar2(30) not null,
    JobID varchar2(30) not null
)

drop table OrderDetail;
drop table Orders;

alter table Categories modify CategoryTitle varchar2(50);
alter table Staffs drop column JobID;
alter table SalaryHistory move tablespace Staff_TS;
alter table PriceHistory move tablespace Product_TS;

alter table PriceHistory add primary key (PriceID);
alter table PriceHistory add constraint fk_PriceHistory_Product foreign key (ProductID) references Products (ProductID);

alter table SalaryHistory add primary key (SalaryID);
alter table SalaryHistory add constraint fk_SalaryHistory_Staff foreign key (StaffID) references Staffs (StaffID);
alter table SalaryHistory add constraint fk_SalaryHistory_Job foreign key (JobID) references Jobs (JobID);

alter table Clients modify ClientType varchar(50);

create table Attendance (
    AttendanceID varchar2(30) not null,
    WorkDate date not null,
    StaffID varchar(30) not null,
    Primary key (AttendanceID),
    Constraint fk_Attendance_Staff foreign key (StaffID) references Staffs(StaffID)
) tablespace Staff_TS;
commit;
