<%@ Control Language="C#" AutoEventWireup="true" CodeFile="Product_Edit.ascx.cs" Inherits="UserAdmin_cms_admin_product_ManageProdct_Product_Edit" %>
<style>
    .Xoa {
        border: none;
        font-size: 18px;
        float: right;
        background: #ff6a00;
        height: 40px;
        width: 60px;
        font-weight: bold;
        color: #ffff;
        border-radius: 10px;
        transform: translateX(-15%);
        margin-bottom: 6px;
    }

        .Xoa:hover {
            opacity: 0.9;
        }
</style>
 <div class="head">Danh mục sản phẩm lựa chọn</div>
        
        <div class="KhungChua" style="padding:10px;">
            <div>
           <table class="tbDanhSach" style="width:100%">
           <asp:Label ID="lblErrorMessage" runat="server" Text="" style="color:#ff6a00"> </asp:Label>
           <asp:Button ID="btnXoa" Text="Xóa " runat="server" CommandName="DeleteItem" CommandArgument='<%# Eval("id") %>' CssClass="Xoa" OnClick="btnXoa_Click"/>
               <tr>
                   <th style="width: 8%; border-collapse:collapse; border: 1px solid #ccc;">Chọn</th>
                   <th style="width: 10%; border-collapse:collapse; border: 1px solid #ccc;">Mã</th>
                   <th style="width: 10%; border-collapse:collapse; border: 1px solid #ccc;">Thương Hiệu</th>
                   <th style="width: 10%; border-collapse:collapse; border: 1px solid #ccc; padding: 25px">Lựa chọn</th>
                   <th style="width: 10%; border-collapse:collapse; border: 1px solid #ccc;">Danh mục</th>
                   <th style="width: 5%; border-collapse:collapse; border: 1px solid #ccc;overflow: hidden; ; text-overflow: ellipsis; white-space: nowrap;"">Tên sản phẩm</th>
                   <th style="width: 40%; border-collapse:collapse; border: 1px solid #ccc;padding: 0 30px">Giá</th>
                   <th style="width: 40%; border-collapse:collapse; border: 1px solid #ccc; padding: 0 30px">Tồn kho</th>
                   <th style="width: 20%; border-collapse:collapse; border: 1px solid #ccc; padding: 10px 45px;">Ảnh đại diện</th>
                   
                   <th style="width: 100%; border-collapse:collapse; border: 1px solid #ccc; padding: 35px">Công cụ</th>
               </tr>
              <asp:Repeater ID="rptCartItems" runat="server" OnItemCommand="rptCartItems_ItemCommand1">
                    <HeaderTemplate>
                        <!-- HeaderTemplate: Thẻ mở đầu của Repeater -->
                    </HeaderTemplate>
                    <ItemTemplate>
                        <!-- ItemTemplate: Thẻ cho mỗi mục trong Repeater -->
                        <tr>
                            <td style="width: 5%; border-collapse:collapse; border: 1px solid #ccc;text-align:center; font-size:20px;">
                        <asp:CheckBox ID="chkSelect" runat="server" />
                        <asp:HiddenField ID="hfProductId" runat="server" Value='<%# Eval("id") %>' />
                    </td>
                           <td style="width: 10%; border-collapse:collapse; border: 1px solid #ccc;text-align:center;"><%# Eval("Index") %></td>
                            <td style="width: 10%; border-collapse:collapse; border: 1px solid #ccc;text-align:center;"><%# Eval("ProducerName") %></td>
                            <td style="width: 10%; border-collapse:collapse; border: 1px solid #ccc;text-align:center;"><%# Eval("OptionName") %></td>
                            <td style="width: 10%; border-collapse:collapse; border: 1px solid #ccc;text-align:center;overflow: hidden; padding: 0 10px; text-overflow: ellipsis; white-space: nowrap;"><%# Eval("MenuName") %></td>
                           <td style="width: 10%; border-collapse:collapse; border: 1px solid #ccc; overflow: hidden; padding: 0 20px; text-overflow: ellipsis; white-space: nowrap;"><%# Eval("title") %></td>
                            <td style="width: 10%; border-collapse:collapse; border: 1px solid #ccc;text-align:center;">$<%# Eval("price") %></td>
                            <td style="width: 20%; border-collapse:collapse; border: 1px solid #ccc;text-align:center;"><%# Eval("inventory") %></td>
                           <td style="width: 20%; border-collapse:collapse; border: 1px solid #ccc;text-align:center;"><img style="width:80px; height: 80px" src='/img/<%# Eval("thumbnail") %>'/></td>
                           
                           <td style="width: 100%;height:24px; border-collapse:collapse; border: 1px solid #ccc;text-align:center; object-fit:cover">
                               <a 
                                   style="display:inline-block;width:52px; height:52px; background-position:center; background-image: url(/img/editt.png);" 
                                   href='Admin.aspx?modul=SanPham&modulextra=DanhSachSanPham&operation=ChinhSua&id=<%# Eval("id") %>'>
                               </a>
                               <asp:Button ID="btnXoa" runat="server" Text="" CommandName="DeleteItem" CommandArgument='<%# Eval("id") %>'
    style="display:inline-block; width:52px; height:52px;border: none; background-position:center; background-image:url(/img/xoaa.jpg);" />

                           </td>
                       </tr>
               
                 </ItemTemplate>
                    <FooterTemplate>
                        <!-- FooterTemplate: Thẻ kết thúc của Repeater -->
                    </FooterTemplate>
                </asp:Repeater>
                </table>
            </div>
        </div>
