using System;
using System.Security.Cryptography;
using System.Text;
using System.Linq;
using System.Web.UI;
using System.Web.UI.WebControls;


public partial class UserUI_create_acount : System.Web.UI.UserControl
{
    public static QLSHOPDataContext db = new QLSHOPDataContext();
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void btnSubmit_Click(object sender, EventArgs e)
    {
        string email = txtEmail.Text;
        if (IsEmailExists(email))
        {
            lblMessage.Text = "Email đã tồn tại. Vui lòng sử dụng email khác.";
            lblMessage.ForeColor = System.Drawing.Color.Red;
        }
        else
        {
            User infoUser = new User();
            infoUser.firstname = txtHo.Text;
            infoUser.lastname = txtTen.Text;
            infoUser.address = txtDiaChi.Text;
            infoUser.phone_number = txtSoDienThoai.Text;
            infoUser.email = email;
            infoUser.created_at = DateTime.Now;
            infoUser.password = HashPassword(txtMatKhau.Text); // Mã hóa mật khẩu
            infoUser.role_id = 2;
            db.Users.InsertOnSubmit(infoUser);
            db.SubmitChanges();
            Response.Redirect("Dangnhap.aspx");
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
}