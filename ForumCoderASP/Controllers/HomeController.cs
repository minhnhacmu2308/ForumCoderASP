using ForumCoderASP.Daos;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace ForumCoderASP.Controllers
{
    public class HomeController : Controller
    {
        CourseDao courseDao = new CourseDao();
        // GET: Home
        public ActionResult Index()
        {
            ViewBag.Course = courseDao.getCourses();
            return View();
        }
        public ActionResult About()
        {
            ViewBag.Message = "Your application description page.";

            return View();
        }

        public ActionResult Contact()
        {
            ViewBag.Message = "Your contact page.";

            return View();
        }

        public ActionResult Home()
        {
            return View();
        }
    }
}