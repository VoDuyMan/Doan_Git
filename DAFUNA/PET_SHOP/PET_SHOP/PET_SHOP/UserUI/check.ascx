<%@ Control Language="C#" AutoEventWireup="true" CodeFile="check.ascx.cs" Inherits="UserUI_check" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Đặt hàng thành công</title>
    <style>
        body {
            font-family: 'Arial', sans-serif;
            background-color: #f5f5f5;
            margin: 0;
            display: flex;
            align-items: center;
            justify-content: center;
            height: 444px;
        }

        .message {
            text-align: center;
            padding: 20px;
            background-color: #ffffff;
            border-radius: 10px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        }

        h1 {
            color: #367aa7;
        }

        p {
            color: #000000;
        }
    </style>
</head>
<body>
    <div class="message">
        <h1>Xin cảm ơn!</h1>
        <p>Bạn đã đặt hàng thành công. Chúng tôi sẽ liên hệ với bạn sớm nhất có thể!.</p>
        <p>Mọi thắc mắc xin vui lòng liên hệ: teamML@gmail.com.</p>
        <p><a href="TrangChu.aspx">Tiếp tục mua sắm!!</a></p>

    </div>
</body>
</html>

