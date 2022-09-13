using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Http.Headers;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using System.ComponentModel.Design;
using System.Linq;

namespace WebApplication2.Controllers
{
    [Route("api/[action]")]
    [ApiController]
    public class WorksTokController : ControllerBase
    {
        private readonly worksTokV2Context db ;
        public WorksTokController()
        {
            db = new worksTokV2Context();
        }

        [HttpGet]
        
        public IActionResult TotalEarning([FromHeader(Name= "Employee")] int employeeId)
        {
            var employee = db.Employees.Where(e => e.Id == employeeId).FirstOrDefault();
            if (employee == null)
            {
                return Problem(statusCode: 403);
            }

            return Ok(new
            {
                TotalEarning = employee.TotalEarnings
            });
        }

        [HttpGet]
        public IActionResult EarningHistory([FromHeader(Name = "Employee")] int employeeId)
        {
            var employee = db.Employees.FirstOrDefault(e => e.Id == employeeId);
            if(employee == null)
            {
                return Problem(statusCode: 403);
            }
            return Ok(new
            {
                TotalEarning = employee.TotalEarnings,
                EarningHistory = employee.workRequestsAwaitEarnings.Select(x => new
                {
                    RequestId = x.Id,
                    RequestRating = x.UserAssessment,
                    ClientName = x.Client.Name,
                    CompletedWorkTime = x.CompleteWorkTime,
                    Earning = x.ESP
                })
            }) ;
        }


        [HttpGet]
        public IActionResult EarningRequestWorkDetail(int requestId)
        {
            var request = db.WorkRequests.FirstOrDefault(e => e.Id == requestId);
            if (request == null)
            {
                return NotFound();
            }
            return Ok(new
            {
                WorkTypeName = request.WorkType.Name,
                Esp = request.ESP,
                Wrp = request.WRP,
                Hbp = request.HBR,
                Scr = request.ESP * request.SCR,
                Ccr = request.ESP * request.CCR,
                QER = request.ESP * request.QER
            });
        }

        [HttpGet]
        public IActionResult WorkHistory([FromHeader(Name = "Employee")] int employeeId,
            [FromQuery(Name = "FromDate")] DateTime FromDate, [FromQuery(Name = "ToDate")] DateTime ToDate)
        {
            var employee = db.Employees.FirstOrDefault(e => e.Id == employeeId);
            if(employee == null)
            {
                return NotFound();
            }
            var works = employee.WorkRequests.Where(x => x.CompleteWorkTime != null && x.BeginWorkTime >= FromDate && x.BeginWorkTime <= ToDate);
            return Ok(works.Select(x => new
            {
                RequestId = x.Id,
                CompletedWorkTime = x.CompleteWorkTime,
                ClientName = x.Client.Name,
                WorkTypeName = x.WorkType.Name,
                ExecutionTimeInMinute = (x.CompleteWorkTime - x.BeginWorkTime).Value.Minutes,
                Earning = x.ESP
            }
            ));
        }

        [HttpGet]
        public IActionResult CompanyCommission(int CompanyId, [FromQuery(Name = "Year")] int year,
            [FromQuery(Name = "month")] int month)
        {
            var employees = db.Employees.Where(e => e.CompanyId == CompanyId).ToList();

            var company = db.Companies.FirstOrDefault(c => c.Id == CompanyId);
            if (company == null)
            {
                return NotFound();
            }
            if(company.Employees == null)
            {
                return BadRequest(new
                {
                    Error = "Company has not Started Working yet!"
                });
            }

            if (employees.Select(x => x.workRequestsAwaitEarnings).Count() <= 0)
            {
                return BadRequest(new
                {
                    Error = "Company has not completed works"
                }) ;
            }
            var StartDate = new DateTime(year, month, 1);
            var EndDate = StartDate.AddMonths(1).AddDays(-1);
            return Ok(new
            {
                Period = new
                {
                    Start = StartDate,
                    End = EndDate
                },
                CompanyRevenue = employees.Sum(e => e.TotalEarnings),
                CompanyCommission = employees.Sum(x => x.WorkRequests.Sum(wr => wr.CCR))
            });
        }

        [HttpPost]
        public IActionResult EarningRequest([FromHeader(Name = "Employee")] int employeeId)
        {
            var employee = db.Employees.Where(e => e.Id == employeeId).FirstOrDefault();
            if (employee == null)
            {
                return Problem(statusCode: 403);
            }
            if (employee.workRequestsAwaitEarnings.Count() <= 0)
            {
                return BadRequest(new
                {
                    Error = "Employee hasn't earning"
                });
            }
            return Ok(new
            {
                TotalRequestedEarnings = employee.TotalEarnings
            });
        }

        [HttpGet]
        public IActionResult Employees()
        {
            return Ok(db.Employees.Select(e => new
            {
                Id = e.Id,
                FirstName = e.FirstName,
                MiddleName = e.MiddleName,
                LastName = e.LastName
            }));
        }
    }
}
