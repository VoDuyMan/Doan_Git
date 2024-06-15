<%@ Control Language="C#" AutoEventWireup="true" CodeFile="productLoadControl.ascx.cs" Inherits="UserAdmin_cms_admin_product_productLoadControl" %>
<div style="clear:both; height:10px"></div>
<div class="container">
<div class="column_Left" style="width:20%; min-height:100%">
    <div class="head">
        Quản lý
    </div>
    <ul>
        <li><a href="Admin.aspx?modul=SanPham&modulextra=DanhMuc&operation=QuanLy">Quản lý danh mục</a></li>
        <li style="display:none"><a href="Admin.aspx?modul=SanPham&modulextra=DanhMuc&operation=ChinhSua">Chinh sửa danh mục</a></li>
        <li><a href="Admin.aspx?modul=SanPham&modulextra=DanhMucLuaChon&operation=QuanLy">Quản lý danh mục lựa chọn</a></li>
        <li style="display:none"><a href="Admin.aspx?modul=SanPham&modulextra=DanhMucLuaChon&operation=ChinhSua">Chỉnh sửa danh mục lựa chọn</a></li>
        <li><a href="Admin.aspx?modul=SanPham&modulextra=DanhSachSanPham&operation=QuanLy">Quản lý danh sách sản phẩm</a></li>
        <li style="display:none"><a href="Admin.aspx?modul=SanPham&modulextra=DanhSachSanPham&operation=ChinhSua">Chỉnh sửa danh sách sản phẩm</a></li>
    </ul>
    <div class="head">
        Thêm mới
    </div>
    <ul>
        <li><a href="Admin.aspx?modul=SanPham&modulextra=DanhMuc&operation=ThemMoi">Quản lý danh mục</a></li>
        <li><a href="Admin.aspx?modul=SanPham&modulextra=DanhMucLuaChon&operation=ThemMoi">Quản lý danh mục lựa chọn</a></li>
        <li><a href="Admin.aspx?modul=SanPham&modulextra=DanhSachSanPham&operation=ThemMoi">Quản lý danh sách sản phẩm</a></li>
    </ul>
</div>
<div class="column_Right" style="width:75%; height:100%">
  <asp:PlaceHolder ID="plSanPhamLoadControl" runat="server"></asp:PlaceHolder>
</div>
<div class="cb"><!----></div>
</div>