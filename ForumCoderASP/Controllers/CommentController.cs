using ForumCoderASP.Daos;
using ForumCoderASP.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace ForumCoderASP.Controllers
{
    public class CommentController : Controller
    {
        CommentDao commentDao = new CommentDao();
        // GET: Comment
        public ActionResult Index()
        {
            return View();
        }

        [HttpPost]
        public ActionResult PostComment(Comment comment)
        {
            var user = (User)Session["User"];
            if (user == null)
            {
                return RedirectToAction("Login", "Authentication");
            }
            else
            {
                DateTime now = DateTime.Now;
                comment.createdAt = now;
                comment.id_user = user.id_user;
                commentDao.postComment(comment);
                string url = "/post/detail/" + comment.id_post;
                return Redirect(url);
            }

        }

        [HttpPost]
        public ActionResult DeleteComment(FormCollection form)
        {
            var id = form["id"];
            var postId = form["postId"];
            commentDao.deleteComment(Int32.Parse(id));
            string url = "/post/detail/" + postId;
            return Redirect(url);
        }
    }
}