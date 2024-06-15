using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.IO;


public partial class UserAdmin_cms_admin_product_ManageOptions_Options_ChinhSua : System.Web.UI.UserControl
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
        var option = db.Options.SingleOrDefault(o => o.id == id);
        if (option != null)
        {
            idDanhMuc.Text = option.id.ToString();
            txtTenDanhMucLuaChon.Text = option.name;
            // Assuming that the image file path is stored in the database
            imgCurrentThumbnail.ImageUrl = "/img/" + option.thumbnail;
            txtViTriLuaChon.Text = option.location.ToString();
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
                var existingOption = db.Options.SingleOrDefault(opt => opt.id == id);
                if (existingOption != null)
                {
                    // Kiểm tra xem vị trí có phải là số nguyên dương không
                    int viTri;
                    if (!int.TryParse(txtViTriLuaChon.Text, out viTri) || viTri <= 0)
                    {
                        lblErrorMessage.Text = "Vị trí phải là một số nguyên dương.";
                        return;
                    }

                    // Kiểm tra xem vị trí đã tồn tại trong cơ sở dữ liệu chưa (ngoại trừ sản phẩm hiện tại)
                    var duplicateLocation = db.Options.FirstOrDefault(opt => opt.location == viTri && opt.id != id);
                    if (duplicateLocation != null)
                    {
                        lblErrorMessage.Text = "Vị trí đã tồn tại. Vui lòng chọn vị trí khác.";
                        return;
                    }

                    // Cập nhật thông tin sản phẩm
                    existingOption.name = txtTenDanhMucLuaChon.Text;

                    // Kiểm tra xem đã có ảnh mới được chọn hay chưa
                    if (flAnhDaiDien.HasFile)
                    {
                        string fileName = System.IO.Path.GetFileName(flAnhDaiDien.FileName);
                        string filePath = "~/img/" + fileName;
                        flAnhDaiDien.SaveAs(Server.MapPath(filePath));
                        existingOption.thumbnail = fileName;
                    }

                    existingOption.location = viTri;

                    // Lưu thay đổi vào cơ sở dữ liệu
                    try
                    {
                        db.SubmitChanges();
                        Response.Redirect("Admin.aspx?modul=SanPham&modulextra=DanhMucLuaChon&operation=QuanLy");
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
