<%@ Control Language="C#" AutoEventWireup="true" CodeFile="tintuc_3.ascx.cs" Inherits="UserUI_founder" %>
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
        .content{
    font-size: 26px; margin: 5px 80px;
   
}
.content p{
    line-height: 3rem;
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
            <li><H3>Trang tin tức</H3></li>
            
            <li><a href="TrangChu.aspx">Trang chủ </a><i class="ti-angle-right"></i><a  href="TinTuc_3.aspx" style="color: #C49A6C;"> Tin tức</a></li>
        </ul>
    </div>
     <!-- Thêm nội dung bài viết vào đây nha đại ca-->
    <div class="content">
        <h2>Có thể bạn chưa biết “Những lợi ích của việc ngủ với thú cưng” 08/06/2024</h2>
        <p>Theo một nghiên cứu của Đại học Canisius, New York dựa trên việc khảo sát gần 1.000 phụ nữ Mỹ về thói quen ngủ phát hiện, việc ngủ cùng thú cưng mang lại giấc ngủ ngon hơn cả. Đặc biệt là với chó cưng vì chúng mang đến cảm giác thoải mái, an toàn.</p>
        <p>Theo đó 57% số người được khảo sát cho biết họ ngủ chung giường với bạn đời, 55% ngủ cùng chó và 31% với mèo. Kết quả cho thấy những phụ nữ ngủ với chó có giấc ngủ ngon nhất.</p>
        <img src="./img/tintuc_3.jpg" style="width:700px"/></br>
        <h3>Có bao nhiêu người ngủ cùng thú cưng?</h3>
        <p>Có một khảo sát năm 2019 của American Pet Product chỉ ra rằng có 41% các em chó size trung bình và 62% em mèo ngủ cùng với chủ.</p>
        <p>Từ đó có thể thấy thú cưng càng bé thì ngủ với người càng nhiều. Và có chung quy có gần một nửa số người nuôi thú cưng ngủ cùng pet của mình.</p>
        <h3>Ngủ cùng thú cưng có ích gì?</h3>
        <p>Đương nhiên với từng cá thể thú cưng khác nhau thì người nuôi cũng sẽ có các trải nghiệm khác nhau. Ngoại trừ các trường hợp như dị ứng lông chó mèo,… thì nghiên cứu đã chỉ ra những lợi ích về sức khỏe tổng thể đáng kể với những người nuôi chó mèo.</p>
        <p>Cụ thể, họ có cơ hội vận động nhiều hơn, đặc biệt với những người nuôi chó. Ngoài ra, họ cũng có thái độ cởi mở và tích cực hơn với khu vực mình đang sinh sống, gắn kết hơn với mọi người xung quanh.</p>
        <p>Bên cạnh đó việc nuôi thú cưng có liên quan đến những lợi ích như giảm huyết áp, giảm cholesterol, giảm triệu chứng căng thẳng và cô đơn. Và ở mèo cũng có những đặc điểm đặc biệt giúp giảm nguy cơ mắc bệnh cho chủ nhân. Nhiều người thực sự tìm thấy sự thoải mái và cảm giác an toàn khi ngủ với thú cưng của họ.</p>
        <p>Nghiên cứu của Đại học Alberta cho biết, với người mắc chứng đau mãn tính, ngủ cùng các em chó sẽ giúp:</p>
        <ul>
            <li>Điều chỉnh giấc ngủ vì mức độ căng thẳng của người bệnh giảm xuống</li>
            <li>Giúp người bệnh có cơ hội tiếp xúc với nắng sớm khi dắt thú cưng ra ngoài</li>
        </ul>
        <p>Một nghiên cứu được công bố trên tạp chí Mayo Clinic Proceedings năm 2017 cũng cho thấy chó có thể làm tăng hiệu suất giấc ngủ của con người khoảng 83% (trên 80% là đạt)</p>
        <p>Từ đó chúng ta có thể thấy việc đi ngủ với thú cưng mang lại lợi ích rất lớn cho sức khỏe cho chính bạn cũng như thú cưng. Đừng ngần ngại mà hãy thử xem hiệu quả thực sự thế nào nhé!</p>
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
