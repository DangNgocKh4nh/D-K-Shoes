-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Máy chủ: 127.0.0.1
-- Thời gian đã tạo: Th5 22, 2024 lúc 09:10 AM
-- Phiên bản máy phục vụ: 10.4.32-MariaDB
-- Phiên bản PHP: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Cơ sở dữ liệu: `mysqli`
--

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `chitietdondathang`
--

CREATE TABLE `chitietdondathang` (
  `MaChiTietDonDatHang` int(11) NOT NULL,
  `SoLuong` int(11) DEFAULT NULL,
  `GiaBan` int(11) DEFAULT NULL,
  `MaDonDatHang` int(11) NOT NULL,
  `MaSanPham` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `chitietdondathang`
--

INSERT INTO `chitietdondathang` (`MaChiTietDonDatHang`, `SoLuong`, `GiaBan`, `MaDonDatHang`, `MaSanPham`) VALUES
(1, 3, 1050000, 1, 3),
(2, 4, 660000, 1, 11),
(3, 5, 1050000, 2, 3),
(4, 1, 950000, 2, 6),
(5, 1, 790000, 3, 2),
(6, 2, 660000, 3, 11),
(7, 8, 660000, 4, 11),
(8, 1, 800000, 4, 12),
(9, 4, 800000, 5, 12),
(10, 1, 1050000, 6, 3),
(11, 1, 1990000, 7, 3),
(12, 1, 1990000, 8, 3);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `dondathang`
--

CREATE TABLE `dondathang` (
  `MaDonDatHang` int(11) NOT NULL,
  `NgayLap` datetime DEFAULT NULL,
  `TongThanhTien` int(11) DEFAULT NULL,
  `MaTaiKhoan` int(11) NOT NULL,
  `MaTinhTrang` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `dondathang`
--

INSERT INTO `dondathang` (`MaDonDatHang`, `NgayLap`, `TongThanhTien`, `MaTaiKhoan`, `MaTinhTrang`) VALUES
(1, '2024-04-27 22:35:23', 5790000, 1, 2),
(2, '2024-04-27 22:58:54', 6200000, 1, 3),
(3, '2024-04-28 12:19:55', 2110000, 2, 3),
(4, '2024-05-10 23:03:57', 6080000, 1, 5),
(5, '2024-05-10 23:08:39', 3200000, 1, 6),
(6, '2024-05-10 23:25:57', 1050000, 1, 3),
(7, '2024-05-11 17:11:22', 1990000, 1, 6),
(8, '2024-05-13 16:09:04', 1990000, 1, 1);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `hangsanxuat`
--

CREATE TABLE `hangsanxuat` (
  `MaHangSanXuat` int(11) NOT NULL,
  `TenHangSanXuat` varchar(64) DEFAULT NULL,
  `BiXoa` tinyint(1) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `hangsanxuat`
--

INSERT INTO `hangsanxuat` (`MaHangSanXuat`, `TenHangSanXuat`, `BiXoa`) VALUES
(1, 'Nike', 0),
(2, 'Adidas', 0),
(3, 'Lacoste', 0),
(4, 'Puma', 0),
(5, 'Asics', 0),
(6, 'My Care', 0),
(10, 'Action', 0);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `loaisanpham`
--

CREATE TABLE `loaisanpham` (
  `MaLoaiSanPham` int(11) NOT NULL,
  `TenLoaiSanPham` varchar(64) DEFAULT NULL,
  `BiXoa` tinyint(1) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `loaisanpham`
--

INSERT INTO `loaisanpham` (`MaLoaiSanPham`, `TenLoaiSanPham`, `BiXoa`) VALUES
(1, 'Giày Nike', 0),
(2, 'Giày Adidas', 0),
(3, 'Giày Lacoste', 0),
(4, 'Giày Puma', 0),
(5, 'Giày Asics', 0),
(6, 'Phụ kiện', 0),
(9, 'Giày Action', 0);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `sanpham`
--

CREATE TABLE `sanpham` (
  `MaSanPham` int(11) NOT NULL,
  `TenSanPham` varchar(45) DEFAULT NULL,
  `HinhURL` varchar(45) DEFAULT NULL,
  `GiaSanPham` int(11) DEFAULT NULL,
  `NgayNhap` date DEFAULT NULL,
  `SoLuong` int(11) DEFAULT NULL,
  `SoLuotXem` int(11) DEFAULT 0,
  `MoTa` text DEFAULT NULL,
  `BiXoa` tinyint(1) DEFAULT 0,
  `MaLoaiSanPham` int(11) NOT NULL,
  `MaHangSanXuat` int(11) NOT NULL,
  `BaoHanh` int(12) DEFAULT NULL,
  `SoLuongDaBan` int(12) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `sanpham`
--

INSERT INTO `sanpham` (`MaSanPham`, `TenSanPham`, `HinhURL`, `GiaSanPham`, `NgayNhap`, `SoLuong`, `SoLuotXem`, `MoTa`, `BiXoa`, `MaLoaiSanPham`, `MaHangSanXuat`, `BaoHanh`, `SoLuongDaBan`) VALUES
(1, 'GIÀY ADIDAS ULTRABOUNCE NAM- XÁM', 'giay-adidas-ultrabounce-nam-xam.jpg', 1990000, '2024-04-27', 30, 3, '- Giày Adidas Ultrabounce là mẫu giày thể thao mới nhất của adidas. Với thiết kế trẻ trung, khỏe khoắn, ôm sát bàn chân. Đế giày công nghệ Bounce siêu nhẹ và êm ái giúp bạn di chuyển cả ngày mà không mệt mỏi. </br>\r\n- Ngoài ra, Adidas Ultrabounce còn được làm với hơn 50% vật liệu thân thiện bảo vệ môi trường. Giày Adidas Ultrabounce là một lựa chọn hợp lý cho mọi hoạt động hàng ngày. </br>\r\n- Giày Adidas Ultrabounce tại D&K Shoes được phân phối chính hãng. Full box, đầy đủ phụ kiện. </br>', 0, 2, 2, 3, 0),
(2, 'GIÀY NIKE AIR WINFLO 11 NAM - XÁM', 'giay-nike-air-winflo-11.jpg', 2890000, '2024-04-28', 30, 2, '- Giày Nike Air Winflo 11 là một trong những mẫu giày thể thao tốt nhất của Nike vừa được ra mắt. Với kiểu dáng cực đẹp cùng công nghệ đỉnh cao, Nike Air Winflo 11 hứa hẹn sẽ mẫu giày cực hot của Nike trong năm nay. <br/>\r\n- Phần upper với chất liệu mesh cao cấp, mềm mại linh hoạt và rất thoáng khí. Phần đế ngoài hình dạng Waffle làm bằng chất liệu cao su cao cấp cho độ bám và khả năng chống mài mòn tuyệt vời. <br/>\r\n- D&K Shoes tự hào là một trong những đơn vị phân phối sớm nhất Nike Air Winflo 11 tại Việt Nam. <br/>\r\n- Giày Nike Air Winflo 11 tại D&K Shoes được nhập khẩu chính hãng. Full box, đầy đủ phụ kiện. <br/>', 0, 1, 1, 3, 0),
(3, 'GIÀY NIKE SB ALLEYOOP NAM - XÁM XANH', 'giay-nikesb-alleyoop-nam-nau-xam-xanh.jpg', 1990000, '2024-04-30', 30, 2, '- Giày Nike SB Alleyoop là dòng giày sneaker có thiết kế đơn giản nhưng đẹp mắt, được rất nhiều người yêu thích. Một mẫu giày bạn có thể tự tin sử dụng trong mọi hoàn cảnh mà không sợ lỗi mốt. <br/>\r\n- Phần upper của giày được làm từ chất liệu da lộn cao cấp kết hợp với vải Canvas chắc chắn chịu va chạm mài mòn tốt, đế giày làm bằng cao su với công nghệ độc quyền của Nike siêu bền. <br/>\r\n- Giày Nike SB Alleyoop tại D&K Shoes được nhập khẩu chính hãng. Full box, đầy đủ phụ kiện.  <br/>', 0, 1, 1, 3, 0),
(4, 'GIÀY NIKE EBERNON MID NAM - TRẮNG', 'giay-nike-ebernon-mid-nam-trang.jpg', 1690000, '2024-04-26', 30, 2, '- Giày Nike Ebernon Mid là mẫu giày với thiết kế lấy cảm hứng từ thập niên 70 với những nét cổ điển mang phong cách đường phố đặc trưng. Với chất liệu da cao cấp và đến cao su nguyên chất khiến đôi giày bền bỉ với thời gian. <br/>\n- Giày Nike Ebernon Mid tại Myshoes.vn được nhập khẩu chính hãng. Full box, đầy đủ phụ kiện. <br/>', 0, 1, 1, 3, 0),
(5, 'GIÀY LACOSTE CARNABY PRO BL23 NAM - TRẮNG NAV', 'giay-lacoste-carnaby-pro-bl23.jpg', 2690000, '2024-04-30', 30, 4, '- Giày Lacoste Carnaby Pro BL23 là mẫu giày Lacoste mới có thiết kế cực đẹp, sang trọng và tinh tế đặc trưng của thương hiệu đến từ Pháp. Được làm từ chất liệu da cao cấp  Lacoste Carnaby Pro BL23 là lựa chọn tuyệt vời cho các quý ông. <br/>\r\n- Với đế cao su đúc dày êm chân được gắn với phần upper bằng công nghệ ép nhiệt, có khâu đế xung quanh khiến đôi giày chắc chắn và bền hơn nữa. Ngoài ra, Lacoste Carnaby Pro BL23 có phối màu vô cùng đẹp mắt. <br/>\r\n- Giày Lacoste Carnaby Pro BL23 tại D&K Shoes được nhập khẩu chính hãng. Full box, đầy đủ phụ kiện. <br/>', 0, 3, 3, 3, 0),
(6, 'GIÀY PUMA AVIATE NAM - ĐEN TRẮNG', 'giay-puma-aviate-nam-den-trang.jpg', 1690000, '2024-04-26', 30, 3, '- Giày Puma Aviate  mẫu giày thể thao có thiết kế rất đẹp cùng với những công nghệ cao cấp của Puma. Đây chính là mẫu giày đa năng tuyệt vời cho luyện tập thể thao, chạy bộ và các hoạt động hàng ngày. <br/>\r\n- Giày Puma Aviate tại Myshoes.vn được nhập khẩu chính hãng. Full box, đầy đủ phụ kiện. <br/>', 0, 4, 4, 3, 0),
(7, 'GIÀY ASICS SKY COURT NAM - TRẮNG ĐỎ', 'giay-asics-sky-court-nam-trang-do.jpg', 1690000, '2024-04-30', 33, 3, '- Giày Asics Sky Court được người yêu giày trên toàn thế giới nhắc đến như là một mẫu sneaker kinh điển mà bạn không thể bỏ qua. Asics Sky Court có thể sử dụng trong nhiều hoạt động hàng ngày và kết hợp được với rất nhiều loại quần áo khác nhau. <br/>\r\n- Upper làm bằng da cao cấp và có đục nhiều lỗ thoáng khí, phần đế giày chất liệu cao su cực kỳ bền bỉ với thời gian. <br/>\r\n- Giày Asics Sky Court tại D&K Shoes được nhập khẩu chính hãng. Full box, đầy đủ phụ kiện. <br/>', 0, 5, 5, 3, 0),
(8, 'GIÀY ASICS EVORIDE 2 NAM - ĐEN TRẮNG', 'giay-asics-evoride-2-nam-den-trang.jpg', 1550000, '2024-04-20', 33, 3, '- Giày Asics Gel Sonoma 6 với thiết kế đẹp, khỏe khoắn năng động cùng với công nghệ đỉnh cao của Asics Nhật Bản mang đến cho người sử dụng một đôi giày trail tuyệt vời. <br/>\r\n- Thiết kế ôm gọn bàn chân khiến người dùng thật dễ chịu khi di chuyển. Phần upper của giày được làm chất liệu mesh thoáng khí, phần đế giữa sử dụng công nghệ AmpliFoam độc quyền của Asics giúp cho đôi giày thật êm ái và trợ lực cực tốt mỗi bước đi. Phần đế ngoài với cao su định hình cực kỳ bền và bám đường giúp bạn dễ dàng vượt qua những địa hình khó khăn nhất. <br/>\r\n- Giày Asics Gel Sonoma 6 tại D&K Shoes được nhập khẩu chính hãng. Full box, đầy đủ phụ kiện. <br/>', 0, 5, 5, 3, 0),
(9, 'GIÀY ADIDAS VL COURT 2.0 NAM - XÁM NÂU', 'giay-adidas-vl-court-2-nam-xam.jpg', 1650000, '2024-04-30', 33, 3, '- Giày Adidas VL Court 2.0 được thiết kế phong cách cổ điển nhưng đẹp mãi với thời gian. Một mẫu giày bạn có thể sử dụng trong mọi hoàn cảnh và luôn phù hợp dù ở bất cứ nơi đâu. <br/>\r\n- Phần Upper được làm từ da lộn cao cấp với logo đặc trưng của adidas, đế giày chất liệu cao su siêu bền, chắc chắn hỗ trợ từng bước chân. <br/>\r\n- Giày Adidas VL Court 2.0 chính hãng tại D&K Shoes được nhập khẩu chính hãng. Full box, đầy đủ phụ kiện. <br/>', 0, 2, 2, 3, 0),
(10, 'BỘ VỆ SINH GIÀY CAO CẤP MYCARE SHOE CLEANER', 'mycare-02-800x800w.jpg', 209000, '2024-01-05', 33, 1, '- MYCARE là thương hiệu sản phẩm chăm sóc giày cao cấp của Công ty cổ  phần Đầu tư và Công nghệ MYGROUP. <br/>\r\n- Bộ vệ sinh giày Mycare Shoe Cleaner Kit được Myroup nghiên cứu và phát triển trong gần 1 năm để tạo ra sản phẩm cao cấp chuyên nghiệp dành cho việc vệ sinh mọi loại giày từ giày da cho đến giày thể thao. <br/>\r\n<strong>Bộ vệ sinh giày Mycare Shoe Cleaner Kit gồm 2 sản phẩm bên trong: </strong> <br/>\r\n+ 01 chai dung dịch Mycare Shoe Cleaning Gel là giải pháp làm sạch giày chuyên nghiệp đánh bay mọi vết bẩn cứng đầu nhất giúp đôi giày của bạn luôn sạch sẽ và sáng đẹp. Sản phẩm này làm từ nguyên liệu tự nhiên, an toàn cho sản phẩm và người sử dụng. <br/>\r\n+ 01 Bàn chải giặt giày chuyên nghiệp được làm bằng gỗ sồi nhập khẩu cao cấp, cực kỳ bền chắc. Lông bàn chải chất liệu PP mềm sử dụng an toàn với mọi loại giày mà không lo làm chày xước hay hỏng giày. Logo trên bàn trải được khắc lazer cực kỳ tinh tế. <br/>\r\n- Đặc biệt, hộp đựng bộ sản phẩm này được Mycare thiết kế cực kỳ đẹp mắt và chuyên nghiệp, sử dụng chất liệu carton lạnh cứng cáp, logo và tên sản phẩm được ép nhũ 3 lớp khiến sản phẩm càng trở lên sang trọng. Hộp này rất hữu ích, bạn có thể sử dụng để đựng rất nhiều đồ dùng nhỏ xinh trong nhà đó. <br/>\r\n- Mycare giúp bạn tiết kiệm tiền tối ưu, bạn chỉ phải bỏ ra 4000-5000đ để dễ dàng làm sạch giày với Mycare thay vì bỏ ra hàng trăm nghìn để giặt giày ở tiệm. <br/>', 0, 6, 6, 3, 0),
(11, 'XỊT NANO CHỐNG NƯỚC MYCARE NANO PROTECT 200ML', 'xit-nano-chong-nuoc-mycare.jpg', 199000, '2024-04-30', 32, 1, '- Xịt Nano Chống Nước Mycare Nano Protect được sản xuất với công nghệ Nano tiên tiến nhất sẽ giúp đôi giày được bảo vệ toàn diện khi tiếp xúc với nước, dầu mỡ, bụi bẩn...<br/>\r\n- Với khả năng chống nước, dầu mỡ, bụi bẩn lên tới 98% cho thấy hiệu quả vượt trội so với các sản phẩm thông thường khác.<br/>\r\n- Mỗi lần xịt 2 lớp lên giày có thể sử dụng hiệu quả trong thời gian từ 15-30 ngày tùy theo số lần sử dụng và tiếp xúc với nước <br/>\r\n- Mycare Nano Protect có thể sử dụng cho mọi loài giày thừ giày da trơn, giày da lộn, giày vải...Cùng với mức giá sản phẩm vô cùng hợp lý chắc chắn đây là sản phẩm không thể thiếu với bất cứ ai.<br/>', 0, 6, 6, 3, 0),
(12, 'GIÀY PUMA CAVEN NAM - TRẮNG XANH LÁ', 'giay-puma-caven-nam-trang-xanh-la.jpg', 1390000, '2024-04-26', 31, 3, '- Giày Puma Caven mẫu giày cổ điển được phát triển từ những năm 1980 của Puma. Chất liệu da cao cấp và đế cao su bền bỉ chắc chắn sẽ làm hài lòng những khách hàng khó tính nhất. Bạn sẽ luôn yên tâm rằng nó không bao giờ bị lỗi mốt. <br/>\r\n- Giày Puma Caven chính hãng tại Myshoes.vn được nhập khẩu chính hãng. Full box, đầy đủ phụ kiện. <br/>', 0, 4, 4, 3, 0),
(14, 'GIÀY ADIDAS RUNFALCON 3.0 NAM - TRẮNG ĐEN', 'giay-adidas-runfalcon-3-nam.jpg', 1590000, '2024-05-20', 30, 0, 'Giày Adidas RunFalcon 3.0 là mẫu giày thể thao mới nhất của adidas. Với thiết kế trẻ trung, khỏe khoắn, ôm sát bàn chân. Đế giày cloud siêu nhẹ và êm ái giúp bạn di chuyển cả ngày mà không mệt mỏi.\r\nNgoài ra, Adidas RunFalcon 3.0 lại có mức giá rất hợp lý dành cho tất cả mọi người.\r\nGiày Adidas RunFalcon 3.0 tại D&K Shoes được nhập khẩu chính hãng. Full box, đầy đủ phụ kiện.', 0, 2, 2, 3, 0);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `taikhoan`
--

CREATE TABLE `taikhoan` (
  `MaTaiKhoan` int(11) NOT NULL,
  `TenDangNhap` varchar(20) DEFAULT NULL,
  `MatKhau` varchar(20) DEFAULT NULL,
  `HoTen` varchar(100) DEFAULT NULL,
  `DiaChi` varchar(256) DEFAULT NULL,
  `DienThoai` varchar(11) DEFAULT NULL,
  `Email` varchar(30) DEFAULT NULL,
  `NgaySinh` date DEFAULT NULL,
  `Xoa` tinyint(1) DEFAULT 0,
  `Quyen` tinyint(1) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `taikhoan`
--

INSERT INTO `taikhoan` (`MaTaiKhoan`, `TenDangNhap`, `MatKhau`, `HoTen`, `DiaChi`, `DienThoai`, `Email`, `NgaySinh`, `Xoa`, `Quyen`) VALUES
(1, 'admin', '27052003', 'Đặng Ngọc Khánh', 'Phùng Khoang, Trung Văn, Nam Từ Liêm, Hà Nội', '0388355059', 'khanh270503a@gmail.com', '2003-05-27', 0, 1),
(2, 'sonban123', '123456', 'Dương Quang Sơn', 'Hà Nội', '0378165822', 'sonban123@gmail.com', '2003-08-09', 0, 0),
(3, 'trungvan', '654321', 'Trung Văn', 'Ba VÌ', '0984586213', 'trungvan123@gmail.com', '2003-03-24', 0, 0);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `tinhtrang`
--

CREATE TABLE `tinhtrang` (
  `MaTinhTrang` int(11) NOT NULL,
  `TenTinhTrang` varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `tinhtrang`
--

INSERT INTO `tinhtrang` (`MaTinhTrang`, `TenTinhTrang`) VALUES
(1, 'Chưa thanh toán'),
(2, 'Thanh toán '),
(3, 'Đã giao'),
(4, 'Chưa giao'),
(5, 'Đã hủy'),
(6, 'Đang giao');

--
-- Chỉ mục cho các bảng đã đổ
--

--
-- Chỉ mục cho bảng `chitietdondathang`
--
ALTER TABLE `chitietdondathang`
  ADD PRIMARY KEY (`MaChiTietDonDatHang`);

--
-- Chỉ mục cho bảng `dondathang`
--
ALTER TABLE `dondathang`
  ADD PRIMARY KEY (`MaDonDatHang`);

--
-- Chỉ mục cho bảng `hangsanxuat`
--
ALTER TABLE `hangsanxuat`
  ADD PRIMARY KEY (`MaHangSanXuat`);

--
-- Chỉ mục cho bảng `loaisanpham`
--
ALTER TABLE `loaisanpham`
  ADD PRIMARY KEY (`MaLoaiSanPham`);

--
-- Chỉ mục cho bảng `sanpham`
--
ALTER TABLE `sanpham`
  ADD PRIMARY KEY (`MaSanPham`);

--
-- Chỉ mục cho bảng `taikhoan`
--
ALTER TABLE `taikhoan`
  ADD PRIMARY KEY (`MaTaiKhoan`);

--
-- Chỉ mục cho bảng `tinhtrang`
--
ALTER TABLE `tinhtrang`
  ADD PRIMARY KEY (`MaTinhTrang`);

--
-- AUTO_INCREMENT cho các bảng đã đổ
--

--
-- AUTO_INCREMENT cho bảng `chitietdondathang`
--
ALTER TABLE `chitietdondathang`
  MODIFY `MaChiTietDonDatHang` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT cho bảng `dondathang`
--
ALTER TABLE `dondathang`
  MODIFY `MaDonDatHang` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT cho bảng `hangsanxuat`
--
ALTER TABLE `hangsanxuat`
  MODIFY `MaHangSanXuat` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT cho bảng `loaisanpham`
--
ALTER TABLE `loaisanpham`
  MODIFY `MaLoaiSanPham` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT cho bảng `sanpham`
--
ALTER TABLE `sanpham`
  MODIFY `MaSanPham` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT cho bảng `taikhoan`
--
ALTER TABLE `taikhoan`
  MODIFY `MaTaiKhoan` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT cho bảng `tinhtrang`
--
ALTER TABLE `tinhtrang`
  MODIFY `MaTinhTrang` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
