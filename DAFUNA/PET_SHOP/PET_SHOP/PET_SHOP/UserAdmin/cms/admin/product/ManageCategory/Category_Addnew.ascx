<%@ Control Language="C#" AutoEventWireup="true" CodeFile="Category_Addnew.ascx.cs" Inherits="UserAdmin_cms_admin_product_ManageCategory_Category_Addnew" %>
<style>
    .input{
        font-size:18px;
    }
</style>
<div class="head">
    Thêm mới danh mục sản phẩm
</div>
<div class="FormAdd">
    <div class="thongTin">
        <div class="tenTruong">Danh mục hiện có</div>
        <div class="oNhap">
             <asp:DropDownList CssClass="input" style="font-size:18px" ID="ListDanhMuc" runat="server" AutoPostBack="true" OnSelectedIndexChanged="cmbOption_SelectedIndexChanged"></asp:DropDownList>
            
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
        <div class="oNhap"> <asp:CheckBox ID="cbThemNhieu" runat="server" Text="Tiếp tục tạo danh mục khác sau khi tạo danh mục này!!"/>  </div>
     </div>
    <div class="thongTin">
        <div class="tenTruong">&nbsp;</div>
        <div class="oNhap"> 
            <asp:Button ID="btnThemMoi" runat="server" Text="Thêm mới" CssClass="btnThemMoi" OnClick="btnThemMoi_Click1" style="height: 29px" />
            <asp:Button ID="btnHuy" runat="server" Text="Hủy" CssClass="btnHuy" OnClick="btnHuy_Click"/>
            <asp:Label ID="lblErrorMessage" runat="server" Text=""></asp:Label>
        </div>
    </div>
</div>