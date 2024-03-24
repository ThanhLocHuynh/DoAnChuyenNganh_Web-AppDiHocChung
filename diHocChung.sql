--drop database DiHocChung
--create database DiHocChung
go
use DiHocChung
go

SET DATEFORMAT dmy;
go

--test cai datetime
--DECLARE @datevar datetime2 = '31/12/2008 09:01:01';
--SELECT @datevar;

CREATE TABLE TaiKhoan (
    taiKhoan NVARCHAR(100) PRIMARY KEY,
    matKhau NVARCHAR(255),
	ten NVARCHAR(255),
	avatar VARBINARY(MAX),
    moMo char(20),
	ngaySinh VARCHAR(100), -- them cai nay nay
    soDienThoai char(20),
    diaChi NVARCHAR(255),
	otp char(5)
);

CREATE TABLE TaiXe (
	taiKhoan NVARCHAR(100) PRIMARY KEY,
		FOREIGN KEY (taiKhoan) REFERENCES TaiKhoan(taiKhoan),
    moTa NVARCHAR(MAX), --mo ta thong tin tai xe
    hoatDong BIT,
    thongTinXe NVARCHAR(MAX), --loai xe, mau xe...
	bienSo VARCHAR(50),
	--them 4 cai nay
	hinhBangLai VARBINARY(MAX),
	hinhCMND VARBINARY(MAX),
	hinhXe VARBINARY(MAX), --chup het xe tu bien so len
	hinhGiayToXe VARBINARY(MAX)
);

CREATE TABLE DatChuyen (
    maChuyen UNIQUEIDENTIFIER PRIMARY KEY,
	tkKhach NVARCHAR(100),
		FOREIGN KEY (tkKhach) REFERENCES TaiKhoan(taiKhoan),
    thoiGianDatXe datetime, --dinh dang: '31/12/2008 09:01:01'
);

CREATE TABLE ChiTietDatChuyen (
    maChiTiet UNIQUEIDENTIFIER PRIMARY KEY,
		FOREIGN KEY (maChiTiet) REFERENCES DatChuyen(maChuyen),
    diemBatDau NVARCHAR(255),
    diemDen NVARCHAR(255),
    soKm FLOAT,
    soTien decimal(9,0),
	tkTaiXe NVARCHAR(100),
		FOREIGN KEY (tkTaiXe) REFERENCES TaiXe(taiKhoan)
);

--CREATE TABLE ThongTinChuyen (
--    maChuyen UNIQUEIDENTIFIER PRIMARY KEY,
--    diemBatDau NVARCHAR(255),
--    diemDen NVARCHAR(255),
--    soKm FLOAT,
--    soTien decimal(9,0),
--	tkKhach NVARCHAR(100),
--		FOREIGN KEY (tkKhach) REFERENCES TaiKhoan(taiKhoan),
--	tkTaiXe NVARCHAR(100),
--		FOREIGN KEY (tkTaiXe) REFERENCES TaiXe(taiKhoan)
--);