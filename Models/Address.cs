using Newtonsoft.Json;
using System;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace TripValley.Models
{
    public partial class Address
    {
        [Key]
        public int address_id { get; set; }

        public int customer_id { get; set; }

        [Column(TypeName = "text")]
        public string address_1{ get; set; }

        [Column(TypeName = "text")]
        public string address_2 { get; set; }

        [Column(TypeName = "text")]
        public string number { get; set; }

        [Column(TypeName = "text")]
        public string city { get; set; }

        [Column(TypeName = "text")]
        public string state { get; set; }

        [Column(TypeName = "text")]
        public string zip_code { get; set; }
        
        [ForeignKey("customer_id")]
        public virtual Customer Customer { get; set; }

    }
}