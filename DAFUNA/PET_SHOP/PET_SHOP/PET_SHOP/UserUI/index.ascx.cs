using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class UserUI_index : System.Web.UI.UserControl
{
    public static QLSHOPDataContext db = new QLSHOPDataContext();
    public static List<Menu> ListDMMenu = new List<Menu>();
    public static List<Producer> ListDMThuonghieu = new List<Producer>();
    public static List<Product> ListSP = new List<Product>();

    protected void Page_Load(object sender, EventArgs e)
    {
        LoadData1();
        LoadData2();
        LoadSanPham();

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
            if (Session["UserToken"] == null || (int)Session["UserRole"] == 1)
    {
        // Redirect to the login page if the user is not a regular user
        Response.Redirect("Dangnhap.aspx");
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
        Response.Redirect("TrangChu.aspx");
    }




    void LoadData1()
    {
        var data = from q in db.Menus
                   orderby q.locations ascending
                   select q;
        if (data != null && data.Count() > 0)
        {
            ListDMMenu = data.ToList();
        }
    }
    void LoadData2()
    {
        var data = from q in db.Producers
                   orderby q.locations ascending
                   select q;
        if (data != null && data.Count() > 0)
        {
            ListDMThuonghieu = data.ToList();
        }
    }
    // Load Sản Phẩm Nổi Bật
    void LoadSanPham()
    {
        var data = from q in db.Products
                   where q.outstanding == 1
                   select q;

        if (data != null && data.Count() > 0)
        {
            ListSP = data.ToList();
        }
    }

    protected void btnSearch_Click(object sender, EventArgs e)
    {
        Response.Redirect("TimKiem.aspx?strSearch=" + txtSearch.Text);
    }
}