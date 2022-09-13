using System;
using System.Collections.Generic;

namespace WebApplication2.Models
{
    public partial class Withdrawal
    {
        public Withdrawal()
        {
            WorkRequests = new HashSet<WorkRequest>();
        }

        public int Id { get; set; }
        public int EmployeeId { get; set; }
        public DateTime CreateDateTime { get; set; }
        public decimal Amount { get; set; }
        public DateTime? FinishedDateTime { get; set; }

        public virtual Employee Employee { get; set; } = null!;
        public virtual ICollection<WorkRequest> WorkRequests { get; set; }
    }
}
