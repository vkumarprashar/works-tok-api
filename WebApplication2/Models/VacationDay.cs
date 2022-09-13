using System;
using System.Collections.Generic;

namespace WebApplication2.Models
{
    public partial class VacationDay
    {
        public int Id { get; set; }
        public int EmployeeId { get; set; }
        public DateTime StartVacationDate { get; set; }
        public DateTime? EndVacationDate { get; set; }
        public string? Comment { get; set; }

        public virtual Employee Employee { get; set; } = null!;
    }
}
