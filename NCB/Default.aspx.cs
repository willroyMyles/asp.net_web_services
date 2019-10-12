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

        protected void NWCSubmit_Click(object sender, EventArgs e)
        {
            NWCServices.NWCServiceSoapClient nwcsoap = new NWCServices.NWCServiceSoapClient();
            UserTableAdapters.UsersTableAdapter uta = new UserTableAdapters.UsersTableAdapter();
            var result = uta.GetUserById(nwcId.Text);
            if (result[0] == null) return;
            if (result[0].Password == nwcPassword.Text)
            {
                User user = new User();
                user.Name = result[0].Name;
                user.Id = result[0].Id;
                user.Email = result[0].Email;
                user.Balance = result[0].Balance;
                user.Password = result[0].Password;
                user.Nwc = result[0].Nwc;
                user.Jps = result[0].Jps;

                nwcsoap.register(user.Id,user.Name,user.Email,user.Password);
                nwcsoap.login(user.Id, user.Password);
            }
        }
    }
}