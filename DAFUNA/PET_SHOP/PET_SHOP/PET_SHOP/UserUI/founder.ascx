<%@ Control Language="C#" AutoEventWireup="true" CodeFile="founder.ascx.cs" Inherits="UserUI_founder" %>
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
    <title>Về chúng tôi</title>
    <link rel="stylesheet" href="./asset/Css/style_about.css">
    <link rel="stylesheet" href="./asset/fonts/themify-icons-font/themify-icons/themify-icons.css">
     <style>
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
</head>
<body>
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
            <a href="SanPham.aspx">SẢN PHẨM</a></i>
        </li>
        <li><a  href="KhuyenMai.aspx">KHUYẾN MÃI</a></li>
        <li><a class="active-menu" href="About.aspx">POODLE SHOP</a></li>
        <li><a href="LienHe.aspx">LIÊN HỆ</a></li>
        </ul>
    </div>

    <div class="banner_sp">
        <ul>
            <li><H3>Trang poodle shop</H3></li>
            
            <li><a href="TrangChu.aspx">Trang chủ </a><i class="ti-angle-right"></i><a  href="About.aspx" style="color: #C49A6C;"> Poodle Shop</a></li>
        </ul>
    </div>
    <main style="    margin: 0 44px;">
        <section class="about">
            <h2>Giới thiệu</h2>
            <p>Poddle Pet Shop là điểm đến lý tưởng cho những người yêu thú cưng và muốn chăm sóc họ như một phần của gia đình. Với niềm đam mê và tình yêu dành cho các loài vật, chúng tôi đã cam kết cung cấp những sản phẩm chất lượng và dịch vụ tốt nhất cho cộng đồng thú cưng.</p>
            <p>Tại Poddle Pet Shop, chúng tôi hiểu rằng thú cưng không chỉ là những vật nuôi, mà còn là bạn đồng hành, người bạn trung thành trong cuộc sống hàng ngày. Do đó, chúng tôi mong muốn tạo ra một môi trường mua sắm an toàn và thân thiện, nơi mọi người có thể tìm thấy những sản phẩm phù hợp và chăm sóc tốt nhất cho thú cưng của họ.</p>
            <p>Với một bộ sưu tập đa dạng từ đồ chơi, thức ăn, đồ dùng vệ sinh, đến phụ kiện thời trang và dịch vụ spa, Poddle Pet Shop đảm bảo đáp ứng mọi nhu cầu của thú cưng và chủ nhân. Đội ngũ nhân viên chuyên nghiệp và tận tâm của chúng tôi sẵn lòng hỗ trợ và tư vấn bạn trong việc lựa chọn những sản phẩm phù hợp nhất với loài vật của bạn.</p>
            <p>Hãy đến với Poddle Pet Shop và khám phá không gian mua sắm đẳng cấp dành cho thú cưng của bạn. Chúng tôi tin rằng, mỗi lần đến đây, bạn sẽ mang về nhà những trải nghiệm mới mẻ và niềm vui không ngừng cho cả gia đình và thú cưng của bạn.</p>
            <h2>Người sáng lập</h2>
        </section>
        
        <section class="founders">
            <div class="founder">
                <img src="./img/fouder_1.png" alt="Người sáng lập 1">
                <h3>Võ Duy Mẫn</h3>
                <p>CEO</p>
            </div>
            <div class="founder">
                <img src="./img/fouder_2.png" alt="Người sáng lập 2">
                <h3>Trương Thanh Lực</h3>
                <p>COO</p>
            </div>
        </section>
    </main>
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
                <li><a href="mailto:voduyman21112003@gmail.com"></a>Email: <input type="text"></li>
                <li>
                    <ul class="icons">
                        <li><a href="https://www.facebook.com/vo.man.9809"><i class="ti-facebook"></i></a></li>
                        <li><a href="https://www.youtube.com/channel/UCKdg0ZnCYpBvI1K1ig-l-1g"><i class="ti-youtube"></i></a></li>
                        <li><a href="https://www.facebook.com/vo.man.9809"><i class="ti-reddit"></i></a></li>
                    </ul>
                </li>
            </ul>
        </div>
    </footer>
</body>
</html>