
USE poodlepetshop
Go

CREATE TABLE [Role] (
  [id] int PRIMARY KEY IDENTITY(1, 1),
  [name] nvarchar(20)
)
GO

CREATE TABLE [User] (
  [id] int PRIMARY KEY IDENTITY(1, 1),
  [firstname] nvarchar(30),
  [lastname] nvarchar(30),
  [email] varchar(150),
  [phone_number] varchar(20),
  [address] nvarchar(200),
  [password] varchar(32),
  [role_id] int,
  [created_at] datetime,
  [updated_at] datetime,
  [deleted] int
)
GO

CREATE TABLE [Tokens] (
  [user_id] int,
  [token] varchar(32),
  [created_at] datetime,
  PRIMARY KEY ([user_id], [token])
)
GO

CREATE TABLE [Category] (
  [id] int PRIMARY KEY IDENTITY(1, 1),
  [name] nvarchar(100),
  [locations] int
)
GO

CREATE TABLE [Producer] (
  [id] int PRIMARY KEY IDENTITY(1, 1),
  [name] nvarchar(150),
  [locations] int
)
GO

CREATE TABLE [Menu] (
  [id] int PRIMARY KEY IDENTITY(1, 1),
  [name] nvarchar(150),
  [locations] int
)
GO

CREATE TABLE [Options] (
  [id] int PRIMARY KEY IDENTITY(1, 1),
  [name] nvarchar(100),
  [thumbnail] varchar(500),
  [location] int
)
GO

CREATE TABLE [Product] (
  [id] int PRIMARY KEY IDENTITY(1, 1),
  [category_id] int,
  [producer_id] int,
  [options_id] int,
  [menu_id] int,
  [title] nvarchar(250),
  [price] int,
  [thumbnail] varchar(500),
  [description] nvarchar(500),
  [created_at] datetime,
  [updated_at] datetime,
  [deleted] int,
  [outstanding] int
)
GO

CREATE TABLE [FeedBack] (
  [id] int PRIMARY KEY IDENTITY(1, 1),
  [fullname] nvarchar(30),
  [email] varchar(250),
  [note] varchar(1000),
  [status] int DEFAULT (0),
  [created_at] datetime
)
GO

CREATE TABLE [Orders] (
  [id] int PRIMARY KEY IDENTITY(1, 1),
  [user_id] int,
  [fullname] nvarchar(50),
  [email] varchar(150),
  [phone_number] varchar(20),
  [address] nvarchar(200),
  [order_date] datetime,
  [status] int,
  [total_money] int
)
GO

CREATE TABLE [Order_Details] (
  [id] int PRIMARY KEY IDENTITY(1, 1),
  [order_id] int,
  [product_id] int,
  [price] int,
  [num] int,
  [total_money] int
)
GO

CREATE TABLE OrderDetails (
    id INT PRIMARY KEY IDENTITY,
    order_id INT,
    product_id INT,
    quantity INT,
    -- Các cột khác nếu cần
    FOREIGN KEY (order_id) REFERENCES Orders(id),
    FOREIGN KEY (product_id) REFERENCES Product(id)
);

  ALTER TABLE dbo.Detail_Order
ADD user_id INT NULL;
ALTER TABLE dbo.Detail_Order
ADD CONSTRAINT FK_Detail_Order_User
FOREIGN KEY (user_id) 
REFERENCES dbo.Users(id);

ALTER TABLE [User] ADD FOREIGN KEY ([role_id]) REFERENCES [Role] ([id])
GO

ALTER TABLE [Product] ADD FOREIGN KEY ([category_id]) REFERENCES [Category] ([id])
GO

ALTER TABLE [Product] ADD FOREIGN KEY ([menu_id]) REFERENCES [Menu] ([id])
GO

ALTER TABLE [Order_Details] ADD FOREIGN KEY ([product_id]) REFERENCES [Product] ([id])
GO

ALTER TABLE [Order_Details] ADD FOREIGN KEY ([order_id]) REFERENCES [Orders] ([id])
GO

ALTER TABLE [Orders] ADD FOREIGN KEY ([user_id]) REFERENCES [User] ([id])
GO

ALTER TABLE [Tokens] ADD FOREIGN KEY ([user_id]) REFERENCES [User] ([id])
GO

ALTER TABLE [Product] ADD FOREIGN KEY ([producer_id]) REFERENCES [Producer] ([id])
GO

ALTER TABLE [Product] ADD FOREIGN KEY ([options_id]) REFERENCES [Options] ([id])
GO

ALTER TABLE Order_Details
ADD user_id int;

ALTER TABLE Order_Details
ADD CONSTRAINT FK_OrderDetails_Users
FOREIGN KEY (user_id) REFERENCES [User](id);

ALTER TABLE Order_Details
ADD TotalPrice int;
ALTER TABLE Order_Details
ALTER COLUMN TotalPrice decimal(18, 2);

ALTER TABLE Feedback
ALTER COLUMN note nvarchar(1000);

ALTER TABLE [User]
ADD thumbnail varchar(10);

ALTER TABLE [User]
ALTER COLUMN thumbnail varchar(500);

ALTER TABLE [FeedBack]
Add user_id int;

ALTER TABLE [FeedBack] ADD FOREIGN KEY ([user_id]) REFERENCES [User] ([id])
GO

ALTER TABLE [Product]
Add number int;

EXEC sp_rename 'Product.deleted', 'inventory', 'COLUMN';


INSERT INTO Category 
VALUES (N'TRANG CHỦ', '1'),
	   ( N'SẢN PHẨM', '2'),
	   ( N'KHUYẾN MÃI', '3'),
	   ( N'POODLE SHOP', '4'),
	   ( N'LIÊN HỆ', '5');

