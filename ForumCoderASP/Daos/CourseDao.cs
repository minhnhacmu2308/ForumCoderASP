using ForumCoderASP.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace ForumCoderASP.Daos
{
    public class CourseDao
    {
        DBContextForum myDb = new DBContextForum();

        public List<Course> getCourses()
        {
            return myDb.Courses.OrderByDescending(x => x.id_course).ToList();
        }

        public void add(Course course)
        {
            myDb.Courses.Add(course);
            myDb.SaveChanges();
        }

        public Course checkExistName(string name)
        {
            return myDb.Courses.Where(x => x.name == name).FirstOrDefault();
        }

        public void update(Course course)
        {
            var obj = myDb.Courses.FirstOrDefault(x => x.id_course == course.id_course);
            obj.image = course.image;
            obj.name = course.name; 
            obj.description = course.description;
            obj.createdAt = DateTime.Now;
            obj.status = 1;
            myDb.SaveChanges();
        }

        public Course getCourseById(int id)
        {
            return myDb.Courses.FirstOrDefault(x => x.id_course == id);
        }

        public void delete(int id)
        {
            var obj = myDb.Courses.FirstOrDefault(x => x.id_course == id);
            myDb.Courses.Remove(obj);
            myDb.SaveChanges();
        }
    }
}