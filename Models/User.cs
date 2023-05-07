using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;


namespace TripValley.Models
{
    public partial class User
    {
        [Key]
        public int user_id { get; set; }

        [Column(TypeName = "text")]
        public string name{ get; set; }

        [Column(TypeName = "text")]
        public string email { get; set; }

        [Column(TypeName = "text")]
        public string password { get; set; }

        [DataType(DataType.Date)]
        public string date_added { get; set; }

    }
}