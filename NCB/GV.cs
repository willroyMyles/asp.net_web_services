using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace NCB
{
    public class GV
    {
        private static User user = null;
        private static OtherUser nwcUser = new OtherUser();
        private static OtherUser jpsUser = new OtherUser();

        public static User User { get => user; set => user = value; }
        public static OtherUser NwcUser { get => nwcUser; set => nwcUser = value; }
        public static OtherUser JpsUser { get => jpsUser; set => jpsUser = value; }
    }
}