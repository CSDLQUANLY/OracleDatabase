alter table Jobs drop column SalaryMax;

alter table Jobs rename column SalaryMin to ShiftSalary;

alter table Attendance drop column EndTime;

alter table Attendance rename column StartTime to ShiftDate;

alter table Staffs add SalaryIncrement number;
