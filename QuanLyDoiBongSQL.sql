CREATE TABLE CAPBAC (
    MACB char(5) NOT NULL PRIMARY KEY, 
    TENCAPBAC CHAR(20) NOT NULL
);
CREATE TABLE NHANVIEN (
    MANV CHAR(5) NOT NULL PRIMARY KEY, 
    TENDANGNHAP CHAR(12) NOT NULL, 
    MATKHAU CHAR(12) NOT NULL, 
    MACB CHAR(5) NOT NULL, 
    HOTEN CHAR(50) NOT NULL, 
    NGSINH DATE NOT NULL, 
    GIOITINH CHAR(3) NOT NULL, 
    DIACHI TEXT NOT NULL, 
    SDT CHAR(11) NOT NULL,
    
    FOREIGN KEY (MACB) REFERENCES CAPBAC(MACB)
);
CREATE TABLE KHACHHANG (
    MAKH CHAR(5) NOT NULL PRIMARY KEY, 
    HOTEN CHAR(50) NOT NULL, 
    NGSINH DATE NOT NULL, 
    GIOITINH CHAR(3) NOT NULL, 
    DIACHI TEXT NOT NULL, 
    SDT CHAR(11) NOT NULL, 
    EMAIL CHAR(50) NOT NULL,
    MABAOMAT CHAR(12) NOT NULL
);
CREATE TABLE LOAISP (
    MALOAISP CHAR(5) NOT NULL PRIMARY KEY, 
    LOAISP CHAR(20) NOT NULL
);
CREATE TABLE SANPHAM (
    MASP CHAR(5) NOT NULL PRIMARY KEY,
    TENSP CHAR(30) NOT NULL, 
    GIATIEN INT NOT NULL, 
    MALOAISP CHAR(5) NOT NULL, 
    THUONGHIEU CHAR(50), 
    SOLUONG INT NOT NULL, 
    CHITIET TEXT NOT NULL,
    
    FOREIGN KEY (MALOAISP) REFERENCES LOAISP(MALOAISP)
);
CREATE TABLE SP_HINHANH (
    MASP CHAR(5) NOT NULL, 
    HINHANH CHAR(50) NOT NULL,
    
	PRIMARY KEY(MASP, HINHANH),
    FOREIGN KEY (MASP) REFERENCES SANPHAM(MASP)
);
CREATE TABLE SP_MAUSAC(
    MASP CHAR(5) NOT NULL, 
    MAUSAC CHAR(10) NOT NULL,
    
    PRIMARY KEY(MASP, MAUSAC),
    FOREIGN KEY (MASP) REFERENCES SANPHAM(MASP)
	);
