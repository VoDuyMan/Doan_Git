using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class UserAdmin_cms_admin_product_ManageCategory_Category_ChinhSua : System.Web.UI.UserControl
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
                else
                {
                    lblErrorMessage.Text = "ID không hợp lệ.";
                }
            }
            else
            {
                lblErrorMessage.Text = "Không tìm thấy ID.";
            }
        }
    }

    private void LoadOptionData(int id)
    {
        var menu = db.Menus.SingleOrDefault(o => o.id == id);
        if (menu != null)
        {
            idDanhMuc.Text = menu.id.ToString();
            txtTenDanhMucLuaChon.Text = menu.name;
            // Assuming that the image file path is stored in the database
            txtViTriLuaChon.Text = menu.locations.ToString();
            // Load other fields if necessary
        }
        else
        {
            lblErrorMessage.Text = "Không tìm thấy danh mục với ID này.";
        }
    }

    protected void btnChinhSua_Click(object sender, EventArgs e)
    {
        lblErrorMessage.Text = ""; // Reset error message

        // Kiểm tra xem có ID sản phẩm được truyền không
        if (!string.IsNullOrEmpty(Request.QueryString["id"]))
        {
            int id;
            if (int.TryParse(Request.QueryString["id"], out id))
            {
                // Kiểm tra xem sản phẩm có tồn tại trong cơ sở dữ liệu không
                var existingMenu = db.Menus.SingleOrDefault(opt => opt.id == id);
                if (existingMenu != null)
                {
                    // Kiểm tra xem vị trí có phải là số nguyên dương không
                    int viTri;
                    if (!int.TryParse(txtViTriLuaChon.Text, out viTri) || viTri <= 0)
                    {
                        lblErrorMessage.Text = "Vị trí phải là một số nguyên dương.";
                        return;
                    }

                    // Kiểm tra xem vị trí đã tồn tại trong cơ sở dữ liệu chưa (ngoại trừ sản phẩm hiện tại)
                    var duplicateLocation = db.Menus.FirstOrDefault(opt => opt.locations == viTri && opt.id != id);
                    if (duplicateLocation != null)
                    {
                        lblErrorMessage.Text = "Vị trí đã tồn tại. Vui lòng chọn vị trí khác.";
                        return;
                    }

                    // Cập nhật thông tin sản phẩm
                    existingMenu.name = txtTenDanhMucLuaChon.Text;

                    // Kiểm tra xem đã có ảnh mới được chọn hay chư

                    existingMenu.locations = viTri;

                    // Lưu thay đổi vào cơ sở dữ liệu
                    try
                    {
                        db.SubmitChanges();
                        Response.Redirect("Admin.aspx?modul=SanPham&modulextra=DanhMuc&operation=QuanLy");
                    }
                    catch (Exception ex)
                    {
                        lblErrorMessage.Text = "Lỗi khi cập nhật sản phẩm: " + ex.Message;
                    }
                }
                else
                {
                    lblErrorMessage.Text = "Không tìm thấy sản phẩm để chỉnh sửa.";
                }
            }
            else
            {
                lblErrorMessage.Text = "ID sản phẩm không hợp lệ.";
            }
        }
        else
        {
            lblErrorMessage.Text = "Thiếu ID sản phẩm.";
        }
    }

}