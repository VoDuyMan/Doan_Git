<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Admin.aspx.cs" Inherits="UserAdmin_Admin" %>

<%@ Register Src="~/UserAdmin/cms/admin/adminLoadControl.ascx" TagPrefix="uc1" TagName="adminLoadControl" %>


<%@ Register src="cms/admin/TrangChuAdmin.ascx" tagname="TrangChuAdmin" tagprefix="uc2" %>


<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>TRANG QUẢN TRỊ WEBSITE</title>
    <link href="cms/admin/css/cssAdmin.css" rel="stylesheet" />
    <link href="cms/admin/css/Options.css" rel="stylesheet" />
    
     <script src="https://www.gstatic.com/charts/loader.js"></script>
    <script src="https://cdn.plot.ly/plotly-latest.min.js"></script>
     
</head>
<body>
    <form id="form1" runat="server">    
        <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
        <div>
            <div class="container">
            <div id="header" style="width:100%; height:125px">
                <div class="logo" >
                    <img class="logo-shop" src="/img/logo_Shop.png" style="width:300px; height:130px" alt="">
                </div>
                <div class="accountMenu" style="font-size:20px; padding-top:15px">
                    <ul class="subnav" style="display:flex">
            <% if (Session["UserToken"] != null)
                {%>
                <li><a href="ThongTin.aspx"><asp:Label ID="lblWelcome" runat="server" Text=""></asp:Label></a> </li>
                 <li style="padding: 0 15px">|</li>
                <li ><asp:Button class="txt" ID="btnLogout" runat="server" Text="Đăng xuất" OnClick="btnLogout_Click"  /></li>
              
                <%}
                    %>
                    <a href="GioHang.aspx">
                        <div class="cart">
                            <label></label>
                            <i style="font-size: 2.5rem;"class="ti-shopping-cart button-cart" ></i>
                        </div>
                    </a>
                </li>
        </ul>
                </div>
            </div>
            </div>
            
            <div class="MenuChinh">
                <div class="container">
                <ul>
                    <li><a href="Admin.aspx?modul=TrangChu" tile="Trang chủ">Trang chủ</a></li>
                    <li><a href="Admin.aspx?modul=SanPham&modulextra=DanhSachSanPham&operation=QuanLy" tile="Sản phẩm">Sản phẩm</a></li>
                    <li><a href="Admin.aspx?modul=TaiKhoan&modulextra=QuanLy&operation=QuanLy" tile="Tài khoản">Tài khoản</a></li>
                </ul>
                </div>
            </div>
           
            <%--  Phần nội dung trang---%>
            <uc1:adminLoadControl runat="server" ID="adminLoadControl" />
        </div>
    </form>


</body>
</html>

