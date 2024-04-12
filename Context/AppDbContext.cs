using Microsoft.EntityFrameworkCore;
using web_api_school.Models;

namespace web_api_school.Context
{
    public class AppDbContext:DbContext
    {
        public AppDbContext(DbContextOptions<AppDbContext> options) : base(options)
        {

        }
        public DbSet<Person> Persons { get; set; }

    }


}
