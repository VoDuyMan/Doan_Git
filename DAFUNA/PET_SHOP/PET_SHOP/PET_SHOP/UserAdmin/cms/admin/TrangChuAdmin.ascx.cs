using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class UserAdmin_cms_admin_TrangChuAdmin : System.Web.UI.UserControl
{
    public static QLSHOPDataContext db = new QLSHOPDataContext();

    protected void Page_Load(object sender, EventArgs e)
    {
        // Truy vấn SQL để đếm số lượng tài khoản
        int numberOfAccounts = db.Users.Count();
        lbMess.Text = numberOfAccounts.ToString();

        int numberOfOrder = db.Orders.Count();
        lbDonHang.Text = numberOfOrder.ToString();

        int numberOfContact = db.FeedBacks.Count();
        lbLienHe.Text = numberOfContact.ToString();

        int totalNumberOfAccounts = db.Users.Count();
        int totalNumberOfOrders = db.Orders.Count();
        int totalNumberOfContacts = db.FeedBacks.Count();

        int Sum = totalNumberOfAccounts + totalNumberOfOrders + totalNumberOfContacts;
        double percentageOfAccounts = (double)numberOfAccounts / Sum * 100;
        double percentageOfOrders = (double)numberOfOrder / Sum * 100;
        double percentageOfContacts = (double)numberOfContact / Sum * 100;

        lbMess.Text = percentageOfAccounts.ToString("0.00") ;
        lbDonHang.Text = percentageOfOrders.ToString("0.00") ;
        lbLienHe.Text = percentageOfContacts.ToString("0.00") ;


        int numberOfAccount = db.Users.Count();
        Label1.Text = numberOfAccount.ToString();

        int numberOfOrders = db.Orders.Count();
        Label2.Text = numberOfOrders.ToString();

        int numberOfContacts = db.FeedBacks.Count();
        Label3.Text =  numberOfContacts.ToString();
    }
}