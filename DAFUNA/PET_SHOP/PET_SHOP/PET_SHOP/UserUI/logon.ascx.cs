using System;
using System.Security.Cryptography;
using System.Text;
using System.Linq;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Net.Mail;
using System.Net;
using System.IO;
public partial class UserUI_logon : System.Web.UI.UserControl
{
    public static QLSHOPDataContext db = new QLSHOPDataContext();

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            // Kiểm tra xem người dùng đã đăng nhập hay chưa
            if (Session["UserToken"] != null)
            {
                // Nếu đã đăng nhập, chuyển hướng đến trang chính
                Response.Redirect("TrangChu.aspx");
            }
        }
    }

    protected void btnSubmit_Click(object sender, EventArgs e)
    {
        string username = txtEmail.Text;
        string password = txtMatKhau.Text;

        // Giả sử phương thức AuthenticateUser trả về một Token và role_id sau khi xác thực người dùng
        var (token, roleId) = AuthenticateUser(username, password);

        if (!string.IsNullOrEmpty(token) && roleId.HasValue)
        {
            // Lưu Token vào Session
            Session["UserToken"] = token;

            // Lưu tên người dùng vào Session (tuỳ chọn)
            Session["Username"] = username;
            
            Session["UserRole"] = roleId; // Lưu role_id vào Session

            // Chuyển hướng dựa trên role_id
            if (roleId == 1)
            {

                Response.Redirect("/UserAdmin/Admin.aspx");
            }
            else if (roleId == 2)
            {
                Response.Redirect("TrangChu.aspx");
            }
            else
            {
                lblMessage.Text = "Quyền truy cập không hợp lệ.";
                lblMessage.Visible = true;
                Response.Redirect("Dangnhap.aspx");
            }
        }
        else
        {
            // Hiển thị thông báo lỗi nếu đăng nhập thất bại
            lblMessage.Text = "Đăng nhập không thành công. Vui lòng kiểm tra lại tên đăng nhập và mật khẩu.";
            lblMessage.Visible = true;
        }
    }


    // Giả sử đây là phương thức xác thực người dùng và trả về Token
    private (string token, int? roleId) AuthenticateUser(string username, string password)
    {
        // Mã hóa mật khẩu người dùng nhập vào
        string hashedPassword = HashPassword(password);

        // Thực hiện xác thực người dùng từ cơ sở dữ liệu
        var user = db.Users.SingleOrDefault(u => u.email == username && u.password == hashedPassword);

        if (user != null)
        {
            // Trả về token và role_id nếu người dùng tồn tại và xác thực thành công
            return ("user-token", user.role_id);
        }
        else
        {
            return (null, null);
        }
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


    private void LogError(Exception ex)
    {
        string logFilePath = Server.MapPath("~/App_Data/ErrorLog.txt");

        try
        {
            // Kiểm tra xem tệp tin đã tồn tại chưa
            if (!File.Exists(logFilePath))
            {
                // Nếu không, tạo mới tệp tin
                File.Create(logFilePath).Close();
            }

            // Ghi log vào tệp tin
            File.AppendAllText(logFilePath, DateTime.Now.ToString() + " " + ex.ToString() + Environment.NewLine);
        }
        catch (Exception)
        {
            // Xử lý ngoại lệ khi ghi log không thành công
        }
    }


    private string GenerateRandomPassword(int length = 8)
    {
        const string validChars = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ1234567890";
        StringBuilder res = new StringBuilder();
        Random rnd = new Random();
        while (0 < length--)
        {
            res.Append(validChars[rnd.Next(validChars.Length)]);
        }
        return res.ToString();
    }

    private void SendEmail(string toEmail, string subject, string body)
    {
        try
        {
            using (MailMessage mail = new MailMessage())
            {
                mail.From = new MailAddress("voduyman2111@gmail.com");
                mail.To.Add(toEmail);
                mail.Subject = subject;
                mail.Body = body;
                mail.IsBodyHtml = true;

                using (SmtpClient smtp = new SmtpClient("smtp.gmail.com", 587))
                {
                    smtp.Credentials = new NetworkCredential("voduyman2111@gmail.com", "nqhuqbfxjjevksor");
                    smtp.EnableSsl = true;
                    smtp.Send(mail);
                }
            }
        }
        catch (Exception ex)
        {
            // Ghi log lỗi
            LogError(ex);

            // Hiển thị thông báo lỗi
            lblMessage.Text = "Không thể gửi email. Vui lòng thử lại sau.";
            lblMessage.Visible = true;
        }
    }

    protected void btnSearch_Click(object sender, EventArgs e)
    {
        Response.Redirect("TimKiem.aspx?strSearch=" + txtSearch.Text);
    }

   protected void Button1_Click(object sender, EventArgs e)
{
    string email = txtMatKhauMoi.Text;

    // Tìm người dùng theo email
    var user = db.Users.SingleOrDefault(u => u.email == email);
    if (user != null)
    {
        // Tạo mật khẩu mới
        string newPassword = GenerateRandomPassword();

        // Mã hóa mật khẩu mới
        string hashedPassword = HashPassword(newPassword);

        // Cập nhật mật khẩu mới vào cơ sở dữ liệu
        user.password = hashedPassword;
        
        try
        {
            // Lưu thay đổi vào cơ sở dữ liệu
            db.SubmitChanges();
            
            // Gửi mật khẩu mới tới email của người dùng
            string subject = "Mật khẩu mới của bạn";
            string body = "<p>PET SHOP xin chào!!</p><br/>" +
                "<p>Bạn vừa yêu cầu cấp lại mật khẩu</p>" +
                "<p>Đây là mật khẩu mới của bạn:</p>" +
                $"<p>{newPassword}</p>";

            SendEmail(email, subject, body);

            lblMessage.Text = "Mật khẩu mới đã được gửi tới email của bạn.";
            txtMatKhauMoi.Text = "";
            }
        catch (Exception ex)
        {
            // Ghi log lỗi
            LogError(ex);

            // Hiển thị thông báo lỗi
            lblMessage.Text = "Không thể cập nhật mật khẩu mới. Vui lòng thử lại sau.";
        }
    }
    else
    {
        lblMessage.Text = "Địa chỉ email không tồn tại.";
    }
    lblMessage.Visible = true;
}


    

}
