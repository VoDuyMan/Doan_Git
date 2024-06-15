<%@ Control Language="C#" AutoEventWireup="true" CodeFile="Order_Details.ascx.cs" Inherits="UserAdmin_cms_admin_account_ManageOrder_Order_Details" %>
<style>
    .Xoa{
        border:none; font-size:18px;float:right; background: #ff6a00; height:40px;width:60px;font-weight:bold;color:#ffff; border-radius:10px; transform:translateX(-15%); margin-bottom:6px;
    }
    .Xoa:hover{
        opacity:0.9;
    }
</style>
<div class="head">
    Chi tiết đơn hàng
</div>
<div class="KhungChua" style="padding:10px;">
    <table class="tbDanhSach" style="width:100%">
        <tr>
            <th style="width: 40%; border-collapse:collapse; border: 1px solid #ccc;">Sản phẩm</th>
            <th style="width: 10%; border-collapse:collapse; border: 1px solid #ccc;">Hình ảnh</th>
            <th style="width: 10%; border-collapse:collapse; border: 1px solid #ccc;">Số lượng</th>
            <th style="width: 10%; border-collapse:collapse; border: 1px solid #ccc;">Giá</th>
            <th style="width: 30%; border-collapse:collapse; border: 1px solid #ccc;">Tổng Giá</th>
        </tr>
        <asp:Repeater ID="rptOrderDetails" runat="server">
            <HeaderTemplate>
                <!-- HeaderTemplate: Thẻ mở đầu của Repeater -->
            </HeaderTemplate>
            <ItemTemplate>
                <!-- ItemTemplate: Thẻ cho mỗi mục trong Repeater -->
                <tr>
                    <td style="width: 30%; padding:10px;border-collapse:collapse; border: 1px solid #ccc;"><%# Eval("title") %></td>          
                       <td style="width: 20%; border-collapse:collapse; border: 1px solid #ccc;text-align:center;"><img style="width:80px; height: 80px" src='/img/<%# Eval("thumbnail") %>'/></td>
                    <td style="width: 10%; padding:10px;border-collapse:collapse; border: 1px solid #ccc; text-align:center;"><%# Eval("quantity") %></td>
                    <td style="width: 5%; padding:10px;border-collapse:collapse; border: 1px solid #ccc;text-align:center;">$<%# Eval("price") %></td>
                    <td style="width: 20%; padding:10px;border-collapse:collapse; border: 1px solid #ccc;text-align:center; font-size: 22px; color:#C49A6C">$<%# Eval("Total_money") %></td>
                </tr>
                
            </ItemTemplate>
            <FooterTemplate>
                <!-- FooterTemplate: Thẻ kết thúc của Repeater -->
            </FooterTemplate>
        </asp:Repeater>
        
    </table>   
    <div class="Sum" style="display:flex; justify-content:flex-end;align-items:center;padding-right:120px; gap:130px">
                    <h3 style="font-size: 26px; font-weight:bold">Tổng giá:</h3>
                    <p style="font-size:26px; color:#C49A6C; font-weight:bold"> $<asp:Label ID="lblTotalMoney" runat="server"></asp:Label></p>

        </div>
</div>
