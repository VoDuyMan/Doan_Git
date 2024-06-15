<%@ Control Language="C#" AutoEventWireup="true" CodeFile="tintuc_2.ascx.cs" Inherits="UserUI_founder" %>
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
            
            <li><a href="TrangChu.aspx">Trang chủ </a><i class="ti-angle-right"></i><a  href="TinTuc_2.aspx" style="color: #C49A6C;"> Tin tức</a></li>
        </ul>
    </div>
     <!-- Thêm nội dung bài viết vào đây nha đại ca-->
    <div class="content">
        <h2>Cấp cứu chó bị sốc nhiệt tại nhà 08/06/2024</h2>
        <p>Khi quyết định nuôi thú cưng, đặc biệt là chó, bạn cần tìm hiểu những thông tin cơ bản về chế độ dinh dưỡng, một số bệnh dễ gặp,… để có thể chăm sóc pet một cách tốt nhất. Với khí hậu thời tiết ở nước ta, miền Bắc có mùa hè đổ lửa còn miền Nam thì có mùa khô nắng gắt sẽ ảnh hưởng rất nhiều đến sức khỏe của chó. Vì vậy bạn cần biết cách chữa chó sốc nhiệt để không bị lúng túng nếu gặp phải trường hợp này.</p>
        <img src="./img/tintuc_2.jpg" style="width:700px"/></br>
        <h3>Chó cưng bị sốc nhiệt nguyên nhân do đâu?</h3>
        <p>Yếu tố về nhiệt độ chính xác là nguyên nhân hàng đầu dẫn đến việc chó cưng bị sốc nhiệt, cụ thể là:</p>
        <ul>
            <li>Thời tiết quá nóng bức khiến chó hấp thu nhiệt nhanh, bị mất nước.</li>
            <li>Chó phải di chuyển, vận động nhiều giờ liền dưới thời tiết nắng gắt, không được che mát hoặc bù nước thường xuyên.</li>
            <li>Bị bỏ quên trong xe đóng kín cửa.</li>
            <li>Đột ngột gặp nhiệt độ nóng, ví dụ như từ phòng máy lạnh đi ra ngoài.</li>
        </ul>
        <h3>Nhận biết dấu hiệu bị sốc nhiệt ở chó</h3>
        <p>Nhiệt độ quá cao chính là kẻ thù của chó cưng. Bạn cần thực hiện ngay các cách chữa chó sốc nhiệt khi thấy thú cưng có những dấu hiệu, biểu hiện dưới đây:</p>
        <ul>
            <li>Thở nhanh, mạnh hơn bình thường, khó thở. Thè lưỡi liên tục. Khát nước. Cơ thể rất yếu và mệt mỏi, không nhanh nhạy, hoạt bát.</li>
            <li>Chó bị mất phương hướng, đi đứng loạng choạng hoặc ngã quỵ, nằm phịch ngay xuống đất.</li>
            <li>Phần lưỡi có màu đỏ tươi như máu, phần lợi màu nhợt nhạt. Trường hợp nặng hơn lưỡi và lợi sẽ chuyển sang tím tái. Nhiều nước dãi chảy sệt.</li>
            <li>Chảy máu mũi. Nôn ói. Bị hôn mê.</li>
        </ul>
        <h3>Cách chữa chó sốc nhiệt tại nhà</h3>
        <p>Như đã nói, nếu chó bị sốc nhiệt nặng và không được cấp cứu kịp thời sẽ dẫn đến đột quỵ và bị chết ngay sau đó. Không thể luôn luôn phụ thuộc vào bác sĩ thú y, dưới đây là cách chữa chó sốc nhiệt ngay tại nhà mà bạn có thể dễ dàng áp dụng để sơ cứu.</p>
        <ul>
            <li>Lập tức hạ nhiệt khẩn cấp cho chó bằng cách đưa pet vào bóng râm gần nhất, dội nước lạnh vào đầu và thân chó. Nếu không có nước thì nên quạt mát, sử dụng khăn ướt phủ lên mình chó. Lưu ý khi hạ thân nhiệt cho chó không được sử dụng đá cục (viên) hay nước đá vì sẽ làm se nhỏ lỗ chân lông, làm hạ thân nhiệt và khiến tình trạng tồi tệ hơn.</li>
            <li>Cho chó cưng uống thật nhiều nước. Nếu chó không thể tự uống, bạn có thể bơm nước vào miệng chó từ từ. Nhưng cần phải làm cẩn thận để tránh pet bị sặc nước.</li>
            <li>Chườm khăn lạnh ở phần mũi để cầm máu (nếu có). Hoặc sử dụng thuốc cầm máu ở chó nếu nhà bạn sẵn có hoặc gần tiệm thuốc thú ý.</li>
            <li>Thường xuyên quạt mát và làm tơi lông để không khí có thể làm mát cơ thể chú chó.</li>
            <li> <img src="./img/chouongnuoc.jpg" style="width:700px"/></br></li>
        </ul>
        <p>Ngay sau khi thực hiện các bước sơ cứu này tại nhà, bạn cũng nên gọi điện nhờ bác sĩ thú y để được hướng dẫn thêm. Có thể mời bác sĩ đến thăm khám hoặc chờ cún ổn định hơn thì mang đi khám trực tiếp.</p>
        <p>Giờ đây, bạn và cả thú cưng có thể yên tâm hơn trong mùa hè với những kiến thức nhỏ nhưng rất hữu ích về sốc nhiệt ở chó rồi. PAWTY PET SHOP sẽ cung cấp thêm nhiều thông tin cần thiết về chất dinh dưỡng cũng như đời sống cho thú cưng để các Sen cập nhật hàng ngày!</p>
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
