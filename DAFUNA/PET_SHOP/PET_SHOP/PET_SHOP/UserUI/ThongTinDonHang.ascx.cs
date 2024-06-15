using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class UserUI_ThongTinDonHang : System.Web.UI.UserControl
{
    public static QLSHOPDataContext db = new QLSHOPDataContext();
    private decimal totalPrice = 0;

    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["UserToken"] != null)
        {
            // Người dùng đã đăng nhập, lấy thông tin từ Session
            string username = Session["Username"].ToString();

            // Lấy thông tin người dùng từ cơ sở dữ liệu
            var user = db.Users.SingleOrDefault(u => u.email == username);
            if (user != null)
            {
                // Hiển thị thông tin người dùng
                lblWelcome.Text = user.lastname;
            }
        }
        else
        {
            // Người dùng chưa đăng nhập
            lblWelcome.Text = "";
        }
        if (!IsPostBack)
        {
            LoadCartItems();
        }
    }

    protected void btnLogout_Click(object sender, EventArgs e)
    {
        // Xóa token và tên người dùng khỏi Session để đăng xuất
        Session.Remove("UserToken");
        Session.Remove("Username");

        // Chuyển hướng người dùng đến trang đăng nhập hoặc trang chính (tuỳ thuộc vào yêu cầu của bạn)
        Response.Redirect("DMSP.aspx");
    }

    protected void btnSearch_Click(object sender, EventArgs e)
    {
        Response.Redirect("TimKiem.aspx?strSearch=" + txtSearch.Text);
    }

    private void LoadCartItems()
    {
        if (Session["UserToken"] != null)
        {
            string username = Session["Username"].ToString();
            var user = db.Users.SingleOrDefault(u => u.email == username);



            var orderDetails = from detail in db.Detail_Orders
                               join product in db.Products on detail.product_id equals product.id
                               join order in db.Orders on detail.order_id equals order.id
                               where order.user_id == user.id
                               select new
                               {
                                   product.title,
                                   product.thumbnail,
                                   detail.quantity,
                                   product.price,
                                   order.status,
                                   Total_money = detail.quantity * product.price
                               };

            if (orderDetails.Any())
            {
                decimal totalMoneyOfAllProducts = orderDetails.Sum(detail => detail.Total_money ?? 0);
                lblTotalMoney.Text = totalMoneyOfAllProducts.ToString(); // Hiển thị tổng tiền của đơn hàng
            }
            else
            {
                lblTotalMoney.Text = "0"; // Nếu không có đơn hàng, tổng tiền là 0
            }

            rptCartItems.DataSource = orderDetails.ToList();
            rptCartItems.DataBind();

        }
    }
    protected void rptCartItems_ItemCommand1(object source, RepeaterCommandEventArgs e)
    {
        if (e.CommandName == "CancelOrder")
        {
            // Lấy id của đơn hàng từ CommandArgument
            int orderId = Convert.ToInt32(e.CommandArgument);

            // Lấy đơn hàng từ cơ sở dữ liệu
            var order = db.Orders.FirstOrDefault(o => o.id == orderId);

            if (order != null && order.status == 1) // Đảm bảo đơn hàng tồn tại và đang ở trạng thái Đang chờ xử lý
            {
                // Cập nhật trạng thái của đơn hàng thành Đã hủy (status = 4)
                order.status = 4;
                db.SubmitChanges();

                // Load lại danh sách đơn hàng
                LoadCartItems();
            }
        }
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


