using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class UserAdmin_cms_admin_account_ManageOrder_Order_Details : System.Web.UI.UserControl
{
    public static QLSHOPDataContext db = new QLSHOPDataContext();

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            LoadOrderDetails();
        }
    }

    private void LoadOrderDetails()
    {
        int orderId = Convert.ToInt32(Request.QueryString["id"]);

        var orderDetails = from detail in db.Detail_Orders
                           join product in db.Products on detail.product_id equals product.id
                           where detail.order_id == orderId
                           select new
                           {
                               product.title,
                               product.thumbnail,
                               detail.quantity,
                               product.price,
                               Total_money = detail.quantity * product.price
                              
                           };
        decimal totalMoneyOfAllProducts = orderDetails.Sum(detail => detail.Total_money ?? 0);
        lblTotalMoney.Text = totalMoneyOfAllProducts.ToString(); // Hiển thị tổng tiền của đơn hàng
        rptOrderDetails.DataSource = orderDetails.ToList();
        rptOrderDetails.DataBind();
        
       
    }
}