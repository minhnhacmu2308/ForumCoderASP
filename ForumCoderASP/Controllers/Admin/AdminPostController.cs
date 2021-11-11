using ForumCoderASP.Daos;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace ForumCoderASP.Controllers.Admin
{
    public class AdminPostController : Controller
    {
        PostDao postDao = new PostDao();

        // GET: AdminPost
        public ActionResult Index(string mess)
        {
            ViewBag.Msg = mess;
            var list = postDao.getPosts();
            return View(list);
        }

        public ActionResult ChangeStatus(int id)
        {
            postDao.changeStatus(id);
            return RedirectToAction("Index", new { mess = "Thành công" });
        }

        public ActionResult ChangeStatusBank(int id)
        {
            postDao.bankPost(id);
            return RedirectToAction("Index", new { mess = "Thành công" });
        }
    }
}