<%@ Control Language="C#" AutoEventWireup="true" CodeFile="Product_ChinhSua.ascx.cs" Inherits="UserAdmin_cms_admin_product_ManageProdct_Product_ChinhSua" %>
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
    Chỉnh sửa sản phẩm
<div class="FormAdd">
    <div class="thongTin">
        <div class="tenTruong">ID sản phẩm</div>
        <div class="oNhap">
            <asp:Label CssClass="input" ID="idSanPham" runat="server"></asp:Label>
        </div>
    </div>
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
           <asp:TextBox CssClass="input"  style="font-size:18px" ID="txtGia" runat="server" required="required" ></asp:TextBox>
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
            <asp:FileUpload ID="flAnhDaiDien" runat="server"  />
            <asp:Image ID="imgCurrentThumbnail" runat="server" style="margin-left: 200px;
                    margin-top: -310px;
                    transform: translateY(10px);
                    transform: translateX(184%);
                    height: 160px;
                    position: absolute;
                    width: 160px;" />
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
            <asp:Button ID="btnChinhSua" runat="server" Text="Chỉnh sữa" CssClass="btnThemMoi"  style=" padding: 25px 35px 35px; height: 29px" OnClick="btnChinhSua_Click" />
            <asp:Button ID="btnHuy" runat="server" Text="Hủy" CssClass="btnHuy" style="padding: 25px 35px 20px;" />
            <asp:Label ID="lblErrorMessage" runat="server" Text=""></asp:Label>
        </div>
    </div>
</div>