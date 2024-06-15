using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class UserAdmin_cms_admin_product_productLoadControl : System.Web.UI.UserControl
{
    private string modulextra = "";
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Request.QueryString["modulextra"] != null)
            modulextra = Request.QueryString["modulextra"];
        switch (modulextra)
        {
            case "DanhMuc":
                plSanPhamLoadControl.Controls.Add(LoadControl("ManageCategory/CategoryLoadControl.ascx"));
                break;
            case "DanhMucLuaChon":
                plSanPhamLoadControl.Controls.Add(LoadControl("ManageOptions/optionsLoadControl.ascx"));
                break;
            case "DanhSachSanPham":
                plSanPhamLoadControl.Controls.Add(LoadControl("ManageProdct/ProductLoadControl.ascx"));
                break;

        }
    }
}