using ForumCoderASP.Daos;
using ForumCoderASP.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace ForumCoderASP.Controllers
{
    public class ForumController : Controller
    {
        // GET: Forum
        PostDao postDao = new PostDao();
        UserDao userDao = new UserDao();
        public ActionResult Index()
        {
            ViewBag.List = postDao.getPosts();
            return View();
        }
        [HttpPost]
        [ValidateInput(false)]
        public ActionResult PostAdd(FormCollection form)
        {
            var title = form["title"];
            var nguoidung = Int32.Parse(form["nguoidung"]);
            var noidung = form["noidung"];
            DateTime now = DateTime.Now;
            Post post = new Post();
            post.title = title;
            post.status = 0;
            post.description = noidung;
            post.id_user = nguoidung;
            post.createdAt = now;
            postDao.add(post);
            var message = "1";
            return RedirectToAction("AddPost", new { mess = message });
        }

        public ActionResult AddPost(string mess)
        {
            ViewBag.Msg = mess;
            return View();
        }
        public ActionResult UpdatePost(int id)
        {
            ViewBag.Post = postDao.getPostById(id);
            return View();
        }
        [HttpPost]
        [ValidateInput(false)]
        public ActionResult PostUpdate(FormCollection form)
        {
            var user = (User)Session["User"];
            var title = form["title"];
            var noidung = form["noidung"];
            var id = Int32.Parse(form["id"]);
            Post post = new Post();
            post.title = title;
            post.description = noidung;
            post.id_post = id;
            postDao.update(post);
            string action = "ListPost/" + user.id_user;
            return RedirectToAction(action);
        }
        public ActionResult Detail(int id)
        {
            ViewBag.Detail = postDao.getPostById(id);
            return View();
        }

        public ActionResult ListPost(int id)
        {
            ViewBag.List = postDao.getPostByUser(id);
            ViewBag.User = userDao.getUserById(id);
            return View();
        }
    }
}