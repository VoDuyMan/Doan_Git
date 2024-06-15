<%@ Control Language="C#" AutoEventWireup="true" CodeFile="TrangChuAdmin.ascx.cs" Inherits="UserAdmin_cms_admin_TrangChuAdmin" %>
<style>
    .Hinh{
        width: 150px;
        height: 150px;
        margin-top: 15px;
       
    }
    .table tr{
        display: flex;
        justify-content: center;
        gap: 150px;
        margin-top:10px;
       
    }
    .table tr .container-nav:hover{
        box-shadow: rgba(50, 50, 93, 0.25) 0px 50px 100px -20px, rgba(0, 0, 0, 0.3) 0px 30px 60px -30px;
    }
    .container-nav{
      display: flex;
      justify-content: center;
     
    }
    h3{
        font-size: 50px;
        margin-top: 18px;
        color: #393628;
    
    }
    p{
        font-size: 30px;
        color: #393628;
    }
  

 
</style>
 <div class="full">
        <div style="padding:10px;">
            <table class="table" style="width:100%">
                <tr>
                    <th style="width: 18%;background-image: url('/img/nen_1.jpg'); border-collapse:collapse; border: 1px solid #ccc; border-radius: 12px ;">
                        <a href="Admin.aspx?modul=TaiKhoan&modulextra=QuanLy&operation=QuanLy">
                       <div class="container-nav">

                           <img class="Hinh" src="/img/admin.png" alt="">
                          
                           <div class="content">
                               <p> Tài khoản </p>
                               <h3><asp:Label runat="server" Text="" ID="lbMess" style="display:none"></asp:Label>
                                   <asp:Label runat="server" Text="" ID="Label1" ></asp:Label>
                               </h3>
                           </div>
                       </div>
                        </a>
                    </th>
                    <th style="width: 18%; border-collapse:collapse; border: 1px solid #ccc; border-radius: 12px ;background-image: url('/img/nen_2.jpg')">
                        <a href="Admin.aspx?modul=TaiKhoan&modulextra=ThongTin&operation=QuanLy">
                        <div class="container-nav">
 
                            <img class="Hinh" src="/img/cart.png" alt="">
                           
                            <div class="content">
                                <p> Đơn hàng </p>
                                <h3><asp:Label runat="server" Text="" ID="lbDonHang" style="display:none"></asp:Label>
                                    <asp:Label runat="server" Text="" ID="Label2" ></asp:Label>
                                </h3>
                            </div>
                        </div>
                         </a>
                     </th>
                     <th style="width: 18%; border-collapse:collapse; border: 1px solid #ccc; border-radius: 12px ;background-image: url('/img/nen_1.jpg')">
                         <a href="Admin.aspx?modul=TaiKhoan&modulextra=ThongTinLienHe&operation=LienHe">
                        <div class="container-nav">
 
                            <img class="Hinh" src="/img/contact.png" alt="">
                           
                            <div class="content">
                                <p> Liên hệ </p>
                                 <h3><asp:Label runat="server" Text="" ID="lbLienHe" style="display:none"></asp:Label>
                                     <asp:Label runat="server" Text="" ID="Label3"></asp:Label>
                                 </h3>
                            </div>
                        </div>
                         </a>
                     </th>
                </tr>
            </table>
    </div>
    </div>

<span id="numberOfAccounts" style="display: none;"><%= lbMess.Text %></span>
<span id="numberOfOrders" style="display: none;"><%= lbDonHang.Text %></span>
<span id="numberOfContacts" style="display: none;"><%= lbLienHe.Text %></span>
  <div  style="display: flex; justify-content: center;margin-top:50px;border:1px solid #ccc; width:80%; margin-left:10%;"">
        <div id="myPlot"></div>
    <div id="myChartt" style="width:100%; max-width:600px;"></div>
</div>
<script>
    const percentageOfAccounts = parseFloat('<%= lbMess.Text.Replace("%", "") %>');
    const percentageOfOrders = parseFloat('<%= lbDonHang.Text.Replace("%", "") %>');
    const percentageOfContacts = parseFloat('<%= lbLienHe.Text.Replace("%", "") %>');

  google.charts.load('current', { 'packages': ['corechart'] });
    google.charts.setOnLoadCallback(drawChart);

    function drawChart() {

        // Set Data
        const data = google.visualization.arrayToDataTable([
            ['Country', 'Percentage'],
            ['Tài khoản', percentageOfAccounts],
            ['Đơn hàng', percentageOfOrders],
            ['Liên hệ',  percentageOfContacts]

        ]);

        // Set Options
        const options = {
            title: 'Thống kê'
        };

        // Draw
        const chart = new google.visualization.PieChart(document.getElementById('myChartt'));
        chart.draw(data, options);

    }

        
        const xArray = ["Tài khoản", "Đơn hàng", "Liên hệ"];
    const yArray = [percentageOfAccounts, percentageOfOrders, percentageOfContacts ];

        const data = [{
            x: xArray,
            y: yArray,
            type: "bar",
            orientation: "v",
            marker: { color: "rgba(0,0,255,0.6)" }
        }];

        const layout = { title: "Biểu đồ thống kê" };

        Plotly.newPlot("myPlot", data, layout);
</script>
        
   
