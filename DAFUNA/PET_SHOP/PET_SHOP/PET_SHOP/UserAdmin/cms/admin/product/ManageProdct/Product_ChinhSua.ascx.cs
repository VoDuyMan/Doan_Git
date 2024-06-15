    using System;
    using System.Collections.Generic;
    using System.Linq;
    using System.Web;
    using System.Web.UI;
    using System.Web.UI.WebControls;

    public partial class UserAdmin_cms_admin_product_ManageProdct_Product_ChinhSua : System.Web.UI.UserControl
    {
        public static QLSHOPDataContext db = new QLSHOPDataContext();
        public static List<Option> ListDM = new List<Option>();
        public static List<Producer> ListDMTH = new List<Producer>();
        public static List<Menu> ListDMMenu = new List<Menu>();

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (Request.QueryString["id"] != null)
                {
                    int id;
                    if (int.TryParse(Request.QueryString["id"], out id))
                    {
                        LoadData();
                        LoadThuongHieu();
                        LoadOptionData();
                        LoadMenu();
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


        private void LoadData()
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
        private void LoadOptionData(int id)
        {
            if (Request.QueryString["id"] != null && int.TryParse(Request.QueryString["id"], out id))
            {
                var product = db.Products.SingleOrDefault(o => o.id == id);
                if (product != null)
                {
                    idSanPham.Text = product.id.ToString();
                    txtTenSanPham.Text = product.title;
                    txtSL.Text = product.inventory.ToString();
                    txtGia.Text = product.price.ToString();
                    imgCurrentThumbnail.ImageUrl = "/img/" + product.thumbnail;
                    txtMoTa.Text = product.description;

                if (product.producer_id.HasValue)
                {
                    cmbThuongHieu.SelectedValue = product.producer_id.ToString();
                }

                // Load danh mục menus và chọn giá trị mặc định
                if (product.menu_id.HasValue)
                {
                    ListMenus.SelectedValue = product.menu_id.ToString();
                }

                // Chọn giá trị mặc định cho danh mục options
                if (product.options_id.HasValue)
                {
                    ListOptions.SelectedValue = product.options_id.ToString();
                }
            }
                else
                {
                    lblErrorMessage.Text = "Không tìm thấy sản phẩm với ID này.";
                }
            }
            else
            {
                lblErrorMessage.Text = "ID không hợp lệ hoặc không được cung cấp.";
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
        protected void cmbThuongHieu_SelectedIndexChanged(object sender, EventArgs e)
        {
            int selectedProducerId;
            if (int.TryParse(cmbThuongHieu.SelectedValue, out selectedProducerId))
            {
                // Xử lý logic khi thay đổi giá trị thương hiệu
            }
        }

        protected void ListOptions_SelectedIndexChanged(object sender, EventArgs e)
        {
            int selectedOptionsId;
            if (int.TryParse(ListOptions.SelectedValue, out selectedOptionsId))
            {
                // Xử lý logic khi thay đổi giá trị danh mục options
            }
        }

        protected void ListMenus_SelectedIndexChanged(object sender, EventArgs e)
        {
            int selectedMenusId;
            if (int.TryParse(ListMenus.SelectedValue, out selectedMenusId))
            {
                // Xử lý logic khi thay đổi giá trị danh mục menus
            }
        }


        // Hàm này cập nhật thương hiệu cho sản phẩm


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
                    var existingOption = db.Products.SingleOrDefault(opt => opt.id == id);
                    if (existingOption != null)
                    {


                        // Cập nhật thông tin sản phẩm
                        existingOption.title = txtTenSanPham.Text;

                        // Kiểm tra xem đã có ảnh mới được chọn hay chưa
                        if (flAnhDaiDien.HasFile)
                        {
                            string fileName = System.IO.Path.GetFileName(flAnhDaiDien.FileName);
                            string filePath = "~/img/" + fileName;
                            flAnhDaiDien.SaveAs(Server.MapPath(filePath));
                            existingOption.thumbnail = fileName;
                        }

                        int selectedProducerId = Convert.ToInt32(cmbThuongHieu.SelectedValue);
                        int selectedOptionsId = Convert.ToInt32(ListOptions.SelectedValue);
                        int selectedMenusId = Convert.ToInt32(ListMenus.SelectedValue);

                  
                        existingOption.producer_id = selectedProducerId;
                        existingOption.options_id = selectedOptionsId;
                        existingOption.menu_id = selectedMenusId;


                        // Cập nhật thương hiệu đã chọn cho existingOption

                        existingOption.price = int.Parse(txtGia.Text);
                        existingOption.description = txtMoTa.Text;
                        existingOption.inventory = int.Parse(txtSL.Text);
                        existingOption.updated_at = DateTime.Today;



                        // Lưu thay đổi vào cơ sở dữ liệu
                        try
                        {
                            db.SubmitChanges();
                            Response.Redirect("Admin.aspx?modul=SanPham&modulextra=DanhSachSanPham&operation=QuanLy");
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