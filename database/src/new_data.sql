USE Digital_Bus_Pass;

-- ST: student, NP: normal people.
INSERT INTO User (user_id, full_name, user_phone_number, user_mail, gender, DoB) VALUES
(1, 'Nguyen Quang Sang', '0913123456', 'a.nguyen@gmail.com', 'male', '2005-05-01'),
(2, 'Nguyen Anh Minh', '0709876543', 'b.tran@gmail.com', 'female', '2003-08-21'),
(3, 'Nguyen Duc Trung', '0794567890', 'c.le@gmail.com', 'male', '1985-12-30'),
(4, 'Phung Huy Quang', '0989988776', 'd.pham@gmail.com', 'female', '2001-04-15'),
(5, 'Nguyen Cong Tuan Vu', '0913789456', 'e.hoang@gmail.com', 'male', '1980-07-10'),
(6, 'Vu Viet Vy', '0836677889', 'f.vu@gmail.com', 'male', '2003-11-05'),
(7, 'Nguyen Dang Khiem', '0852233445', 'g.ngo@gmail.com', 'female', '1989-03-25'),
(8, 'Le Ba Khanh Hoang', '0791234987', 'h.bui@gmail.com', 'male', '2002-09-09'),
(9, 'Tran Phuc Nguyen', '0705566778', 'i.mai@gmail.com', 'female', '2001-06-01');

INSERT INTO BusPass (pass_id, pass_price, pass_start_date, pass_expired_date, pass_status) VALUES
(1, 150000, '2025-04-01', '2025-05-01', 'active'),
(2, 150000, '2025-03-15', '2025-04-15', 'expired'),
(3, 300000, '2025-03-01', '2025-04-01', 'expired'),
(4, 150000, '2025-04-10', '2025-05-10', 'active'),
(5, 300000, '2025-04-05', '2025-05-05', 'active'),
(6, 150000, '2025-04-12', '2025-05-12', 'active'),
(7, 300000, '2025-03-25', '2025-04-25', 'expired'),
(8, 150000, '2025-04-15', '2025-05-15', 'active'),
(9, 150000, '2025-04-20', '2025-05-20', 'active');

INSERT INTO Account (account_id, user_id, pass_id, username, password, account_type, balance) VALUES
(1, 1, 1, 'sang912003@', 'pass123A', 'ST', 200.0),
(2, 2, 2, 'Minh2412', 'pass123B', 'ST', 150.0),
(3, 3, 3, 'Trung253@', 'pass123C', 'NP', 300.0),
(4, 4, 4, 'Quang3836@', 'pass123D', 'NP', 100.0),
(5, 5, 5, 'Vu917373@', 'pass123E', 'ST', 0.0),
(6, 6, 6, 'Vy372632@', 'pass123F', 'ST', 220.0),
(7, 7, 7, 'Khiem16713@', 'pass123G', 'NP', 180.0),
(8, 8, 8, 'Hoang28173@', 'pass123H', 'NP', 90.0),
(9, 9, 9, 'Nguyen1212@', 'pass123I', 'ST', 130.0);

INSERT INTO Ticket (ticket_id, ticket_price, ticket_status_date, ticket_expired_date, ticket_status) VALUES
(1, 3000, '2025-04-30', '2025-04-30', 'used'),
(2, 3000, '2025-04-28', '2025-04-28', 'used'),
(3, 6000, '2025-04-20', '2025-04-20', 'expired'),
(4, 3000, '2025-04-29', '2025-04-29', 'used'),
(5, 6000, '2025-04-25', '2025-04-25', 'used'),
(6, 3000, '2025-04-30', '2025-04-30', 'active'),
(7, 6000, '2025-04-27', '2025-04-27', 'used'),
(8, 3000, '2025-04-26', '2025-04-26', 'used'),
(9, 3000, '2025-04-30', '2025-04-30', 'active');

INSERT INTO Payment (payment_id, account_id, ticket_id, pass_id, payment_method, payment_date, payment_status) VALUES
(1, 1, 1, 1, 'Credit Card', '2025-05-02', 'Completed'),
(2, 2, 2, 2, 'Momo', '2025-05-02', 'Cancelled'),
(3, 3, 3, 3, 'Debit Card', '2025-05-02', 'Completed'), 
(4, 4, 4, 4, 'Cash', '2025-05-02', 'Completed'),
(5, 5, 5, 5, 'Credit Card', '2025-05-02', 'Completed'),
(6, 6, 6, 6, 'Momo', '2025-05-02', 'Completed'),
(7, 7, 7, 7, 'Debit Card', '2025-05-02', 'Cancelled '),
(8, 8, 8, 8, 'Cash', '2025-05-02', 'Completed'),
(9, 9, 9, 9, 'Credit Card', '2025-05-02', 'Completed');

INSERT INTO Cart (cart_id, account_id, payment_id, cart_status) VALUES
(1, 1, 1, 'pending'),
(2, 2, 2, 'completed'),
(3, 3, 3, 'completed'),
(4, 4, 4, 'pending'),
(5, 5, 5, 'completed'),
(6, 6, 6, 'completed'),
(7, 7, 7, 'pending'),
(8, 8, 8, 'completed'),
(9, 9, 9, 'pending');


