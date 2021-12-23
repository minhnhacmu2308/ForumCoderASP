using ForumCoderASP.Daos;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace ForumCoderASP.Controllers.Admin
{
    public class AdminHomeController : Controller
    {
        UserDao userDao = new UserDao();
        PostDao postDao = new PostDao();
        CourseDao courseDao = new CourseDao();
        // GET: AdminHome
        public ActionResult Index()
        {
            string result = (string)Session["Admin"];
            if (string.IsNullOrEmpty(result))
            {              
                return RedirectToAction("Index", "AdminLogin");
            }
            else
            {
                ViewBag.numberUser = userDao.getUsers().Count;
                ViewBag.numberPost = postDao.getPostList().Count;
                ViewBag.numberComment = courseDao.getCourses().Count;
                return View();
            }
              
        }
    }
}