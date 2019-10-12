using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace NCB
{
    public class GV
    {
        private static User user = null;

        public static User User { get => user; set => user = value; }
    }
}