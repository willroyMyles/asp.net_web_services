using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Services;

namespace NWC
{
    /// <summary>
    /// Summary description for NWCService
    /// </summary>
    [WebService(Namespace = "http://tempuri.org/")]
    [WebServiceBinding(ConformsTo = WsiProfiles.BasicProfile1_1)]
    [System.ComponentModel.ToolboxItem(false)]
    // To allow this Web Service to be called from script, using ASP.NET AJAX, uncomment the following line. 
    // [System.Web.Script.Services.ScriptService]
    public class NWCService : System.Web.Services.WebService
    {
        public static User userAgent = null;
        [WebMethod]
        public string HelloWorld()
        {
            return "Hello World";
        }

        [WebMethod]
        public void register(string id, string name, string email, string password)
        {
            var user = new User();
            user.Name = name;
            user.Id = id;
            user.Email = email;
            user.Password = password;
            user.Linked = true;

            UsersTableAdapters.UsersApaterTableAdapter uta = new UsersTableAdapters.UsersApaterTableAdapter();
            uta.Insert(user.Id, user.Name, user.Email, user.Password, user.Balance, user.Linked);
            userAgent = user;
        }

        [WebMethod]
        public bool Login(string id, string password)
        {
            UsersTableAdapters.UsersApaterTableAdapter uta = new UsersTableAdapters.UsersApaterTableAdapter();
            var result = uta.GetUserById(id);
            if (result.Rows.Count <= 0) return false; 
            if (result[0] == null) return false;
            if (result[0].Password == password)
            {
                User user = new User();
                user.Name = result[0].Name;
                user.Id = result[0].Id;
                user.Email = result[0].Email;
                user.Balance = result[0].Balance;
                user.Password = result[0].Password;
                user.Linked = result[0].Linked;
                userAgent = user;
                return true;
                
            }
            return false;
        }
        [WebMethod]
        public void updateBalance(string id, int balance)
        {
            UsersTableAdapters.UsersApaterTableAdapter uta = new UsersTableAdapters.UsersApaterTableAdapter();
            var result = uta.GetUserById(id);
            if (result[0] == null) return;
            int newBalance = result[0].Balance + balance;
            userAgent.Balance = newBalance;
            uta.UpdateBalance(newBalance, id);
        }
        [WebMethod]
        public void updateLinkedStatus(string id, bool status)
        {
            UsersTableAdapters.UsersApaterTableAdapter uta = new UsersTableAdapters.UsersApaterTableAdapter();
            var result = uta.GetUserById(id);
            if (result[0] == null) return;
            uta.UpdateLinkStatus(status, id);
        }
        [WebMethod]
        public User getUser()
        {
            return userAgent;
        }
        [WebMethod]
        public string GetUsername()
        {
            return userAgent.Name;
        }
        [WebMethod]
        public string GetUserId()
        {
            return userAgent.Id;
        }
        [WebMethod]
        public string GetUserEmail()
        {
            return userAgent.Email;
        }
        [WebMethod]
        public int GetUserBalance()
        {
            return userAgent.Balance;
        }
        [WebMethod]
        public bool GetUserLinkedStatus()
        {
            return userAgent.Linked;
        }
        [WebMethod]
        public bool GetUserLinkedStatusById(string id)
        {
            UsersTableAdapters.UsersApaterTableAdapter uta = new UsersTableAdapters.UsersApaterTableAdapter();
            var result = uta.GetUserById(id);
            if (result[0] == null) return false;
            return result[0].Linked;
        }
    }
}
