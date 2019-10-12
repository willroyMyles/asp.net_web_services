using System;
using System.Collections.Generic;
using System.Data.Entity;
using System.Linq;
using System.Web;

namespace JPS.Models
{
    public class UserContext : DbContext
    {
        public UserContext() : base("JPSDatabase")//The Name of it should be the same with the name of connectionStrings(in web.config)
        {
        }
        public DbSet<User> user { get; set; }
    }
}