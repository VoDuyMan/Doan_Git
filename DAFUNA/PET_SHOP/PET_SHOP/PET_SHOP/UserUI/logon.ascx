<%@ Control Language="C#" AutoEventWireup="true" CodeFile="logon.ascx.cs" Inherits="UserUI_logon" %>
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
        .cart:hover{
            box-shadow: rgba(149, 157, 165, 0.2) 0px 8px 24px;
            cursor: pointer;
            background-color: #c9a783;
        }
        .wheel-and-hamster {
    --dur: 1s;
    position: relative;
    width: 300px;
    height: 300px;
    font-size: 14px;
    
   
}
        }
    </style>
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
            
                <li><a href="Dangnhap.aspx">Đăng nhập</a></li>
                <li> | </li>
                <li><a href="DangKy.aspx">Đăng ký</a></li>
                <li>
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
            <li><H3>Tài khoản</H3></li>
            
            <li><a href="TrangChu.aspx">Trang chủ </a><i class="ti-angle-right"></i><a  href="Dangnhap.aspx" style="color: #C49A6C;"> Tài khoản</a></li>
        </ul>
    </div>
    <div class="form">
        <div class="head">
            <h1>Tài khoản</h1>
            <p>Nếu đã có tài khoản vui lòng đăng nhập tại đây</p>
        </div><br>
        <form action="#" method="POST">
            <asp:Panel ID="pnlLogin" runat="server" DefaultButton="btnSubmit">
            <div class="form-comment">
                <ul>
                    <li>
                        <p>Email: </p> <br>
                        <asp:TextBox runat="server" ID="txtEmail" TextMode="Email" CssClass="form-control"  />
    
                    </li>
                    <li>
                        <p>Mật khẩu: </p> <br>
                        <asp:TextBox runat="server" ID="txtMatKhau" TextMode="Password" CssClass="form-control"  />
                    </li>
                    <li style="font-size: 22px; color:red;margin-left: 320px;margin-top: 10px"> <asp:Label ID="lblMessage" runat="server" Visible="false" ForeColor="Red"></asp:Label>
</li>
                </ul>
                <ul>
                    <li style="margin-top: -40px;">
                        <p style="padding: 5px 0; font-weight:bold">Nhập Email để lấy lại mật khẩu!!</p>
                        <p>Email: </p> <br>
                         <asp:TextBox runat="server" ID="txtMatKhauMoi" TextMode="Email" CssClass="form-control" />
                    </li>
                    <li style="    margin: -18px 0 0 -57px;">
                        <asp:Button ID="Button1" CssClass="btn_contact" runat="server" Text="Gửi đi" OnClick="Button1_Click" />

                    </li>
                    <li>
                        <div aria-label="Orange and tan hamster running in a metal wheel" style="margin-left: 50%; margin-top: -120px;" role="img" class="wheel-and-hamster">
                            <div class="wheel"></div>
                            <div class="hamster">
                                <div class="hamster__body">
                                    <div class="hamster__head">
                                        <div class="hamster__ear"></div>
                                        <div class="hamster__eye"></div>
                                        <div class="hamster__nose"></div>
                                    </div>
                                    <div class="hamster__limb hamster__limb--fr"></div>
                                    <div class="hamster__limb hamster__limb--fl"></div>
                                    <div class="hamster__limb hamster__limb--br"></div>
                                    <div class="hamster__limb hamster__limb--bl"></div>
                                    <div class="hamster__tail"></div>
                                </div>
                            </div>
                            <div class="spoke"></div>
                        </div>
                    </li>
                </ul>
            </div>
            <div class="btns" style="margin-top: -160px;">
                 <asp:Button ID="btnSubmit" Class="btn_contact" runat="server" Text="Đăng nhập" OnClick="btnSubmit_Click" />

          
                <a href="DangKy.aspx">
                    <h2>Đăng ký</h2>
                  </a>
            </div></br> 
           </asp:Panel>
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