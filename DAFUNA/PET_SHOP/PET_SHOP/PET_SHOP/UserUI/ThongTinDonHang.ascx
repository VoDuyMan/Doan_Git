<%@ Control Language="C#" AutoEventWireup="true" CodeFile="ThongTinDonHang.ascx.cs" Inherits="UserUI_ThongTinDonHang" %>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="icon" sizes="70x70" href="./img/icon.png" />
    <title>Poodle Pet Shop</title>
    <link rel="stylesheet" href="./asset/Css/style_cart.css">
    <link rel="stylesheet" href="./asset/fonts/themify-icons-font/themify-icons/themify-icons.css">
    <style>
        .search{
                            background-color: #C49A6C;
                border-radius: 13px;
                border: 0px solid;
                padding: 15px 22px 15px 22px;
                margin-top: 0px;
                margin-left: -20px;
                font-size: 16px;
                color: #fff;
        }
          .txt{font-size: 18px; background-color: transparent;border: dotted;}
          .modal-tong ul{
              margin-right: -100px;
          }
          modal-close:hover {
    background-color: initial;
    color: initial;
    border-color: initial;
    text-decoration: none; /* Loại bỏ gạch chân của liên kết khi hover */
    /* Bỏ các thuộc tính khác nếu cần */
}
          .close{
                  border: none;
                  background-color: transparent;
          }
          .cart{
      
            width: 100px;
            height: 50px;
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
        .TrangThai {
    font-size: 20px;
    margin-left: 60px;
    width:150px;
   
}
    </style>

</head>

<body>
    <nav>
        <header>
            <a href=""><img class="logo-shop" src="./img/logo_Shop.png" alt=""></a>
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
                <li ><asp:Button class="txt" ID="btnLogout" runat="server" Text="Đăng xuất" OnClick="btnLogout_Click"  /></li>
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
                            <i style="font-size: 2.5rem;"class="ti-shopping-cart button-cart" ></i>
                        </div>
                    </a>
                </li>
        </ul>
    </nav>
    <div class="container" style="font-weight: bold;">
        <ul>
            <li><a href="TrangChu.aspx">TRANG CHỦ</a></li>
            <li>
                <a class="active-menu" href="SanPham.aspx">SẢN PHẨM</a></i>
            </li>
            <li><a href="KhuyenMai.aspx">KHUYẾN MÃI</a></li>
            <li><a href="About.aspx">POODLE SHOP</a></li>
            <li><a href="LienHe.aspx">LIÊN HỆ</a></li>
        </ul>
    </div>
    </div>
    <div>
        <div class="banner_sp">
            <ul>
                <li>
                    <H3>Trang thông tin đơn hàng</H3>
                </li>
                <li><a href="TrangChu.aspx">Trang chủ </a><i class="ti-angle-right"></i><a href="DonHang.aspx"
                        style="color: #C49A6C;"> Đơn hàng</a></li>
            </ul>
        </div>
    </div>
    <!-- Giỏ hàng -->
    <!-- Giỏ hàng -->
  <div class="modal js-modal" id="show-modal">
    <div class="modal-container">
        <header class="modal-header">
            <i class="ti-check check"></i>
            Sản phẩm đã đặt hàng
        </header>
        <div class="modal-body" style="">
            <div style="padding: 8px">
                <asp:Repeater ID="rptCartItems" runat="server" OnItemCommand="rptCartItems_ItemCommand1">
                    <HeaderTemplate>
                        <!-- HeaderTemplate: Thẻ mở đầu của Repeater -->
                    </HeaderTemplate>
                    <ItemTemplate>
                        <!-- ItemTemplate: Thẻ cho mỗi mục trong Repeater -->
                        <div style="display:flex; justify-content:center; align-items:center">
                            <div class="name-product">
                                <div class="modal-close">
                                  
                                </div>
                                <div class="image">
                                    <img src='./img/<%# Eval("thumbnail") %>' alt="">
                                    <a href=""><%# Eval("title") %></a>
                                </div>
                            </div>
                            <div class="soluong modal-soluong">
                                <input type="text" id="amount" name="amount" value='<%# Eval("quantity") %>'>
                            </div>
                            <h5>$<%# Eval("Total_money") %></h5>
                            <div class="TrangThai" style=" color: <%# GetStatusText(Eval("status")).Color %>;   "> <%# GetStatusText(Eval("status")).Text %></div>
                        </div>
                    </ItemTemplate>
                    <FooterTemplate>
                        <!-- FooterTemplate: Thẻ kết thúc của Repeater -->
                    </FooterTemplate>
                </asp:Repeater>
            </div>
        </div>
        <div class="modal-tong">
            <H6>GIỎ HÀNG CỦA BẠN</H6>
            <ul>
                <li>Tổng thanh toán:</li>
                <li style="font-size: 30px; color: #f7941d;font-weight: 700;">$<asp:Label ID="lblTotalMoney" runat="server"></asp:Label></li>
            </ul>
        </div>
        <div class="bnts">
           
        </div>
    </div>
</div>
    <!-- footer  -->
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
                <li>
                    <h4>VỀ CHÚNG TÔI</h4>
                </li>
               <li><a href="SanPham.aspx">SHOP CHO CÚN</a>
                <li><a href="KhuyenMai.aspx">KHUYẾN MÃI</a></li>
                <li><a href="About.aspx">POODLE SHOP</a></li>
                <li><a href="#">TIN TỨC</a></li>
            </ul>
        </div>
        <div class="footer_3">
            <ul>
                <li>
                    <h4>TIN KHUYẾN MÃI</h4>
                </li>
               <li><a href="SanPham.aspx">SHOP CHO CÚN</a>
                <li><a href="KhuyenMai.aspx">KHUYẾN MÃI</a></li>
                <li><a href="About.aspx">POODLE SHOP</a></li>
                <li><a href="#">TIN TỨC</a></li>
        </div>
        <div class="footer_4">
            <ul>
                <li>
                    <h4>LIÊN HỆ</h4>
                </li>
                <li class="call"><a href="tel:+84 899022913">Hotline:0899022913 </a></li>
                <li><a href="mailto:voduyman21112003@gmail.com"></a>Email: <input type="text"></li>
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