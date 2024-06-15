using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class UserAdmin_cms_admin_product_ManageOptions_Options_Edit : System.Web.UI.UserControl
{
    public static QLSHOPDataContext db = new QLSHOPDataContext();
    public static List<Option> ListDanhMuc = new List<Option>();
    public static Option info = new Option();

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


        var cartItems = from cart in db.Options
                        select new
                        {
                            cart.id,
                            cart.name,
                            cart.thumbnail,
                            cart.location
                        };

                var cartItemsList = cartItems.ToList();
                

                rptCartItems.DataSource = cartItemsList;
                rptCartItems.DataBind();
            
        
    }
    /*   private void LayDanhMuc()
       {
           ListDanhMuc = db.Options.ToList();
           // Refresh the UpdatePanel to reflect the changes
       }

       protected void btnXoa_Click(object sender, EventArgs e)
       {
           try
           {
               // Tìm nút đã được nhấn
               Button btn = (Button)sender;
               // Lấy ID của danh mục từ CommandArgument
               long idInput;
               if (long.TryParse(btn.CommandArgument, out idInput))
               {
                   // Tiến hành xóa danh mục với ID đã lấy được
                   var option = db.Options.SingleOrDefault(o => o.id == idInput);
                   if (option != null)
                   {
                       db.Options.DeleteOnSubmit(option);
                       db.SubmitChanges();
                       lblErrorMessage.Text = "Xóa mục tùy chọn thành công!";
                       LayDanhMuc(); // Refresh the list after deletion
                   }
               }
               else
               {
                   // Xử lý trường hợp không thể chuyển đổi ID thành số
                   lblErrorMessage.Text = "Không thể xác định ID của danh mục.";
               }
           }
           catch (Exception ex)
           {
               // Xử lý ngoại lệ nếu có
               lblErrorMessage.Text = "Đã xảy ra lỗi: " + ex.Message;
           }
       }*/
    public class Cart
    {
        public static void DeleteProduct(int productId)
        {
            using (QLSHOPDataContext db = new QLSHOPDataContext())
            {
                // Tìm sản phẩm cần xóa trong đối tượng cơ sở dữ liệu
                Option productToDelete = db.Options.FirstOrDefault(p => p.id == productId);

                if (productToDelete != null)
                {
                    // Xóa sản phẩm từ cơ sở dữ liệu
                    db.Options.DeleteOnSubmit(productToDelete);
                    db.SubmitChanges(); // Lưu thay đổi vào cơ sở dữ liệu
                }
                else
                {
                    // Sản phẩm không tồn tại trong giỏ hàng
                    // Có thể thông báo cho người dùng hoặc ghi log
                }
            }
        }
    }
}


