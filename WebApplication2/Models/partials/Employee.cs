using System.ComponentModel.DataAnnotations.Schema;

namespace WebApplication2.Models
{
    public partial class Employee
    {
        [NotMapped]
        public List<WorkRequest> workRequestsAwaitEarnings =>
            WorkRequests.Where(x => x.Withdrawals == null && x.ESP != null).ToList();

        [NotMapped]
        public double? TotalEarnings => workRequestsAwaitEarnings.Sum(x => x.ESP);
    }
}