INSERT INTO Menu
VALUES ( N'-Thức ăn & Pate', '1'),
	   ( N'-Bát ăn', '2'),
	   ( N'-Vòng cổ dây dắt', '3'),
	   ( N'-Thuốc và dinh dưỡng', '4'),
	   ( N'-Sữa tắm & dụng cụ vệ dinh', '5'),
	   ( N'-Chuồng, nệm và túi vận chuyển', '6'),
	   ( N'-Đồ chơi thú cưng', '7');

INSERT INTO Producer
VALUES ( 'ROYAL CANIN', '1'),
	   ( N'Thương hiệu khác', '2');

INSERT INTO Options
VALUES ( N'-Thức ăn', 'doan.jpg', '1'),
	   ( N'-Bát ăn', 'batan.jpg', '2'),
	   ( N'-Vòng cổ', 'vongco.jpg', '3'),
	   ( N'-Dinh dưỡng', 'thuoc.jpg','4'),
	   ( N'-Sữa tắm', 'suatam.jpg', '5'),
	   ( N'-Chuồng, nệm', 'chuong.jpg', '6'),
	   ( N'-Đồ chơi', 'dochoi.jpg', '7');

INSERT INTO Product
VALUES ( '2', '2', '1', '1', N'Thịt bò viên Funny U cho chó mèo', '100', 'hinh_1.jpg', 'NThịt bò viên là một loại thức ăn giàu chất dinh dưỡng, chứa nhiều protein, vitamin, canxi. Là thức ăn vặt và là loại dụng cụ có thể dùng để huấn luyện các boss vâng lời hơn.','05-18-2024', '05-18-2024', '', '1'),
	   ( '2', '2', '2', '2', N'Bát Ăn Cho Chó Bát Ăn Cho Chó Bát Cơm Poodle', '150', 'hinh_2.jpg', N'Bát ăn cho chó mèo - Bát inox treo chuồng có giá đỡ ( 3 size NHỎ, TRUNG, LỚN) ( 4711734) chén ăn uống cho chó. ','05-18-2024', '05-18-2024', '', '1'),
	   ( '2', '1', '1', '1', N'Royal Canin Poodle Junior 1.5kg Hạt cho chó Poodle', '100', 'hinh_3.jpg', N'Thức ăn cho chó Royal Canin Poodle Junior cho chó Poodlelà thức ăn dành riêng cho giống chó Poodle từ 0 đến 10 tháng tuổi','05-18-2024', '05-18-2024', '', '1'),
	   ( '2', '1', '6', '6', N'Đệm cho chó mèo họa tiết chữ nhật ổ nệm cho thú cưng - Cutepets', '100', 'hinh_4.jpg', N'Đệm vải lông chân chó cho chó mèo - CutePets Phụ kiện thú cưng Pet shop','05-18-2024', '05-18-2024', '', '1'),
	   ( '2', '1', '4', '4', N'Bột Vitamin Bio Hỗ Trợ Tăng Sức Đề Kháng Cho Chó Mèo 5g', '100', 'hinh_5.jpg', N'Bột Vitamin Bio Hỗ Trợ Tăng Sức Đề Kháng Cho Chó Mèo Nhà Bạn','05-18-2024', '05-18-2024', '', '2'),
	   ( '2', '1', '1', '1', N'Thức ăn cho chó trưởng thành Ganador vị cá hồi & gạo Salmon & Rice 20kg', '100', 'hinh_6.jpg', N'Sản phẩm Ganador đảm bảo chó cưng được nuôi dưỡng đầy đủ cả về thể chất lẫn tinh thần để chúng luôn có một cuộc sống mạnh khỏe, dài lâu và hạnh phúc bên bạn.','05-18-2024', '05-18-2024', '', '2'),
	   ( '2', '2', '6', '6', N'Đệm thú Doremon Xanh - Nệm chữ nhật 2 lớp cho thú cưng', '100', 'hinh_7.jpg', N'Đệm thú Doremon Xanh - Nệm chữ nhật 2 lớp - CutePets-Vật liệu: sang trọng + pp bông padding','05-18-2024', '05-18-2024', '', '2'),
	   ( '2', '2', '7', '7', N'Combo đồ chơi cho bé Poodle cảu bạn', '100', 'hinh_8.jpg', N'Đồ chơi không chỉ là món đồ mà nó còn là một người bạn đối với cún yêu của bạn','05-18-2024', '05-18-2024', '', '2'),
	   ( '2', '2', '7', '7', N'Đồ chơi bóng cao su 7 sắc cho chó mèo', '100', 'hinh_9.jpg', N'Bóng huấn luyện chó giúp cải thiện kỹ năng và tương tác của thú cưng bóng này có khả năng nảy và quả bóng bất thường','05-18-2024', '05-18-2024', '', '3'),
	   ( '2', '2', '2', '2', N'Bát ăn nhựa cứng Mèo thần tài', '100', 'hinh_10.jpg', N'Nhà sạch thì mát bát đẹp thì ngon cơmm','05-18-2024', '05-18-2024', '', '3'),
	   ( '2', '2', '5', '5', N'Sữa tắm DORRIKEY cho chó mèo 510ml', '100', 'hinh_11.jpg', N'Với sự hòa quyện từ hoa hồng đỏ của nữ hoàng Anirabet đệ Nhị tạo nên một hương thơm ngào ngat cho cún của bạn','05-18-2024', '05-18-2024', '', '3'),
	   ( '2', '2', '1', '1', N'Cỏ tươi hỗ trợ tiêu hoá và tiêu búi lông cho chó mèo', '100', 'hinh_12.jpg', N'Cho cún ăn cỏ giúp cún yêu bạn dễ tiêu hóa hơn giúp tránh các căn bệnh về hệ tiêu hóa','05-18-2024', '05-18-2024', '', '3');
