using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class UserAdmin_cms_admin_product_ManageOptions_optionsLoadControl : System.Web.UI.UserControl
{
    private string operation = "";
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Request.QueryString["operation"] != null)
            operation = Request.QueryString["operation"];
        switch (operation)
        {
            case "ThemMoi":
                plOptionsLoad.Controls.Add(LoadControl("Options_Addnew.ascx"));
                break;
            case "QuanLy":
                plOptionsLoad.Controls.Add(LoadControl("Options_Edit.ascx"));
                break;
            case "ChinhSua":
                plOptionsLoad.Controls.Add(LoadControl("Options_ChinhSua.ascx"));
                break;


        }
    }
}