using ForumCoderASP.Daos;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace ForumCoderASP.Controllers
{
    public class CourseController : Controller
    {
        CourseDao courseDao = new CourseDao();
        // GET: Course
        public ActionResult Index()
        {
            return View();
        }
        public ActionResult Detail(int id)
        {
            ViewBag.Detail = courseDao.getCourseById(id);
            return View();
        }
    }
}