using System.Data.Entity;


namespace TripValley.Models
{
    public partial class TripValleyContext : DbContext
    {
        public TripValleyContext() : base("name=TripValleyContext")
        {}

        public virtual DbSet<User> Users { get; set; }

        public virtual DbSet<Customer> Customers { get; set; }

        public virtual DbSet<Address> Addresses { get; set; }
    }
}