INSERT INTO BusRoute (route_id, pass_id, ticket_id, route_name, origin, destination, direction, sequence_stop)
VALUES
('R008_G', 1, 1, 'Route 8', 'Bến xe buýt Quận bus8', 'Bến xe buýt ĐH Quốc gia TPHCM', 'Go trip', 'a');

INSERT INTO BusRoute (route_id, pass_id, ticket_id, route_name, origin, destination, direction, sequence_stop)
VALUES
('R008_R', 1, 1, 'Route 8', 'Bến xe buýt Quận 8', 'Bến xe buýt ĐH Quốc gia TPHCM', 'Return trip', 'a');

UPDATE BusRoute
SET sequence_stop = 'BX Quận 8 - Cầu Nhị Thiên Đường - Tùng Thiện Vương - Chợ Xóm Củi - Bưu điện Quận 5 - Rạp Đại Quang - Bệnh viện Chợ Rẫy - Bệnh viện Hùng Vương - CoopMart Lý Thường Kiệt - Điện lực Phú Thọ - Nhà thi đấu Phú Thọ - Bệnh viện Trưng Vương - Đại học Bách Khoa - Bưu Điện Phú Thọ - Ngã ba Thành Thái - Siêu thị Nguyễn Kim - CMC Tân Bình - Cây xăng Đôi - Chợ Tân Bình - Bệnh viện chỉnh hình và Phục hồi chức năng - Bệnh viện Thống Nhất - Bệnh viện Quận Tân Bình - Nhà hàng Đông Phương - Công viên Hoàng Văn Thụ - Bảo Tàng Miền Đông - Siêu Thị Big C - Khách Sạn Tân Sơn Nhất - Công an Phú Nhuận - Ngã tư Phú Nhuận - Ngã tư Phan Xích Long - Ngã Tư Thích Quảng Đức - Trường Đại học Văn Hiến - Bệnh Viện Phước An - Công viên Văn hóa Phú Nhuận - UBND Quận Bình Thạnh - Lăng Ông Bà Chiểu - Chợ Bà Chiểu - Tòa Án nhân dân Quận Bình Thạnh - Chùa Bồ Đề - Nhà thờ Hàng Xanh - Chợ Hàng Xanh - Ngã Ba Hàng Xanh - Đài Liệt sĩ - Cổng ra - Bến xe Miền Đông 3 - Ngã tư Bình Triệu - Đường số 20 - Chùa Ưu Đàm - Cá sấu Hoa cà - THCS Ngô Chí Quốc - Chùa An Lạc - Cầu Gò Dưa - Trường Cao đẳng Vinatex - Trạm xăng 27-7 - Công an phường Linh Đông - Trạm Cầu Ngang - Chợ Thủ Đức - Ngã ba Chương Dương - Cao đẳng xây dựng 2 - Siêu thị Nguyễn Kim - Trường ĐHSP Kỹ Thuật - Công an Quận 9 - Chợ chiều - Trạm Hutech - Khu Công nghệ cao - Khu Công nghệ cao quận 9 - Cầu Vượt Trạm 2 - Suối Tiên - Nghĩa trang liệt sĩ TP.HCM - Vành đại ĐHQG TPHCM - KTX Khu A ĐH Quốc Gia TPHCM - Đại học Quốc tế - Đại học Khoa học xã hội và Nhân văn - ĐH Khoa học tự nhiên - ĐH Quốc gia'
WHERE route_id = 'R008_G' AND direction = 'Go trip';

UPDATE BusRoute
SET sequence_stop = 'ĐH Quốc gia – ĐH Khoa học tự nhiên – Đại học Khoa học xã hội và Nhân văn – Đại học Quốc tế – KTX Khu A ĐH Quốc Gia TPHCM – Vành đai ĐHQG TPHCM – Nghĩa trang liệt sĩ TP.HCM – Suối Tiên – Cầu Vượt Trạm 2 – Khu Công nghệ cao quận 9 – Khu Công nghệ cao – Trạm Hutech – Chợ chiều – Công an Quận 9 – Trường ĐHSP Kỹ Thuật – Siêu thị Nguyễn Kim – Cao đẳng xây dựng 2 – Ngã ba Chương Dương – Chợ Thủ Đức – Trạm Cầu Ngang – Công an phường Linh Đông – Trạm xăng 27-7 – Trường Cao đẳng Vinatex – Cầu Gò Dưa – Chùa An Lạc – THCS Ngô Chí Quốc – Cá sấu Hoa cà – Chùa Ưu Đàm – Đường số 20 – Ngã tư Bình Triệu – Bến xe Miền Đông 3 – Cổng ra – Đài Liệt sĩ – Ngã Ba Hàng Xanh – Chợ Hàng Xanh – Nhà thờ Hàng Xanh – Chùa Bồ Đề – Tòa Án nhân dân Quận Bình Thạnh – Chợ Bà Chiểu – Lăng Ông Bà Chiểu – UBND Quận Bình Thạnh – Công viên Văn hóa Phú Nhuận – Bệnh Viện Phước An – Trường Đại học Văn Hiến – Ngã Tư Thích Quảng Đức – Ngã tư Phan Xích Long – Ngã tư Phú Nhuận – Công an Phú Nhuận – Khách Sạn Tân Sơn Nhất – Siêu Thị Big C – Bảo Tàng Miền Đông – Công viên Hoàng Văn Thụ – Nhà hàng Đông Phương – Bệnh viện Quận Tân Bình – Bệnh viện Thống Nhất – Bệnh viện chỉnh hình và Phục hồi chức năng – Chợ Tân Bình – Cây xăng Đôi – CMC Tân Bình – Siêu thị Nguyễn Kim – Ngã ba Thành Thái – Bưu Điện Phú Thọ – Đại học Bách Khoa – Bệnh viện Trưng Vương – Nhà thi đấu Phú Thọ – Điện lực Phú Thọ – CoopMart Lý Thường Kiệt – Bệnh viện Hùng Vương – Bệnh viện Chợ Rẫy – Rạp Đại Quang – Bưu điện Quận 5 – Chợ Xóm Củi – Tùng Thiện Vương – Cầu Nhị Thiên Đường – BX Quận 8'
WHERE route_id = 'R008_R' AND direction = 'Return trip';