CREATE TABLE HOADON (
    SOHD CHAR(5) NOT NULL PRIMARY KEY,
    MAKH CHAR(5) NOT NULL, 
    NGHD DATE NOT NULL,
    MANV CHAR(5) NOT NULL, 
    THANHTIEN INT,
    
    FOREIGN KEY (MAKH) REFERENCES KHACHHANG(MAKH),
    FOREIGN KEY (MANV) REFERENCES NHANVIEN(MANV)
);
CREATE TABLE CHITIETHOADON (
    SOHD CHAR(5) NOT NULL, 
    MASP CHAR(5) NOT NULL, 
    SL INT NOT NULL,
	
	PRIMARY KEY (SOHD, MASP),
    FOREIGN KEY (SOHD) REFERENCES HOADON(SOHD),
    FOREIGN KEY (MASP) REFERENCES SANPHAM(MASP)
);
CREATE TABLE KHUYENMAI (
    MAKM CHAR(5) NOT NULL PRIMARY KEY, 
    TENKHUYENMAI CHAR(100) NOT NULL, 
    BATDAUKM DATE NOT NULL, 
    KETTHUCKM DATE NOT NULL, 
    GIAKM INT NOT NULL, 
    MASP CHAR(5) NOT NULL,
    
    FOREIGN KEY (MASP) REFERENCES SANPHAM(MASP),
    CONSTRAINT CHK CHECK(BATDAUKM < KETTHUCKM)
);
CREATE TABLE DONDATHANG (
    SODONDH CHAR(5) NOT NULL PRIMARY KEY,
    MAKH CHAR(5) NOT NULL,
    NGDATHANG DATE NOT NULL,
	
   	FOREIGN KEY(MAKH) REFERENCES KHACHHANG(MAKH)
);
CREATE TABLE CTDONDH (
    SODONDH CHAR(5) NOT NULL, 
    MASP CHAR(5) NOT NULL, 
    SL INT NOT NULL,

	PRIMARY KEY(SODONDH, MASP),
	FOREIGN KEY (MASP) REFERENCES SANPHAM(MASP)
);
-- Thêm dữ liệu cấp bậc nhân viên
INSERT INTO CAPBAC VALUES ('CB001', 'ADMIN');
INSERT INTO CAPBAC VALUES ('CB002', 'QUAN LY');
INSERT INTO CAPBAC VALUES ('CB003', 'NHAN VIEN');
-- Thêm dữ liệu nhân viên
INSERT INTO NHANVIEN VALUES ('NV001', 'NHONA', 'NHoNjK123', 'CB001', 'CHAU QUE NHON', '2002/05/18', 'NAM', 'AN NHON - BINH DINH', '0981234567');
INSERT INTO NHANVIEN VALUES ('NV002', 'NHONB', 'NHoNjK123', 'CB002', 'HOANG VINH PHUC', '2002/01/10', 'NAM', 'AN NHON - BINH DINH', '0981234567');
INSERT INTO NHANVIEN VALUES ('NV003', 'NHONC', 'NHoNjK123', 'CB003', 'HO TAN TAI', '1997/05/18', 'NAM', 'PHU CAT - BINH DINH', '0981234567');
-- Thêm dữ liệu khách hàng
INSERT INTO KHACHHANG VALUES ('KH001', 'TRAN DINH TRONG', '1997/06/02', 'NAM', 'BA DINH - HA NOI', '012345678', 'TRONGBDFC@GMAIL.COM', '123456N!');
-- Thêm dữ liệu loại sản phẩm
INSERT INTO LOAISP VALUES ('SP001', 'XE SO');
INSERT INTO LOAISP VALUES ('SP002', 'XE TAY GA');
INSERT INTO LOAISP VALUES ('SP003', 'XE CON TAY');
INSERT INTO LOAISP VALUES ('SP004', 'PHU TUNG');
-- Thêm dữ liệu sản phẩm
INSERT INTO SANPHAM VALUES ('XE1', 'Air Blade 125cc', '41324727', 'SP002', 'HONDA', '14', 'Khung xe hoàn toàn mới, Cụm đèn LED hiện đại, Mặt đồng hồ LCD thể thao, Động cơ eSP+ 4 van hoàn toàn mới');
INSERT INTO SANPHAM VALUES ('XE2', 'Air Blade 160cc', '55990000', 'SP002', 'HONDA', '2', 'Khung xe hoàn toàn mới, Cụm đèn LED hiện đại, Mặt đồng hồ LCD thể thao, Động cơ eSP+ 4 van hoàn toàn mới');
INSERT INTO SANPHAM VALUES ('PT1', 'Ốp bầu lọc gió', '488000', 'SP004', 'VARIO', '127', 'Ốp bầu lọc gió còn được biết đến với tên gọi ốp pô Air hoặc chụp pô E là bộ phận ốp bên ngoài của lọc gió xe máy.Với bộ phụ kiện ốp pô E trong suốt kết hợp lọc gió độ Panther giúp trang trí nổi bật phần đuôi xe. Mặc khác với loại ốp trong suốt giúp Biker theo dõi & kịp thời vệ sinh lọc gió của xe.');
-- Thêm dữ liệu hình ảnh
INSERT INTO SP_HINHANH VALUES ('XE1', '/tayga/a_blade_125_1.png');
INSERT INTO SP_HINHANH VALUES ('XE1', '/tayga/a_blade_125_2.png');
INSERT INTO SP_HINHANH VALUES ('XE2', '/tayga/a_blade_160_1.png');
INSERT INTO SP_HINHANH VALUES ('PT1', '/phutung/loc_gio_1.png');
-- Thêm dữ liệu màu sản phẩm
INSERT INTO SP_MAUSAC VALUES ('XE1', 'BLACK');
INSERT INTO SP_MAUSAC VALUES ('XE1', 'WHITE');
INSERT INTO SP_MAUSAC VALUES ('XE2', 'BLACK');
INSERT INTO SP_MAUSAC VALUES ('PT1', 'WHITE');
-- Thêm dữ liệu hóa đơn
INSERT INTO HOADON VALUES ('HD001', 'KH001', '2022/10/01', 'NV001', '0');
-- Thêm chi tiết hóa đơn
INSERT INTO CHITIETHOADON VALUES ('HD001', 'XE2', '1');
INSERT INTO CHITIETHOADON VALUES ('HD001', 'PT1', '1');
-- Thêm dữ liệu khuyển mãi
INSERT INTO KHUYENMAI VALUES ('KM001', 'Giảm giá sốc khi mua Air Blade 160cc trong tháng 10', '2022/10/01', '2022/10/31', '7000000', 'XE2');
-- Thêm dữ liệu đơn đặt hàng
INSERT INTO DONDATHANG VALUES ('DH001', 'KH001', '2022/10/01');
-- Thêm chi tiết đơn đặt hàng
INSERT INTO CTDONDH VALUES ('DH001', 'XE2', '1');

-- sp tinh tong tien hoa don
CREATE PROC sp_thanhtienhoadon(@SOHD CHAR(5))
AS
	declare @tien int;
	SELECT @tien = a.GIATIEN FROM SANPHAM a join CHITIETHOADON b on a.MASP = b.MASP;
	UPDATE HOADON SET THANHTIEN = SL * @tien
	FROM CHITIETHOADON
	WHERE HOADON.SOHD = @SOHD
-- sp tinh tong tien hoa don
CREATE PROC sp_thongtinnhanvien
AS	
	SELECT NV.*, CB.TENCAPBAC FROM NHANVIEN NV JOIN CAPBAC CB ON NV.MACB = CB.MACB
