using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class UserAdmin_cms_admin_product_ManageProdct_ProductLoadControl : System.Web.UI.UserControl
{
    private string operation = "";
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Request.QueryString["operation"] != null)
            operation = Request.QueryString["operation"];
        switch (operation)
        {
            case "ThemMoi":
                plProductLoad.Controls.Add(LoadControl("Product_Addnew.ascx"));
                break;
            case "QuanLy":
                plProductLoad.Controls.Add(LoadControl("Product_Edit.ascx"));
                break;
            case "ChinhSua":
                plProductLoad.Controls.Add(LoadControl("Product_ChinhSua.ascx"));
                break;


        }
    }
}