INSERT INTO BusRoute (route_id, pass_id, ticket_id, route_name, origin, destination, direction, sequence_stop)
VALUES
('R010_G', 2, 2, 'Route 10', 'Bến xe buýt ĐH Quốc gia TPHCM', 'Bến xe Miền Tây', 'Go trip', 'a');

INSERT INTO BusRoute (route_id, pass_id, ticket_id, route_name, origin, destination, direction, sequence_stop)
VALUES
('R010_R', 2, 2, 'Route 10', 'Bến xe buýt ĐH Quốc gia TPHCM', 'Bến xe Miền Tây', 'Return trip', 'a');

UPDATE BusRoute
SET sequence_stop = 'Bến xe buýt ĐH Quốc gia TPHCM - Bến xe buýt Khu A ĐHQG - Đại học Quốc tế - KTX Khu A ĐH Quốc Gia TPHCM - ĐH Khoa học tự nhiên - Đại học An Ninh Nhân Dân - Trường giáo dục Quốc phòng - Khu DL Suối Tiên - Khu Công nghệ cao Q9 - Xa Lộ Hà Nội - Công ty Cocacola - Ngã tư Thủ Đức - Ga metro Thủ Đức - Betong Hải Âu - UBND Quận 9 - Ngã 4 Bình Thái - Công ty truyền tải điện 4 - Ngã 4 Tây Hòa (RMK) - Xi măng Hà Tiên - Cát Lái - Metro Quận 2 - Thảo Điền - Cầu Đen - Cầu Sài Gòn - Khu Du lịch Văn Thánh - Đại học Hutech - Cây xăng dầu - Vòng xoay Hàng Xanh - Đại học Hồng Bàng - Trạm Điện Nguyễn Cửu Vân - Cầu Điện Biên Phủ - Đền Trần Hưng Đạo - Công viên Lê Văn Tám - Phạm Ngọc Thạch - Nhà thiếu nhi thành phố - Bảo tàng Phụ Nữ - Trần Quốc Thảo - Ngã sáu Dân Chủ - Siêu thị Maximark - Bệnh viện Bình Dân - Học viện Hành chính Quốc gia - Học viện Hành chính Quốc gia - Nhà hát Hòa Bình - Nhà thờ Vinh Sơn - Bệnh viện Nhi Đồng 1 - Học viện Quân y - Chợ Nhật Tảo - Trường Hoàng Văn Thụ - Đại học kinh tế - Ngô Gia Tự - Trung tâm giáo dục thường xuyên - Bệnh viện Phạm Ngọc Thạch - Hùng Vương Plaza - Bệnh viện Chợ Rẫy - Rạp Đại Quang - Bưu điện Quận 5 - Hải Thượng Lãn Ông - Chợ Kim Biên - Cây xăng - Ngân hàng Thương Tín - CoopMart - Cầu Hậu Giang - Chợ Hoa - Nguyễn Văn Luông - Bình Phú - Đồng Quê - Mũi Tàu Phú Lâm - Vòng xoay Kinh Dương Vương - Bến xe Miền Tây - 428, Kinh Dương Vương - Bến xe Miền Tây'
WHERE route_id = 'R010_G' AND direction = 'Go trip';

