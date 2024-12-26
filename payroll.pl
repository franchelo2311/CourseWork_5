/*
 * File: binary_tree.pl
 * Author: Franz Zbinden Garcia
 * Course: COTI 4039-KJ1
 * Date: 15/12/2024
 * Purpose: This program defines employees
 */

% Employee facts: employee(ID, Name, Department, TypeInfo).
% TypeInfo: hourly(HourlyRate, HoursWorked) or sales(CommissionRate, SalesAmount)
employee('1111', 'Lucas Bennett', 'Information Technology', hourly(15.00, 40)).
employee('2222', 'Sofia Ramirez', 'Sales', sales(0.15, 5000.00)).
employee('3333', 'Ethan Clarke', 'Marketing', hourly(20.00, 45)).
employee('4444', 'Isabella Martinez', 'Finance', sales(0.10, 8000.00)).
employee('5555', 'Oliver Harris', 'Human Resources', hourly(18.00, 38)).

% Calculate weekly salary for hourly employees.
weekly_salary(hourly(HourlyRate, HoursWorked), Salary) :-
    HoursWorked =< 40,
    Salary is HourlyRate * HoursWorked.

weekly_salary(hourly(HourlyRate, HoursWorked), Salary) :-
    HoursWorked > 40,
    OvertimeHours is HoursWorked - 40,
    RegularPay is HourlyRate * 40,
    OvertimePay is OvertimeHours * HourlyRate * 1.5,
    Salary is RegularPay + OvertimePay.

% Calculate weekly salary for salespeople.
weekly_salary(sales(CommissionRate, SalesAmount), Salary) :-
    Salary is CommissionRate * SalesAmount.

% Display employee data and weekly salary.
go :-
    employee(ID, Name, Department, TypeInfo),
    weekly_salary(TypeInfo, Salary),
    format('ID: ~w~n', [ID]),
    format('Name: ~w~n', [Name]),
    format('Department: ~w~n', [Department]),
    format('Weekly Salary: $~2f~n', [Salary]),
    nl,
    fail.  % Force backtracking to display all employees.

% Base case to end the display process.
go.