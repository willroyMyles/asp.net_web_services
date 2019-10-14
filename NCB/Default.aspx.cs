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
        public OtherUser nwcUser = GV.NwcUser;
        public OtherUser jpsUser = GV.JpsUser;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (user != null)
            {
                if (user.Nwc)   NWCLogin_Click(sender, e);

                if (user.Jps)   JPSLogin_Click(sender, e);

            }
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
            var result = uta.GetUserById(ncbidbox.Text);
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
                NWCLogin_Click(sender, e);
            }
        }

        protected void NWCLogin_Click(object sender, EventArgs e)
        {
            NWCServices.NWCServiceSoapClient nwcsoap = new NWCServices.NWCServiceSoapClient();
            
            if(nwcsoap.Login(user.Id, user.Password))
            {
                nwcUser["name"] = nwcsoap.GetUsername();
                nwcUser["id"] = nwcsoap.GetUserId();
                nwcUser["email"] = nwcsoap.GetUserEmail();
                nwcUser["balance"] = nwcsoap.GetUserBalance();
                nwcUser["linked"] = nwcsoap.GetUserLinkedStatus();
                user.Nwc = true;
                UserTableAdapters.UsersTableAdapter uta = new UserTableAdapters.UsersTableAdapter();
                uta.UpdateNwc(user.Nwc, user.Id);
                GV.NwcUser = nwcUser;
            }
        }

        protected void nwcPaymentButton_Click(object sender, EventArgs e)
        {
            var amount = int.Parse(nwcPayment.Text);
            UserTableAdapters.UsersTableAdapter uta = new UserTableAdapters.UsersTableAdapter();
            var result = uta.GetUserById(user.Id);
            var newBalance = result[0].Balance - amount;

            NWCServices.NWCServiceSoapClient nwcsoap = new NWCServices.NWCServiceSoapClient();
            var nwcnewBalance = nwcsoap.GetUserBalance() + amount;
            nwcsoap.updateBalance(user.Id, nwcnewBalance);
            uta.UpdateBalance(newBalance, user.Id);
            user.Balance = newBalance;
            GV.NwcUser["balance"] = nwcnewBalance;
        }

        protected void nwcUnlink_Click(object sender, EventArgs e)
        {
            user.Nwc = false;
            UserTableAdapters.UsersTableAdapter uta = new UserTableAdapters.UsersTableAdapter();
            uta.UpdateNwc(user.Nwc, user.Id);
        }

        public void getNwcusername()
        {

        }

        protected void JPSSubmit_Click(object sender, EventArgs e)
        {
            JPSService.JPSServiceSoapClient jpsopap = new JPSService.JPSServiceSoapClient();
            UserTableAdapters.UsersTableAdapter uta = new UserTableAdapters.UsersTableAdapter();
            var result = uta.GetUserById(jpsidbox.Text);
            if (result[0] == null) return;
            if (result[0].Password == jpspassword.Text)
            {
                jpsopap.Register(result[0].Id, result[0].Name, result[0].Email, result[0].Password);
                JPSLogin_Click(sender, e);
            }
        }

        protected void JPSLogin_Click(object sender, EventArgs e)
        {
            JPSService.JPSServiceSoapClient jpsopap = new JPSService.JPSServiceSoapClient();

            if (jpsopap.Login(user.Id, user.Password))
            {
                jpsUser["name"] = jpsopap.GetUsername();
                jpsUser["id"] = jpsopap.GetUserId();
                jpsUser["email"] = jpsopap.GetUserEmail();
                jpsUser["balance"] = jpsopap.GetUserBalance();
                jpsUser["linked"] = jpsopap.GetUserLinkedStatus();
                user.Jps = true;
                UserTableAdapters.UsersTableAdapter uta = new UserTableAdapters.UsersTableAdapter();
                uta.UpdateJps(user.Jps, user.Id);
                GV.JpsUser = jpsUser;
            }
        }

        protected void jpsUnlink_Click(object sender, EventArgs e)
        {
            user.Jps = false;
            UserTableAdapters.UsersTableAdapter uta = new UserTableAdapters.UsersTableAdapter();
            uta.UpdateJps(user.Jps, user.Id);
        }

        protected void jpsPaymentButton_Click(object sender, EventArgs e)
        {
            var amount = int.Parse(jpsPayment.Text);
            UserTableAdapters.UsersTableAdapter uta = new UserTableAdapters.UsersTableAdapter();
            var result = uta.GetUserById(user.Id);
            var newBalance = result[0].Balance - amount;
            JPSService.JPSServiceSoapClient jpsopap = new JPSService.JPSServiceSoapClient();

            var jpsnewBalance = jpsopap.GetUserBalance() + amount;
            jpsopap.updateBalance(user.Id, jpsnewBalance);
            uta.UpdateBalance(newBalance, user.Id);
            user.Balance = newBalance;
            GV.JpsUser["balance"] = jpsnewBalance;
        }

        protected void logoff_Click(object sender, EventArgs e)
        {
            GV.NwcUser = null;
            GV.JpsUser = null;
            GV.User = null;
        }

        protected void checkBtn_Click(object sender, EventArgs e)
        {

            UserTableAdapters.UsersTableAdapter uta = new UserTableAdapters.UsersTableAdapter();
            var result = uta.GetUserById(IdBox.Text);
            if (result[0] == null) return;
            if (result.Rows.Count <= 0) return;
            if (result[0].Password == passwordBox.Text)
            {
                NWCServices.NWCServiceSoapClient nwcsoap = new NWCServices.NWCServiceSoapClient();
                JPSService.JPSServiceSoapClient jpsopap = new JPSService.JPSServiceSoapClient();
                var lbl1 = new Label();
                var lbl2 = new Label();
                if (nwcsoap.Login(result[0].Id, result[0].Password))
                {
                    lbl1.Text = "NWC Account Linked";
                    lbl1.CssClass += "alert-success p-2";
                }
                else
                {
                    lbl1.Text = "NWC Account Not Linked";
                    lbl1.CssClass += "alert-danger p-2";
                }
             
                if(jpsopap.Login(result[0].Id, result[0].Password))
                {
                    lbl2.Text = "JPS Account Linked";
                    lbl2.CssClass += "alert-success p-2";
                }
                else
                {
                    lbl2.Text = "JPS Account Not Linked";
                    lbl2.CssClass += "alert-danger p-2";
                }

                statusText.Controls.Add(lbl1);
                statusText.Controls.Add(lbl2);


            }
        }
    }
}