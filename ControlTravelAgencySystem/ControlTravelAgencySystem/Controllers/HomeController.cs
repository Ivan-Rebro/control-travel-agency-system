using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace ControlTravelAgencySystem.Controllers
{
    public class HomeController : Controller
    {
        public ActionResult Index()
        {
            var dbContext = new ControlTravelAgencySystem.Models.travel_systemEntities();

            ViewBag.Tours = dbContext.tours;

            var tour = ViewBag.Tours[0];

            return View();
        }
    }
}
