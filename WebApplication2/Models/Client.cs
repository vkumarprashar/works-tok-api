using System;
using System.Collections.Generic;

namespace WebApplication2.Models
{
    public partial class Client
    {
        public Client()
        {
            WorkRequests = new HashSet<WorkRequest>();
        }

        public int Id { get; set; }
        public string Name { get; set; } = null!;
        public long ChatId { get; set; }

        public virtual ICollection<WorkRequest> WorkRequests { get; set; }
    }
}
