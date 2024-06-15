<%@ Control Language="C#" AutoEventWireup="true" CodeFile="Pay_one.ascx.cs" Inherits="UserUI_Pay_one" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Thông tin thanh toán</title>
    <link rel="stylesheet" href="./asset/Css/style_thanhtoan.css">
    <link rel="stylesheet" href="./asset/fonts/themify-icons-font/themify-icons/themify-icons.css">
    <style>
        .button {
            width: 172px;
            height: 76px;
            text-align: center;
            display: flex;
            justify-content: center;
        }

        .checkbox {
            display: flex;
            margin-right: calc(var(--s-small)* 0.7);
            justify-content: center;
            border-radius: 0.1em;
            width: 1.5em;
            height: 1.5em;
            transition: box-shadow var(--t-base) var(--e-out), background-color var(--t-base);
        }

        .checkbox_1 {
            width: 100%;
            display: flex;
            text-align: center
        }
    </style>
</head>
<body>
    <div class="thanhtoan">
        <div class="form">
            <div class="head">
                <ul>
                    <li>
                        <h1>Poodle Pet Shop</h1>
                    </li>
                    <li>
                        <a href="GioHang.aspx">Giỏ hàng</a>
                        <i class="ti-angle-right"></i>
                        Thông tin thanh toán
                    </li>
                </ul>
                <p>Trang thông tin thanh toán</p>
            </div>
            <br>

            <div class="form-comment">
                <ul>
                    <li>
                        <p>Họ và tên: </p>
                        <br>
                        <asp:TextBox ID="txtName" runat="server" CssClass="form-control" required="required"></asp:TextBox>
                    </li>
                    <li>
                        <p>Email: </p>
                        <br>
                        <asp:TextBox ID="txtEmail" runat="server" CssClass="form-control" required="required"></asp:TextBox>
                    </li>
                    <li>
                        <p>Số điện thoại:</p>
                        <br>
                        <asp:TextBox ID="txtPhone" runat="server" CssClass="form-control" required="required"></asp:TextBox>
                    </li>
                    <li>
                        <p>Địa chỉ:</p>
                        <br>
                        <asp:TextBox ID="txtAddress" runat="server" CssClass="form-control" required="required"></asp:TextBox>
                    </li>
                    <li>
                        <div class="checkbox-wrapper-33">
                            <label class="checkbox_1">
                                <span class="checkbox" style="margin-top: 8px">
                                    <input type="checkbox" id="vehicle1" name="vehicle1" value="Bike">
                                </span>
                                <p class="checkbox__textwrapper">Thanh toán khi nhận hàng!!</p>
                            </label>
                        </div>
                    </li>
                </ul>
            </div>
            <div class="btns">
                <asp:Button ID="btnConfirmPayment" runat="server" Text="Thanh toán" OnClick="btnConfirmPayment_Click" CssClass="button" />
                <a href="GioHang.aspx">
                    <h2>Tới giỏ hàng</h2>
                </a>

            </div>
            <asp:Label runat="server" ID="lbthongTinDatHang" Text="" Style="font-size: 18px; background: none; color: #f7941d; display: contents;"></asp:Label>
        </div>
        <div class="image">
            <div class="spthanhtoan">
                <ul style="display: contents; justify-content: flex-end; align-items: first baseline; text-align: center; margin-right: 0; overflow: hidden; padding: 0 20px; text-overflow: ellipsis; white-space: nowrap; padding-right: 10px;">
                    <li>
                        <img src='<%="/img/"+ infoSanPham.thumbnail %>' alt=""></li>
                    <li style="font-size: 20px; display: flex; justify-content: flex-start; width: 480px; overflow: hidden; padding: 0 20px; text-overflow: ellipsis; white-space: nowrap;"><a href="#"><%=infoSanPham.title %> </a></li>
                    <li>
                        <h3>x 1</h3>
                    </li>
                    <li>
                        <h3 style="color: #C49A6C; padding-left: 55px">$<%=infoSanPham.price %></h3>
                    </li>
                </ul>
            </div>
            <div class="thanhtien">
                <ul>
                    <li></li>

                    <li>
                        <p>Tạm tính</p>
                        <h3 style="color: #C49A6C;">$<%=infoSanPham.price %></h3>
                    </li>
                    <li>
                        <p>Phí vận chuyển</p>
                        <h3>-----</h3>
                    </li>
                    <li class="plus">
                        <h4>Tổng cộng</h4>
                        <h4 style="color: #C49A6C">$<%=infoSanPham.price %></h4>
                    </li>
                </ul>
            </div>
        </div>
    </div>
</body>
</html>
