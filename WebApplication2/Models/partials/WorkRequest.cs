namespace WebApplication2.Models
{
    public partial class WorkRequest
    {
        public double WRP => WorkType.Price;
        public double SCR => Employee.Company.SystemCommissionRate;

        public double CCR => Employee.Company.CompanyCommissionRate;

        public double? FCP => HBR != null ? (WRP * (1 + HBR)) : WRP;
        public double? ESP => (QER != null && CompleteWorkTime!= null)
            ? (FCP * (1 - SCR) * (1 - (CCR - QER))) 
            : null;

        public double? QER =>
            UserAssessment switch
            {
                1 => -0.03,
                2 => -0.02,
                3 => -0.01,
                4 =>  0,
                5 => CCR/2,
                _ => null
            };
        

        public double? HBR
        {
            get
            {
                foreach(var holiday in Employee.Company.HolidayDays.OrderByDescending(x => x.AdditivePercentage))
                {
                    var date = FullfilledDate;
                    if (holiday.EveryYear == 0)
                    {
                        if (date >= holiday.StartHolidayDate.Date && date <= holiday.EndHolidayDate.Date)
                            return holiday.AdditivePercentage;
                    } else
                    {
                        date = new DateTime(holiday.StartHolidayDate.Year, date.Month, date.Day);
                        if (date >= holiday.StartHolidayDate.Date && date <= holiday.EndHolidayDate.Date)
                            return holiday.AdditivePercentage;

                        date = new DateTime(holiday.EndHolidayDate.Year, date.Month, date.Day);
                        if (date >= holiday.StartHolidayDate.Date && date <= holiday.EndHolidayDate.Date)
                            return holiday.AdditivePercentage;
                    }
                }
                return null;
            }
        }
    }
}
