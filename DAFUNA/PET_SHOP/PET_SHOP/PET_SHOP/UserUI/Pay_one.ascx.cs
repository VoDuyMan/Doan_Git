using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class UserUI_Pay_one : System.Web.UI.UserControl
{
    public static QLSHOPDataContext db = new QLSHOPDataContext();
    public static Product infoSanPham = new Product();
    protected void Page_Load(object sender, EventArgs e)
    {
        try
        {
            if (Request.QueryString["id"] != "")
            {
                long IdGet = Convert.ToInt64(Request.QueryString["id"]);
                LoadData(IdGet);
            }
            else
            {
                Response.Redirect("TrangChu.aspx");
            }
        }
        catch (Exception ex)
        {
            Response.Redirect("TrangChu.aspx");

        }

    }

    void LoadData(long IdQuanAoInput)
    {
        var data = from q in db.Products
                   where q.id == IdQuanAoInput
                   select q;
        if (data != null && data.Count() > 0)
        {
            infoSanPham = data.First();
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
                // Retrieve product information
                var product = db.Products.SingleOrDefault(p => p.id == infoSanPham.id);
                if (product != null && product.inventory >= 1)
                {
                    // Create a new order
                    Order newOrder = new Order
                    {
                        user_id = user.id,
                        order_date = DateTime.Now,
                        total_money = infoSanPham.price,
                        fullname = txtName.Text,
                        email = txtEmail.Text,
                        phone_number = txtPhone.Text,
                        address = txtAddress.Text,
                        status = 1,
                        product_id = infoSanPham.id
                    };

                    // Add the order to the database
                    db.Orders.InsertOnSubmit(newOrder);
                    db.SubmitChanges();

                    // Add order details to the Detail_Order table
                    Detail_Order newOrderDetail = new Detail_Order
                    {
                        order_id = newOrder.id,
                        product_id = infoSanPham.id,
                        quantity = 1
                    };

                    // Add the order detail to the database
                    db.Detail_Orders.InsertOnSubmit(newOrderDetail);
                    db.SubmitChanges();

                    // Update product inventory
                    product.inventory -= 1;
                    db.SubmitChanges();

                    // Redirect to thank you page
                    Response.Redirect("Thank.aspx");
                }
                else
                {
                    // Handle case where inventory is insufficient
                    lbthongTinDatHang.Text = "Số lượng sản phẩm tồn kho không đủ!";
                }
            }
            else
            {
                // Handle case where user is not found
                Response.Redirect("Dangnhap.aspx");
            }
        }
        else
        {
            // If user is not logged in, redirect to login page
            Response.Redirect("Dangnhap.aspx");
        }
    }
}
        