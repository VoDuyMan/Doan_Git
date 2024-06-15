<%@ Control Language="C#" AutoEventWireup="true" CodeFile="accountLoadControl.ascx.cs" Inherits="UserAdmin_cms_admin_account_accountLoadControl" %>
<div style="clear:both; height:10px"></div>
<div class="container">
<div class="column_Left" style="width:20%; min-height:100%">
    <div class="head">
        Quản lý
    </div>
    <ul>
        <li><a href="Admin.aspx?modul=TaiKhoan&modulextra=QuanLy&operation=QuanLy">Quản tài khoản</a></li>
        <li style="display:none"><a href="Admin.aspx?modul=TaiKhoan&modulextra=QuanLy&operation=XemTaiKhoan">Xem tài khoản</a></li>
       <li><a href="Admin.aspx?modul=TaiKhoan&modulextra=ThongTin&operation=QuanLy">Thông tin đơn hàng</a></li>
        <li style="display:none"><a href="Admin.aspx?modul=TaiKhoan&modulextra=ThongTin&operation=ChiTiet">Thông tin đơn hàng</a></li>
        <li ><a href="Admin.aspx?modul=TaiKhoan&modulextra=ThongTinLienHe&operation=LienHe">Thông tin liên hệ</a></li>
        <li style="display:none" ><a href="Admin.aspx?modul=TaiKhoan&modulextra=ThongTinLienHe&operation=XemThu">Thông tin liên hệ</a></li>
        
        
    </ul>
</div>
<div class="column_Right" style="width:75%; height:100%">
  <asp:PlaceHolder ID="plTaiKhoanLoadControl" runat="server"></asp:PlaceHolder>
</div>
<div class="cb"><!----></div>
</div>