UPDATE BusRoute
SET sequence_stop = 'Bến xe Miền Tây – 428, Kinh Dương Vương – Bến xe Miền Tây – Vòng xoay Kinh Dương Vương – Mũi Tàu Phú Lâm – Đồng Quê – Bình Phú – Nguyễn Văn Luông – Chợ Hoa – Cầu Hậu Giang – CoopMart – Ngân hàng Thương Tín – Cây xăng – Chợ Kim Biên – Hải Thượng Lãn Ông – Bưu điện Quận 5 – Rạp Đại Quang – Bệnh viện Chợ Rẫy – Hùng Vương Plaza – Bệnh viện Phạm Ngọc Thạch – Trung tâm giáo dục thường xuyên – Ngô Gia Tự – Đại học Kinh tế – Trường Hoàng Văn Thụ – Chợ Nhật Tảo – Học viện Quân y – Bệnh viện Nhi Đồng 1 – Nhà thờ Vinh Sơn – Nhà hát Hòa Bình – Học viện Hành chính Quốc gia – Học viện Hành chính Quốc gia – Bệnh viện Bình Dân – Siêu thị Maximark – Ngã sáu Dân Chủ – Trần Quốc Thảo – Bảo tàng Phụ Nữ – Nhà thiếu nhi thành phố – Phạm Ngọc Thạch – Công viên Lê Văn Tám – Đền Trần Hưng Đạo – Cầu Điện Biên Phủ – Trạm Điện Nguyễn Cửu Vân – Đại học Hồng Bàng – Vòng xoay Hàng Xanh – Cây xăng dầu – Đại học Hutech – Khu Du lịch Văn Thánh – Cầu Sài Gòn – Cầu Đen – Thảo Điền – Metro Quận 2 – Cát Lái – Xi măng Hà Tiên – Ngã 4 Tây Hòa (RMK) – Công ty truyền tải điện 4 – Ngã 4 Bình Thái – UBND Quận 9 – Betong Hải Âu – Ga metro Thủ Đức – Ngã tư Thủ Đức – Công ty Cocacola – Xa Lộ Hà Nội – Khu Công nghệ cao Q9 – Khu DL Suối Tiên – Trường giáo dục Quốc phòng – Đại học An Ninh Nhân Dân – ĐH Khoa học tự nhiên – KTX Khu A ĐH Quốc Gia TPHCM – Đại học Quốc tế – Bến xe buýt Khu A ĐHQG – Bến xe buýt ĐH Quốc gia TPHCM'
WHERE route_id = 'R010_R' AND direction = 'Return trip';

INSERT INTO BusRoute (route_id, pass_id, ticket_id, route_name, origin, destination, direction, sequence_stop)
VALUES
('R019_G', 3, 3, 'Route 19', 'Bến xe buýt Sài Gòn', 'Bến xe buýt ĐH Quốc gia TPHCM ', 'Go trip', 'a');

INSERT INTO BusRoute (route_id, pass_id, ticket_id, route_name, origin, destination, direction, sequence_stop)
VALUES
('R019_R', 3, 3, 'Route 19', 'Bến xe buýt Sài Gòn', 'Bến xe buýt ĐH Quốc gia TPHCM ', 'Return trip', 'a');

UPDATE BusRoute
SET sequence_stop = 'Bến xe buýt Sài Gòn - Tôn Thất Tùng - Nguyễn Thị Nghĩa - Trường Emst Thalmann - Trạm Trung chuyển trên đường Hàm Nghi - Nam Kỳ Khởi Nghĩa - Chợ Cũ - Giao lộ Hàm Nghi - Tôn Thất Đạm - Hồ Tùng Mậu - Bến Bạch Đằng - Công Trường Mê Linh - Nhà Hát Thành Phố - Bệnh viện Nhi Đồng 2 - Bưu Điện Thành Phố - Khách sạn Sofitel - Đại học Khoa học xã hội nhân văn - Thảo Cầm Viên - Cầu Thị Nghè - Nhà Thờ Thị Nghè - Trung tâm Dưỡng Lão - Trường trung học Gia Định - Ngã Ba Hàng Xanh - Đài Liệt sĩ - Cổng ra - Bến xe Miền Đông 3 - Trường TH Bình Triệu - Trạm xăng dầu - Cầu Ông Dầu - Đường số 3 - Đường số 4 - Cân Nhơn Hòa - Ngã 3 Hiệp Bình - Ngã 3 Đường Hiệp Bình - Trạm y tế Hiệp Bình Phước - UBND P.Hiệp Bình Phước - Hồ Bơi - Ngã 4 Bình Phước - Ngã ba mũi tàu đường Gò Dưa - Chợ Đầu Mối - Chợ Tam Bình - Hồ Bơi - Chợ Tam Hải - Cầu vượt Sóng Thần - Bến xe Lam Hồng - Giày da Thái Bình - Cầu vượt Linh Xuân - Vietcombank - Nghĩa trang TP - ĐH Kinh tế Luật - Công ty điện tử Samsung - ĐH Nông Lâm - ĐH Nông Lâm - Cầu Vượt Trạm 2 - Suối Tiên - Nghĩa trang liệt sĩ TP.HCM - Vành đại ĐHQG TPHCM - KTX Khu A ĐH Quốc Gia TPHCM - Đại học Quốc tế - Đại học Khoa học xã hội và Nhân văn - ĐH Khoa học tự nhiên - Bến xe buýt ĐH Quốc gia TPHCM'
WHERE route_id = 'R019_G' AND direction = 'Go trip';

