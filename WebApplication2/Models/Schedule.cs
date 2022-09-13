using System;
using System.Collections.Generic;

namespace WebApplication2.Models
{
    public partial class Schedule
    {
        public int Id { get; set; }
        public int EmployeeId { get; set; }
        public int DayOfWeek { get; set; }
        public TimeSpan StartWorkTime { get; set; }
        public TimeSpan FinishWorkTime { get; set; }

        public virtual Employee Employee { get; set; } = null!;
    }
}
