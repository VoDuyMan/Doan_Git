using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class UserAdmin_cms_admin_account_ManageOrder_OrderManage : System.Web.UI.UserControl
{
    public static QLSHOPDataContext db = new QLSHOPDataContext();

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            LoadCartItems();
        }
    }

    protected void rptCartItems_ItemCommand(object source, RepeaterCommandEventArgs e)
    {
        if (e.CommandName == "UpdateStatus")
        {
            int orderId = Convert.ToInt32(e.CommandArgument);
            var order = db.Orders.SingleOrDefault(o => o.id == orderId);
            if (order != null)
            {
                // Tăng trạng thái lên một giá trị
                order.status = (order.status % 4) + 1; // Giả sử trạng thái chỉ có 4 giá trị (1-4)
                db.SubmitChanges();
                LoadCartItems(); // Tải lại dữ liệu để cập nhật giao diện
            }
        }
    }

    protected void rptCartItems_ItemCommand1(object source, RepeaterCommandEventArgs e)
    {
        if (e.CommandName == "DeleteItem")
        {
            int userId = Convert.ToInt32(e.CommandArgument);

            // Thực hiện xóa sản phẩm có ID là userId từ cơ sở dữ liệu
          

            // Sau khi xóa sản phẩm, cập nhật lại danh sách sản phẩm trong giỏ hàng
            LoadCartItems();
        }
    }

    private void LoadCartItems()
    {
        var cartItems = from user in db.Orders
                        select new
                        {
                            user.id,
                            user.fullname,
                            user.total_money,
                            user.order_date,
                            user.status
                        };
        

        var cartItemsList = cartItems.ToList();

        rptCartItems.DataSource = cartItemsList;
        rptCartItems.DataBind();
    }
    public class StatusInfo
    {
        public string Text { get; set; }
        public string Color { get; set; }
    }

    public StatusInfo GetStatusText(object statusObj)
    {
        int status = Convert.ToInt32(statusObj);
        switch (status)
        {
            case 1:
                return new StatusInfo { Text = "Đang chờ xử lý", Color = "green" };
            case 2:
                return new StatusInfo { Text = "Đã vận chuyển", Color = "#C49A6C" };
            case 3:
                return new StatusInfo { Text = "Đã giao", Color = "blue" };
            case 4:
                return new StatusInfo { Text = "Đã hủy", Color = "red" };
            default:
                return new StatusInfo { Text = "Unknown", Color = "black" };
        }
    }






}