using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class UserAdmin_cms_admin_product_ManageOptions_Options_Addnew : System.Web.UI.UserControl
{
    public static QLSHOPDataContext db = new QLSHOPDataContext();
    public static List<Option> ListDM = new List<Option>();
    protected void Page_Load(object sender, EventArgs e)
    {
        if(!IsPostBack)
        {
            LayDanhMuc(); 
        }    
    }

    private void LayDanhMuc()
    {
        ListDanhMuc.Items.Clear();

        var producers = db.Options.ToList();
        foreach (var producer in producers)
        {
            ListDanhMuc.Items.Add(new ListItem($"{producer.id}  {producer.name}", producer.id.ToString()));
        }

        // Thêm một lựa chọn mặc định nếu cần
        ListDanhMuc.Items.Insert(0, new ListItem("Danh mục hiện có", "0"));
    }

    // Sự kiện này sẽ được gọi khi người dùng chọn một thương hiệu từ ComboBox
    protected void cmbOption_SelectedIndexChanged(object sender, EventArgs e)
    {
        int selectedProducerId;
        if (int.TryParse(ListDanhMuc.SelectedValue, out selectedProducerId))
        {

        }
    }

    protected void btnThemMoi_Click1(object sender, EventArgs e)
    {
        lblErrorMessage.Text = ""; // Reset error message

        // Kiểm tra xem vị trí có phải là số nguyên dương không
        int viTri;
        if (!int.TryParse(txtViTriLuaChon.Text, out viTri) || viTri <= 0)
        {
            lblErrorMessage.Text = "Vị trí phải là một số nguyên dương ";
            return;
        }
        if (!int.TryParse(txtViTriLuaChon.Text, out viTri) || viTri > 7)
        {
            lblErrorMessage.Text = "Tối đa được 7 danh mục vui lòng xóa để thêm mới!!";
            return;
        }

        // Kiểm tra xem vị trí đã tồn tại trong cơ sở dữ liệu chưa
        var existingOption = db.Options.FirstOrDefault(opt => opt.location == viTri);
        if (existingOption != null)
        {
            lblErrorMessage.Text = "Vị trí đã tồn tại. Vui lòng chọn vị trí khác.";
            return;
        }

        // Thêm mới dữ liệu vào cơ sở dữ liệu
        try
        {
            
            Option infooptions = new Option();
            infooptions.name = txtTenDanhMucLuaChon.Text;
            infooptions.thumbnail = flAnhDaiDien.FileName;
            flAnhDaiDien.SaveAs(Server.MapPath("/img/") + flAnhDaiDien.FileName);
            infooptions.location = viTri; // Chuyển đổi giá trị thành số nguyên
            db.Options.InsertOnSubmit(infooptions);
            db.SubmitChanges();
            lblErrorMessage.Text = "Thêm danh mục thành công";

            // Xóa dữ liệu đã nhập để chuẩn bị cho việc nhập mới
            txtTenDanhMucLuaChon.Text = "";
            flAnhDaiDien.Dispose();
            txtViTriLuaChon.Text = "";
        }
        catch (Exception ex)
        {
            lblErrorMessage.Text = "Lỗi khi thêm mới: " + ex.Message;
        }
    }

    protected void btnHuy_Click(object sender, EventArgs e)
    {
        txtTenDanhMucLuaChon.Text = "";
        flAnhDaiDien.Dispose();
        txtViTriLuaChon.Text = "";
    }
}