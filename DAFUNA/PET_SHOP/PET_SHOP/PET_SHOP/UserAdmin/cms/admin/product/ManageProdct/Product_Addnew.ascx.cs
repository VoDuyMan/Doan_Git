using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;

using System.Web.UI.WebControls;

public partial class UserAdmin_cms_admin_product_ManageProdct_Product_Addnew : System.Web.UI.UserControl
{
    public static QLSHOPDataContext db = new QLSHOPDataContext();
    public static List<Option> ListDM = new List<Option>();
    public static List<Producer> ListDMTH = new List<Producer>();
    public static List<Menu> ListDMMenu = new List<Menu>();

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            LoadThuongHieu();
            LoadOptionData();
            LoadMenu();

        }
    }

    private void LoadThuongHieu()
    {
        cmbThuongHieu.Items.Clear();

        var producers = db.Producers.ToList();
        foreach (var producer in producers)
        {
            cmbThuongHieu.Items.Add(new ListItem($"{producer.id} - {producer.name}", producer.id.ToString()));
        }

        // Thêm một lựa chọn mặc định nếu cần
        cmbThuongHieu.Items.Insert(0, new ListItem("Chọn một thương hiệu", "0"));
    }

    // Sự kiện này sẽ được gọi khi người dùng chọn một thương hiệu từ ComboBox
    protected void cmbThuongHieu_SelectedIndexChanged(object sender, EventArgs e)
    {
        int selectedProducerId;
        if (int.TryParse(cmbThuongHieu.SelectedValue, out selectedProducerId))
        {

        }
    }


    private void LoadOptionData()
    {
        ListOptions.Items.Clear();

        var producers = db.Options.ToList();
        foreach (var producer in producers)
        {
            ListOptions.Items.Add(new ListItem($"{producer.id} - {producer.name}", producer.id.ToString()));
        }

        // Thêm một lựa chọn mặc định nếu cần
        ListOptions.Items.Insert(0, new ListItem("Chọn một danh mục", "0"));
    }

    // Sự kiện này sẽ được gọi khi người dùng chọn một thương hiệu từ ComboBox
    protected void ListOptions_SelectedIndexChanged(object sender, EventArgs e)
    {
        int selectedProducerId;
        if (int.TryParse(ListOptions.SelectedValue, out selectedProducerId))
        {

        }
    }

    private void LoadMenu()
    {
        ListMenus.Items.Clear();

        var producers = db.Menus.ToList();
        foreach (var producer in producers)
        {
            ListMenus.Items.Add(new ListItem($"{producer.id} - {producer.name}", producer.id.ToString()));
        }

        // Thêm một lựa chọn mặc định nếu cần
        ListMenus.Items.Insert(0, new ListItem("Chọn một danh mục", "0"));
    }

    // Sự kiện này sẽ được gọi khi người dùng chọn một thương hiệu từ ComboBox
    protected void ListMenus_SelectedIndexChanged(object sender, EventArgs e)
    {
        int selectedProducerId;
        if (int.TryParse(ListMenus.SelectedValue, out selectedProducerId))
        {

        }
    }

    // Hàm này cập nhật thương hiệu cho sản phẩm


    protected void btnThemMoi_Click(object sender, EventArgs e)
    {
        lblErrorMessage.Text = ""; // Reset error message

        Product infoproduct = new Product();
        infoproduct.title = txtTenSanPham.Text;
        int selectedProducerId = Convert.ToInt32(cmbThuongHieu.SelectedValue);
        int selectedOptionsId = Convert.ToInt32(ListOptions.SelectedValue);
        int selectedMenusId = Convert.ToInt32(ListMenus.SelectedValue);


        infoproduct.producer_id = selectedProducerId;
        infoproduct.options_id = selectedOptionsId;
        infoproduct.menu_id = selectedMenusId;
        infoproduct.price = int.Parse(txtGia.Text); // Sửa lỗi ở đây
        infoproduct.description = txtMoTa.Text;
        infoproduct.created_at = DateTime.Today;
        infoproduct.category_id = 2;
        infoproduct.thumbnail = flAnhDaiDien.FileName;
        infoproduct.inventory = int.Parse(txtSL.Text);
        flAnhDaiDien.SaveAs(Server.MapPath("/img/") + flAnhDaiDien.FileName);
        db.Products.InsertOnSubmit(infoproduct);
        db.SubmitChanges();
        lblErrorMessage.Text = "Thêm sản phẩm thành công";

        // Xóa dữ liệu đã nhập để chuẩn bị cho việc nhập mới
        txtTenSanPham.Text = "";
        flAnhDaiDien.Dispose();
        txtGia.Text = "";
        txtSL.Text = "";
        txtMoTa.Text = "";
        ListMenus.SelectedIndex = 0;
        cmbThuongHieu.SelectedIndex = 0;
        ListOptions.SelectedIndex = 0;
    }

    protected void btnHuy_Click(object sender, EventArgs e)
    {
        txtTenSanPham.Text = "";
        flAnhDaiDien.Dispose();
        txtGia.Text = "";
        txtSL.Text = "";
        txtMoTa.Text = "";
        ListMenus.SelectedIndex = 0;
        cmbThuongHieu.SelectedIndex = 0;
        ListOptions.SelectedIndex = 0;
    }
}