using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class UserUI_search : System.Web.UI.UserControl
{
    public static QLSHOPDataContext db = new QLSHOPDataContext();
    public static List<Menu> ListDMMenu = new List<Menu>();
    public static List<Producer> ListDMThuonghieu = new List<Producer>();
    public static List<Option> ListDMOption = new List<Option>();
    public static List<Product> ListSP = new List<Product>();
    public static string strGet = "";

    protected void Page_Load(object sender, EventArgs e)
    {
        try
        {
            if (Request.QueryString["strSearch"] != "")
            {
                strGet = Request.QueryString["strSearch"];
                LoadDM(strGet);

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
        LoadData1();
        LoadData2();
        LoadData3();

    }

    protected void btnLogout_Click(object sender, EventArgs e)
    {
        // Xóa token và tên người dùng khỏi Session để đăng xuất
        Session.Remove("UserToken");
        Session.Remove("Username");

        // Chuyển hướng người dùng đến trang đăng nhập hoặc trang chính (tuỳ thuộc vào yêu cầu của bạn)
        Response.Redirect("TimKiem.aspx");
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
    void LoadData3()
    {
        var data = from q in db.Options
                   orderby q.location ascending
                   select q;
        if (data != null && data.Count() > 0)
        {
            ListDMOption = data.ToList();
        }
    }
    // Load Sản Phẩm Nổi Bật
    void LoadDM(string strInput)
    {
        var data = from q in db.Products
                   where q.title.Contains(strInput)
                   select q;
        if (data == null && data.Count() < 0)
        {
            Console.WriteLine("Sản Phẩm lỗi");


        }
        else
            ListSP = data.ToList();

    }
}