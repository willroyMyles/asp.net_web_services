using System;
using System.Collections.Generic;
using System.Data.Entity;
using System.Linq;
using System.Web;

namespace NWC.Models
{
    public class UserContext : DbContext
    {

        public UserContext() : base("NWCDatabase")//The Name of it should be the same with the name of connectionStrings(in web.config)
        {
        }
        public DbSet<User> user { get; set; }

    }
}