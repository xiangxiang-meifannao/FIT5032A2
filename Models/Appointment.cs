//------------------------------------------------------------------------------
// <auto-generated>
//     This code was generated from a template.
//
//     Manual changes to this file may cause unexpected behavior in your application.
//     Manual changes to this file will be overwritten if the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

namespace FIT5032A2FXY.Models
{
    using System;
    using System.Collections.Generic;
    
    public partial class Appointment
    {
        public int Id { get; set; }
        public int CustomerId { get; set; }
        public int DoctorId { get; set; }
        public System.DateTime Date { get; set; }
    
        public virtual Customer Customer { get; set; }
        public virtual Doctor Doctor { get; set; }
    }
}
