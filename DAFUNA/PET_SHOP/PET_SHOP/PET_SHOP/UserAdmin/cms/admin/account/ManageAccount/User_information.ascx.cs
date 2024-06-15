using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class UserAdmin_cms_admin_account_ManageAccount_User_information : System.Web.UI.UserControl
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
        var option = db.Users.SingleOrDefault(o => o.id == id);
        if (option != null)
        {
            string fullName = $"{option.firstname} {option.lastname}";
            TenUser.Text = fullName;
            txtEmail.Text = option.email;
            txtSodienthoai.Text = option.phone_number;
            txtDiaChi.Text = option.address;
            // Assuming that the image file path is stored in the database
            imgCurrentThumbnail.ImageUrl = "/img/" + option.thumbnail;
            
            // Load other fields if necessary
        }
        
    }

   



}