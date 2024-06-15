<%@ Control Language="C#" AutoEventWireup="true" CodeFile="contact.ascx.cs" Inherits="UserUI_contact" %>
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
    <title>Trang liên hệ</title>
    <link rel="stylesheet" href="./asset/fonts/themify-icons-font/themify-icons/themify-icons.css">
    <style>
        body {
            font-family:  "Product Sans";
            margin: 0;
            padding: 0;
            box-sizing: border-box;
            
        }
        ul{
            list-style-type: none;
        }
        a{
            text-decoration: none;
            color:#000;
        }
        img {
            object-fit: cover;
        }
        nav img {
        width: 300px;
        }
        header {
            padding: 16px;
        }
        /* .background-header{
            padding-bottom: 10px;
            background-color: #C49A6C;
        } */
        nav a{
            text-decoration: none;
            font-size: 1.5rem;
            line-height: 100%;
        }
        
        nav a img {
            width: 400px;
            margin-top: 1px;
        }
        nav li:hover a{
            color: #c0b523 ;
            cursor: pointer;
        }
        nav ul{
            list-style-type: none;
            display: flex;
            justify-content: flex-end;
            align-items: center;
            width:640px;
        }
        ul li{
            padding: 20px 24px;
           
        }
        nav {
            display: flex;
            justify-content: space-around;
            width: 100%;
            padding: 5px;
            margin-top: -25px;
        }
        .subnav li{
            padding: 20px 24px;
            font-size: 1.5rem;
        }
        .subnav li:hover{
            color: #c0b523;
            cursor: pointer;
            border-radius: 5%;
        }
        .search-container {
            position: relative;
            display: inline-block;
            margin: 40px 0;
        }
        .nav-search{
         
            padding-left: 0px;
            font-weight: 700px;
        }
        .search-input {
            padding: 10px;
            height:50px;
            width: 600px;
            border: 3px solid #C49A6C;;
            border-radius: 10px;
            outline: none;
            display: flex;
            align-items: centter;
            font-size: 1rem;
        }
        /* Css cho danh sách Mneu */
            .container {
                display: flex;
                justify-content: center;
            }
            .container ul {
                display: flex;
                justify-content: space-around;
                margin-top: -30px;
            }
            .container ul li {
                padding: 0 20px;
                font-size: 1.5rem;
            }
        .container ul li a:hover {
            cursor: pointer;
            color: #c0b523 ;
        }
        .search {
            background-color: #C49A6C;
            border-radius: 50%;
            border: 0px solid;
            padding: 30px 30px 27px 35px;
            margin-top: 8px;
            margin-left: -55px;
            font-size: 28px;
            color: #fff;
        }
        .search:hover{
            box-shadow: rgba(149, 157, 165, 0.2) 0px 8px 24px;
            cursor: pointer; 
            background-color: #c9a783;
            transition: calc(0.5s);   
        }
        .cart {
            padding: 17px 40px;
            border: 1px solid #ccc;
            border-radius: 8%;
            margin-bottom: 20px;
            font-size: 1.3rem;
            background-color: transparent;
            background-color: #C49A6C;
        
        }
        .button-cart {
            color:#fff;
        }
        .cart:hover{
            box-shadow: rgba(149, 157, 165, 0.2) 0px 8px 24px;
            cursor: pointer;    
            background-color: #c9a783; 
            transition: calc(0.5s);   
        }
        .active-menu{
            color: #C49A6C;
        }
            /*Banner */
        .banner_sp  {
            margin-top: 18px;
            width: 100%;
            min-height: 300px;
            background-size: cover;
            background-image: url(./asset/Css/banner_sanpham.jpg);
            position: relative;
            display: flex;
            text-align: center;
            justify-content: center;
        }
        .banner_sp h3 {
            font-size: 3rem;
            color: #fff;
            margin-bottom: -22px;
        }
        
        .banner_sp ul li a {
            font-size: 26px;
            color: #fff;
        
        }
        .banner_sp ul li a:hover{
            color: #C49A6C;
        }
        .ti-angle-right {
            font-size: 1rem;
            color: #fff;
        
        }
        .active_b {
            color: #C49A6C;
        }
        /* Csss liên hệ */
        .container_contacts {
            display: flex;
            justify-content: center;
            align-items: center;
            margin: 50px 200px;
            gap: ;
           
        }
        .map{
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            border: 2px solid #ccc;
            border-radius: 8px;
        }
        
        .form{
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            max-width: 100%;
            margin: 50px ;
            padding: 20px;
            background-color: #fff;
            border-radius: 8px;
            display: grid;
            
        }
        
        h1 {
            text-align: center;
            margin-bottom: 20px;
           width: 500px;
        }
        
        label {
            font-weight: bold;
            margin-bottom: 5px;
        }
        
        input, textarea {
            padding: 10px;
            margin-bottom: 15px;
            border: 1px solid #ccc;
            border-radius: 4px;
        }
        .btn_contact {
            padding: 10px 20px;
            background-color: #C49A6C;
            color: #fff;
            border: none;
            border-radius: 4px;
            cursor: pointer;
        }
        .btn_contact:hover {
            background-color: #cb8840;
        }
        
        /* Css cho footer */
        footer{
            margin-top: 50px;
            width: 100%;
            height: 300px;
            font-size: 1.5rem;
            padding-bottom: 150px;
        }
        footer {
            display: flex;
            justify-content: space-around;
            border-top: 1px solid #ccc;
        }
        
        .footer_1 img{ 
            width: 310px;
            height: 100px;
          
        }
        footer h4{
            color: #C49A6C;
        }
        footer ul li a:hover{
            color: #C49A6C;
        
        }
        .footer_4 input{
            border: 1px solid #000;
            padding: 12px 18px 12px 12px ;
        }
        .button-footer{
            border: none;
            width: 312px;
            height: 100px;
            object-fit: cover;
            overflow: hidden;
            display: flex;
            align-items: center;
            justify-content: center;
            border-radius: 10px;
        }
        
        .button-footer:hover{
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.5);
        }
        .icons{
            margin-left: -55px;
            display: flex;
        }
        .banquyen{
            color: #c9a783;
            font-size: 18px;
            font-weight: 700;
            /* height: 50px; */
            /* padding: 1px 0; */
            margin-bottom: 1px;
        } 
        .banquyen p{
            margin-left: 40px;
        }
        
        .btn_contact {
            font-family: inherit;
            font-size: 18px;
            background: linear-gradient(to bottom, #c9a783 0%,#C49A6C 100%);
            color: white;
            padding: 0.8em 1.2em;
            display: flex;
            align-items: center;
            justify-content: center;
            border: none;
            border-radius: 25px;
            box-shadow: 0px 5px 10px rgba(0, 0, 0, 0.2);
            transition: all 0.3s;
          }
          
        .btn_contact:hover {
            transform: translateY(-3px);
            box-shadow: 0px 8px 15px rgba(0, 0, 0, 0.3);
          }
          
        .btn_contact:active {
            transform: scale(0.95);
            box-shadow: 0px 2px 5px rgba(0, 0, 0, 0.2);
          }
          
        .btn_contact span {
            display: block;
            margin-left: 0.4em;
            transition: all 0.3s;
          }
          
        .btn_contact svg {
            width: 18px;
            height: 18px;
            fill: white;
            transition: all 0.3s;
          }
          
        .btn_contact .svg-wrapper {
            display: flex;
            align-items: center;
            justify-content: center;
            width: 30px;
            height: 30px;
            border-radius: 50%;
            background-color: rgba(255, 255, 255, 0.2);
            margin-right: 0.5em;
            transition: all 0.3s;
          }
          
        .btn_contact:hover .svg-wrapper {
            background-color: rgba(255, 255, 255, 0.5);
          }
          
        .btn_contact:hover svg {
            transform: rotate(45deg);
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
          .text{
              font-size: 22px
          }
          .txt{
                  font-size: 18px; 
                  background-color: transparent;
                  border: dotted;
                    padding: revert;

              }
          .cart{
      
            width: 40px;
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
          
          
    </style>
</head>
<body>
    <nav>
        <header>
            <a href="TrangChu.aspx"><img class="logo-shop" src="./img/logo_Shop.png" alt=""></a>  
        </header>
            <ul>
                <li>
                 
                </li>
               
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
        <li><a href="TrangChu.aspx">TRANG CHỦ</a></li>
        <li>
            <a href="SanPham.aspx">SẢN PHẨM</a></i>
        </li>
        <li><a  href="KhuyenMai.aspx">KHUYẾN MÃI</a></li>
        <li><a href="About.aspx">POODLE SHOP</a></li>
        <li><a class="active-menu"  href="LienHe.aspx">LIÊN HỆ</a></li>
        </ul>
    </div>

    <div class="banner_sp">
        <ul>
            <li><H3>Trang liên hệ</H3></li>
            
            <li><a href="TrangChu.aspx">Trang chủ </a><i class="ti-angle-right"></i><a  href="LienHe.aspx" style="color: #C49A6C;"> Liên hệ</a></li>
        </ul>
    </div>
    <div class="container_contacts">
        <div class="map">
            <iframe src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3929.920221771543!2d105.86494067480595!3d9.940595890161791!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x31a061bcd9682eeb%3A0x595d45803b261320!2zRHV5IE3huqtuIElU!5e0!3m2!1svi!2s!4v1715869203518!5m2!1svi!2s" width="600" height="450" style="border:0;" allowfullscreen="" loading="lazy" referrerpolicy="no-referrer-when-downgrade"></iframe>
        </div>
        <div class="form">
            <h1>Liên Hệ</h1>
                <h3>Họ và tên:</h3>
                <asp:TextBox class="text" ID="txtName" runat="server"></asp:TextBox>
    
                 <h3>Email:</h3>
               <asp:TextBox class="text"  ID="txtEmail" runat="server" TextMode="Email"></asp:TextBox>
    
                 <h3>Tin nhắn:</h3>
                   <asp:TextBox class="text" ID="txtMessenger" runat="server"></asp:TextBox>

                 <asp:Button class="text" ID="btnSubmit" CssClass="btn_contact" runat="server" Text="Gửi" OnClick="btnSubmit_Click" />
                <div style="font-size: 22px"><asp:Label ID="lblSuccessMessage" runat="server" Visible="false" ForeColor="Green" Text=""></asp:Label>
</div>
        </div>
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
               
            </ul>
        </div>
        <div class="footer_3">
            <ul>
                <li><h4>TIN KHUYẾN MÃI</h4></li>
                <li><a href="SanPham.aspx">SHOP CHO CÚN</a>
                <li><a href="KhuyenMai.aspx">KHUYẾN MÃI</a></li>
                <li><a href="About.aspx">POODLE SHOP</a></li>
                
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