using System;
using System.Collections.Generic;

namespace WebApplication2.Models
{
    public partial class Employee
    {
        public Employee()
        {
            Schedules = new HashSet<Schedule>();
            VacationDays = new HashSet<VacationDay>();
            Withdrawals = new HashSet<Withdrawal>();
            WorkRequests = new HashSet<WorkRequest>();
            Professions = new HashSet<Profession>();
            WorkTypes = new HashSet<WorkType>();
        }

        public int Id { get; set; }
        public string FirstName { get; set; } = null!;
        public string? MiddleName { get; set; }
        public string LastName { get; set; } = null!;
        public string DateOfBirth { get; set; } = null!;
        public string PhoneNumber { get; set; } = null!;
        public string? Comment { get; set; }
        public int CompanyId { get; set; }

        public virtual Company Company { get; set; } = null!;
        public virtual ICollection<Schedule> Schedules { get; set; }
        public virtual ICollection<VacationDay> VacationDays { get; set; }
        public virtual ICollection<Withdrawal> Withdrawals { get; set; }
        public virtual ICollection<WorkRequest> WorkRequests { get; set; }

        public virtual ICollection<Profession> Professions { get; set; }
        public virtual ICollection<WorkType> WorkTypes { get; set; }
    }
}
