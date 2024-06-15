using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class UserAdmin_cms_admin_account_accountLoadControl : System.Web.UI.UserControl
{
    private string modulextra = "";
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Request.QueryString["modulextra"] != null)
            modulextra = Request.QueryString["modulextra"];
        switch (modulextra)
        {
            case "QuanLy":
                plTaiKhoanLoadControl.Controls.Add(LoadControl("ManageAccount/UserLoadControl.ascx"));
                break;
            case "ThongTin":
                plTaiKhoanLoadControl.Controls.Add(LoadControl("ManageOrder/OderLoadControl.ascx"));
                break;
            case "ThongTinLienHe":
                plTaiKhoanLoadControl.Controls.Add(LoadControl("ManageContact/ContactLoadControl.ascx"));
                break;

        }
    }
}