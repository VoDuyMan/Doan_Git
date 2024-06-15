<%@ Control Language="C#" AutoEventWireup="true" CodeFile="search.ascx.cs" Inherits="UserUI_search" %>
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
    <title>Trang sản phẩm</title>
    <link rel="stylesheet" href="./asset/Css/style_sanpham.css">
    <link rel="stylesheet" href="./asset/fonts/themify-icons-font/themify-icons/themify-icons.css">
    <style>
            .txt{font-size: 18px; background-color: transparent;border: dotted;}
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
    </style>
</head>
<body>
    <nav>
        <header>
            <a href="TrangChu.aspx"><img class="logo-shop" src="./img/logo_Shop.png" alt=""></a>  
        </header>
        


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
                            <label></label>
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
            <a class="active-menu" href="SanPham.aspx">SẢN PHẨM</a>
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
            <li><H3>Trang sản phẩm</H3></li>
            
            <li><a href="TrangChu.aspx">Trang chủ </a><i class="ti-angle-right"></i><a  href="SanPham.aspx" style="color: #C49A6C;">Tìm kiếm</a></li>
        </ul>
    </div>
        <div class="content-dmsp">
            <% for (int i = 0; i < ListDMOption.Count; i++)
                {
            %>
            <div class="dmsp">
                <ul>
                    <li>
                        <img src='<%="./img/" + ListDMOption[i].thumbnail%>' alt=""></li>
                    <li><a href="<%="DMSP.aspx?id="+ListDMOption[i].id%>"><%=ListDMOption[i].name%></a></li>
                </ul>
            </div>
            <%} %>
            
           
        </div>
        <div class="main-content">
            <!-- List danh mục bên trái -->
            <div class="main-content-left">
                <div class="menu-main">
                    <p>Danh mục sản phẩm</p>
                    <ul>
                          <% for (int i = 0; i < ListDMMenu.Count; i++)
                                        {
                        %>
                        <li>
                            <a href="<%="DMSP.aspx?id="+ListDMMenu[i].id%>"><%=ListDMMenu[i].name %></a>
                        </li>
                        <%} %>
                    </ul>
                </div>
                <div class="menu-main">
                    <p>Thương hiệu</p>
                    <ul>
                          <% for (int i = 0; i < ListDMThuonghieu.Count; i++)
                                        {
                        %>
                        <li>
                            <a href="<%="DMSP.aspx?id="+ListDMThuonghieu[i].id%>"><%=ListDMThuonghieu[i].name %></a>
                        </li>
                        <%} %>
                    </ul>
                </div>
                <div class="menu-main">
                    <p>Khoảng giá</p>
                    <ul>
                        <li><a href="">$100 - $200</a></li>
                        <li><a href="">$200 - $300</a></li>
                        <li><a href="">$300 - $400</a></li>
                        <li><a href="">$400 - $500</a></li>
                    </ul>
                </div>
            </div>
            <div class="main-content-right main-sp">
                <h3>Sản phẩm cho cún </h3>
                <!-- Product 1 -->
                <section>
                    <%for (int i = 0; i < ListSP.Count; i++)
                        {
                            if ((i + 1) % 4 == 0)
                            { %>
                    <div></div>

                    <%     }   %>
                    <div class="product" style="width: 24%;  ">
                        <a href='<%="CTSP.aspx?id="+ ListSP[i].id%>'>
                            <div style="width:100%; height: 300px;">

                            <img style="width:100%; height:100%; display:block;" class="img" src='<%="./img/" + ListSP[i].thumbnail%>' alt="Sản phẩm 1">
                            </div>
                            <h2 style=" overflow: hidden; padding: 0 20px; text-overflow: ellipsis; white-space: nowrap;"><%=ListSP[i].title%></h2>
                            <p>Giá: $<%=ListSP[i].price%></p>
                        </a>
                    </div>
        <%} %>
                </section>
               
            </div>
        </div>
</div>
<footer>
    <div class="footer_1">
        <ul>
            <li><button class="button-footer"><a href="contact.html"><img src="./img/logo_Shop.png" alt=""></a></button></li>
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