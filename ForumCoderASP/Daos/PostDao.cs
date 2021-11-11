using ForumCoderASP.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace ForumCoderASP.Daos
{
    public class PostDao
    {
        DBContextForum myDb = new DBContextForum();

        public List<Post> getPosts()
        {
            return myDb.Posts.OrderByDescending(x => x.id_post).ToList();
        }

        public Post getPostById(int id)
        {
            return myDb.Posts.Where(p => p.id_post == id).FirstOrDefault();
        }

        public void changeStatus(int id)
        {
            var post = getPostById(id);
            post.status = 1;
            myDb.SaveChanges();
        }

        public void bankPost(int id)
        {
            var post = getPostById(id);
            post.status = post.status == 2 ? 1 : 2;
            myDb.SaveChanges()
;        }
    }
}