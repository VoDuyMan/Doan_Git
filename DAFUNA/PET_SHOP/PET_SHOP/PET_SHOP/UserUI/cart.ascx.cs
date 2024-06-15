using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class UserUI_cart : System.Web.UI.UserControl
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

            if (user != null)
            {
                var cartItems = from cart in db.Order_Details
                                join product in db.Products on cart.product_id equals product.id
                                where cart.user_id == user.id
                                select new
                                {
                                    product.id,
                                    product.title,
                                    product.thumbnail,
                                    cart.num,
                                    cart.price,
                                    TotalPrice = (cart.num) * (cart.price)
                                };

                var cartItemsList = cartItems.ToList();
                totalPrice = cartItemsList.Sum(item => item.TotalPrice.Value);

                rptCartItems.DataSource = cartItemsList;
                rptCartItems.DataBind();
            }
        }
    }

    protected void rptCartItems_ItemCommand(object source, RepeaterCommandEventArgs e)
    {
        // Xử lý các lệnh từ Repeater (nếu cần)
    }

    public decimal GetTotalPrice()
    {
        return totalPrice;
    }

    protected void rptCartItems_ItemCommand1(object source, RepeaterCommandEventArgs e)
    {
        if (e.CommandName == "DeleteItem")
        {
            int productId = Convert.ToInt32(e.CommandArgument);

            // Thực hiện xóa sản phẩm có ID là productId từ cơ sở dữ liệu
            Cart.DeleteProduct(productId);

            // Sau khi xóa sản phẩm, cập nhật lại danh sách sản phẩm trong giỏ hàng
            LoadCartItems();
        }
    }

    protected void btnCheckout_Click(object sender, EventArgs e)
    {
        // Kiểm tra xem người dùng có đăng nhập hay không
        if (Session["UserToken"] != null)
        {
            // Lấy thông tin người dùng từ Session
            string username = Session["Username"].ToString();
            var user = db.Users.SingleOrDefault(u => u.email == username);

            if (user != null)
            {
                // Lấy các sản phẩm trong giỏ hàng của người dùng
                var cartItems = from cart in db.Order_Details
                                join product in db.Products on cart.product_id equals product.id
                                where cart.user_id == user.id
                                select new
                                {
                                    product.id,
                                    product.title,
                                    product.thumbnail,
                                    cart.num,
                                    cart.price,
                                    TotalPrice = (cart.num) * (cart.price)
                                };

                var cartItemsList = cartItems.ToList();

                // Lưu thông tin giỏ hàng vào Session để truyền sang trang thanh toán
                Session["CartItems"] = cartItemsList;

                // Chuyển hướng đến trang thanh toán
                Response.Redirect("ThanhToan.aspx");
            }
        }
        else
        {
            // Nếu người dùng chưa đăng nhập, chuyển hướng đến trang đăng nhập

        }
    }
}

public class Cart
{
    public static void DeleteProduct(int productId)
    {
        using (QLSHOPDataContext db = new QLSHOPDataContext())
        {
            // Tìm sản phẩm cần xóa trong đối tượng cơ sở dữ liệu
            Order_Detail productToDelete = db.Order_Details.FirstOrDefault(p => p.product_id.Value == productId);

            if (productToDelete != null)
            {
                // Xóa sản phẩm từ cơ sở dữ liệu
                db.Order_Details.DeleteOnSubmit(productToDelete);
                db.SubmitChanges(); // Lưu thay đổi vào cơ sở dữ liệu
            }
            else
            {
                // Sản phẩm không tồn tại trong giỏ hàng
                // Có thể thông báo cho người dùng hoặc ghi log
            }
        }
    }
}
