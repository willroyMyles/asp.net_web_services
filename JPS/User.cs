using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace JPS
{
    public partial class User
    {
        private string name;
        private string id;
        private string email;
        private string password;
        private int balance = 3000;
        private bool linked = false;

       
        public string Name { get => name; set => name = value; }
        public string Id { get => id; set => id = value; }
        public string Email { get => email; set => email = value; }
        public string Password { get => password; set => password = value; }
        public int Balance { get => balance; set => balance = value; }
        public bool Linked { get => linked; set => linked = value; }

        public void MakePayment(int num) => balance = balance - num;

        public void AddBalance(int num) => balance = balance + num;
    }
}