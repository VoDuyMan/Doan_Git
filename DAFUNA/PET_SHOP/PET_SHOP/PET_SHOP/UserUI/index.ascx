<%@ Control Language="C#" AutoEventWireup="true" CodeFile="index.ascx.cs" Inherits="UserUI_index" %>
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

    <link rel="stylesheet" href="./asset/Css/style.css">
    <link rel="stylesheet" href="./asset/fonts/themify-icons-font/themify-icons/themify-icons.css">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">

    <style>
        .container {
            display: flex;
            justify-content: center;
            margin-top: -50px;
        }
        .search{
            font-size: 18px;
            padding: 15px 22px 15px 22px;
            margin-left: -16px;
            border-radius: 14px;
            font-weight: 600;
            /* top: 9px; */
            margin-top: 2px;
        }
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
    <div class="background-header">
    <nav class="d-flex">
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
            <li><a class="active_menu" href="TrangChu.aspx">TRANG CHỦ</a></li>
            <li>
                <a href="SanPham.aspx">SẢN PHẨM</a>
            </li>
            <li><a href="KhuyenMai.aspx">KHUYẾN MÃI</a></li>
            <li><a href="About.aspx">POODLE SHOP</a></li>
            <li><a href="LienHe.aspx">LIÊN HỆ</a></li>
       </ul>
    </div>
    </div>

    <!-- Banner website -->
    <div class="full-banner">
        <!-- <div class="nav-banner">
            <div class="slide-show">
                <div class="list-img">
                    <img class="img-banner" src="./img/banner_2.png" alt="">
                    <img class="img-banner" src="./img/banner_1.png" alt="">
                    <img class="img-banner" src="./img/banner_3.png" alt="">
                </div>
                <div class="btns">
                    <div class="btn-left btn"><i class="ti-angle-left"></i></div>
                    <div class="btn-right btn"><i class="ti-angle-right"></i></div>
                </div>
                <div class="index-img">
                    <div class="index-item index-item-0 active"></div>
                    <div class="index-item index-item-1"></div>
                    <div class="index-item index-item-2"></div>
                </div>
            </div>
        </div> -->
        <div id="carouselExampleIndicators" class="carousel slide" data-ride="carousel">
          <ol class="carousel-indicators">
            <li data-target="#carouselExampleIndicators" data-slide-to="0" class="active"></li>
            <li data-target="#carouselExampleIndicators" data-slide-to="1"></li>
            <li data-target="#carouselExampleIndicators" data-slide-to="2"></li>
          </ol>
          <div class="carousel-inner">
            <div class="carousel-item active">
              <img class="d-block w-100" src="./img/banner_2.png" alt="First slide">
            </div>
            <div class="carousel-item">
              <img class="d-block w-100" src="./img/banner_1.png" alt="Second slide">
            </div>
            <div class="carousel-item">
              <img class="d-block w-100" src="./img/banner_3.png" alt="Third slide">
            </div>
          </div>
          <a class="carousel-control-prev" href="#carouselExampleIndicators" role="button" data-slide="prev">
            <span class="carousel-control-prev-icon" aria-hidden="true"></span>
            <span class="sr-only">Previous</span>
          </a>
          <a class="carousel-control-next" href="#carouselExampleIndicators" role="button" data-slide="next">
            <span class="carousel-control-next-icon" aria-hidden="true"></span>
            <span class="sr-only">Next</span>
          </a>
        </div>
        <div class="content-banner">
            <ul>
                <li>
                    <p class="icon-baner"> <i class="ti-star icon-baner"></i></p>
                    <h2>Sản phẩm độc đáo, sáng tạo</h2>
                    <p>---------</p>
                    <p>Các sản phẩm được thiết kế và sản xuất độc quyền bởi Poodle pet Shop</p>
                </li>  
                <li>
                    <p class="icon-baner"><i class="ti-world icon-baner"></i></p>
                    <h2>Giao hàng trên toàn quốc</h2>
                    <p>---------</p>
                    <p>Chúng tôi nhận giao hàng trên toàn quốc đối với các sản phẩm tại cửa hàng</p>
                </li>
                <li>
                    <p class="icon-baner"><i class="ti-money icon-baner"></i></p>
                    <h2>Giá thành tốt nhất</h2>
                    <p>---------</p>
                    <p>Đảm bảo giá thành tốt nhất trên thị trường</p>
                </li>
            </ul>
        </div>
    </div>
    <script src="./index.js"></script>
    <!-- Sản phẩm 1 -->
    <div class="main-content">
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
        </div>
        <div class="main-content-right">
            <h3>SẢN PHẨM NỔI BẬT</h3>
            <!-- Product 1 -->
            <div class="d-flex flex-wrap">
                    <%for (int i = 0; i < ListSP.Count; i++)
                        {
                            if ((i + 1) % 4 == 0)
                            { %>
                    <div></div>

                    <%     }   %>
                    <div class="product">
                        <a href='<%="CTSP.aspx?id="+ ListSP[i].id%>'>
                            <div style="width:100%; height: 300px;">

                            <img style="width:100%; height:100%; display:block;" class="img" src='<%="./img/" + ListSP[i].thumbnail%>' alt="Sản phẩm 1">
                            </div>
                            <p style="overflow: hidden; padding: 0 20px; text-overflow: ellipsis; white-space: nowrap; color: #000"><%=ListSP[i].title%></p>
                            <p>Giá: $<%=ListSP[i].price%></p>
                        </a>
                    </div>
        <%} %>
                </div>

            <!-- Product 2 -->
           
        </div>
    </div>
    <div class="baner-mid">
        <ul>
            <li><a href="#"><img src="./img/banner_2.png" alt=""></a></li>
            <li><a href="#"><img src="./img/banner_3.png" alt=""></a></li>
        </ul>
    </div>
    <!-- Product news -->
    <div class="main-news">
        <h3 id="NEW">TIN TỨC</h3>
        <section class="list-news">
            <div class="product news-product">
                <a href="TinTuc_1.aspx">

                    <img class="img" src="./img/tintuc_1.jpg" alt="Tin tức 1">
                    <p>CÁCH XỬ LÝ KHI CHÓ MÈO BỊ BỆNH TẠI NHÀ?</p>
                    <p></p>
                
                </a>
            </div>
    
            <div class="product news-product">
                <a href="TinTuc_2.aspx">
                     <img class="img" src="./img/tintuc_2.jpg" alt="Tin tức 2">
                    <p>CẤP CỨU CHÓ BỊ SÓC NHIỆT TẠI NHÀ</p>
                    <p></p>
                </a>
                
            </div>
            <div class="product news-product">
                <a href="TinTuc_3.aspx">
                    <img class="img" src="./img/tintuc_3.jpg" alt="Tin tức 3">
                    <p>CÓ THỂ BẠN CHƯA BIẾT "NHỮNG LỢI ÍCH CỦA VIỆC NGỦ VỚI THÚ CƯNG</p>
                    <p></p>
                </a>
                
            </div>
        </section>
    </div>
    <footer class="d-flex" style="line-height:20px">
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
                <li><a href="#NEW">TIN TỨC</a></li>
            </ul>
        </div>
        <div class="footer_3">
            <ul>
                <li><h4>TIN KHUYẾN MÃI</h4></li>
                <li><a href="SanPham.aspx">SHOP CHO CÚN</a>
                <li><a href="KhuyenMai.aspx">KHUYẾN MÃI</a></li>
                <li><a href="About.aspx">POODLE SHOP</a></li>
                <li><a href="#NEW">TIN TỨC</a></li>
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

    <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.12.9/dist/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
</body>
</html>
