﻿<%@ Control Language="C#" AutoEventWireup="true" CodeFile="create_acount.ascx.cs" Inherits="UserUI_create_acount" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link
    rel="icon"
    sizes="70x70"
    href="./img/icon.png"
/>
    <title>Poodle Pet Shop</title>
    <link rel="stylesheet" href="./asset/Css/style_dangky.css">
    <link rel="stylesheet" href="./asset/fonts/themify-icons-font/themify-icons/themify-icons.css">
    <style>
        .cart{
      
            width: 20px;
            height: 40px;
            align-items: center;
            border-radius: 22px;
            display: flex;
            justify-content: center;
            background-color: #C49A6C;

        }
        .cart:hover{
            box-shadow: rgba(149, 157, 165, 0.2) 0px 8px 24px;
            cursor: pointer;
            background-color: #c9a783;
        }
    </style>
    <script>
        document.addEventListener('DOMContentLoaded', function () {
            var phoneInput = document.getElementById('<%= txtSoDienThoai.ClientID %>');
            
            phoneInput.addEventListener('input', function (e) {
                var value = phoneInput.value;
                var isValid = /^\d{0,11}$/.test(value);
                
                if (!isValid) {
                    phoneInput.setCustomValidity('Số điện thoại chỉ được chứa chữ số và phải có độ dài từ 10 đến 11 ký tự.');
                } else {
                    phoneInput.setCustomValidity('');
                }
            });
        });
    </script>