UPDATE BusRoute
SET sequence_stop = 'Bến xe buýt ĐH Quốc gia TPHCM – ĐH Khoa học tự nhiên – Đại học Khoa học xã hội và Nhân văn – Đại học Quốc tế – KTX Khu A ĐH Quốc Gia TPHCM – Vành đai ĐHQG TPHCM – Nghĩa trang liệt sĩ TP.HCM – Suối Tiên – Cầu Vượt Trạm 2 – ĐH Nông Lâm – ĐH Nông Lâm – Công ty điện tử Samsung – ĐH Kinh tế Luật – Nghĩa trang TP – Vietcombank – Cầu vượt Linh Xuân – Giày da Thái Bình – Bến xe Lam Hồng – Cầu vượt Sóng Thần – Chợ Tam Hải – Hồ Bơi – Chợ Tam Bình – Chợ Đầu Mối – Ngã ba mũi tàu đường Gò Dưa – Ngã 4 Bình Phước – Hồ Bơi – UBND P.Hiệp Bình Phước – Trạm y tế Hiệp Bình Phước – Ngã 3 Đường Hiệp Bình – Ngã 3 Hiệp Bình – Cân Nhơn Hòa – Đường số 4 – Đường số 3 – Cầu Ông Dầu – Trạm xăng dầu – Trường TH Bình Triệu – Bến xe Miền Đông 3 – Cổng ra – Đài Liệt sĩ – Ngã Ba Hàng Xanh – Trường trung học Gia Định – Trung tâm Dưỡng Lão – Nhà Thờ Thị Nghè – Cầu Thị Nghè – Thảo Cầm Viên – Đại học Khoa học xã hội nhân văn – Khách sạn Sofitel – Bưu Điện Thành Phố – Bệnh viện Nhi Đồng 2 – Nhà Hát Thành Phố – Công Trường Mê Linh – Bến Bạch Đằng – Hồ Tùng Mậu – Tôn Thất Đạm – Giao lộ Hàm Nghi – Chợ Cũ – Nam Kỳ Khởi Nghĩa – Trạm Trung chuyển trên đường Hàm Nghi – Trường Emst Thalmann – Nguyễn Thị Nghĩa – Tôn Thất Tùng – Bến xe buýt Sài Gòn'
WHERE route_id = 'R019_R' AND direction = 'Return trip';


INSERT INTO BusRoute (route_id, pass_id, ticket_id, route_name, origin, destination, direction, sequence_stop)
VALUES
('R033_G', 4, 4, 'Route 33', 'Bến xe An Sương', 'Bến Xe Buýt ÐH Quốc Gia', 'Go trip', 'a');

INSERT INTO BusRoute (route_id, pass_id, ticket_id, route_name, origin, destination, direction, sequence_stop)
VALUES
('R033_R', 4, 4, 'Route 33', 'Bến xe An Sương', 'Bến Xe Buýt ÐH Quốc Gia', 'Return trip', 'a');

UPDATE BusRoute
SET sequence_stop = 'Bến xe An Sương - Cầu vượt An Sương - Trạm đăng kiểm - Chung cư Thái An - Đài phát thanh Quán Tre - Trường Nguyễn Du - Bảo vệ Nam Long Hải - Ngã tư Đình - Cây xăng Năng lượng - Cao su Vina - Ngã tư Tân Thới Hiệp - UBND Quận 12 - Bãi xe Tri Ân - Cầu Bến Cát - Gò Sao - Cây xăng Thạnh Xuân - Cầu Cả Bốn - Bến xe Ngã tư Ga - Cầu Ga nhỏ - An Phú Đông - Công ty Vĩnh Hưng - Đài liệt sĩ An Phú Đông - ĐH Nguyễn Tất Thành - Công ty đá Ngọc Ngân - Tu viện Khánh An - Bãi đậu xe kho hàng - Aone - Ngã 4 Bình Phước - Ngã ba mũi tàu đường Gò Dưa - Chợ Đầu Mối - Chợ Tam Bình - Hồ Bơi - Chợ Tam Hải - Cầu vượt Sóng Thần - Bến xe Lam Hồng - Giày da Thái Bình - Cầu vượt Linh Xuân - Vietcombank - Nghĩa trang TP - ĐH Kinh tế Luật - Công ty điện tử Samsung - ĐH Nông Lâm - ĐH Nông Lâm - Cầu Vượt Trạm 2 - Suối Tiên - Nghĩa trang liệt sĩ TP.HCM - Vành đại ĐHQG TPHCM - KTX Khu A ĐH Quốc Gia TPHCM - Đại học Quốc tế - Hồ Đá - Nhà Khách ĐHQG - Viện Tài nguyên môi trường - KTX Khu B ĐHQG - KTX Khu B ĐHQG - Bến Xe Buýt ÐH Quốc Gia'
WHERE route_id = 'R033_G' AND direction = 'Go trip';

UPDATE BusRoute
SET sequence_stop = 'Bến Xe Buýt ĐH Quốc Gia – KTX Khu B ĐHQG – KTX Khu B ĐHQG – Viện Tài nguyên môi trường – Nhà Khách ĐHQG – Hồ Đá – Đại học Quốc tế – KTX Khu A ĐHQG – Vành đai ĐHQG TPHCM – Nghĩa trang liệt sĩ TP.HCM – Suối Tiên – Cầu Vượt Trạm 2 – ĐH Nông Lâm – ĐH Nông Lâm – Công ty điện tử Samsung – ĐH Kinh tế Luật – Nghĩa trang TP – Vietcombank – Cầu vượt Linh Xuân – Giày da Thái Bình – Bến xe Lam Hồng – Cầu vượt Sóng Thần – Chợ Tam Hải – Hồ Bơi – Chợ Tam Bình – Chợ Đầu Mối – Ngã ba mũi tàu đường Gò Dưa – Ngã 4 Bình Phước – Aone – Bãi đậu xe kho hàng – Tu viện Khánh An – Công ty đá Ngọc Ngân – ĐH Nguyễn Tất Thành – Đài liệt sĩ An Phú Đông – Công ty Vĩnh Hưng – An Phú Đông – Cầu Ga nhỏ – Bến xe Ngã tư Ga – Cầu Cả Bốn – Cây xăng Thạnh Xuân – Gò Sao – Cầu Bến Cát – Bãi xe Tri Ân – UBND Quận 12 – Ngã tư Tân Thới Hiệp – Cao su Vina – Cây xăng Năng lượng – Ngã tư Đình – Bảo vệ Nam Long Hải – Trường Nguyễn Du – Đài phát thanh Quán Tre – Chung cư Thái An – Trạm đăng kiểm – Cầu vượt An Sương – Bến xe An Sương'
WHERE route_id = 'R033_R' AND direction = 'Return trip';

