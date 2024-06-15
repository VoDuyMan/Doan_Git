using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class UserAdmin_cms_admin_product_ManageProdct_Product_Edit : System.Web.UI.UserControl
{
    public static QLSHOPDataContext db = new QLSHOPDataContext();
    public static List<Product> ListSanPham = new List<Product>();
    public static Product info = new Product();

    protected void Page_Load(object sender, EventArgs e)
    { /*
        if (!IsPostBack)
        {
            LayDanhMuc();
        }
        
        */
        LoadCartItems();

    }
    protected void rptCartItems_ItemCommand(object source, RepeaterCommandEventArgs e)
    {
        // Xử lý các lệnh từ Repeater (nếu cần)
    }



    protected void rptCartItems_ItemCommand1(object source, RepeaterCommandEventArgs e)
    {
        if (e.CommandName == "DeleteItem")
        {
            int productId = Convert.ToInt32(e.CommandArgument);

            // Thực hiện xóa sản phẩm có ID là productId từ cơ sở dữ liệu
            Cart.DeleteProduct(productId);

            // Sau khi xóa sản phẩm, cập nhật lại danh sách sản phẩm trong giỏ hàng
            LoadCartItems();
        }
    }
    private void LoadCartItems()
    {
        var cartItems = from product in db.Products
                        join producer in db.Producers on product.producer_id equals producer.id
                        join option in db.Options on product.producer_id equals option.id
                        join menu in db.Menus on product.producer_id equals menu.id
                        select new
                        {
                            product.id,
                            ProducerName = producer.name,
                            OptionName = option.name,
                            MenuName = menu.name,
                            product.title,
                            product.price,
                            product.inventory,
                            product.thumbnail,
                            product.description,
                        };

        var cartItemsList = cartItems.ToList();

        // Thêm mã sản phẩm theo thứ tự từ 1 đến n
        var indexedCartItemsList = cartItemsList.Select((item, index) => new
        {
            Index = index + 1,
            item.id,
            item.ProducerName,
            item.OptionName,
            item.MenuName,
            item.title,
            item.price,
            item.inventory,
            item.thumbnail,
            item.description
        }).ToList();

        rptCartItems.DataSource = indexedCartItemsList; // Sử dụng indexedCartItemsList làm nguồn dữ liệu
        rptCartItems.DataBind();
    }


    public class Cart
    {
        public static void DeleteProduct(int productId)
        {
            using (QLSHOPDataContext db = new QLSHOPDataContext())
            {
                // Find related detail orders
                var relatedOrders = db.Detail_Orders.Where(d => d.product_id == productId).ToList();

                // Delete related detail orders
                if (relatedOrders.Any())
                {
                    db.Detail_Orders.DeleteAllOnSubmit(relatedOrders);
                }

                // Find the product to delete in the database
                Product productToDelete = db.Products.FirstOrDefault(p => p.id == productId);

                if (productToDelete != null)
                {
                    // Delete the product from the database
                    db.Products.DeleteOnSubmit(productToDelete);
                    db.SubmitChanges(); // Save changes to the database
                    Console.WriteLine($"Product with ID {productId} deleted successfully.");
                }
                else
                {
                    // Product not found in the cart
                    Console.WriteLine($"Product with ID {productId} not found.");
                    // You can also log this information or notify the user
                }
            }
        }
    }



    protected void btnXoa_Click(object sender, EventArgs e)
    {
        foreach (RepeaterItem item in rptCartItems.Items)
        {
            CheckBox chkSelect = (CheckBox)item.FindControl("chkSelect");
            if (chkSelect != null && chkSelect.Checked)
            {
                HiddenField hfProductId = (HiddenField)item.FindControl("hfProductId");
                if (hfProductId != null)
                {
                    int productId = int.Parse(hfProductId.Value);
                    // Thực hiện xóa sản phẩm với productId
                    Cart.DeleteProduct(productId);
                }
            }
        }
        // Load lại dữ liệu vào Repeater sau khi xóa
        LoadCartItems();
        lblErrorMessage.Text = "Xóa sản phẩm thành công";
    }
}