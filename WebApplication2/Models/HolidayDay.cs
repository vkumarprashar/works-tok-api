using System;
using System.Collections.Generic;

namespace WebApplication2.Models
{
    public partial class HolidayDay
    {
        public int Id { get; set; }
        public int CompanyId { get; set; }
        public string Name { get; set; } = null!;
        public DateTime StartHolidayDate { get; set; }
        public DateTime EndHolidayDate { get; set; }
        public short EveryYear { get; set; }
        public double AdditivePercentage { get; set; }
        public string? Comment { get; set; }

        public virtual Company Company { get; set; } = null!;
    }
}
