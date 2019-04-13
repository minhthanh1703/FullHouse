using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace FullHouseWebsite.Models
{
    public class GetRequestByUserModel
    {
        public tbl_Customer customer { get; set; }
        public tbl_House house { get; set; }
    }
}