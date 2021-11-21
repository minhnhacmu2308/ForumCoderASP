using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using System.Web.Routing;

namespace ForumCoderASP
{
    public class RouteConfig
    {
        public static void RegisterRoutes(RouteCollection routes)
        {
            routes.IgnoreRoute("{resource}.axd/{*pathInfo}");

            routes.MapRoute(
            name: "Detail Course",
            url: "course/detail/{id}",
            defaults: new { controller = "Course", action = "Detail", id = UrlParameter.Optional }
            );
            routes.MapRoute(
             name: "Detail Post",
             url: "post/detail/{id}",
             defaults: new { controller = "Forum", action = "Detail", id = UrlParameter.Optional }
            );
            routes.MapRoute(
             name: "User Post",
             url: "user/post/{id}",
             defaults: new { controller = "Forum", action = "ListPost", id = UrlParameter.Optional }
            );
            routes.MapRoute(
             name: "Update Post",
             url: "update/post/{id}",
             defaults: new { controller = "Forum", action = "UpdatePost", id = UrlParameter.Optional }
            );
            routes.MapRoute(
                name: "Default",
                url: "{controller}/{action}/{id}",
                defaults: new { controller = "Home", action = "Index", id = UrlParameter.Optional }
            );
           
        }
    }
}
