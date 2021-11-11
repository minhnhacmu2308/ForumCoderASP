using ForumCoderASP.Daos;
using ForumCoderASP.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;


namespace ForumCoderASP.Controllers
{
    public class AuthenticationController : Controller
    {
        UserDao userDao = new UserDao();

        // GET: Authentication
        public ActionResult Index()
        {
            return View();
        }

        public ActionResult Login()
        {
            return View();
        }
        public ActionResult Register()
        {
            return View();
        }

        [HttpPost]
        public ActionResult Register(FormCollection form)
        {
            var email = form["email"];
            var password = form["password"];
            var rePassword = form["rePassword"];
            var fullname = form["fullname"];
            int status = 1;
            if (string.IsNullOrEmpty(email) || string.IsNullOrEmpty(password) || string.IsNullOrEmpty(rePassword) || string.IsNullOrEmpty(fullname))
            {
                ViewBag.message = "Cần điền đầy đủ thông tin";
                return View();
            }
            else if (password != rePassword)
            {
                ViewBag.message = "Hai mật khẩu không trùng khớp";
                return View();
            }
            else
            {
                bool checkEmail = userDao.checkEmailExist(email);
                if (checkEmail)
                {
                    ViewBag.message = "Email đã tồn tại";
                    return View();
                }
                else
                {
                    string passwordMd5 = userDao.md5(password);
                    User user = new User();
                    user.email = email;
                    user.password = passwordMd5;
                    user.fullname = fullname;
                    user.status = status;
                    userDao.register(user);
                    return RedirectToAction("Login");
                }
            }

        }
        [HttpPost]
        public ActionResult Login(FormCollection form)
        {
            var email = form["email"];
            var password = form["password"];
            string passwordMd5 = userDao.md5(password);
            if (string.IsNullOrEmpty(email) || string.IsNullOrEmpty(password))
            {
                ViewBag.message = "Cần điền đầy đủ thông tin";
                return View();
            }
            else
            {
                bool checkLogin = userDao.checkLogin(email, passwordMd5);
                if (checkLogin)
                {
                    var userInformation = userDao.getUserByEmail(email);
                    Session.Add("User", userInformation);
                    return RedirectToAction("Index", "Home");
                }
                else
                {
                    ViewBag.message = "Tài khoản hoặc mật khẩu không chính xác";
                    return View();
                }
            }

        }
        public ActionResult Logout()
        {
            Session.Remove("User");
            return Redirect("/");
        }

    }
}