INSERT INTO BusRoute (route_id, pass_id, ticket_id, route_name, origin, destination, direction, sequence_stop)
VALUES
('R052_G', 5, 5, 'Route 52', 'Bến xe buýt Sài Gòn', 'Bến xe buýt ĐH Quốc gia TPHCM', 'Go trip', 'a');

INSERT INTO BusRoute (route_id, pass_id, ticket_id, route_name, origin, destination, direction, sequence_stop)
VALUES
('R052_R', 5, 5, 'Route 52', 'Bến xe buýt Sài Gòn', 'Bến xe buýt ĐH Quốc gia TPHCM', 'Return trip', 'a');

UPDATE BusRoute
SET sequence_stop = 'Bến xe buýt Sài Gòn - Tôn Thất Tùng - Nguyễn Thị Nghĩa - Trường Emst Thalmann - Trạm Trung chuyển trên đường Hàm Nghi - Chợ Cũ - Đền Thờ Ấn Giáo, Pasteur - Lê Thánh Tôn - Lý Tự Trọng - Lê Duẫn - Nhà Văn Hóa Thanh Niên - Nhà Văn Hóa Thanh Niên - Nhà Văn Hóa Thanh Niên - Mạc Đỉnh Chi - Đinh Tiên Hoàng - Thảo Cầm Viên - Cầu Thị Nghè - Nhà Thờ Thị Nghè - Trung tâm Dưỡng Lão - Trường trung học Gia Định - Đại học Hutech - Khu Du lịch Văn Thánh - Cầu Sài Gòn - Cầu Đen - Thảo Điền - Metro Quận 2 - Cát Lái - Xi măng hà tiên - trạm thu phí - Ngã 4 Tây Hòa (RMK) - Trạm xây dựng - Khu QLGTDT số 2 - Ngã 4 Bình Thái - UBND quận 9 - Bê tông Hải Âu - Ga metro Thủ Đức - Ngã 4 Thủ Đức - Công an Quận 9 - Chợ chiều - Trạm Hutech - Khu Công nghệ cao - Khu Công nghệ cao quận 9 - Thư Viện Trung tâm ĐHQG TPHCM - Thư Viện Trung tâm ĐHQG TPHCM - Hồ Câu cá - Nhà văn hoá sinh viên - Đại học Quốc tế - KTX Khu A ĐH Quốc Gia TPHCM - ĐH Khoa học tự nhiên - Bến xe buýt ĐH Quốc gia TPHCM'
WHERE route_id = 'R052_G' AND direction = 'Go trip';

UPDATE BusRoute
SET sequence_stop = 'Bến xe buýt ĐH Quốc gia TPHCM – ĐH Khoa học tự nhiên – KTX Khu A ĐH Quốc Gia TPHCM – Đại học Quốc tế – Nhà văn hoá sinh viên – Hồ Câu cá – Thư Viện Trung tâm ĐHQG TPHCM – Thư Viện Trung tâm ĐHQG TPHCM – Khu Công nghệ cao quận 9 – Khu Công nghệ cao – Trạm Hutech – Chợ chiều – Công an Quận 9 – Ngã 4 Thủ Đức – Ga metro Thủ Đức – Bê tông Hải Âu – UBND quận 9 – Ngã 4 Bình Thái – Khu QLGTDT số 2 – Trạm xây dựng – Ngã 4 Tây Hòa (RMK) – Trạm thu phí – Xi măng Hà Tiên – Cát Lái – Metro Quận 2 – Thảo Điền – Cầu Đen – Cầu Sài Gòn – Khu Du lịch Văn Thánh – Đại học Hutech – Trường trung học Gia Định – Trung tâm Dưỡng Lão – Nhà Thờ Thị Nghè – Cầu Thị Nghè – Thảo Cầm Viên – Đinh Tiên Hoàng – Mạc Đỉnh Chi – Nhà Văn Hóa Thanh Niên – Nhà Văn Hóa Thanh Niên – Nhà Văn Hóa Thanh Niên – Lê Duẫn – Lý Tự Trọng – Lê Thánh Tôn – Đền Thờ Ấn Giáo, Pasteur – Chợ Cũ – Trạm Trung chuyển trên đường Hàm Nghi – Trường Emst Thalmann – Nguyễn Thị Nghĩa – Tôn Thất Tùng – Bến xe buýt Sài Gòn'
WHERE route_id = 'R052_R' AND direction = 'Return trip';


