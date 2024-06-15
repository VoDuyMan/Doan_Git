using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class UserAdmin_cms_admin_account_ManageAccount_UserLoadControl : System.Web.UI.UserControl
{
    private string operation = "";
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Request.QueryString["operation"] != null)
            operation = Request.QueryString["operation"];
        switch (operation)
        {
            case "QuanLy":
                plTaiKhoanAccountLoadControl.Controls.Add(LoadControl("ManageUser.ascx"));
                break;
            case "XemTaiKhoan":
                plTaiKhoanAccountLoadControl.Controls.Add(LoadControl("User_information.ascx"));
                break;
            case "ChinhSua":
                plTaiKhoanAccountLoadControl.Controls.Add(LoadControl("Category_ChinhSua.ascx"));
                break;


        }
    }
}