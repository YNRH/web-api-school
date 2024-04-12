using System.ComponentModel.DataAnnotations;

namespace web_api_school.Models
{
    public class Person
    {
        public int Id { get; set; }

        [Required(ErrorMessage = "El campo Apellido es obligatorio.")]
        public string LastName { get; set; }

        [Required(ErrorMessage = "El campo nombre es obligatorio.")]
        public string FirstName { get; set; }

        public int? Age { get; set; }
    }
}
