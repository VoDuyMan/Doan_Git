using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class UserAdmin_cms_admin_product_ManageCategory_CategoryLoadControl : System.Web.UI.UserControl
{
    private string operation = "";
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Request.QueryString["operation"] != null)
            operation = Request.QueryString["operation"];
        switch (operation)
        {
            case "ThemMoi":
                plCategoryLoad.Controls.Add(LoadControl("Category_Addnew.ascx"));
                break;
            case "QuanLy":
                plCategoryLoad.Controls.Add(LoadControl("Category_Edit.ascx"));
                break;
            case "ChinhSua":
                plCategoryLoad.Controls.Add(LoadControl("Category_ChinhSua.ascx"));
                break;


        }
    }
}