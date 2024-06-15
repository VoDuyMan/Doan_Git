using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class UserUI_pay : System.Web.UI.UserControl
{
    public static QLSHOPDataContext db = new QLSHOPDataContext();

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            LoadCartItems();
        }
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
                                    cart.total_money,
                                    TotalPrice = (cart.num) * (cart.price)
                                };

                var cartItemsList = cartItems.ToList();
                decimal totalPrice = cartItemsList.Sum(item => item.TotalPrice.Value);
                lblTotalPrice.Text = totalPrice.ToString("C");

                // Sum of all items
                decimal totalPriceSum = cartItemsList.Sum(item => item.TotalPrice.Value);
                lblTotalSum.Text = totalPriceSum.ToString("C");

                rptCartItems.DataSource = cartItemsList;
                rptCartItems.DataBind();
            }
        }
    }

    protected void btnConfirmPayment_Click(object sender, EventArgs e)
    {
        // Xác định người dùng đang đăng nhập và thông tin của họ
        if (Session["UserToken"] != null)
        {
            string username = Session["Username"].ToString();
            var user = db.Users.SingleOrDefault(u => u.email == username);

            if (user != null)
            {
                var cartItems = from cart in db.Order_Details
                                where cart.user_id == user.id
                                select cart;

                if (cartItems.Any())
                {
                    // Tạo một đơn hàng mới
                    Order newOrder = new Order
                    {
                        user_id = user.id,
                        order_date = DateTime.Now,
                        total_money = cartItems.Sum(c => (c.num) * (c.price)),
                        fullname = txtName.Text,
                        email = txtEmail.Text,
                        phone_number = txtPhone.Text,
                        address = txtAddress.Text,
                        status = 1
                    };

                    // Thêm đơn hàng vào cơ sở dữ liệu
                    db.Orders.InsertOnSubmit(newOrder);
                    db.SubmitChanges();

                    // Thêm thông tin chi tiết về các sản phẩm trong đơn hàng vào bảng liên kết mới
                    foreach (var cartItem in cartItems)
                    {
                        Detail_Order newOrderDetail = new Detail_Order
                        {
                            order_id = newOrder.id,
                            product_id = cartItem.product_id,
                            quantity = cartItem.num
                            // Thêm các cột khác nếu cần
                        };

                        // Thêm thông tin chi tiết đơn hàng vào cơ sở dữ liệu
                        db.Detail_Orders.InsertOnSubmit(newOrderDetail);

                        // Cập nhật số lượng tồn kho của sản phẩm
                        var product = db.Products.SingleOrDefault(p => p.id == cartItem.product_id);
                        if (product != null)
                        {
                            product.inventory -= cartItem.num;

                            if (product.inventory < 0)
                            {
                                product.inventory = 0; // đảm bảo tồn kho không âm
                            }
                        }
                    }

                    // Lưu thay đổi vào cơ sở dữ liệu
                    db.SubmitChanges();

                    // Xóa các sản phẩm trong giỏ hàng
                    db.Order_Details.DeleteAllOnSubmit(cartItems);
                    db.SubmitChanges();

                    // Chuyển hướng đến trang cảm ơn
                    Response.Redirect("Thank.aspx");
                }
            }
        }
    }


}