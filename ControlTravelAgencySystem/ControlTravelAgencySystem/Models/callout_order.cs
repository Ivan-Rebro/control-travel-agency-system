//------------------------------------------------------------------------------
// <auto-generated>
//     This code was generated from a template.
//
//     Manual changes to this file may cause unexpected behavior in your application.
//     Manual changes to this file will be overwritten if the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

namespace ControlTravelAgencySystem.Models
{
    using System;
    using System.Collections.Generic;
    
    public partial class callout_order
    {
        public int id { get; set; }
        public int callout_id { get; set; }
        public int person_id { get; set; }
        public int employee_id { get; set; }
        public int created_at { get; set; }
        public int payment { get; set; }
        public Nullable<int> payment_at { get; set; }
        public int is_discount { get; set; }
        public Nullable<int> canceling_at { get; set; }
        public string status { get; set; }
    
        public virtual callout callout { get; set; }
        public virtual person person { get; set; }
        public virtual employee employee { get; set; }
    }
}
