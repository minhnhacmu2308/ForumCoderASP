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
            post.status = 1;
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
        /*public ActionResult UpdatePost(int id)
        {
            ViewBag.Post = postDao.deTail(id);
            return View();
        }
        [HttpPost]
        [ValidateInput(false)]
        public ActionResult PostUpdate(FormCollection form)
        {
            var title = form["title"];
            var theloai = Int32.Parse(form["theloai"]);
            var id = Int32.Parse(form["id"]);
            var file = Request.Files["file"];
            var img = form["img"];
            var noidung = form["noidung"];
            var nguoidung = Int32.Parse(form["nguoidung"]);
            if (file != null && file.ContentLength > 0)
            {
                Random random = new Random();
                int num = random.Next();
                String filename = "post" + num + file.FileName.Substring(file.FileName.LastIndexOf("."));
                String Strpath = Path.Combine(Server.MapPath("~/Content/assets/imgs/news/"), filename);
                file.SaveAs(Strpath);
                postDao.update(title, filename, noidung, theloai, id);
                return RedirectToAction("UserPost", new { id = nguoidung });
            }
            else
            {
                postDao.update(title, img, noidung, theloai, id);
                return RedirectToAction("UserPost", new { id = nguoidung });
            }
        }*/
    }
}