using System;
using System.Collections.Generic;

namespace WebApplication2.Models
{
    public partial class WorkType
    {
        public WorkType()
        {
            WorkRequests = new HashSet<WorkRequest>();
            Employees = new HashSet<Employee>();
            Professions = new HashSet<Profession>();
        }

        public int Id { get; set; }
        public string Name { get; set; } = null!;
        public int Price { get; set; }
        public string? Description { get; set; }

        public virtual ICollection<WorkRequest> WorkRequests { get; set; }

        public virtual ICollection<Employee> Employees { get; set; }
        public virtual ICollection<Profession> Professions { get; set; }
    }
}
