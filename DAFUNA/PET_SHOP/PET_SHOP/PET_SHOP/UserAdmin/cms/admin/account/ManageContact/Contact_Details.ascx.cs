using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class UserAdmin_cms_admin_account_ManageContact_Contact_Details : System.Web.UI.UserControl
{
    public static QLSHOPDataContext db = new QLSHOPDataContext();

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            if (Request.QueryString["id"] != null)
            {
                int id;
                if (int.TryParse(Request.QueryString["id"], out id))
                {
                    LoadOptionData(id);
                }

            }

        }
    }

    private void LoadOptionData(int id)
    {
        var feedback = db.FeedBacks.SingleOrDefault(f => f.id == id);
        if (feedback != null)
        {
            TenUser.Text = feedback.fullname;
            txtEmail.Text = feedback.email;
            txtNoiDung.Text = feedback.note;

            // Fetch the associated account information
            var user = db.Users.SingleOrDefault(u => u.id == feedback.user_id);
            if (user != null)
            {
                string fullName = $"{user.firstname} {user.lastname}";
                txtTaiKhoan.Text = fullName;
            }

        }

    }
}