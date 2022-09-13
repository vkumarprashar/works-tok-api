using System;
using System.Collections.Generic;

namespace WebApplication2.Models
{
    public partial class WorkRequest
    {
        public int Id { get; set; }
        public int ClientId { get; set; }
        public DateTime CreateTime { get; set; }
        public int EmployeeId { get; set; }
        public DateTime FullfilledDate { get; set; }
        public string Address { get; set; } = null!;
        public string? TaskDescription { get; set; }
        public bool? IsAccepted { get; set; }
        public DateTime? BeginWorkTime { get; set; }
        public DateTime? CompleteWorkTime { get; set; }
        public int WorkTypeId { get; set; }
        public int? WithdrawalsId { get; set; }
        public int? UserAssessment { get; set; }

        public virtual Client Client { get; set; } = null!;
        public virtual Employee Employee { get; set; } = null!;
        public virtual Withdrawal? Withdrawals { get; set; }
        public virtual WorkType WorkType { get; set; } = null!;
    }
}
