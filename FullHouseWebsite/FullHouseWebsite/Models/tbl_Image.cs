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
    
    public partial class tbl_Image
    {
        public int imageID { get; set; }
        public string url { get; set; }
        public Nullable<int> houseID { get; set; }
    
        public virtual tbl_House tbl_House { get; set; }
    }
}