INSERT INTO BusRoute (route_id, pass_id, ticket_id, route_name, origin, destination, direction, sequence_stop)
VALUES
('R053_G', 6, 6, 'Route 53', 'Lê Hồng Phong', 'Bến Xe Buýt ÐH Quốc Gia', 'Go trip', 'a');

INSERT INTO BusRoute (route_id, pass_id, ticket_id, route_name, origin, destination, direction, sequence_stop)
VALUES
('R053_R', 6, 6, 'Route 53', 'Lê Hồng Phong', 'Bến Xe Buýt ÐH Quốc Gia', 'Return trip', 'a');

UPDATE BusRoute
SET sequence_stop = 'Lê Hồng Phong - Nhà Sách Minh Khai - Trần Hưng Đạo - Bệnh viện Quận 1 - CS2 - KTX Trần Hưng Đạo - Nguyễn Kim - Trạm Trung chuyển trên đường Hàm Nghi - Bến Bạch Đằng - Nguyễn Hữu Cảnh - Cầu Đen - Khu QLGTDT số 2 - Đầu đường Lê Văn Chí - Đại học Ngân hàng - Vietcombank - Cầu Vượt Trạm 2 - Suối Tiên - Vành đại ĐHQG TPHCM - Bến xe buýt Khu A ĐHQG - Đại học Quốc tế - Đại học Quốc tế - Hồ Đá - Nhà Khách ĐHQG - Viện Tài nguyên môi trường - KTX Khu B ĐHQG - KTX Khu B ĐHQG - Bến Xe Buýt ÐH Quốc Gia'
WHERE route_id = 'R053_G' AND direction = 'Go trip';

UPDATE BusRoute
SET sequence_stop = 'Bến Xe Buýt ÐH Quốc Gia - KTX Khu B ĐHQG - Viện Tài nguyên môi trường - Nhà Khách ĐHQG - Hồ Đá - Đại học Quốc tế - Đại học Quốc tế - Bến xe buýt Khu A ĐHQG - Vành đại ĐHQG TPHCM - Suối Tiên - Cầu Vượt Trạm 2 - Vietcombank - Đại học Ngân hàng - Đầu đường Lê Văn Chí - Khu QLGTDT số 2 - Cầu Đen - Nguyễn Hữu Cảnh - Bến Bạch Đằng - Trạm Trung chuyển trên đường Hàm Nghi - Nguyễn Kim - KTX Trần Hưng Đạo - CS2 - Bệnh viện Quận 1 - Trần Hưng Đạo - Nhà Sách Minh Khai - Lê Hồng Phong'
WHERE route_id = 'R053_R' AND direction = 'Return trip';

INSERT INTO BusRoute (route_id, pass_id, ticket_id, route_name, origin, destination, direction, sequence_stop)
VALUES
('R099_G', 7, 7, 'Route 99', 'Khu dân cư Thạnh Mỹ Lợi', 'Bến Xe Buýt ÐH Quốc Gia', 'Go trip', 'a');

INSERT INTO BusRoute (route_id, pass_id, ticket_id, route_name, origin, destination, direction, sequence_stop)
VALUES
('R099_R', 7, 7, 'Route 99', 'Khu dân cư Thạnh Mỹ Lợi', 'Bến Xe Buýt ÐH Quốc Gia', 'Return trip', 'a');

UPDATE BusRoute
SET sequence_stop = 'Khu dân cư Thạnh Mỹ Lợi - UBND Phường Thạnh Mỹ Lợi - Chợ Thạnh Mỹ Lợi - Trường Tiểu học Lương Thế Vinh - Ban bồi thường GPMB Thành phố Thủ Đức - UBND Thành phố Thủ Đức - Đường Đồng Văn Cống - Ban điều hành KP3 - Ga metro Rạch Chiếc - Xi măng hà tiên - trạm thu phí - Ngã 4 Tây Hòa (RMK) - Chợ Nam Hòa - Đường 122 - Trường mầm non thỏ ngọc - UBND phường Phước Long B - Ngã 3 Đỗ Xuân Hợp - Đường 61 - Trường cao đẳng Công Thương - Dệt Phong Phú - 92 Tăng Nhơn Phú - chùa kim linh - UBND phường Tăng Nhơn Phú B - Trung tâm GDTX Quận 9 - Cổng Đình - Trạm y tế Phường Hiệp Phú - Chợ Hiệp Phú - Chợ Tăng Nhơn Phú A - Bệnh viện Quận 9 - Đại Học GTVT - Ký túc xá Đại học Sư phạm kỹ thuật - Chung cư C7 - Công Ty FILIED - Ngã ba Mỹ Thành - Ngã 3 Mỹ Thành - Đường cầu xây - Hoa cảnh Sài Gòn - Đường số 100 - Trạm cuối đường Cầu Xây - Trạm đầu Nam Cao - Trường THCS Tân Phú - Trạm Y tế phường Tân Phú - Suối Tiên - Nghĩa trang liệt sĩ TP.HCM - Vành đại ĐHQG TPHCM - KTX Khu A ĐH Quốc Gia TPHCM - Đại học Quốc tế - Hồ Đá - Nhà Khách ĐHQG - Viện Tài nguyên môi trường - KTX Khu B ĐHQG - KTX Khu B ĐHQG - Bến Xe Buýt ÐH Quốc Gia'
WHERE route_id = 'R099_G' AND direction = 'Go trip';