</head>
<body>
    <div class="background-header">
    <nav>
            <header>
                <a href="TrangChu.aspx"><img class="logo-shop" src="./img/logo_Shop.png" alt=""></a>  
            </header>
            <ul>
                <li>
                    <input type="text" class="search-input" placeholder="Tìm kiếm gì cho hôm nay....">
                </li>
                <li class="nav-search"><a href=""><button class="search"><i class=" ti-search" ></i></button></a></li>
            </ul>
  
        <ul class="subnav">
                <li><a href="Dangnhap.aspx">Đăng nhập</a></li>
                <li> | </li>
                <li><a href="DangKy.aspx">Đăng ký</a></li>
                <li>
                    <a href="GioHang.aspx">
                        <div class="cart">
                     
                            <i style="font-size: 2.5rem;"class="ti-shopping-cart button-cart" ></i>
                        </div>
                    </a>
                </li>
        </ul>
    </nav>
    <div class="container" style="font-weight: bold;">
        <ul>
            <li><a class="active_menu"href="TrangChu.aspx">TRANG CHỦ</a></li>
            <li>
              <a href="SanPham.aspx">SẢN PHẨM</a>
          </li>
            <li><a href="KhuyenMai.aspx">KHUYẾN MÃI</a></li>
            <li><a href="About.aspx">POODLE SHOP</a></li>
            <li><a href="LienHe.aspx">LIÊN HỆ</a></li>
          </ul>
    </div>
    </div>
    <div class="banner_sp">
        <ul>
            <li><H3>Tạo tài khoản</H3></li>
            
            <li><a href="TrangChu.aspx">Trang chủ </a><i class="ti-angle-right"></i><a  href="DangKy.aspx" style="color: #C49A6C;"> Tạo tài khoản</a></li>
        </ul>
    </div>
    <!-- <div class="content-account">
        <h1>Tạo tài khoản</h1>
        <p>Nếu chưa có tài khoản vui lòng đăng kí tại đây</p>
        <div class="form-account">
            <div class="form">
                <label for="name">Họ:</label>
               <input type="text" id="ho" name="name" required>
   
               <label for="name">Tên:</label>
               <input type="text" id="ten" name="name" required>
            </div>
            <div class="form">
                <label for="email">Email:</label>
               <input type="email" id="email" name="email" required>
   
               <label for="text">Mật khẩu:</label>
               <input type="text" id="matkhau" name="text" required>
            </div>
    
        </div>
    </div> -->
    <div class="form">
        <div class="head">
            <h1>Tạo tài khoản</h1>
            <p>Nếu chưa có tài khoản vui lòng đăng kí tại đây</p>
        </div><br>
        <form action="#" method="POST">
            <div class="form-comment">
                <ul>
                    <li>
                        <p>Họ: </p> <br>
                        <asp:TextBox runat="server" ID="txtHo" TextMode="SingleLine" CssClass="form-control" required="required" />
    
                    </li>
                    <li>
                        <p>Tên: </p> <br>
                        <asp:TextBox runat="server" ID="txtTen" TextMode="SingleLine" CssClass="form-control" required="required" />
                    </li>
                     <li>
                       <p>Số điện thoại:</p> <br>
                         <asp:TextBox runat="server" ID="txtSoDienThoai" TextMode="Phone" CssClass="form-control" required="required" />
                    </li>
                    <li style="font-size: 22px"> <asp:Label ID="lblMessage" runat="server"></asp:Label></li> 
                </ul>
                
                <ul class="form-right">
                    <li>
                       <p>Địa chỉ:</p> <br>
                         <asp:TextBox runat="server" ID="txtDiaChi" TextMode="SingleLine" CssClass="form-control" required="required" />
                    </li>
                   
                    <li>
                        <p>Email: </p> <br>
                         <asp:TextBox runat="server" ID="txtEmail" TextMode="Email" CssClass="form-control" required="required" />
                    </li>
                    <li>
                       <p>Mật khẩu:</p> <br>
                         <asp:TextBox runat="server" ID="txtMatKhau" TextMode="Password" CssClass="form-control" required="required" />
                    </li>

                    
                </ul>
                
            </div>
             
            <div class="btns">

                  <asp:Button ID="btnSubmit" Class="btn_contact" runat="server" Text="Đăng ký" OnClick="btnSubmit_Click"/>

                  <a href="Dangnhap.aspx">
                    <h2>Đăng nhập</h2>
                  </a>
              
            </div>
        </form>
    </div>
    <footer>
        <div class="footer_1">
            <ul>
                <li><button class="button-footer"><img src="./img/logo_Shop.png" alt=""></button></li>
                <li>Trụ sở chính: DNC University, Phong Điền, Cần Thơ, Vietnam</li>
                <li class="call"><a href="tel:+84 899022913">Hotline: 0899022913</a></li>
                <li><a href="mailto:voduyman2111@gmail.com">Email: voduyman2111@gmail.com</a></li>
            </ul>
        </div>
        <div class="footer_2">
            <ul>
                <li><h4>VỀ CHÚNG TÔI</h4></li>
                <li><a href="SanPham.aspx">SHOP CHO CÚN</a>
                <li><a href="KhuyenMai.aspx">KHUYẾN MÃI</a></li>
                <li><a href="About.aspx">POODLE SHOP</a></li>
                <li><a href="#">TIN TỨC</a></li>
            </ul>
        </div>
        <div class="footer_3">
            <ul>
                <li><h4>TIN KHUYẾN MÃI</h4></li>
                <li><a href="SanPham.aspx">SHOP CHO CÚN</a>
                <li><a href="KhuyenMai.aspx">KHUYẾN MÃI</a></li>
                <li><a href="About.aspx">POODLE SHOP</a></li>
                <li><a href="#">TIN TỨC</a></li>
        </div>
        <div class="footer_4">
            <ul>
                <li><h4>LIÊN HỆ</h4></li>
                <li class="call"><a href="tel:+84 899022913">Hotline:0899022913 </a></li>
                
                <li>
                    <ul class="icons">
                        <li><a href="https://www.facebook.com/vo.man.9809"><i class="ti-facebook"></i></a></li>
                        <li><a href="https://www.youtube.com/channel/UCKdg0ZnCYpBvI1K1ig-l-1g"><i class="ti-youtube"></i></a></li>
                        <li><a href="https://www.tiktok.com/@vduyman03"><i class="ti-reddit"></i></a></li>
                    </ul>
                </li>
            </ul>
        </div>
    </footer>
</body>
</html>