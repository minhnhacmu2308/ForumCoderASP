using ForumCoderASP.Daos;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace ForumCoderASP.Controllers.Admin
{
    public class AdminClientController : Controller
    {
        UserDao userDao = new UserDao();
        // GET: AdminClient
        public ActionResult Index(string mess)
        {
            ViewBag.Msg = mess;
            var list = userDao.getUsers();
            return View(list);
        }

        public ActionResult ChangeStatus(int id)
        {
            userDao.changeStatus(id);
            return RedirectToAction("Index", new { mess = "Thành công" });
        }
    }
}