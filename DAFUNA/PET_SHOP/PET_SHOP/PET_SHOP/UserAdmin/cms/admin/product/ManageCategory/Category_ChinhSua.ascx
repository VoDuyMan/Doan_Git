<%@ Control Language="C#" AutoEventWireup="true" CodeFile="Category_ChinhSua.ascx.cs" Inherits="UserAdmin_cms_admin_product_ManageCategory_Category_ChinhSua" %>
<div class="head">
    Chỉnh sửa danh mục sản phẩm
</div>
<div class="FormAdd">
    <div class="thongTin">
        <div class="tenTruong">Danh mục hiện có</div>
        <div class="oNhap">
            <asp:Label CssClass="input" ID="idDanhMuc" runat="server"></asp:Label>
        </div>
    </div>
    <div class="thongTin">
        <div class="tenTruong">Tên danh mục</div>
        <div class="oNhap">
            <asp:TextBox CssClass="input" ID="txtTenDanhMucLuaChon" runat="server" required="required" ></asp:TextBox>
        </div>
    </div>
    <div class="thongTin">
        <div class="tenTruong">Vị trí xuất hiện</div>
        <div class="oNhap"> 
            <asp:TextBox  CssClass="input" ID="txtViTriLuaChon" runat="server" required="required" ></asp:TextBox>

    </div>
    </div>
    <div class="thongTin">
        <div class="tenTruong">&nbsp;</div>
        <div class="oNhap"> 
            <asp:Button ID="btnChinhSua" runat="server" Text="Chỉnh sữa" CssClass="btnThemMoi"  style="height: 29px" OnClick="btnChinhSua_Click" />
            <asp:Button ID="btnHuy" runat="server" Text="Hủy" CssClass="btnHuy" />
            <asp:Label ID="lblErrorMessage" runat="server" Text=""></asp:Label>
        </div>
    </div>
</div>