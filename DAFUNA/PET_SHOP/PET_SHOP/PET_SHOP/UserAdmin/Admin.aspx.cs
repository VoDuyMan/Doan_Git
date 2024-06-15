using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class UserAdmin_Admin : System.Web.UI.Page
{
    public static QLSHOPDataContext db = new QLSHOPDataContext();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["UserToken"] == null || (int)Session["UserRole"] != 1)
        {
            
            Response.Redirect("~/Dangnhap.aspx");
        }
        // Kiểm tra xem người dùng đã đăng nhập hay chưa
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
        Response.Redirect("~/TrangChu.aspx");
    }
}