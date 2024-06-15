using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Security.Cryptography;
using System.Text;

public partial class UserUI_account : System.Web.UI.UserControl
{
    public static QLSHOPDataContext db = new QLSHOPDataContext();

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
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

                    // Load thông tin tài khoản
                    LoadOptionData(user.id);
                }
            }
            else
            {
                // Người dùng chưa đăng nhập
                lblWelcome.Text = "";
            }
        }
    }

    private bool IsEmailExists(string email)
    {
        var user = db.Users.SingleOrDefault(u => u.email == email);
        return user != null;
    }
    private string HashPassword(string password)
    {
        using (MD5 md5Hash = MD5.Create())
        {
            byte[] bytes = md5Hash.ComputeHash(Encoding.UTF8.GetBytes(password));
            StringBuilder builder = new StringBuilder();
            for (int i = 0; i < bytes.Length; i++)
            {
                builder.Append(bytes[i].ToString("x2"));
            }
            return builder.ToString();
        }
    }

    private void LoadOptionData(int id)
    {
        var option = db.Users.SingleOrDefault(o => o.id == id);
        if (option != null)
        {
            string fullName = $"{option.firstname} {option.lastname}";
            TenTaiKhoan.Text = fullName;
            txtEmail.Text = option.email;
            txtSoDienThoai.Text = option.phone_number;
            txtDiaChi.Text = option.address;
            // Assuming that the image file path is stored in the database
            imgCurrentThumbnail.ImageUrl = "/img/" + option.thumbnail;

            // Load other fields if necessary
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


    protected void ChinhSua_Click(object sender, EventArgs e)
    {
        if (Session["UserToken"] != null)
        {
            // Lấy thông tin người dùng từ Session
            string username = Session["Username"].ToString();

            // Lấy thông tin người dùng từ cơ sở dữ liệu
            var user = db.Users.SingleOrDefault(u => u.email == username);
            if (user != null)
            {
                // Cập nhật thông tin người dùng với các giá trị mới từ giao diện
                
                
                user.email = txtEmail.Text;
                user.phone_number = txtSoDienThoai.Text;
                user.address = txtDiaChi.Text;
                user.updated_at = DateTime.Now;
                // Cập nhật hình ảnh nếu cần thiết
                if (flAnhDaiDien.HasFile)
                {
                        string fileName = System.IO.Path.GetFileName(flAnhDaiDien.FileName);
                        string filePath = "~/img/" + fileName;
                        flAnhDaiDien.SaveAs(Server.MapPath(filePath));
                    
                        user.thumbnail = fileName;
                }
                // Cập nhật mật khẩu nếu người dùng đã nhập
                if (!string.IsNullOrEmpty(txtMatKhau.Text))
                {
                    user.password = HashPassword(txtMatKhau.Text);
                }


                // Lưu thay đổi vào cơ sở dữ liệu
                db.SubmitChanges();
                Response.Redirect("ThongTin.aspx");
                // Hiển thị thông báo thành công hoặc chuyển hướng đến trang khác nếu cần
                // Ví dụ: lblMessage.Text = "Thông tin đã được cập nhật thành công!";
            }
        }
        else
        {
            // Người dùng chưa đăng nhập, xử lý tùy thuộc vào yêu cầu của bạn
        }
    }
    protected void btnSearch_Click(object sender, EventArgs e)
    {
        Response.Redirect("TimKiem.aspx?strSearch=" + txtSearch.Text);
    }
}