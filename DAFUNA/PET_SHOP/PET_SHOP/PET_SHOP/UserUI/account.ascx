<%@ Control Language="C#" AutoEventWireup="true" CodeFile="account.ascx.cs" Inherits="UserUI_account" %>
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
    <link rel="stylesheet" href="./asset/Css/style_dangnhap.css">
    <link rel="stylesheet" href="./asset/fonts/themify-icons-font/themify-icons/themify-icons.css">
    <style>
             .search{
            font-size: 18px;
            padding: 15px 35px 15px 22px;
            margin-left: -16px;
            border-radius: 14px;
            font-weight: 600;
            /* top: 9px; */
            margin-top: 2px;
            width: 100%;
            .cart{
      
            width: 100px;
            height: 76px;
            align-items: center;
            border-radius: 22px;
            display: flex;
            justify-content: center;
            background-color: #C49A6C;

        }
                  .txt{}
        .cart:hover{
            box-shadow: rgba(149, 157, 165, 0.2) 0px 8px 24px;
            cursor: pointer;
            background-color: #c9a783;
        }
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
                   <asp:Textbox runat="server" type="search" class="search-field search-input" placeholder="Tìm kiếm gì cho hôm nay...." 
                    ID="txtSearch"
                    />   
                </li>
                <li class="nav-search"><asp:Button runat="server" class="search" ID="btnSearch" OnClick="btnSearch_Click" Text="Tìm kiếm"></asp:Button></li>
            </ul>
  
        <ul class="subnav">
            <% if (Session["UserToken"] != null)
                {%>
                <li><a href="ThongTin.aspx"><asp:Label ID="lblWelcome" runat="server" Text=""></asp:Label></a> </li>
                 <li>|</li>
                <li ><asp:Button class="txt" style="font-size: 18px; background-color: transparent;border: dotted;    width: 105px;" ID="btnLogout" runat="server" Text="Đăng xuất" OnClick="btnLogout_Click"  /></li>
                <li>
                <%}
                    else
                    { %>
                 <li><a href="Dangnhap.aspx">Đăng nhập</a></li>
                <li> | </li>
                <li><a href="DangKy.aspx">Đăng ký</a></li>
                <li>
                    <%} %>
                    <a href="GioHang.aspx">
                        <div class="cart">
                            <label></label>
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
            
            <li><a href="TrangChu.aspx">Trang chủ </a><i class="ti-angle-right"></i><a  href="ThongTin.aspx" style="color: #C49A6C;"> Thông tin tài khoản</a></li>
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
            <h1>Thông tin tài khoản</h1>
           
        </div><br>
        <form action="#" method="POST">
            <div class="form-comment">
                <ul>
                    <li style="margin-left: 88%;">
                        <asp:FileUpload ID="flAnhDaiDien" runat="server" style="position:absolute;border:none;padding: 130px 130px 0 200px;" />
                        <asp:Image ID="imgCurrentThumbnail" runat="server" style="
                            transform: translateX(10%);
                            height: 159px;
                            border-radius: 5px;
                            width: 160px;
                            " />
                    </li>
                    <li>
                        <p>Tên tài khoản: </p> <br>
                        <asp:TextBox runat="server" Text="" ID="TenTaiKhoan"  CssClass="form-control"></asp:TextBox>
                    </li>
                    
                     <li>
                       <p>Số điện thoại:</p> <br>
                        <asp:TextBox runat="server" Text="" ID="txtSoDienThoai" TextMode="Phone" CssClass="form-control"></asp:TextBox>
    
                    </li>
                    <li>
                       <p>Mật khẩu mới:</p> <br>
                        <asp:TextBox runat="server" Text="" ID="txtMatKhau" TextMode="SingleLine" CssClass="form-control"></asp:TextBox>
    
                    </li>
                </ul>
                
                <ul class="form-right" style="margin-top: 200px;">
                     <li style=" margin-bottom: -20px; float:right">
                        
                         <asp:Button runat="server" Text="Cập nhật" Class="btn_contact" ID="ChinhSua" OnClick="ChinhSua_Click" ></asp:Button>
   
                    </li>
                    <li>
                       <p style=" margin-top: 30px;">Địa chỉ:</p>
                        <asp:TextBox runat="server" Text="" ID="txtDiaChi"  CssClass="form-control"></asp:TextBox>
    
                    </li>
                   
                    <li>
                        <p>Email: </p> <br>
                         <asp:TextBox runat="server" Text="" ID="txtEmail"  CssClass="form-control"></asp:TextBox>
    
                    </li>
                   
                </ul>
                
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
                <li><a href="TinTuc.aspx">TIN TỨC</a></li>
            </ul>
        </div>
        <div class="footer_3">
            <ul>
                <li><h4>TIN KHUYẾN MÃI</h4></li>
               <li><a href="SanPham.aspx">SHOP CHO CÚN</a>
                <li><a href="KhuyenMai.aspx">KHUYẾN MÃI</a></li>
                <li><a href="About.aspx">POODLE SHOP</a></li>
                <li><a href="TinTuc.aspx">TIN TỨC</a></li>
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