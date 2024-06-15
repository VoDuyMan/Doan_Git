using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class UserAdmin_cms_admin_account_ManageOrder_OderLoadControl : System.Web.UI.UserControl
{
    private string operation = "";
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Request.QueryString["operation"] != null)
            operation = Request.QueryString["operation"];
        switch (operation)
        {
            case "QuanLy":
                plTaiKhoanLoadControl.Controls.Add(LoadControl("OrderManage.ascx"));
                break;
            case "ChiTiet":
                plTaiKhoanLoadControl.Controls.Add(LoadControl("Order_Details.ascx"));
                break;
            


        }
    }
}