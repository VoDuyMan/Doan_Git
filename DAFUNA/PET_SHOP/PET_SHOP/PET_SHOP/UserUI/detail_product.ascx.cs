using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class UserUI_detail_product : System.Web.UI.UserControl
{
    public static QLSHOPDataContext db = new QLSHOPDataContext();
    public static Product infoproduct = new Product();
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

    }

    protected void btnLogout_Click(object sender, EventArgs e)
    {
        // Xóa token và tên người dùng khỏi Session để đăng xuất
        Session.Remove("UserToken");
        Session.Remove("Username");

        // Chuyển hướng người dùng đến trang đăng nhập hoặc trang chính (tuỳ thuộc vào yêu cầu của bạn)
        Response.Redirect("CTSP.aspx");
    }

    void LoadData(long idInput)
    {
        var data = from q in db.Products
                   where q.id == idInput
                   select q;
        if (data != null && data.Count() > 0)
        {
            infoproduct = data.First();
        }
    }
    protected void btnSearch_Click(object sender, EventArgs e)
    {
        Response.Redirect("TimKiem.aspx?strSearch=" + txtSearch.Text);
    }

    protected void btnAddToCart_Click(object sender, EventArgs e)
    {
        if (Session["UserToken"] != null)
        {
            string username = Session["Username"].ToString();
            var user = db.Users.SingleOrDefault(u => u.email == username);

            if (user != null)
            {
                // Lấy số lượng từ TextBox
                int quantity = Convert.ToInt32(txtSL.Text);

                // Lấy thông tin sản phẩm
                var product = db.Products.SingleOrDefault(p => p.id == infoproduct.id);
                if (product == null)
                {
                    lbthongTinDatHang.Text = "Sản phẩm không tồn tại!";
                    return;
                }

                // Kiểm tra tồn kho
                if (quantity > product.inventory)
                {
                    lbthongTinDatHang.Text = $"Số lượng sản phẩm tồn kho chỉ còn {product.inventory}!";
                    return;
                }

                // Kiểm tra xem sản phẩm đã có trong giỏ hàng chưa
                var existingCartItem = db.Order_Details.SingleOrDefault(c => c.product_id == infoproduct.id && c.user_id == user.id);

                if (existingCartItem != null)
                {
                    // Nếu sản phẩm đã có trong giỏ hàng, tăng số lượng lên
                    existingCartItem.num += quantity;

                    // Kiểm tra tồn kho khi cập nhật số lượng
                    if (existingCartItem.num > product.inventory)
                    {
                        lbthongTinDatHang.Text = $"Số lượng sản phẩm tồn kho chỉ còn {product.inventory}!";
                        return;
                    }

                    existingCartItem.total_money = existingCartItem.num * existingCartItem.price;
                }
                else
                {
                    // Nếu sản phẩm chưa có trong giỏ hàng, thêm mới
                    Order_Detail newItem = new Order_Detail()
                    {
                        user_id = user.id,
                        product_id = infoproduct.id,
                        price = infoproduct.price,
                        num = quantity,
                        total_money = infoproduct.price * quantity
                    };

                    db.Order_Details.InsertOnSubmit(newItem);
                    lbthongTinDatHang.Text = "Thêm vào giỏ hàng thành công!!";
                }

                // Lưu thay đổi vào cơ sở dữ liệu
                db.SubmitChanges();

                // Chuyển hướng đến trang giỏ hàng (nếu cần thiết)
                // Response.Redirect("GioHang.aspx");
            }
        }
        else
        {
            // Nếu người dùng chưa đăng nhập, chuyển hướng đến trang đăng nhập
            Response.Redirect("Dangnhap.aspx");
        }
    }






    protected void btnThanhToan_Click(object sender, EventArgs e)
    {
        if (Session["UserToken"] != null)
        {


            Response.Redirect("ThanhToan_One.aspx?id="+infoproduct.id); 
        }
        else
        {
            // Người dùng chưa đăng nhập, chuyển hướng đến trang đăng nhập
            Response.Redirect("Dangnhap.aspx");
        }
    }

}