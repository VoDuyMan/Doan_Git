<%@ Control Language="C#" AutoEventWireup="true" CodeFile="Product_Addnew.ascx.cs" Inherits="UserAdmin_cms_admin_product_ManageProdct_Product_Addnew" %>
<style>
    .oNhap{
            padding: 4px 0 4px 14px;
            
    }
    .thongTin{
        line-height:4;
    }
    .btnThemMoi{
        
    }

</style>

<div class="head">
    Thêm mới sản phẩm
<div class="FormAdd">
    <div class="thongTin">
        <div class="tenTruong">Thương hiệu</div>
        <div class="oNhap">
            <asp:DropDownList CssClass="input" style="font-size:18px" ID="cmbThuongHieu" runat="server" AutoPostBack="true" OnSelectedIndexChanged="cmbThuongHieu_SelectedIndexChanged"></asp:DropDownList>
        </div>
    </div>
    <div class="thongTin">
        <div class="tenTruong">Danh mục lựa chọn</div>
        <div class="oNhap">
            <asp:DropDownList CssClass="input" style="font-size:18px" ID="ListOptions" runat="server" AutoPostBack="true" OnSelectedIndexChanged="ListOptions_SelectedIndexChanged"></asp:DropDownList>

        </div>
    </div>
    <div class="thongTin">
        <div class="tenTruong">Danh mục</div>
        <div class="oNhap">
            <asp:DropDownList CssClass="input" style="font-size:18px" ID="ListMenus" runat="server" AutoPostBack="true" OnSelectedIndexChanged="ListMenus_SelectedIndexChanged"></asp:DropDownList>
           
        </div>
    </div>
    <div class="thongTin">
        <div class="tenTruong">Tên sản phẩm</div>
        <div class="oNhap">
            <asp:TextBox CssClass="input"  style="font-size:18px"  ID="txtTenSanPham" runat="server" required="required" ></asp:TextBox>
        </div>
    </div>
    <div class="thongTin">
        <div class="tenTruong">Giá      ($)</div>
        <div class="oNhap">  
           <asp:TextBox CssClass="input" style="font-size:18px" ID="txtGia" runat="server" required="required" ></asp:TextBox>
        </div>
    </div>

     <div class="thongTin">
        <div class="tenTruong">Số lượng</div>
        <div class="oNhap">  
           <asp:TextBox CssClass="input" TextMode="Number" style="font-size:18px" ID="txtSL" runat="server" required="required" ></asp:TextBox>
        </div>
    </div>
    <div class="thongTin">
        <div class="tenTruong">Ảnh đại diện</div>
        <div class="oNhap">
            <asp:FileUpload ID="flAnhDaiDien" runat="server" CssClass="Upload" />
          
        </div>
    </div>
    <div class="thongTin">
        <div class="tenTruong">Mô tả</div>
        <div class="oNhap"style="min-height:40px;display: block"> 
            <asp:TextBox  CssClass="input"  style="font-size:18px"  ID="txtMoTa" runat="server" required="required" ></asp:TextBox>
    </div>
    </div>
    <div class="thongTin">
        <div class="tenTruong">&nbsp;</div>
        <div class="oNhap"> 
            <asp:Button ID="btnChinhSua" runat="server" Text="Thêm mới" CssClass="btnThemMoi"  style=" padding: 25px 35px 35px; height: 29px" OnClick="btnThemMoi_Click" />
            <asp:Button ID="btnHuy" runat="server" Text="Hủy" CssClass="btnHuy" style="padding: 25px 35px 20px;" OnClick="btnHuy_Click" />
            <asp:Label ID="lblErrorMessage" runat="server" Text=""></asp:Label>
        </div>
    </div>
</div>