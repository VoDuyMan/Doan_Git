using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class UserUI_contact : System.Web.UI.UserControl
{
    public static QLSHOPDataContext db = new QLSHOPDataContext();
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
    }
    protected void btnLogout_Click(object sender, EventArgs e)
    {
        // Xóa token và tên người dùng khỏi Session để đăng xuất
        Session.Remove("UserToken");
        Session.Remove("Username");

        // Chuyển hướng người dùng đến trang đăng nhập hoặc trang chính (tuỳ thuộc vào yêu cầu của bạn)
        Response.Redirect("LienHe.aspx");
    }

    protected void btnSubmit_Click(object sender, EventArgs e)
    {
        if (Session["UserToken"] != null)
        {
            string username = Session["Username"].ToString();
            var user = db.Users.SingleOrDefault(u => u.email == username);

            if (user != null)
            {
                FeedBack infofeedback = new FeedBack
                {
                    user_id = user.id,
                    fullname = txtName.Text,
                    email = txtEmail.Text,
                    note = txtMessenger.Text
                    
                };
                infofeedback.created_at = DateTime.Now;
                db.FeedBacks.InsertOnSubmit(infofeedback);
                db.SubmitChanges();
                lblSuccessMessage.Visible = true;

                txtName.Text = "";
                txtEmail.Text = "";
                txtMessenger.Text = "";
                lblSuccessMessage.Text = "Gửi phản hồi thành công!";
                lblSuccessMessage.Visible = true;
            }
            else
            {
                lblSuccessMessage.Text = "Người dùng không tồn tại.";
                lblSuccessMessage.Visible = true;
            }
        }
        else
        {
            lblSuccessMessage.Text = "Bạn cần đăng nhập để gửi phản hồi.";
            lblSuccessMessage.Visible = true;
        }
    }
}
