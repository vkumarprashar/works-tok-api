using System;
using System.Collections.Generic;

namespace WebApplication2.Models
{
    public partial class Company
    {
        public Company()
        {
            Employees = new HashSet<Employee>();
            HolidayDays = new HashSet<HolidayDay>();
        }

        public int Id { get; set; }
        public string Name { get; set; } = null!;
        public string Itn { get; set; } = null!;
        public string Address { get; set; } = null!;
        public string PhoneNumber { get; set; } = null!;
        public double CompanyCommissionRate { get; set; }
        public double SystemCommissionRate { get; set; }

        public virtual ICollection<Employee> Employees { get; set; }
        public virtual ICollection<HolidayDay> HolidayDays { get; set; }
    }
}
