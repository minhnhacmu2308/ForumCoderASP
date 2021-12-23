using ForumCoderASP.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Security.Cryptography;
using System.Text;
using System.Web;

namespace ForumCoderASP.Daos
{
    public class UserDao
    {
        DBContextForum myDb = new DBContextForum();

        public List<User> getUsers()
        {
            return myDb.Users.OrderByDescending(x => x.id_user).ToList(); 
        }

        public User getUserById(int id)
        {
            return myDb.Users.Where(u => u.id_user == id).FirstOrDefault();
        }

        public void changeStatus(int id)
        {
            var user = getUserById(id);
            user.status = user.status == 1 ? 0 : 1;
            myDb.SaveChanges();
        }
        public void register(User user)
        {
            myDb.Users.Add(user);
            myDb.SaveChanges();
        }

        public bool checkLogin(string email, string password)
        {
            var objUser = myDb.Users.Where(u => u.email == email && u.password == password && u.status == 1).FirstOrDefault();
            if (objUser != null)
            {
                return true;
            }
            else
            {
                return false;
            }
        }
        public bool checkEmailExist(string email)
        {
            var objUser = myDb.Users.Where(u => u.email == email).FirstOrDefault();
            if (objUser != null)
            {
                return true;
            }
            else
            {
                return false;
            }
        }
        public string md5(string password)
        {
            MD5 md = MD5.Create();
            byte[] inputString = System.Text.Encoding.ASCII.GetBytes(password);
            byte[] hash = md.ComputeHash(inputString);
            StringBuilder sb = new StringBuilder();
            for (int i = 0; i < hash.Length; i++)
            {
                sb.Append(hash[i].ToString("x"));
            }
            return sb.ToString();
        }
        public User getUserByEmail(string email)
        {
            var obj = myDb.Users.Where(u => u.email == email).FirstOrDefault();
            return obj;
        }
    }
}