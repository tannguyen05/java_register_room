-- phpMyAdmin SQL Dump
-- version 4.8.5
-- https://www.phpmyadmin.net/
--
-- Máy chủ: 127.0.0.1
-- Thời gian đã tạo: Th5 08, 2019 lúc 09:31 AM
-- Phiên bản máy phục vụ: 10.1.38-MariaDB
-- Phiên bản PHP: 7.3.3

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Cơ sở dữ liệu: `test01`
--

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `pratice_room`
--

CREATE TABLE `pratice_room` (
  `id` int(11) NOT NULL,
  `name` varchar(30) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `pratice_room`
--

INSERT INTO `pratice_room` (`id`, `name`) VALUES
(1, 'Phòng thực hành 1'),
(2, 'Phòng thực hành 2'),
(3, 'Phòng thực hành 3'),
(4, 'Phòng thực hành 4'),
(5, 'Phòng thực hành 5');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `register`
--

CREATE TABLE `register` (
  `id` int(11) NOT NULL,
  `ca` int(10) NOT NULL,
  `thu` int(10) NOT NULL,
  `mon` varchar(50) CHARACTER SET utf8 NOT NULL,
  `lop` varchar(30) COLLATE utf8_unicode_ci NOT NULL,
  `buoithaythe` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `user_id` int(11) NOT NULL,
  `room_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `register`
--

INSERT INTO `register` (`id`, `ca`, `thu`, `mon`, `lop`, `buoithaythe`, `user_id`, `room_id`) VALUES
(35, 1, 3, 'Lập trình Java', 'cntt1', 'Chiều thứ 6', 4, 2),
(36, 1, 5, 'Lập trình Java', 'cntt1', 'Chiều thứ 2', 4, 2),
(38, 1, 2, 'Lập trình hướng đối tượng', 'cntt1', 'Chiều thứ 2', 4, 3),
(44, 1, 3, 'Cong Nghe Thong Tin', 'cntt', 'Chiều thứ 6', 3, 1),
(47, 3, 1, 'Quản lý dự án', 'cntt', 'Chiều thứ 5', 3, 1),
(48, 1, 6, 'Lập trình Java', 'cntt1', 'Chiều thứ 2', 4, 1),
(49, 1, 3, 'Lập trình Java', 'cntt1', 'Chiều thứ 2', 4, 3),
(50, 1, 1, 'Lập trình hướng đối tượng', 'cntt1', 'Chiều thứ 2', 4, 3),
(60, 1, 2, 'Quản lý dự án', 'cntt1', 'Chiều thứ 6', 3, 1),
(61, 1, 4, 'Lập trình hướng đối tượng', 'cntt1', 'Chiều thứ 2', 3, 1),
(62, 1, 5, 'Đồ họa ứng dụng', 'cntt1', 'Chiều thứ 2', 4, 1),
(64, 2, 2, 'Lập trình sql server', 'cntt1', 'Chiều thứ 6', 4, 1),
(65, 2, 3, 'Kĩ thuật lập trình', 'cntt1', 'Chiều thứ 5', 4, 1),
(67, 2, 4, 'Cong Nghe Thong Tin', 'cntt1', 'Chiều thứ 6', 3, 1),
(68, 1, 1, 'Nhập Môn Tin Học', 'ktpm', 'Sáng thứ 4', 3, 4),
(69, 1, 1, 'Cong Nghe Thong Tin', 'cntt1', 'Sáng thứ 4', 3, 1);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `user`
--

CREATE TABLE `user` (
  `id` int(11) NOT NULL,
  `username` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `password` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `fullname` varchar(20) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `user`
--

INSERT INTO `user` (`id`, `username`, `password`, `fullname`) VALUES
(3, 'tannguyen', '123456789a', 'Nguyễn Văn Tân'),
(4, 'buitai', '123456789a', 'Bùi Văn Tài'),
(5, 'nguyenvan', '123456789a', 'Nguyễn Văn A'),
(6, 'tuantran', '123456789a', 'Trần Văn Tuấn'),
(7, 'nguyenvanc', '123456789a', 'Nguyễn Văn C'),
(8, 'songphy', '123456789a', 'Nguyễn Sỹ Phong'),
(9, 'admin', '123456789a', 'admin');

--
-- Chỉ mục cho các bảng đã đổ
--

--
-- Chỉ mục cho bảng `pratice_room`
--
ALTER TABLE `pratice_room`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `register`
--
ALTER TABLE `register`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `room_id` (`room_id`);

--
-- Chỉ mục cho bảng `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT cho các bảng đã đổ
--

--
-- AUTO_INCREMENT cho bảng `register`
--
ALTER TABLE `register`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=70;

--
-- AUTO_INCREMENT cho bảng `user`
--
ALTER TABLE `user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- Các ràng buộc cho các bảng đã đổ
--

--
-- Các ràng buộc cho bảng `register`
--
ALTER TABLE `register`
  ADD CONSTRAINT `register_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `register_ibfk_2` FOREIGN KEY (`room_id`) REFERENCES `pratice_room` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
