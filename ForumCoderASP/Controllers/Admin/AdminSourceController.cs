using ForumCoderASP.Daos;
using ForumCoderASP.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace ForumCoderASP.Controllers.Admin
{
    public class AdminSourceController : Controller
    {
        CourseDao courseDao = new CourseDao();
        // GET: AdminSource
        public ActionResult Index(string mess)
        {
            ViewBag.mess = mess;
            var list = courseDao.getCourses();
            return View(list);
        }

        [HttpPost]
        [ValidateInput(false)]
        public ActionResult Add(Course course)
        {
            var file = Request.Files["file"];
            string reName = DateTime.Now.Ticks.ToString() + file.FileName;
            file.SaveAs(Server.MapPath("~/Content/assets/imgs/" + reName));
            course.image = reName;
            course.createdAt = DateTime.Now;
            course.status = 1;
            var obj = courseDao.checkExistName(course.name);
            if(obj != null)
            {
                return RedirectToAction("Index", new { mess = "1" });
            }
            else
            {
                courseDao.add(course);
                return RedirectToAction("Index", new { mess = "2" });
            }        
        }
        [HttpPost]
        [ValidateInput(false)]
        public ActionResult Update(Course course)
        {
            string reName = "";
            var objCourse = courseDao.getCourseById(course.id_course);
            var file = Request.Files["file"];
            if(file.FileName == "")
            {
                reName = objCourse.image;
            }
            else
            {
                reName = DateTime.Now.Ticks.ToString() + file.FileName;
                file.SaveAs(Server.MapPath("~/Content/assets/imgs/" + reName));
            }                  
            course.image = reName;
            course.createdAt = DateTime.Now;
            course.status = 1;
            if (objCourse.name.Equals(course.name))
            {
                courseDao.update(course);
                return RedirectToAction("Index", new { mess = "2" });
            }
            else
            {
                var obj = courseDao.checkExistName(course.name);
                if (obj != null)
                {
                    return RedirectToAction("Index", new { mess = "1" });
                }
                else
                {
                    courseDao.update(course);
                    return RedirectToAction("Index", new { mess = "2" });
                }
            }
           
        }

        [HttpPost]
       
        public ActionResult Delete(Course course)
        {         
                courseDao.delete(course.id_course);
                return RedirectToAction("Index", new { mess = "2" });
        }
    }
}