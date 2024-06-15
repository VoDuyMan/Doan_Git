using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class UserAdmin_cms_admin_account_ManageContact_ContactLoadControl : System.Web.UI.UserControl
{
    private string operation = "";
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Request.QueryString["operation"] != null)
            operation = Request.QueryString["operation"];
        switch (operation)
        {
            case "LienHe":
                plTaiKhoanAccountLoadControl.Controls.Add(LoadControl("Contact_Manage.ascx"));
                break;
            case "XemThu":
                plTaiKhoanAccountLoadControl.Controls.Add(LoadControl("Contact_Details.ascx"));
                break;
        


        }
    }
}