//------------------------------------------------------------------------------
// <auto-generated>
//     This code was generated from a template.
//
//     Manual changes to this file may cause unexpected behavior in your application.
//     Manual changes to this file will be overwritten if the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

namespace FullHouseWebsite.Models
{
    using System;
    using System.Collections.Generic;
    
    public partial class tbl_Customer
    {
        public int customerID { get; set; }
        public string fullname { get; set; }
        public string phoneNumber { get; set; }
        public string emailCustomer { get; set; }
        public string message { get; set; }
        public string emailAdmin { get; set; }
        public bool readStatus { get; set; }
        public int houseID { get; set; }
        public System.DateTime date { get; set; }
    
        public virtual tbl_Admin tbl_Admin { get; set; }
    }
}
