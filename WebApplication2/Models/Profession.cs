using System;
using System.Collections.Generic;

namespace WebApplication2.Models
{
    public partial class Profession
    {
        public Profession()
        {
            Employees = new HashSet<Employee>();
            WorkTypes = new HashSet<WorkType>();
        }

        public int Id { get; set; }
        public string Name { get; set; } = null!;
        public string? Description { get; set; }

        public virtual ICollection<Employee> Employees { get; set; }
        public virtual ICollection<WorkType> WorkTypes { get; set; }
    }
}
