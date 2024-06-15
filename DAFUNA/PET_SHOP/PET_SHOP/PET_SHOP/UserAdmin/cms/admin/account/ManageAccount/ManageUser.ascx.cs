using System;
using System.Linq;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class UserAdmin_cms_admin_account_ManageAccount_ManageUser : System.Web.UI.UserControl
{
    public static QLSHOPDataContext db = new QLSHOPDataContext();

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            LoadCartItems();
        }
    }

    protected void rptCartItems_ItemCommand(object source, RepeaterCommandEventArgs e)
    {
        // Xử lý các lệnh từ Repeater (nếu cần)
    }

    protected void rptCartItems_ItemCommand1(object source, RepeaterCommandEventArgs e)
    {
        if (e.CommandName == "DeleteItem")
        {
            int userId = Convert.ToInt32(e.CommandArgument);

            // Thực hiện xóa sản phẩm có ID là userId từ cơ sở dữ liệu
            DeleteUser(userId);

            // Sau khi xóa sản phẩm, cập nhật lại danh sách sản phẩm trong giỏ hàng
            LoadCartItems();
        }
    }

    private void LoadCartItems()
    {
        var cartItems = from user in db.Users
                        select new
                        {
                            user.id,
                            user.firstname,
                            user.lastname,
                            user.email
                        };

        var cartItemsList = cartItems.ToList();

        rptCartItems.DataSource = cartItemsList;
        rptCartItems.DataBind();
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
                    int userId = int.Parse(hfProductId.Value);
                    // Thực hiện xóa sản phẩm với userId
                    DeleteUser(userId);
                }
            }
        }
        // Load lại dữ liệu vào Repeater sau khi xóa
        LoadCartItems();
        lblErrorMessage.Text = "Xóa sản phẩm thành công";
    }

    private void DeleteUser(int userId)
    {
        using (QLSHOPDataContext db = new QLSHOPDataContext())
        {
            // Tìm người dùng cần xóa trong cơ sở dữ liệu
            User userToDelete = db.Users.FirstOrDefault(u => u.id == userId);

            if (userToDelete != null)
            {
                // Kiểm tra role_id của người dùng
                if (userToDelete.role_id == 1)
                {
                    // Nếu là admin, hiển thị thông báo và không thực hiện xóa
                    lblErrorMessage.Text = "Không thể xóa tài khoản admin.";
                    return;
                }
                else
                {

                
                // Kiểm tra và xóa các bản ghi liên quan trong bảng FeedBack
                var relatedFeedbacks = db.FeedBacks.Where(fb => fb.user_id == userId).ToList();
                db.FeedBacks.DeleteAllOnSubmit(relatedFeedbacks);

                // Kiểm tra và xóa các bản ghi liên quan trong bảng Detail_Order
                var relatedDetailOrders = db.Orders.Where(od => od.user_id == userId).ToList();
                db.Orders.DeleteAllOnSubmit(relatedDetailOrders);

                // Kiểm tra và xóa các bản ghi liên quan trong bảng Order_Details
                var relatedOrderDetails = db.Order_Details.Where(od => od.user_id == userId).ToList();
                db.Order_Details.DeleteAllOnSubmit(relatedOrderDetails);
                var relatedUser = db.Detail_Orders.Where(us => us.user_id == userId).ToList();
                db.Detail_Orders.DeleteAllOnSubmit(relatedUser);

                var detailOrders = db.Detail_Orders.Where(d => d.Order.user_id == userId);
                db.Detail_Orders.DeleteAllOnSubmit(detailOrders);
                // Xóa người dùng từ cơ sở dữ liệu
                db.Users.DeleteOnSubmit(userToDelete);
                db.SubmitChanges(); // Lưu thay đổi vào cơ sở dữ liệu
                    lblErrorMessage.Text = "Xóa tài khoản thành công!!";
                }
            }
            else
            {
                // Người dùng không tồn tại
                // Có thể thông báo cho người dùng hoặc ghi log
            }
        }
    }



}
