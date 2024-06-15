    <%@ Control Language="C#" AutoEventWireup="true" CodeFile="OrderManage.ascx.cs" Inherits="UserAdmin_cms_admin_account_ManageOrder_OrderManage" %>
    <style>
        .Xoa{
            border:none; font-size:18px;float:right; background: #ff6a00; height:40px;width:60px;font-weight:bold;color:#ffff; border-radius:10px; transform:translateX(-15%); margin-bottom:6px;
        }
        .Xoa:hover{
            opacity:0.9;
        }
    </style>
    <div class="head">
        Thông tin đơn hàng
    </div>
    <div class="KhungChua" style="padding:10px;">
        <table class="tbDanhSach" style="width:100%">
       
            <tr>
            
                <th style="width: 30%; border-collapse:collapse; border: 1px solid #ccc;">Họ và tên</th>
                <th style="width: 10%; border-collapse:collapse; border: 1px solid #ccc;">Giá</th>
                <th style="width: 20%; border-collapse:collapse; border: 1px solid #ccc;">Ngày đặt hàng</th>
                <th style="width: 20%; border-collapse:collapse; border: 1px solid #ccc;">Trạng thái</th>
                <th style="width: 100%; border-collapse:collapse; border: 1px solid #ccc;">Công cụ</th>
            </tr>
            <asp:Repeater ID="rptCartItems" runat="server" OnItemCommand="rptCartItems_ItemCommand">
                <HeaderTemplate>
                    <!-- HeaderTemplate: Thẻ mở đầu của Repeater -->
                </HeaderTemplate>
                <ItemTemplate>
                    <!-- ItemTemplate: Thẻ cho mỗi mục trong Repeater -->
                    <tr>
                    
                        <td style="width: 30%; border-collapse:collapse; border: 1px solid #ccc;padding"><%# Eval("fullname") %></td>
                        <td style="width: 20%; padding:10px;border-collapse:collapse; border: 1px solid #ccc;">$<%# Eval("total_money") %></td>
                        <td style="width: 20%; padding:10px;border-collapse:collapse; border: 1px solid #ccc;"><%# Eval("order_date") %></td>
                         <td style='width: 10%; padding:10px;border-collapse:collapse; border: 1px solid #ccc; color: <%# GetStatusText(Eval("status")).Color %>; font-weight:bold'> 
                        <%# GetStatusText(Eval("status")).Text %>
                         </td>
                        <td style="width: 100%;height:24px; border-collapse:collapse; border: 1px solid #ccc;text-align:center; object-fit:cover">
                            <a 
                                style="display:inline-block;width:52px; height:52px; background-position:center; background-image: url(/img/editt.png);" 
                                href='Admin.aspx?modul=TaiKhoan&modulextra=ThongTin&operation=ChiTiet&id=<%# Eval("id") %>'>
                            </a>
                            <asp:Button ID="btnCheck" runat="server" Text="" CommandName="UpdateStatus" CommandArgument='<%# Eval("id") %>'
                            style="display:inline-block; border: none; width:52px; overflow:hidden;height:52px; background-position:center; background-image:url(/img/checked.png);" />
                       
                        </td>
                    </tr>
                </ItemTemplate>
                <FooterTemplate>
                    <!-- FooterTemplate: Thẻ kết thúc của Repeater -->
                </FooterTemplate>
            </asp:Repeater>
        </table>
    </div>
