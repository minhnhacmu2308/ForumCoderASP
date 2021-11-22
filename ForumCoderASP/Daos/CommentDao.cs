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

        public List<Comment> getCommentById(int id)
        {
            return myDb.Comments.Where(c => c.Post.id_post == id).OrderByDescending(u => u.id_comment).ToList();
        }

        public void postComment(Comment comment)
        {
            comment.status = 1;
            myDb.Comments.Add(comment);
         /*   var obj = myDb.Comments.FirstOrDefault(x => x.id_comment == comment.id_comment);
            obj.status = 1;
            obj.text = comment.text;
            obj.parent = comment.parent;
            obj.id_post = comment.id_post;
            obj.id_user = comment.id_user;
            obj.createdAt = comment.createdAt;*/
            myDb.SaveChanges();
        }

        public void deleteComment(int id)
        {
            var comment = myDb.Comments.FirstOrDefault(x => x.id_comment == id);
            myDb.Comments.Remove(comment);
            myDb.SaveChanges();
        }
    }
}