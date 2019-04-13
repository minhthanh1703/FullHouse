using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using FullHouseWebsite.Models;
namespace FullHouseWebsite.Controllers
{
    public class HomeController : Controller
    {
        // GET: HOME
        FullHouseEntities db = new FullHouseEntities();
        public ActionResult Index()
        {
            return View(db.tbl_District.ToList());
        }

       
    }
}