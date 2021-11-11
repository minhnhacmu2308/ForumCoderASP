using ForumCoderASP.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace ForumCoderASP.Daos
{
    public class CommentDao
    {
        DBContextForum myDb = new DBContextForum();

        public List<Comment> getComments()
        {
            return myDb.Comments.ToList();  
        }
    }
}