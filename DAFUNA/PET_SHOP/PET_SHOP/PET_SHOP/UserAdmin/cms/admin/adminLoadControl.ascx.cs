using System;


public partial class UserAdmin_cms_admin_adminLoadControl : System.Web.UI.UserControl
{
    string modul = "";
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Request.QueryString["modul"] != null)
            modul = Request.QueryString["modul"];
        switch (modul)
        {
            case "SanPham":
                plAdminLoadControl.Controls.Add(LoadControl("product/productLoadControl.ascx"));
                break;
            case "TaiKhoan":
                plAdminLoadControl.Controls.Add(LoadControl("account/accountLoadControl.ascx"));
                break;

            default:
                plAdminLoadControl.Controls.Add(LoadControl("TrangChuAdmin.ascx"));
                break;
        }    
        
    }
}