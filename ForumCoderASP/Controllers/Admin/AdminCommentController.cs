using ForumCoderASP.Daos;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace ForumCoderASP.Controllers.Admin
{
    public class AdminCommentController : Controller
    {
        CommentDao commentDao = new CommentDao();
        // GET: AdminComment
        public ActionResult Index(string mess)
        {
            ViewBag.mess = mess;
            ViewBag.List = commentDao.getComments();
            return View();
        }
        [HttpPost]
        public ActionResult Delete(FormCollection form)
        {
            var id = Int32.Parse(form["id"]);
            commentDao.deleteComment(id);
            return RedirectToAction("Index", new { mess = "2" });
        }
    }
}