using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace FullHouseWebsite.Models
{
    public class SearchModel
    {
        public string districtName { get; set; }
        public string areaName { get; set; }
        public int houseID { get; set; }
        public double price { get; set; }
        public int roomNumber { get; set; }
        public double acreage { get; set; }
        public string houseStreet { get; set; }
        public List<tbl_Image> listImage { get; set; }
        public int floor { get; set; }
        public bool furniture { get; set; }
        public string houseNumber { get; set; }

    }
}