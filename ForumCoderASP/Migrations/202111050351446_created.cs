namespace ForumCoderASP.Migrations
{
    using System;
    using System.Data.Entity.Migrations;
    
    public partial class created : DbMigration
    {
        public override void Up()
        {
            CreateTable(
                "dbo.Comments",
                c => new
                    {
                        id_comment = c.Int(nullable: false, identity: true),
                        text = c.String(nullable: false, maxLength: 255),
                        id_user = c.Int(nullable: false),
                        id_post = c.Int(nullable: false),
                        parent = c.Int(nullable: false),
                        createdAt = c.DateTime(nullable: false),
                        status = c.Int(nullable: false),
                    })
                .PrimaryKey(t => t.id_comment)
                .ForeignKey("dbo.Posts", t => t.id_post)
                .ForeignKey("dbo.Users", t => t.id_user)
                .Index(t => t.id_user)
                .Index(t => t.id_post);
            
            CreateTable(
                "dbo.Posts",
                c => new
                    {
                        id_post = c.Int(nullable: false, identity: true),
                        title = c.String(nullable: false, maxLength: 255),
                        description = c.String(),
                        status = c.Int(nullable: false),
                        id_user = c.Int(nullable: false),
                        createdAt = c.DateTime(nullable: false),
                    })
                .PrimaryKey(t => t.id_post)
                .ForeignKey("dbo.Users", t => t.id_user)
                .Index(t => t.id_user);
            
            CreateTable(
                "dbo.Users",
                c => new
                    {
                        id_user = c.Int(nullable: false, identity: true),
                        password = c.String(nullable: false, maxLength: 255),
                        fullname = c.String(nullable: false, maxLength: 255),
                        email = c.String(nullable: false, maxLength: 255),
                        status = c.Int(nullable: false),
                    })
                .PrimaryKey(t => t.id_user);
            
            CreateTable(
                "dbo.Courses",
                c => new
                    {
                        id_course = c.Int(nullable: false, identity: true),
                        name = c.String(nullable: false, maxLength: 255),
                        description = c.String(),
                        image = c.String(nullable: false, maxLength: 255),
                        createdAt = c.DateTime(nullable: false),
                        status = c.Int(nullable: false),
                    })
                .PrimaryKey(t => t.id_course);
            
        }
        
        public override void Down()
        {
            DropForeignKey("dbo.Posts", "id_user", "dbo.Users");
            DropForeignKey("dbo.Comments", "id_user", "dbo.Users");
            DropForeignKey("dbo.Comments", "id_post", "dbo.Posts");
            DropIndex("dbo.Posts", new[] { "id_user" });
            DropIndex("dbo.Comments", new[] { "id_post" });
            DropIndex("dbo.Comments", new[] { "id_user" });
            DropTable("dbo.Courses");
            DropTable("dbo.Users");
            DropTable("dbo.Posts");
            DropTable("dbo.Comments");
        }
    }
}