UPDATE BusRoute
SET sequence_stop = 'Bến Xe Buýt ÐH Quốc Gia - KTX Khu B ĐHQG - Viện Tài nguyên môi trường - Nhà Khách ĐHQG - Hồ Đá - Đại học Quốc tế - Đại học Quốc tế - KTX Khu A ĐHQG TPHCM - Vành đại ĐHQG TPHCM - Nghĩa trang liệt sĩ TP.HCM - Suối Tiên - Trạm Y tế phường Tân Phú - Trường THCS Tân Phú - Trạm đầu Nam Cao - Trạm cuối đường Cầu Xây - Đường số 100 - Hoa cảnh Sài Gòn - Ngã 3 Mỹ Thành - Ngã ba Mỹ Thành - Công Ty FILIED - Chung cư C7 - Ký túc xá Đại học Sư phạm kỹ thuật - Đại Học GTVT - Bệnh viện Quận 9 - Chợ Tăng Nhơn Phú A - Chợ Hiệp Phú - Trạm y tế Phường Hiệp Phú - Cổng Đình - Trung tâm GDTX Quận 9 - UBND phường Tăng Nhơn Phú B - Chùa kim linh - 92 Tăng Nhơn Phú - Dệt Phong Phú - Trường cao đẳng Công Thương - Đường 61 - Ngã 3 Đỗ Xuân Hợp - UBND phường Phước Long B - Trường mầm non thỏ ngọc - Đường 122 - Chợ Nam Hòa - Ngã 4 Tây Hòa (RMK) - Trạm thu phí - Xi măng hà tiên - Ga metro Rạch Chiếc - Ban điều hành KP3 - Đường Đồng Văn Cống - UBND Thành phố Thủ Đức - Ban bồi thường GPMB Thành phố Thủ Đức - Trường Tiểu học Lương Thế Vinh - Chợ Thạnh Mỹ Lợi - UBND Phường Thạnh Mỹ Lợi - Khu dân cư Thạnh Mỹ Lợi'
WHERE route_id = 'R099_R' AND direction = 'Return trip';

INSERT INTO Bus (bus_id, route_id, license_plate, model, year, capacity, bus_status) VALUES
(1, 'R008_G', '51B-12345', 'Hyundai', 2018, 59, 'Active'),
(2, 'R008_R', '51B-202.02', 'Hyundai', 2018, 59, 'Active'),
(3, 'R010_G', '51B-54321', 'Thaco', 2017, 49, 'Inactive'),
(4, 'R010_R', '51B-303.03', 'Thaco', 2017, 49, 'Active'),
(5, 'R019_G', '51C-43256', 'Thaco', 2019, 59, 'Active'),
(6, 'R019_R', '51C-505.23', 'Thaco', 2019, 59, 'Inactive'),
(7, 'R033_G', '51D-36356', 'Isuzu', 2020, 49, 'Active'),
(8, 'R033_R', '51D-64573', 'Isuzu', 2020, 49, 'Active'),
(9, 'R052_G', '51B-44556', 'Thaco', 2016, 59, 'Active'),
(10, 'R052_R', '51B-78901', 'Thaco', 2021, 59, 'Active'),
(11, 'R053_G', '51B-23456', 'Hyundai', 2015, 59, 'Active'),
(12, 'R053_R', '51B-11123', 'Hyundai', 2022, 59, 'Active'),
(13, 'R099_G', '51B-54621', 'Kia', 2018, 49, 'Active'),
(14, 'R099_R', '51B-82735', 'Kia', 2020, 49, 'Active');

INSERT INTO Schedule (schedule_id, route_id, date, direction, start_time, end_time)
VALUES
(1, 'R008_G', '2025-05-03', 'Go trip', '05:00:00', '07:30:00'),
(2, 'R008_R', '2025-05-03', 'Return trip', '09:45:00', '12:15:00'),
(3, 'R019_G', '2025-05-03', 'Go trip', '08:00:00', '10:30:00'),
(4, 'R019_R', '2025-05-03', 'Return trip', '11:15:00', '13:30:00'),
(5, 'R033_G', '2025-05-03', 'Go trip', '09:30:00', '11:57:00'),
(6, 'R033_R', '2025-05-03', 'Return trip', '09:30:00', '11:45:00'),
(7, 'R052_G', '2025-05-03', 'Go trip', '06:00:00', '06:30:00'),
(8, 'R052_R', '2025-05-03', 'Return trip', '13:15:00', '15:10:00'),
(9, 'R010_G', '2025-05-03', 'Go trip', '07:30:00', '09:15:00'),
(10, 'R010_R', '2025-05-03', 'Return trip', '08:15:00', '10:45:00'),
(11, 'R053_G', '2025-05-03', 'Go trip', '11:15:00', '13:30:00'),
(12, 'R053_R', '2025-05-03', 'Return trip', '13:15:00', '15:10:00'),
(13, 'R099_G', '2025-05-03', 'Go trip', '05:00:00', '07:30:00'),
(14, 'R099_R', '2025-05-03', 'Return trip', '09:30:00', '11:45:00');