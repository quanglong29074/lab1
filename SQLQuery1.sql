﻿IF EXISTS (SELECT * FROM sys.databases WHERE Name='Dung12')
    DROP DATABASE Dung12
GO 
CREATE DATABASE Dung12
GO
USE Dung12
GO
--TẠO bảng lớp học 
CREATE TABLE LopHoc12(
    MaLopHoc INT PRIMARY KEY IDENTITY,
    TenLopHoc VARCHAR(10)
)
GO 
--Tạo bảng sinh viên có khoá ngoại là cột MaLopHoc, nối với bảng LopHoc12
CREATE TABLE SinhVien (
    MaSV int PRIMARY KEY,
    TenSV varchar(40),
    MaLopHoc int,
    CONSTRAINT fk FOREIGN KEY (MaLopHoc) REFERENCES LopHoc12 (MaLopHoc)
)
GO 
--tẠO bảng SanPham với một cột NULL, một cột NOT NULL
    CREATE TABLE SanPham (
        MaSP int NOT NULL,
        TenSP varchar(40) NULL
    )
    CREATE TABLE StoreProduct(
        ProductID int NOT NULL,
        Name varchar(40) NOT NULL,
        Price money NOT NULL DEFAULT (100)
    )
    --Thử kiểm tra xem giá trị default có dươc sử dụng hay không
INSERT INTO StoreProduct (ProductID, name) VALUES (111, Rivets)
GO
--Tạo bảng ContactPhone với thuộc tính IDENTITY
CREATE TABLE ContractPhone (
    person_ID int IDENTITY(500,1) NOT NULL,
    MobileNumber bigint NOT NULL
)
GO
--Tạo cột nhận dạng duy nhất tổng thể 
CREATE TABLE CellularPhone(
    Person_ID uniqueidentifier DEFAULT NEWID() NOT NULL,
    PersonName varchar(60) NOT NULL
)
--chèn một record vào
INSERT INTO CellularPhone(PersonName) VALUES('William Smith')
GO
--Kiểm tra giá trị của cột Person_ID tự động sinh
SELECT * FROM CellularPhone
Go
--Tạo bảng ContactPhone với cột MobileNumber có thuộc tính UNIQUE
CREATE TABLE ContactPhone (
    person_ID int PRIMARY KEY,
    MobileNumber bigint UNIQUE,
    ServiceProvider varchar(30),
    LandlineNumber bigint UNIQUE
)
--chèn 2 bản ghi có giá trị giống nhau ở cột MobileNumber và LanLieNumber để quan sát lỗi
INSERT INTO ContactPhone values (101, 983345674, 'Hutch', NULL)
INSERT INTO ContactPhone values (102, 983345674, 'Alex', NULL)
GO
--Tạo bảng PhoneExpenses có một CHECT ở cột Amount
CREATE TABLE PhoneExpense (
    Expense_ID int PRIMARY KEY,
    MobileNumber bigint FOREIGN KEY REFERENCES ContactPhone
    (MobileNumber),
      Amount bigint CHECK (Amount >0)
)
GO
-- chỉnh sửa cột trong bảng
ALTER TABLE ContactPhone
     ALTER COLUMN ServiceProvider varchar(45)
GO
--xoá cột trong bảng
ALTER TABLE ContactPhone
   DROP COLUMN ServiceProvder
GO
--Thêm môt ràng buoc vào bảng
ALTER TABLE ContactPhone ADD CONSTRAINT CHK_RC CHECK(RentalCharges > 0)
GO 
--Xoá một rang buộc
ALTER TABLE Person.ContactPhone
    DROP CONSTRAINT CHK_RC
GO
