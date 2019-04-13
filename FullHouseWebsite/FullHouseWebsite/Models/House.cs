using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace FullHouseWebsite.Models
{
    public class House
    {
        
        public tbl_House house { get; set; }
        public List<tbl_Image> listImage { get; set; }
        public int districtID { get; set; }
        public string districtName { get; set; }
        public string areaName { get; set; }
        
    }
}