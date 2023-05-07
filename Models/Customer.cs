using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace TripValley.Models
{
    [JsonObject(IsReference = true)]
    public partial class Customer
    {
        public  Customer()
        {
            Addresses = new HashSet<Address>();
        }

        [Key]
        public int customer_id { get; set; }

        [Column(TypeName = "text")]
        public string documento{ get; set; }

        public int? user_id{ get; set; }

        [Column(TypeName = "text")]
        public string gender { get; set; }

        [DataType(DataType.Date)]
        public string birth_date { get; set; }

        [ForeignKey("user_id")]
        public virtual User User { get; set; }

        public ICollection<Address> Addresses { get; set; }
    }
}