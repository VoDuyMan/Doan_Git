<%@ Control Language="C#" AutoEventWireup="true" CodeFile="Category_Edit.ascx.cs" Inherits="UserAdmin_cms_admin_product_ManageCategory_Category_Edit" %>
   <div class="head">
            Danh mục sản phẩm
        </div>
        <asp:Label ID="lblErrorMessage" runat="server" Text=""> </asp:Label>
        <div class="KhungChua" style="padding:10px;">
           <table class="tbDanhSach" style="width:100%">
               <tr>
                   <th style="width: 10%; border-collapse:collapse; border: 1px solid #ccc;">Mã</th>
                   <th style="width: 40%; border-collapse:collapse; border: 1px solid #ccc;">Tên Options</th>
                   
                   <th style="width: 10%; border-collapse:collapse; border: 1px solid #ccc;">Vị trí</th>
                   <th style="width: 100%; border-collapse:collapse; border: 1px solid #ccc;">Công cụ</th>
               </tr>
              <asp:Repeater ID="rptCartItems" runat="server" OnItemCommand="rptCartItems_ItemCommand1">
                    <HeaderTemplate>
                        <!-- HeaderTemplate: Thẻ mở đầu của Repeater -->
                    </HeaderTemplate>
                    <ItemTemplate>
                        <!-- ItemTemplate: Thẻ cho mỗi mục trong Repeater -->
                        <tr>
                           <td style="width: 10%; border-collapse:collapse; border: 1px solid #ccc;text-align:center;"><%# Eval("id") %></td>
                           <td style="width: 20%; border-collapse:collapse; border: 1px solid #ccc;"><%# Eval("name") %></td>
                          
                           <td style="width: 10%; border-collapse:collapse; border: 1px solid #ccc;text-align:center;"><%# Eval("locations") %></td>
                           <td style="width: 100%;height:24px; border-collapse:collapse; border: 1px solid #ccc;text-align:center; object-fit:cover">
                               <a 
                                   style="display:inline-block;width:52px; height:52px; background-position:center; background-image: url(/img/editt.png);" 
                                   href='Admin.aspx?modul=SanPham&modulextra=DanhMuc&operation=ChinhSua&id=<%# Eval("id") %>'>
                               </a>
                               <asp:Button ID="btnXoa" runat="server" Text="" CommandName="DeleteItem" CommandArgument='<%# Eval("id") %>'
    style="display:inline-block; border: none; width:52px; height:52px; background-position:center; background-image:url(/img/xoaa.jpg);" />

                           </td>
                       </tr>
               
                 </ItemTemplate>
                    <FooterTemplate>
                        <!-- FooterTemplate: Thẻ kết thúc của Repeater -->
                    </FooterTemplate>
                </asp:Repeater>
           </table>
        </div>