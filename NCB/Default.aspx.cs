using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace NCB
{
    public partial class _Default : Page
    {
        public User user = GV.User;
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Deposit_Click(object sender, EventArgs e)
        {
            UserTableAdapters.UsersTableAdapter utp = new UserTableAdapters.UsersTableAdapter();
            var result = utp.GetUserById(user.Id);
            var newBalance = result[0].Balance + int.Parse(DepositBox.Text);
            utp.UpdateBalance(newBalance, user.Id);
            user.Balance = newBalance;
            Response.Redirect("Default.aspx");
        }

        protected void Widthdrawl_Click(object sender, EventArgs e)
        {
            UserTableAdapters.UsersTableAdapter utp = new UserTableAdapters.UsersTableAdapter();
            var result = utp.GetUserById(user.Id);
            var newBalance = result[0].Balance - int.Parse(WithdrawlBox.Text);
            utp.UpdateBalance(newBalance, user.Id);
            user.Balance = newBalance;
            Response.Redirect("Default.aspx");
        }
    }
}