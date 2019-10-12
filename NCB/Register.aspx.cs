using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace NCB
{
    public partial class Register : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void signup_Click(object sender, EventArgs e)
        {
            UserTableAdapters.UsersTableAdapter uta = new UserTableAdapters.UsersTableAdapter();
            User user = new User();
            user.Name = name.Text;
            user.Password = password.Text;
            user.Id = id.Text;
            user.Email = email.Text;

            uta.Insert(user.Id, user.Name, user.Email, user.Password, user.Balance, user.Jps, user.Nwc);
            GV.User = user;
        }

        protected void login_Click(object sender, EventArgs e)
        {
            UserTableAdapters.UsersTableAdapter uta = new UserTableAdapters.UsersTableAdapter();
            var result = uta.GetUserById(lid.Text);
            if (result[0] == null) return;
            if(result[0].Password == lpassword.Text)
            {
                User user = new User();
                user.Name = result[0].Name;
                user.Id = result[0].Id;
                user.Email = result[0].Email;
                user.Balance = result[0].Balance;
                user.Password = result[0].Password;
                user.Nwc = result[0].Nwc;
                user.Jps = result[0].Jps;
                GV.User = user;
            }

            Response.Redirect("Default.aspx");
        }
    }
}