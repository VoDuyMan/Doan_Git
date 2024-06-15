using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class UserAdmin_cms_admin_account_ManageContact_Contact_Manage : System.Web.UI.UserControl
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
            int feedbackId = Convert.ToInt32(e.CommandArgument);

            // Thực hiện xóa phản hồi với ID là feedbackId
            DeleteFeedback(feedbackId);

            // Sau khi xóa phản hồi, cập nhật lại danh sách phản hồi
            LoadCartItems();
        }
    }

    private void LoadCartItems()
    {
        var cartItems = from user in db.FeedBacks
                        select new
                        {
                            user.id,
                            user.fullname,
                            user.email,
                            user.created_at
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
                    int feedbackId = int.Parse(hfProductId.Value);
                    // Call the DeleteFeedback method defined in the same class
                    DeleteFeedback(feedbackId);
                }
            }
        }
        // Load lại dữ liệu vào Repeater sau khi xóa
        LoadCartItems();
        lblErrorMessage.Text = "Xóa sản phẩm thành công";
    }


    private void DeleteFeedback(int feedbackId)
    {
        using (QLSHOPDataContext db = new QLSHOPDataContext())
        {
            // Tìm phản hồi cần xóa trong cơ sở dữ liệu
            FeedBack feedbackToDelete = db.FeedBacks.FirstOrDefault(f => f.id == feedbackId);

            if (feedbackToDelete != null)
            {
                // Xóa phản hồi từ cơ sở dữ liệu
                db.FeedBacks.DeleteOnSubmit(feedbackToDelete);
                db.SubmitChanges(); // Lưu thay đổi vào cơ sở dữ liệu
            }
            else
            {
                // Phản hồi không tồn tại
                // Có thể thông báo cho người dùng hoặc ghi log
            }
        }
    }
}