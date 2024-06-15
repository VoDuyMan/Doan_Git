<%@ Control Language="C#" AutoEventWireup="true" CodeFile="Contact_Manage.ascx.cs" Inherits="UserAdmin_cms_admin_account_ManageContact_Contact_Manage" %>
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
 <div class="head">
           Phản hồi 
        </div>
        <div class="KhungChua" style="padding:10px;">
           <table class="tbDanhSach" style="width:100%">
                <asp:Label ID="lblErrorMessage" runat="server" Text="" style="color:#ff6a00"> </asp:Label>
               <asp:Button ID="btnXoa" Text="Xóa " runat="server" CommandName="DeleteItem" CommandArgument='<%# Eval("id") %>' CssClass="Xoa" OnClick="btnXoa_Click"/>
               <tr>
                   <th style="width: 5%; border-collapse:collapse; border: 1px solid #ccc;">Chọn</th>
                   <th style="width: 20%; border-collapse:collapse; border: 1px solid #ccc;">Họ và tên</th>
                   <th style="width: 30%;; border-collapse:collapse; border: 1px solid #ccc;">Email</th>
                   
                   <th style="width: 20%; border-collapse:collapse; border: 1px solid #ccc;">Ngày gửi</th>
                    <th style="width: 100%; border-collapse:collapse; border: 1px solid #ccc;">Công cụ</th>
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
                           <td style="width: 5%; border-collapse:collapse; border: 1px solid #ccc;text-align:center;"><%# Eval("fullname") %></td>
                           <td style="width: 20%;padding:10px; border-collapse:collapse; border: 1px solid #ccc;"><%# Eval("email") %></td>
                          
                           <td style="width: 10%; padding:10px;border-collapse:collapse; border: 1px solid #ccc;"><%# Eval("created_at") %></td>
                           <td style="width: 100%;height:24px; border-collapse:collapse; border: 1px solid #ccc;text-align:center; object-fit:cover">
                               <a 
                                   style="display:inline-block;width:52px; height:52px; background-position:center; background-image: url(/img/editt.png);" 
                                   href='Admin.aspx?modul=TaiKhoan&modulextra=ThongTinLienHe&operation=XemThu&id=<%# Eval("id") %>'>
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