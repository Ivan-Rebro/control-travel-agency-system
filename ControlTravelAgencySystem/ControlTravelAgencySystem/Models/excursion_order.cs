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
    
    public partial class excursion_order
    {
        public int id { get; set; }
        public int excursion_id { get; set; }
        public int callout_id { get; set; }
        public int payment { get; set; }
        public string starting_address { get; set; }
        public int starting_at { get; set; }
        public int is_baby { get; set; }
        public int is_privilege { get; set; }
        public int is_custom { get; set; }
        public Nullable<int> bus_place_number { get; set; }
    
        public virtual callout callout { get; set; }
        public virtual excursion excursion { get; set; }
    }
}