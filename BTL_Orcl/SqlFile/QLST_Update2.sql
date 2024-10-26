alter table Attendance add(
    Shift varchar2(30) not null,
    StartTime date,
    EndTime date 
);

alter table Attendance drop column WorkDate;
