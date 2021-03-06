USE [master]
GO
/****** Object:  Database [DBForumCoder]    Script Date: 12/23/2021 4:12:37 PM ******/
CREATE DATABASE [DBForumCoder]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'DBForumCoder', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.SQLEXPRESS\MSSQL\DATA\DBForumCoder.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'DBForumCoder_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.SQLEXPRESS\MSSQL\DATA\DBForumCoder_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [DBForumCoder] SET COMPATIBILITY_LEVEL = 140
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [DBForumCoder].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [DBForumCoder] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [DBForumCoder] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [DBForumCoder] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [DBForumCoder] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [DBForumCoder] SET ARITHABORT OFF 
GO
ALTER DATABASE [DBForumCoder] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [DBForumCoder] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [DBForumCoder] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [DBForumCoder] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [DBForumCoder] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [DBForumCoder] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [DBForumCoder] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [DBForumCoder] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [DBForumCoder] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [DBForumCoder] SET  ENABLE_BROKER 
GO
ALTER DATABASE [DBForumCoder] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [DBForumCoder] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [DBForumCoder] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [DBForumCoder] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [DBForumCoder] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [DBForumCoder] SET READ_COMMITTED_SNAPSHOT ON 
GO
ALTER DATABASE [DBForumCoder] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [DBForumCoder] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [DBForumCoder] SET  MULTI_USER 
GO
ALTER DATABASE [DBForumCoder] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [DBForumCoder] SET DB_CHAINING OFF 
GO
ALTER DATABASE [DBForumCoder] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [DBForumCoder] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [DBForumCoder] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [DBForumCoder] SET QUERY_STORE = OFF
GO
USE [DBForumCoder]
GO
/****** Object:  Table [dbo].[__MigrationHistory]    Script Date: 12/23/2021 4:12:37 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[__MigrationHistory](
	[MigrationId] [nvarchar](150) NOT NULL,
	[ContextKey] [nvarchar](300) NOT NULL,
	[Model] [varbinary](max) NOT NULL,
	[ProductVersion] [nvarchar](32) NOT NULL,
 CONSTRAINT [PK_dbo.__MigrationHistory] PRIMARY KEY CLUSTERED 
(
	[MigrationId] ASC,
	[ContextKey] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Comments]    Script Date: 12/23/2021 4:12:37 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Comments](
	[id_comment] [int] IDENTITY(1,1) NOT NULL,
	[text] [nvarchar](255) NOT NULL,
	[id_user] [int] NOT NULL,
	[id_post] [int] NOT NULL,
	[parent] [int] NOT NULL,
	[createdAt] [datetime] NOT NULL,
	[status] [int] NOT NULL,
 CONSTRAINT [PK_dbo.Comments] PRIMARY KEY CLUSTERED 
(
	[id_comment] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Courses]    Script Date: 12/23/2021 4:12:37 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Courses](
	[id_course] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](255) NOT NULL,
	[description] [nvarchar](max) NULL,
	[image] [nvarchar](255) NOT NULL,
	[createdAt] [datetime] NOT NULL,
	[status] [int] NOT NULL,
 CONSTRAINT [PK_dbo.Courses] PRIMARY KEY CLUSTERED 
(
	[id_course] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Posts]    Script Date: 12/23/2021 4:12:37 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Posts](
	[id_post] [int] IDENTITY(1,1) NOT NULL,
	[title] [nvarchar](255) NOT NULL,
	[description] [nvarchar](max) NULL,
	[status] [int] NOT NULL,
	[id_user] [int] NOT NULL,
	[createdAt] [datetime] NOT NULL,
 CONSTRAINT [PK_dbo.Posts] PRIMARY KEY CLUSTERED 
(
	[id_post] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Users]    Script Date: 12/23/2021 4:12:37 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Users](
	[id_user] [int] IDENTITY(1,1) NOT NULL,
	[password] [nvarchar](255) NOT NULL,
	[fullname] [nvarchar](255) NOT NULL,
	[email] [nvarchar](255) NOT NULL,
	[status] [int] NOT NULL,
 CONSTRAINT [PK_dbo.Users] PRIMARY KEY CLUSTERED 
(
	[id_user] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[__MigrationHistory] ([MigrationId], [ContextKey], [Model], [ProductVersion]) VALUES (N'202111050351446_created', N'ForumCoderASP.Migrations.Configuration', 0x1F8B0800000000000400E55BCD6EE33610BE17E83B083AB545D64AB258A00DEC5D649DA40876931871B2E82D6024DA212A51AA48A50E8A3E590F7DA4BE4287A2244B1425EBCF76B6C55E6292F371861C7E1C6A66FFF9EBEFF18795E71ACF3864C4A713F36874681A98DABE43E87262467CF1E647F3C3FB6FBF199F3BDECAF8928E7B2BC681246513F389F3E0C4B298FD843DC4461EB1439FF90B3EB27DCF428E6F1D1F1EFE641D1D5918204CC0328CF16D4439F170FC037E4E7D6AE38047C8BDF21DECB2A41D7AE631AA718D3CCC0264E38979E18791378561E1E97C3692E34DE3D4250874996377611A88529F230E9A9EDC333CE7A14F97F3001A907BF7126018B7402EC3890527EBE14D8D393C16C6586BC114CA8E18F7BD9680476F93D5B154F14E6B6C66AB07EB770EEBCC5F84D5F11A4ECCA9EF799872D350E73A99BAA118A75FE151227760147A0F329700CF11FF0E8C69E4F228C4138A231E22F7C098458F2EB13FE1973BFF574C273472DDBC8AA024F4151AA06916FA010EF9CB2D5E248A13E7C14E75B78AF2960A90896B64A58D9794BF3D368D6B50063DBA38F388DC7ACCB91FE29F31C521E2D89921CE71081B7AE9E0784D4B5A287372BCCA66031784F3641A5768F519D3257F9A98C7EFDE99C6055961276D4934B8A7048E9F000823ACD1B07E56B0346238DC64E64690C0671BD7AA1E24406183F5AEC7B0432CD6FE348339839F77401CAD91186C6AC45A6A738D9EC9327606056D16AFCE2D76E34EF64402493D23D191BA1ACC7611FADEADEF261259C7C31D0A975818E5EB7AE77E14DA2DB4B98F375CA38DE878986AB4297494B429F6EAB4195B6B5EA9651BB9502DA94608ED9567A4F377209926A766408621DCC5BBA71807333B2481BC9F2A27873F1B4DBE8563BB0D4AECC14495E776CD13DD99243D9D7A26494FF6304C22BCBB4C2371AB9E4364572F02911AB5241021B4570291FED681409A38EA70041220C67EF74367F71CB280E114797B602F889F89BBFB69878D3FA675CCD1F0D65799431F1334D528E1862ED4A155A4C82A9DA8630AB862515B3F7484D89EDF3952F34ECF1C29BA2B0AD9CF21DE6508423CB4DC8389FB7CFA541DB153C67C9BC47E938BEFD7514A518D73EA18B5218B5CD134D8814585134502384330F5C43C2AD9550598C51E6BC0EC2B4711F38712269C3B2CDEA904B953A02D38C984F2F22125D4260172EBEC5184DABC2DC48A6773A83D6738C0549CC63ADB7B4E9ECDA110CEA6D5195B3997A8F794E2AD54B5B11557D47A63653CD8DC532A5EBABBF214AD3D0D374B1744B6F214ADED3D27DF95A7C880A1765795E8A1A78F28CF987A6E1AD23B0A66ECD4350A26BF36BF903710C87090C061A2C1D947D182573C8ECE34B11D189684772CB978D55D17B073CC4B91F4FACA5399A1E4384588998C6D4BF233DD572455586C844EF85EF7822C2B2F823DBDEEDA0832B7D645FD735F1A7263B49F22D4ADDF74CD674A672B55F29E4D177B0E62BD5F6A705CB4AD81DDCA3BA96C77CD95D5E0D2CA299D6C728DDDFA6B6A8B76270FB20AA335ECBB897FDB9B5B64DC4D6E5263681AAE6664B14E1F5A327F98E619AD8A44E3F80A050104F6B9C463D262CC65D671FA66DE3E19E7490CCB669A9C5CA66D3613BCC4E0A9A1F48AAD77F00509198717007A44E2584F1DAF344CA1C60AE6482753D8AFBC5529A1A402E26F2954971ED45C2309C005D82646C466E2B2679725E3EC2F72515893CC9BFA6EE4D14D09C23A3499A6CBE3C896E608D9ADA828A3BF2A6B71647CAEE0E883F66A9C34F1968749DB9AA3E4DE9F79A05C7373ACF4059A074ADBCA28634B719952B051F24E8529546F6F741666159CD7F220C4B77EFB53A017DBB6AB2419A482F7CBA6E618856F3179A442C7B69C65DB87B2CB31D89303CB6BB7B703C791677B07D68B6D7B7BD6198C22DBA5ADCD91D619893CD2BAB539529261C8C3244DFF31C64C9F1F03040FF16BA54BECA017AC0D1DE4CBA81439E81E4C7558656769EB28433367F2A5BA60996CFADF5FFBA527823A249B3D7B2A284F8271129E6F2E502CC5EB728869C0F23C1347C4EAF317C6B137120346F3DFDCA94BE2E82C1D7085285960C66522C93C3E3C3A562A1C5F4FB5A1C598E3362B39EC9A0C1BACE88F883F3726BC5AA657F2757EF41985F6130ACB09A27E352B445BB079491DBC9A987FC43227C6E52F0F89D8817113821B9D1887C69F7D8BFF5A4C1DC4755B3DA62E960CC633F7CD9A39F093F7CF9A6DD6A55D495CB7A330485DDA760E41BE146DB053A049F3A6D8DF7968F57D1EB07D355917FFDAE3B9ECEADAED4AADBA39E620F54E5B714CB5C46930DF542B9806032E14280D86BA353AD385E0BB2F74D98AEF6C657B87E6B44279CA605ABEBE7BB44FED49AF5A93693186DC5179C9CECA49AA3FDC7FBD1524BDAA0176BFDF155FDCB693F96FB9DFAFBF0EA4D766376287AF719BDB70C89E6B3ACAF9CD8AAF8FCAE7849A8A0DF9C5056EAD471F7657DE359519745D3D476539870E599FAFD6557A54167AE860B569F48A1A909A1210FD5A2485233BAF0F2925FA6BEB0494AD2EE48B5F590148A90262DF86F5AFF0686752A3DD1DA68AA3FC29164829F73FCA810D1959AE21C4FF2FA7D82ED05136E6922EFC9416158DD2214A487B85398278189D869C2C90CDA1DBC68CC585E15F901BC19073EF113B97F426E241C4C164EC3DBA855A7AC1AE75F3C7A52A459DC737F1AB810D6102A84944487F433F46C47532BD2F3401790584A0EDE4B125F6928B47D7F22543BAF66943A064F9B2DBE60E7B810B60EC86CED133EEA21B38EB67BC44F64BFA45BD1A64F34614977D7C46D032441E4B30D6F2F0137CD8F156EFFF052280F6C258410000, N'6.4.4')
GO
SET IDENTITY_INSERT [dbo].[Comments] ON 

INSERT [dbo].[Comments] ([id_comment], [text], [id_user], [id_post], [parent], [createdAt], [status]) VALUES (1, N'a', 4, 3, 0, CAST(N'2021-12-16T22:01:53.597' AS DateTime), 1)
SET IDENTITY_INSERT [dbo].[Comments] OFF
GO
SET IDENTITY_INSERT [dbo].[Courses] ON 

INSERT [dbo].[Courses] ([id_course], [name], [description], [image], [createdAt], [status]) VALUES (1, N'HTML, CSS từ Zero đến Hero', N'<p>Trong khóa này chúng ta sẽ cùng nhau xây dựng giao diện 2 trang web là The Band &amp; Shopee.</p><h3><strong>Bạn sẽ học được gì</strong></h3><ul><li>Biết cách xây dựng giao diện web với HTML, CSS</li><li>Biết cách phân tích giao diện website</li><li>Biết cách đặt tên class CSS theo chuẩn BEM</li><li>Biết cách làm giao diện web responsive</li><li>Làm chủ Flexbox khi dựng bố cục website</li><li>Sở hữu 2 giao diện web khi học xong khóa học</li><li>Biết cách tự tạo động lực cho bản thân</li><li>Biết cách tự học những kiến thức mới</li></ul><h3><strong>Nội dung khóa học</strong></h3><ul><li>13 phần</li><li>•</li><li>113 bài học</li><li>•</li><li>Thời lượng 27 giờ 21 phút</li></ul><p><strong>Mở rộng tất cả</strong></p><p>&nbsp;</p><p><strong>1. Giới thiệu2 bài học</strong></p><p><strong>2. Làm quen với công cụ2 bài học</strong></p><p><strong>3. Làm quen với HTML5 bài học</strong></p><p><strong>4. Làm quen với CSS9 bài học</strong></p><p><strong>5. Đệm, viền và khoảng lề4 bài học</strong></p><p><strong>6. Thuộc tính tạo nền6 bài học</strong></p><p><strong>7. Thuộc tính vị trí4 bài học</strong></p><p><strong>8. Xây dựng web The band19 bài học</strong></p><p><strong>9. Responsive web The band11 bài học</strong></p><p><strong>10. Dựng bố cục web với Flexbox4 bài học</strong></p><p><strong>11. Quy ước đặt tên class BEM4 bài học</strong></p><p><strong>12. Xây dựng web Shopee42 bài học</strong></p><p><strong>13. Tự bay với đôi cánh của bạn1 bài học</strong></p><h3><strong>Yêu cầu</strong></h3><ul><li>Máy vi tính kết nối internet (Windows, Ubuntu hoặc MacOS)</li><li>Ý thức tự học cao, trách nhiệm cao, kiên trì bền bỉ không ngại cái khó</li><li>Không được nóng vội, bình tĩnh học, làm bài tập sau mỗi bài học</li><li>Khi học nếu có khúc mắc hãy tham gia hỏi/đáp tại group FB: Học lập trình web (fullstack.edu.vn)</li><li>Bạn không cần biết gì hơn nữa, trong khóa học tôi sẽ chỉ cho bạn những gì bạn cần phải biết</li></ul>', N'6377285453346706282.png', CAST(N'2021-11-18T17:48:53.470' AS DateTime), 1)
INSERT [dbo].[Courses] ([id_course], [name], [description], [image], [createdAt], [status]) VALUES (2, N'JavaScript Cơ Bản', N'<p>Học Javascript cơ bản phù hợp cho người chưa từng học lập trình. Với hơn 100 bài học và có bài tập thực hành sau mỗi bài học.</p><h3><strong>Bạn sẽ học được gì</strong></h3><ul><li>Hiểu chi tiết về các khái niệm cơ bản trong JS</li><li>Xây dựng được website đầu tiên kết hợp với JS</li><li>Tự tin khi phỏng vấn với kiến thức vững chắc</li><li>Có nền tảng để học các thư viện và framework JS</li><li>Nắm chắc các tính năng trong phiên bản ES6</li><li>Thành thạo DOM APIs để tương tác với trang web</li><li>Ghi nhớ các khái niệm nhờ bài tập trắc nghiệm</li><li>Nâng cao tư duy với các bài kiểm tra với testcases</li></ul><h3><strong>Nội dung khóa học</strong></h3><ul><li>9 phần</li><li>•</li><li>120 bài học</li><li>•</li><li>Thời lượng 24 giờ 05 phút</li></ul><p><strong>Thu nhỏ tất cả</strong></p><p>&nbsp;</p><p><strong>1. Giới thiệu2 bài học</strong></p><p>&nbsp;</p><p><strong>2. Làm quen23 bài học</strong></p><p>&nbsp;</p><p><strong>3. Kiến thức cốt lõi (phần 1)44 bài học</strong></p><p>&nbsp;</p><p>&nbsp;</p><p><strong>4. HTML DOM17 bài học</strong></p><p>&nbsp;</p><p><strong>5. Kiến thức cốt lõi (phần 2)11 bài học</strong></p><p>&nbsp;</p><p><strong>6. ECMAScript 6+12 bài học</strong></p><p>&nbsp;</p><p><strong>7. Các bài thực hành2 bài học</strong></p><p>&nbsp;</p><p><strong>8. Kiến thức bổ sung2 bài học</strong></p><p>&nbsp;</p><p><strong>9. Nên học thêm (thực hành)7 bài học</strong></p><p>&nbsp;</p><h3><strong>Yêu cầu</strong></h3><ul><li>Máy vi tính kết nối internet (Windows, Ubuntu hoặc MacOS)</li><li>Ý thức tự học cao, trách nhiệm cao, kiên trì bền bỉ không ngại cái khó</li><li>Không được nóng vội, bình tĩnh học, làm bài tập sau mỗi bài học</li><li>Khi học nếu có khúc mắc hãy tham gia hỏi/đáp tại group FB: Học lập trình web (fullstack.edu.vn)</li><li>Bạn không cần biết gì hơn nữa, trong khóa học tôi sẽ chỉ cho bạn những gì bạn cần phải biết</li></ul>', N'6377285477084274071.png', CAST(N'2021-11-18T17:52:50.843' AS DateTime), 1)
INSERT [dbo].[Courses] ([id_course], [name], [description], [image], [createdAt], [status]) VALUES (3, N'Responsive Với Grid System', N'<p>Trong khóa này chúng ta sẽ học về cách xây dựng giao diện web responsive với Grid System, tương tự Bootstrap 4.</p><h3><strong>Bạn sẽ học được gì</strong></h3><ul><li>Biết cách xây dựng website Responsive</li><li>Hiểu được tư tưởng thiết kế với Grid system</li><li>Tự tay xây dựng được thư viện CSS Grid</li><li>Tự hiểu được Grid layout trong bootstrap</li></ul><h3><strong>Nội dung khóa học</strong></h3><ul><li>7 phần</li><li>•</li><li>34 bài học</li><li>•</li><li>Thời lượng 06 giờ 31 phút</li></ul><p><strong>Mở rộng tất cả</strong></p><p>&nbsp;</p><p><strong>1. Giới thiệu2 bài học</strong></p><p>&nbsp;</p><p><strong>2. Cài đặt công cụ1 bài học</strong></p><p>&nbsp;</p><p><strong>3. Khái niệm cốt lõi4 bài học</strong></p><p>&nbsp;</p><p><strong>4. Thực hành nhỏ2 bài học</strong></p><p>&nbsp;</p><p><strong>5. Hệ thống lưới8 bài học</strong></p><p>&nbsp;</p><p><strong>6. Áp dụng vào thực tế5 bài học</strong></p><p>&nbsp;</p><p><strong>7. Responsive web Shopee12 bài học</strong></p><p>&nbsp;</p><h3><strong>Yêu cầu</strong></h3>', N'6377285482093100543.png', CAST(N'2021-11-18T17:53:40.933' AS DateTime), 1)
INSERT [dbo].[Courses] ([id_course], [name], [description], [image], [createdAt], [status]) VALUES (4, N'HTML, CSS Tips & Tricks', N'<h2><strong>HTML, CSS Tips &amp; Tricks</strong></h2><p>Tutorials về HTML, CSS, UI, UX sẽ được tổng hợp tại khóa học này, các video có nội dung ngắn gọn, súc tích giúp học viên có thể ứng dụng ngay vào thực tế</p><h3><strong>Bạn sẽ học được gì</strong></h3><ul><li>Cách làm đúng đắn trong thực tế (best practice)</li><li>Các thủ thuật, kinh nghiệm xây dựng UI, UX</li><li>Các kỹ năng nâng cao khi xây dựng giao diện web</li><li>Kinh nghiệm, thủ thuật tối ưu ứng dụng Front-end</li></ul><h3><strong>Nội dung khóa học</strong></h3><ul><li>1 phần</li><li>•</li><li>7 bài học</li><li>•</li><li>Thời lượng 02 giờ 09 phút</li></ul><p><strong>Mở rộng tất cả</strong></p><p>&nbsp;</p><p><strong>1. Tutorials7 bài học</strong></p><p>&nbsp;</p><h3><strong>Yêu cầu</strong></h3>', N'6377285486016160885.png', CAST(N'2021-11-18T17:54:20.163' AS DateTime), 1)
INSERT [dbo].[Courses] ([id_course], [name], [description], [image], [createdAt], [status]) VALUES (5, N'Node & ExpressJS', N'<p>Học Back-end với Node &amp; ExpressJS framework, hiểu các khái niệm khi làm Back-end và xây dựng RESTful API cho trang web.</p><h3><strong>Bạn sẽ học được gì</strong></h3><ul><li>Nắm chắc lý thuyết chung trong việc xây dựng web</li><li>Biết cách làm việc với Mongoose, MongoDB trong NodeJS</li><li>Xây dựng web với Express bằng kiến thức thực tế</li><li>Biết cách xây dựng API theo chuẩn RESTful API</li><li>Nắm chắc lý thuyết về API và RESTful API</li><li>Được chia sẻ lại kinh nghiệm làm việc thực tế</li><li>Nắm chắc khái niệm về giao thức HTTP</li><li>Hiểu rõ tư tưởng và cách hoạt động của mô hình MVC</li><li>Học được cách tổ chức code trong thực tế</li><li>Biết cách deploy (triển khai) website lên internet</li></ul><h3><strong>Nội dung khóa học</strong></h3><ul><li>3 phần</li><li>•</li><li>36 bài học</li><li>•</li><li>Thời lượng 12 giờ 08 phút</li></ul><p><strong>Mở rộng tất cả</strong></p><p>&nbsp;</p><p><strong>1. Bắt đầu8 bài học</strong></p><p>&nbsp;</p><p><strong>2. Kiến thức cốt lõi8 bài học</strong></p><p>&nbsp;</p><p><strong>3. Xây dựng website20 bài học</strong></p><p>&nbsp;</p><h3><strong>Yêu cầu</strong></h3><ul><li>Có kiến thức cơ bản về HTML, CSS và Javascript</li><li>Nắm chắc các tính năng trong Javascript ES6</li><li>Có hiểu biết về lập trình bất đồng bộ trong Javascript</li><li>Sở hữu máy tính kết nối internet HDH Windows, Ubuntu hoặc MacOS</li><li>Ý thức cao, trách nhiệm cao trong việc tự học. Thực hành lại sau mỗi bài học</li><li>Khi học nếu có khúc mắc hãy tham gia hỏi/đáp tại group FB: Học lập trình web (fullstack.edu.vn)</li><li>Bạn không cần biết gì hơn nữa, trong khóa học tôi sẽ chỉ cho bạn những gì bạn cần phải biết</li></ul>', N'6377285489496971366.png', CAST(N'2021-11-18T17:54:55.070' AS DateTime), 1)
INSERT [dbo].[Courses] ([id_course], [name], [description], [image], [createdAt], [status]) VALUES (6, N'Kiến Thức Nhập Môn', N'<p>Để có cái nhìn tổng quan về ngành IT - Lập trình web các bạn nên xem các videos tại khóa này trước nhé.</p><h3><strong>Bạn sẽ học được gì</strong></h3><ul><li>Các kiến thức cơ bản, nền móng của ngành IT</li><li>Các mô hình, kiến trúc cơ bản khi triển khai ứng dụng</li><li>Các khái niệm, thuật ngữ cốt lõi khi triển khai ứng dụng</li><li>Hiểu hơn về cách internet và máy vi tính hoạt động</li></ul><h3><strong>Nội dung khóa học</strong></h3><ul><li>4 phần</li><li>•</li><li>8 bài học</li><li>•</li><li>Thời lượng 02 giờ 15 phút</li></ul><p><strong>Mở rộng tất cả</strong></p><p>&nbsp;</p><p><strong>1. Khái niệm kỹ thuật cần biết2 bài học</strong></p><p>&nbsp;</p><p><strong>2. Phương pháp học tập2 bài học</strong></p><p>&nbsp;</p><p><strong>3. Tư duy phát triển1 bài học</strong></p><p>&nbsp;</p><p><strong>4. Tham khảo thêm3 bài học</strong></p><p>&nbsp;</p><h3><strong>Yêu cầu</strong></h3>', N'6377285492493637667.png', CAST(N'2021-11-18T17:55:24.940' AS DateTime), 1)
INSERT [dbo].[Courses] ([id_course], [name], [description], [image], [createdAt], [status]) VALUES (7, N'JavaScript Nâng Cao', N'<p>Video về kh&oacute;a học :&nbsp;<br />
&nbsp;</p>

<p><iframe frameborder="0" height="315" src="https://www.youtube.com/embed/0SJE9dYdpps" title="YouTube video player" width="560"></iframe></p>
', N'6377285496939788849.png', CAST(N'2021-12-23T00:40:36.687' AS DateTime), 1)
SET IDENTITY_INSERT [dbo].[Courses] OFF
GO
SET IDENTITY_INSERT [dbo].[Posts] ON 

INSERT [dbo].[Posts] ([id_post], [title], [description], [status], [id_user], [createdAt]) VALUES (2, N'abc', N'Khóa học ReactJS từ cơ bản tới nâng cao, kết quả của khóa học này là bạn có thể làm hầu hết các dự án thường gặp với ReactJS. Cuối khóa học này bạn sẽ sở hữu một dự án giống Tiktok.com, bạn có thể tự tin đi xin việc khi nắm chắc các kiến thức được chia sẻ trong khóa học này.', 2, 1, CAST(N'2021-11-20T00:00:00.000' AS DateTime))
INSERT [dbo].[Posts] ([id_post], [title], [description], [status], [id_user], [createdAt]) VALUES (3, N'Cho e hỏi cách code đoạn php này như nào ạ ?', N'<p><em><strong>Em c&oacute; code 1 đoạn php như n&agrave;y ạ, mọi người giải th&iacute;ch gi&uacute;p e đoạn n&agrave;y vs ạ.Em c&oacute; code 1 đoạn php như n&agrave;y ạ, mọi người giải th&iacute;ch gi&uacute;p e đoạn n&agrave;y vs ạEm c&oacute; code 1 đoạn php như n&agrave;y ạ, mọi người giải th&iacute;ch gi&uacute;p e đoạn n&agrave;y vs ạEm c&oacute; code 1 đoạn php như n&agrave;y ạ, mọi người giải th&iacute;ch gi&uacute;p e đoạn n&agrave;y vs ạEm c&oacute; code 1 đoạn php như n&agrave;y ạ, mọi người giải th&iacute;ch gi&uacute;p e đoạn n&agrave;y vs ạ</strong></em></p>

<p>&nbsp;</p>
', 2, 3, CAST(N'2021-11-21T15:06:13.987' AS DateTime))
INSERT [dbo].[Posts] ([id_post], [title], [description], [status], [id_user], [createdAt]) VALUES (4, N'xn chào ,mọi ngời cho e hỏi', N'<p>e hỏi về code java ạ</p>
', 2, 3, CAST(N'2021-11-22T00:21:09.363' AS DateTime))
INSERT [dbo].[Posts] ([id_post], [title], [description], [status], [id_user], [createdAt]) VALUES (5, N'Hàm query trong php ?', N'<p>Em hiện tại đ&atilde; học tới c&aacute;ch sử dụng query trong php, mọi người hd e với a</p>
', 1, 3, CAST(N'2021-12-16T22:14:30.753' AS DateTime))
INSERT [dbo].[Posts] ([id_post], [title], [description], [status], [id_user], [createdAt]) VALUES (6, N'aaaaaaaaaaaa', N'<p>alo alo&nbsp;</p>
', 2, 5, CAST(N'2021-12-16T23:20:20.847' AS DateTime))
INSERT [dbo].[Posts] ([id_post], [title], [description], [status], [id_user], [createdAt]) VALUES (7, N'Thời gian và Động lực', N'<p>C&oacute; lẽ cũng rất l&acirc;u rồi m&agrave; t&ocirc;i chưa đụng đến thứ được gọi l&agrave; &ldquo;timetable&rdquo;. Hay d&acirc;n d&atilde; hơn th&igrave; người ta hay gọi l&agrave; &ldquo;Lịch thường nhật&rdquo;, c&ograve;n đối với học sinh, sinh vi&ecirc;n gọi l&agrave; &ldquo;thời kh&oacute;a biểu&rdquo;. Chắc hẳn nhiều người sẽ thắc mắc tại sao t&ocirc;i l&agrave; sinh vi&ecirc;n m&agrave; lại l&acirc;u rồi chưa đụng đến c&aacute;i m&agrave; sinh vi&ecirc;n đều gọi l&agrave; thời kh&oacute;a biểu. Đương nhi&ecirc;n học sinh hay sinh vi&ecirc;n đều cần c&oacute; n&oacute; để xem lịch học, để kh&ocirc;ng một buổi s&aacute;ng n&agrave;o bị qu&ecirc;n mất kiến thức.</p>

<p>Trong b&agrave;i viết n&agrave;y, &yacute; t&ocirc;i muốn n&oacute;i l&agrave; &ldquo;timetable&rdquo; hay l&agrave; c&aacute;ch sắp sếp thời gian cho từng m&ocirc;n học hoặc việc g&igrave; đ&oacute; ghi chi ch&iacute;t tr&ecirc;n một bảng lịch. Đến tận b&acirc;y giờ t&ocirc;i mới học được c&aacute;ch sắp xếp thời gian, ph&acirc;n chia từng m&ocirc;n học theo lịch học tr&ecirc;n trường. Khi ch&uacute;ng ta c&ograve;n trẻ c&ograve;n sức khỏe c&ograve;n học tập v&agrave; lao động th&igrave; thời gian l&agrave; thứ v&ocirc; c&ugrave;ng quan trọng nếu như ch&uacute;ng ta biết sắp xếp v&agrave; ph&acirc;n bổ hợp l&yacute; th&igrave; sẽ kiểm so&aacute;t được n&oacute;, thay v&igrave; ch&uacute;ng ta muốn học một c&aacute;i g&igrave; đ&oacute; m&agrave; cứ than v&atilde;n rằng: &ldquo;<em>Th&ocirc;i chắc kh&ocirc;ng c&oacute; thời gian để học đ&acirc;u</em>&rdquo; hay kiểu thấy một kh&oacute;a học d&agrave;i th&igrave; lại than: &ldquo;<em>Haizz&hellip; Học kh&oacute;a n&agrave;y l&acirc;u thế. Tốn thời gian</em>&rdquo; th&igrave; c&aacute;c bạn đang cố t&igrave;m kiếm biện minh cho sự lười biếng của c&aacute;c bạn m&agrave; th&ocirc;i, c&oacute; thể d&agrave;nh v&agrave;i tiếng đồng hồ ra chơi game, lướt facebook, tiktok m&agrave; bỏ mấy ph&uacute;t ra học th&igrave; lại kh&ocirc;ng l&agrave;m được v&agrave; cố tỏ ra m&igrave;nh l&agrave; người bận rộn. Đ&oacute; l&agrave; chẳng qua chưa kiểm so&aacute;t được thời gian n&ecirc;n sẽ c&oacute; t&igrave;nh trạng l&uacute;c th&igrave; l&agrave;m rất nhiều việc nhưng lại c&oacute; l&uacute;c mất c&acirc;n bằng chả muốn l&agrave;m g&igrave; cả, l&agrave;m một việc l&agrave; ngại kh&ocirc;ng muốn l&agrave;m. Đặc biệt ch&uacute;ng ta trong thời gian tự học th&igrave; c&agrave;ng cần phải kiểm so&aacute;t được n&oacute; như một c&aacute;i g&igrave; đấy l&agrave;m động lực gi&uacute;p ta học hỏi th&ecirc;m nhiều thứ hay ho hơn.</p>

<p>Thế nhưng t&ocirc;i lại kh&ocirc;ng phải l&agrave; kiểu người sống rập khu&ocirc;n, l&agrave; kiểu người khi thấy một c&agrave;nh c&acirc;y kh&ocirc; nh&ocirc; ra khỏi lề đường cũng khiến t&ocirc;i đứng sững người mười lăm ph&uacute;t. . Lề th&oacute;i với t&ocirc;i, n&oacute;i chung l&agrave; kh&ocirc;ng c&oacute; t&aacute;c dụng, khi m&agrave; H&agrave; Nội vốn lu&ocirc;n khiến t&ocirc;i bất ngờ đến đứng sững.</p>

<p>Đương nhi&ecirc;n, c&agrave;ng trưởng th&agrave;nh th&igrave; người ta lại c&agrave;ng b&oacute; buộc m&igrave;nh lại theo một khu&ocirc;n khổ. N&oacute; gi&uacute;p ch&uacute;ng ta l&agrave;m được tốt những điều người kh&aacute;c muốn, đạt được những thứ m&agrave; người kh&aacute;c kỳ vọng theo c&aacute;ch đơn giản hơn. Một chương tr&igrave;nh tốt l&agrave; một chương tr&igrave;nh được lập tr&igrave;nh sẵn theo c&aacute;ch kỹ c&agrave;ng, t&iacute;nh to&aacute;n được nhiều biến số&hellip; T&ocirc;i vốn l&agrave;m chủ được cuộc đời m&igrave;nh v&agrave; sống theo c&aacute;ch của t&ocirc;i, một c&aacute;ch l&agrave; người đời chưa thể hiểu r&otilde; hơn được. Tuy nhi&ecirc;n, lớn rồi người ta sẽ phải chấp nhận đ&aacute;nh đổi nhiều thứ để đạt được những thứ m&agrave; m&igrave;nh muốn, đạt được trong tương lai. C&oacute; lẽ từ mai t&ocirc;i sẽ phải t&igrave;m c&aacute;ch c&acirc;n bằng lại cỗ m&aacute;y thời gian của m&igrave;nh v&agrave; một lịch tr&igrave;nh l&agrave;m việc v&agrave; tự học hiệu quả hơn.</p>

<p>Một số ứng dụng, c&aacute;ch gi&uacute;p t&ocirc;i lấy lại động lực để cố gắng tự học, l&agrave;m việc vượt qua trong khoảng thời gian dịch bệnh căng thẳng (Đ&acirc;y l&agrave; suy nghĩ của t&ocirc;i chia sẻ th&ocirc;i nha nếu như c&aacute;c bạn c&oacute; c&aacute;ch n&agrave;o hay th&igrave; h&atilde;y comment b&ecirc;n dưới để cho t&ocirc;i v&agrave; mọi người c&ugrave;ng biết với nha :)) ) khi tất cả đều chuyển sang online. C&aacute;c bạn biết tại sao khi ch&uacute;ng ta học tr&ecirc;n trường học online lại chăm hơn khi ch&uacute;ng ta tự học? Đ&oacute; l&agrave; l&iacute; do những thứ ch&uacute;ng ta gọi l&agrave; r&agrave;ng buộc m&igrave;nh về mọi thứ v&iacute; dụ như: thầy c&ocirc; hoặc điểm số chẳng hạn,&hellip;</p>

<p><strong>Vậy th&igrave;</strong>:</p>

<ol>
	<li>C&aacute;c bạn h&atilde;y coi một kh&oacute;a học online tr&ecirc;n trang học trực tuyến hay youtube như l&agrave; một m&ocirc;n học chuy&ecirc;n ng&agrave;nh tr&ecirc;n trường v&agrave; đang học online, người l&agrave;m video hướng dẫn như người thầy, người c&ocirc; của t&ocirc;i vậy như thế sẽ gi&uacute;p m&igrave;nh c&oacute; động lực học hơn.</li>
	<li>C&aacute;c bạn c&oacute; thể rủ bạn b&egrave; hay một nh&oacute;m bạn th&acirc;n n&agrave;o đấy tạo ph&ograve;ng meet hay rủ nhau v&agrave;o Discord rồi tạo cho m&igrave;nh một kh&ocirc;ng gian như trong buổi học online.</li>
	<li>H&atilde;y nghe một bản nhạc lofi để gi&uacute;p c&aacute;c bạn lấy lại tinh thần v&agrave; động lực cho bản th&acirc;n khi tự học.</li>
</ol>

<p><strong>V&agrave; để sắp xếp lịch học th&igrave; c&aacute;c bạn xem qua</strong>:</p>

<ul>
	<li>Google Calendar (ho&agrave;n to&agrave;n Free v&agrave; lu&ocirc;n đồng bộ với nhiều thiết bị. Đồ ngon thế tội g&igrave; m&agrave; kh&ocirc;ng d&ugrave;ng :v )</li>
	<li>Trello (1 ứng dụng todo list gi&uacute;p ph&acirc;n chia tasks để c&aacute;c bạn c&oacute; thể cong m&ocirc;ng l&ecirc;n m&agrave; chạy deadline). Ứng dụng n&agrave;y nh&igrave;n c&oacute; vẻ giống app Todolist của Microsoft. Tuy nhi&ecirc;n mỗi một ứng dụng sẽ c&oacute; 1 t&iacute;nh năng nổi trội ri&ecirc;ng v&agrave; t&ugrave;y theo c&aacute;ch sử dụng của mỗi người n&ecirc;n thấy c&aacute;i n&agrave;o dễ d&ugrave;ng v&agrave; quen sử dụng th&igrave; d&ugrave;ng th&ocirc;i.</li>
</ul>

<p>Tuy nhi&ecirc;n c&aacute;ch sắp xếp v&agrave; ph&acirc;n bố thời gian của mỗi người l&agrave; kh&aacute;c nhau n&ecirc;n cũng kh&ocirc;ng thể phải &aacute;p đặt thời gian của người kh&aacute;c l&ecirc;n c&aacute;ch sinh hoạt v&agrave; cuộc sống của m&igrave;nh được, h&atilde;y sắp xếp l&agrave;m sao để c&oacute; thế nghỉ ngơi v&agrave; một tinh thần thoải m&aacute;i để ch&agrave;o đ&oacute;n một ng&agrave;y mới v&agrave; l&agrave;m việc trở n&ecirc;n tốt hơn.</p>

<p><img alt="wepik-20211113-01332.png" src="https://cdn.fullstack.edu.vn/f8-learning/blog_posts/1671/61b634151fbbb.png" /></p>
', 1, 4, CAST(N'2021-12-23T00:00:25.730' AS DateTime))
INSERT [dbo].[Posts] ([id_post], [title], [description], [status], [id_user], [createdAt]) VALUES (8, N'Cấu trúc cơ bản trong HTML', N'<p>Chắc hẳn ai cũng biết một trang web th&igrave; kh&ocirc;ng thể n&agrave;o thiếu đi HTML v&agrave; HTML l&agrave;m n&ecirc;n cấu tr&uacute;c của một trang web, như b&agrave;i viết c&aacute;c bạn đang đọc b&agrave;i viết n&agrave;y th&igrave; cũng được viết bằng html.</p>

<p><img alt="cac-the-html-co-ban-5.jpg" src="https://cdn.fullstack.edu.vn/f8-learning/blog_posts/1637/61b174eac43f3.jpg" /></p>

<blockquote>
<p>xem nhiều tip hay tại&nbsp;<a href="https://www.kimidev.ga/" rel="noopener noreferrer" target="_blank">https://www.kimidev.ga/</a></p>
</blockquote>

<p>&nbsp;</p>

<p>cơ bản của html</p>

<p>h&ocirc;m nay m&igrave;nh xin giới thiệu sơ cho mọi người về cấu tr&uacute;c cơ bản của một trang HTML cơ bản nh&aacute;.</p>

<p><strong>HTML l&agrave; g&igrave; ???</strong></p>

<p>HTML l&agrave; chữ viết tắt của cụm từ Hyper Text Markup Language ( Ng&ocirc;n ngữ đ&aacute;nh dấu si&ecirc;u văn bản) được sử dụng để tạo một trang web, tr&ecirc;n một website c&oacute; thể sẽ chứa nhiều trang v&agrave; mỗi trang được quy ra l&agrave; một t&agrave;i liệu HTML. HTML l&agrave; một trong những ng&ocirc;n ngữ quan trọng trong lĩnh vực thiết kế website. HTML đ&atilde; trở th&agrave;nh một chuẩn mực của Internet do tổ chức World Wide Web Consortium (W3C) duy tr&igrave;.</p>

<blockquote>
<p>Lưu &yacute;: HTML kh&ocirc;ng phải l&agrave; ng&ocirc;n ngữ lập tr&igrave;nh.</p>
</blockquote>

<p>Tại sao phải sử dụng html trong thiết kế website ??? n&oacute;i n&ocirc;m na cho dẽ hiểu th&igrave; html l&agrave; một si&ecirc;u văn bản cấu tạo n&ecirc;n một cấu của website ( được xem l&agrave; bộ khung của website ), đ&acirc;y l&agrave; ng&ocirc;n ngữ duy nhất m&agrave; c&aacute;c tr&igrave;nh duyệt cốc cốc , chrome, opera &hellip; c&oacute; thể hiểu v&agrave; thực hiện được,</p>

<p>**cấu tr&uacute;c cơ bản của HTML ??? **</p>

<p>&nbsp;</p>

<p>﻿Đ&acirc;y l&agrave; nhan đề của một b&agrave;i viết﻿</p>

<h1>Đ&acirc;y l&agrave; ti&ecirc;u đề ch&iacute;nh</h1>

<p>Đ&acirc;y l&agrave; đoạn văn để giới thiệu nội dung phần c&ograve;n lại của trang, nếu nội dung d&agrave;i th&igrave; c&oacute; thể chia th&agrave;nh nhiều ti&ecirc;u đề phụ.</p>

<p>﻿</p>

<h2>Đ&acirc;y l&agrave; ti&ecirc;u đề phụ</h2>

<p>Một b&agrave;i viết n&ecirc;n c&oacute; 1 v&agrave;i ti&ecirc;u đề phụ, điều đ&oacute; gi&uacute;p co cấu tr&uacute;c b&agrave;i viết được r&otilde; r&agrave;ng, người đọc dễ hiểu hơn.</p>

<p>﻿</p>

<h2>Đ&acirc;y l&agrave; một ti&ecirc;u đề phục kh&aacute;c c&ugrave;ng cấp với ti&ecirc;u đề phụ b&ecirc;n tr&ecirc;n</h2>

<p>﻿</p>

<p>&nbsp;</p>

<p>đ&acirc;y l&agrave; cấu tr&uacute;c cơ bản của một trang HTML, ch&uacute;ng được cấu tạo từ c&aacute;c k&iacute; tự nằm b&ecirc;n trong dấu &lt; &gt; , ch&uacute;ng được gọi l&agrave; element ( HTML element ), c&aacute;c phần tử n&agrave;y được tạo th&agrave;nh từ 2 thẻ đ&oacute; l&agrave; thẻ đ&oacute;ng v&agrave; mở. v&iacute; dụ: m&igrave;nh c&oacute; thẻ mở l&agrave; :</p>

<p>thẻ đ&oacute;ng l&agrave; : <!-- html --> th&ecirc;m một v&agrave;i v&iacute; vụ nữa:</p>

<p>&nbsp;</p>

<p>; &hellip; tuy nhi&ecirc;n trong nhiều trường hợp th&igrave; sẽ c&oacute; những element bị thiếu cả thẻ đ&oacute;ng v&agrave; mở. v&iacute; dụ: : thẻ n&agrave;y th&igrave; kh&ocirc;ng c&oacute; thẻ đ&oacute;ng nhưng để kết th&uacute;c thẻ th&igrave; ch&uacute;ng ta th&ecirc;m dấu / v&agrave;o ở cưới th&igrave; ch&uacute;ng sẽ trong như n&agrave;y: th&igrave; l&uacute;c n&agrave;y thẻ img vừa l&agrave; thẻ đ&oacute;ng v&agrave; vừa l&agrave; thẻ mở đ&oacute; nha. một v&agrave;i v&iacute; vụ; ;<br />
; &hellip;</p>

<p>&nbsp;</p>

<p><strong>Element Trong HTML</strong></p>

<p>Ở tr&ecirc;n ta đ&atilde; biết đến kh&aacute;i niệm HTML element. B&acirc;y giờ ch&uacute;ng ta sẽ t&igrave;m hiểu s&acirc;u hơn về n&oacute;.</p>

<p>C&aacute;c thẻ ở đ&acirc;y hoạt động giống như c&aacute;c v&ugrave;ng chứa, n&oacute; chứa th&ocirc;ng tin nằm giữa 2 thẻ mở v&agrave; đ&oacute;ng. C&aacute;c k&yacute; tự trong ngoặc cho ta biết loại thẻ, mục đ&iacute;ch của thẻ. V&iacute; dụ: trong c&aacute;c thẻ ở tr&ecirc;n p l&agrave; viết tắt của đoạn văn (paragraph). Thẻ mở</p>

<p>được cấu tạo bởi dấu nhỏ hơn nằm b&ecirc;n tr&aacute;i, tiếp đến l&agrave; k&iacute; tự &ldquo;p&rdquo; v&agrave; cuối c&ugrave;ng l&agrave; dấu lớn hơn. Thẻ đ&oacute;ng</p>

<p>được cấu tạo cơ bản giống thẻ mở của n&oacute; nhưng n&oacute; th&ecirc;m &ldquo;/&rdquo; v&agrave;o trước k&iacute; tự &ldquo;p&rdquo;. Body, Head &amp; TitleTi&ecirc;u đề/Nhan đề b&agrave;i viếtNội dung của trang sẽ nằm ở đ&acirc;y</p>

<p>&nbsp;</p>

<p>Khai b&aacute;o đ&acirc;y l&agrave; một file c&oacute; định dạng l&agrave; HTML5 để gi&uacute;p tr&igrave;nh duyệt biết bạn đang d&ugrave;ng phi&ecirc;n bản html bao nhi&ecirc;u, c&oacute; cũng được, kh&ocirc;ng c&oacute; cũng được nhưng sẽ bị hạn chế nhiều thẻ mới, thuộc t&iacute;nh trong thẻ m&agrave; tr&igrave;nh duyệt kh&ocirc;ng ph&aacute;t hiện được. Thẻ</p>

<p>Cấu tr&uacute;c file html ThẻNằm sau thẻ, c&oacute; thẻ đ&oacute;ng nằm trước. Body l&agrave; nơi chứa những g&igrave; m&agrave; mọi người sẽ thấy tr&ecirc;n trang như thanh menu, banner, quảng c&aacute;o. ThẻNằm sau thẻ, c&oacute; thẻ đ&oacute;ng, n&oacute; chứa những thẻ khai b&aacute;o th&ocirc;ng tin cho trang như ti&ecirc;u đề, m&ocirc; tả, bảng m&atilde; k&yacute; tự. head kh&ocirc;ng hiển thị nội dung những g&igrave; n&oacute; chứa đựng ra ngo&agrave;i. Thuộc t&iacute;nh (attribute) charset nằm trong thẻ meta c&oacute; nhiệm vụ khai b&aacute;o bảng m&atilde;, ng&ocirc;n ngữ tiếng việt n&ecirc;n d&ugrave;ng UTF-8 Thẻd&ugrave;ng để khai b&aacute;o ti&ecirc;u đề của trang, v&agrave; gần như đ&acirc;y l&agrave; bắt buộc phải c&oacute; trong một file html.</p>
', 1, 3, CAST(N'2021-12-23T15:30:57.940' AS DateTime))
INSERT [dbo].[Posts] ([id_post], [title], [description], [status], [id_user], [createdAt]) VALUES (9, N'TyperScript là gì, Vì sao nên dùng TyperScript', N'<p>Link kh&oacute;a học cho anh em n&agrave;o t&ograve; m&ograve; ( Đừng lo v&igrave; tất cả đều miễn ph&iacute; ) :</p>

<ul>
	<li>Course 1 :&nbsp;<a href="https://tedu.com.vn/.../bai-1-gioi-thieu-ecma-script-va" rel="noopener noreferrer" target="_blank">https://tedu.com.vn/.../bai-1-gioi-thieu-ecma-script-va</a>&hellip;</li>
	<li>Course 2 :&nbsp;<a href="https://www.codecademy.com/learn/learn-typescript" rel="noopener noreferrer" target="_blank">https://www.codecademy.com/learn/learn-typescript</a></li>
	<li>Course 3 :&nbsp;<a href="https://www.youtube.com/watch?v=FDvpg10p-WQ" rel="noopener noreferrer" target="_blank">https://www.youtube.com/watch?v=FDvpg10p-WQ</a>&hellip;</li>
</ul>

<p>𝐆𝐢𝐨̛́𝐢 𝐭𝐡𝐢𝐞̣̂𝐮 𝐓𝐲𝐩𝐞𝐬𝐜𝐫𝐢𝐩𝐭 - 𝐒𝐮̛̣ 𝐤𝐡𝐚́𝐜 𝐧𝐡𝐚𝐮 𝐠𝐢𝐮̛̃𝐚 𝐓𝐲𝐩𝐞𝐬𝐜𝐫𝐢𝐩𝐭 𝐯𝐚̀ 𝐉𝐚𝐯𝐚𝐬𝐜𝐫𝐢𝐩𝐭 𝐓𝐲𝐩𝐞𝐬𝐜𝐫𝐢𝐩𝐭 𝐥𝐚̀ 𝐠𝐢̀?</p>

<p>Typescript l&agrave; một dự &aacute;n m&atilde; nguồn mở được Microsoft ph&aacute;t triển, được xem l&agrave; một phi&ecirc;n bản n&acirc;ng cao của Javascript. TypeScript l&agrave; một ng&ocirc;n ngữ gi&uacute;p cung cấp quy m&ocirc; lớn hơn so với JavaScript. V&igrave; sao lại được xem l&agrave; phi&ecirc;n bản n&acirc;ng cao của Javascript? V&igrave; n&oacute; được bổ sung những t&ugrave;y chọn kiểu tĩnh v&agrave; c&aacute;c lớp hướng đối tượng, n&oacute; bao h&agrave;m lu&ocirc;n ES6(ECMAScript 6 2015) - phi&ecirc;n bản mới nhất của Javascript. TypeScript th&ecirc;m c&aacute;c namespace, class v&agrave; module t&ugrave;y chọn v&agrave;o JavaScript. TypeScript hỗ trợ c&aacute;c c&ocirc;ng cụ cho c&aacute;c ứng dụng JavaScript quy m&ocirc; lớn cho bất kỳ tr&igrave;nh duyệt n&agrave;o, cho bất kỳ m&aacute;y chủ n&agrave;o, tr&ecirc;n bất kỳ hệ điều h&agrave;nh n&agrave;o. Với những lập tr&igrave;nh vi&ecirc;n đ&atilde; quen với Javascript th&igrave; chắc hẳn c&aacute;c bạn cũng hiểu được những kh&oacute; khăn khi lập tr&igrave;nh với n&oacute;.</p>

<p>● T&iacute;nh mở trong việc sử dụng biến g&acirc;y kh&oacute; khăn trong việc kiểm so&aacute;t sự thay đổi, cập nhật</p>

<p>● C&aacute;c ứng dụng phức tạp đ&ograve;i hỏi sử dụng rất nhiều file source, t&aacute;ch th&agrave;nh nhiều thư mục ri&ecirc;ng th&igrave; việc đảm bảo t&iacute;nh thống nhất sẽ mất rất nhiều c&ocirc;ng sức v&igrave; phải thao t&aacute;c bằng tay kh&aacute; nhiều.</p>

<p>● Về cơ bản th&igrave; Javascript c&oacute; hỗ trợ OOP nhưng khi &aacute;p dụng th&igrave; lại rất kh&oacute; khăn bởi c&aacute;ch triển khai code kh&ocirc;ng hề đơn giản so với những ng&ocirc;n ngữ bậc cao kh&aacute;c như Java, C#, Ruby &hellip;</p>

<p>Vậy ưu điểm của Typescript l&agrave; g&igrave; v&agrave; tại sao ch&uacute;ng ta lại sử dụng n&oacute;? Ưu điểm của Typescript:</p>

<p>● Dễ d&agrave;ng hơn trong ph&aacute;t triển c&aacute;c dự &aacute;n lớn, được hỗ trợ bởi c&aacute;c Javascript Framework lớn.</p>

<p>● Hỗ trợ OOP mạnh: Hầu hết c&aacute;c c&uacute; ph&aacute;p hướng đối tượng đều được hỗ trợ bởi Typescript như kế thừa, đ&oacute;ng g&oacute;i, constructor, abstract, interface, implement, override&hellip;v.v</p>

<p>● C&aacute;ch tổ chức code r&otilde; r&agrave;ng hơn bởi được hỗ trợ c&aacute;c kỹ thuật mới nhất v&agrave; hỗ trợ lập tr&igrave;nh hướng đối tượng: Hỗ trợ cơ chế gi&uacute;p kiến tr&uacute;c hệ thống code hướng module, hỗ trợ namespace, gi&uacute;p x&acirc;y dựng c&aacute;c hệ thống lớn nơi m&agrave; nhiều dev c&oacute; thể l&agrave;m việc c&ugrave;ng nhau một c&aacute;ch dễ d&agrave;ng hơn.</p>

<p>● Hỗ trợ c&aacute;c t&iacute;nh năng mới nhất của Javascript.</p>

<p>● Một lợi thế của Typescript nữa l&agrave; m&atilde; nguồn mở v&igrave; vậy n&oacute; miễn ph&iacute; v&agrave; c&oacute; cộng đồng hỗ trợ rất lớn.</p>

<p>Typescript đang được sử dụng ở c&aacute;c Framework Front-end phổ biến như Angular 2, Ionic&hellip; cũng như Nền tảng cho back-end như Node-js bởi những ưu điểm của m&igrave;nh.</p>

<p>𝐂𝐚̀𝐢 đ𝐚̣̆𝐭</p>

<p>Ch&uacute;ng ta kh&ocirc;ng thể chạy trực tiếp Typescript ngay trong tr&igrave;nh duyệt một c&aacute;ch đơn giản như Javascript, Typescript được bi&ecirc;n dịch qua Javascript bởi tr&igrave;nh bi&ecirc;n dịch th&ocirc;ng qua npm.</p>

<p>Để c&oacute; thể l&agrave;m việc với Typescript th&igrave; bạn phải c&agrave;i đặt node.js &amp; npm C&agrave;i Typescript để bi&ecirc;n dịch Typescript sang Javascript: npm install -g typescript Kiểm tra c&agrave;i đặt bằng lệnh: tsc -v Version 2.6.2</p>

<p>𝐓𝐡𝐮̛̣𝐜 𝐡𝐚̀𝐧𝐡 𝐓𝐲𝐩𝐞𝐬𝐜𝐫𝐢𝐩𝐭:</p>

<p>Sau khi c&agrave;i đặt th&agrave;nh c&ocirc;ng h&atilde;y thực h&agrave;nh một v&agrave;i d&ograve;ng code để t&igrave;m hiểu Typescript n&agrave;o.</p>

<p>File example.ts :</p>

<p>class Vehicle { name: string; brand: string;</p>

<pre>
<code>constructor (name: string, brand: string) {
    this.name = name;
    this.brand = brand;
}

info() {
  return &quot;Name: &quot; + this.name + &quot;, brand: &quot; + this.brand;
}

start() {
    return this.brand + &quot; &quot; + this.name + &quot; is runing.&quot;;
}
</code></pre>

<p>}</p>

<p>let bugati = new Vehicle(&ldquo;Veyon&rdquo;, &ldquo;Bugati&rdquo;); bugati.start();</p>

<p>Chạy lệnh tsc example.ts typescript sẽ bi&ecirc;n dịch ra một file js c&ugrave;ng t&ecirc;n v&agrave; khi chạy thực ra l&agrave; chạy file n&agrave;y chứ kh&ocirc;ng phải file example.ts.</p>

<p>C&ugrave;ng xem code Javascript đ&atilde; được dịch ra tr&ocirc;ng như thế n&agrave;o nh&eacute;:</p>

<p>var Vehicle = /** @class */ (function () { function Vehicle(name, brand) {&nbsp;<a href="http://this.name/" rel="noopener noreferrer" target="_blank">this.name</a>&nbsp;= name; this.brand = brand; }</p>

<pre>
<code>Vehicle.prototype. info = function () {
    return &quot;Name: &quot; + this.name + &quot;, brand: &quot; + this.brand;
};

Vehicle.prototype.start = function () {
    return this.brand + &quot; &quot; + this.name + &quot; is runing.&quot;;
};

return Vehicle;
</code></pre>

<p>}());</p>

<p>var bugati = new Vehicle(&ldquo;Veyon&rdquo;, &ldquo;Bugati&rdquo;); bugati.start();</p>

<p>Đ&oacute; l&agrave; ưu điểm của Typescript so với Javascript, code tr&ocirc;ng gọn v&agrave; dễ nh&igrave;n hơn nhiều so với Javascript.</p>

<p>Ch&uacute;ng ta c&oacute; thể thấy h&agrave;m constructor trong code của Typescript, c&oacute; g&igrave; đ&oacute; lạ ở đ&acirc;y kh&ocirc;ng? Đ&oacute; l&agrave; h&agrave;m tạo của class trong Typescript, một thể hiện của OOP, chắc c&aacute;c bạn cũng thấy quen quen ở đ&acirc;y đ&uacute;ng kh&ocirc;ng.</p>

<p>𝐁𝐢𝐞̂́𝐧 𝐯𝐚𝐫 - 𝐛𝐢𝐞̂́𝐧 𝐥𝐞𝐭 𝐭𝐫𝐨𝐧𝐠 𝐓𝐲𝐩𝐞𝐬𝐜𝐫𝐢𝐩𝐭:</p>

<p>Lưu &yacute;: V&igrave; hiện tại ES5 vẫn kh&aacute; phổ biến n&ecirc;n Javascript m&igrave;nh so s&aacute;nh ở phần n&agrave;y của b&agrave;i biết đang n&oacute;i l&agrave; javascript bởi ES5 trở về trước, kh&ocirc;ng gồm ES6 trở về sau! Trong ES6 về sau đ&atilde; c&oacute; kh&aacute;i niệm let vs const.</p>

<p>Typescript hỗ trợ 3 c&aacute;ch khai b&aacute;o biến: var, let v&agrave; const Ch&uacute;ng ta chỉ cần quan t&acirc;m đến var với let c&ograve;n const th&igrave; l&agrave; c&aacute;ch khai b&aacute;o hằng số rồi</p>

<p>Cũng giống so với Javascript, Typescript cũng sử dụng var để khai b&aacute;o biến, thế nhưng c&oacute; th&ecirc;m let ở đ&acirc;y nữa, vậy vai tr&ograve; của ch&uacute;ng thế n&agrave;o? Để dễ d&agrave;ng ph&acirc;n biệt sự kh&aacute;c nhau giữa var v&agrave; let, c&ugrave;ng xem v&iacute; dụ sau:</p>

<p>𝐯𝐢́ 𝐝𝐮̣ 𝟏: var foo = 123; if (true) { var foo = 456; }</p>

<p>console.log(foo); // 456</p>

<p>𝐯𝐢́ 𝐝𝐮̣ 𝟐: let foo = 123; if (true) { let foo = 456; } console.log(foo); // 123</p>

<p>𝐕𝐚̣̂𝐲 𝐬𝐮̛̣ 𝐤𝐡𝐚́𝐜 𝐧𝐡𝐚𝐮 𝐨̛̉ đ𝐚̂𝐲 𝐥𝐚̀ 𝐠𝐢̀?</p>

<p>Ta thấy biến let tạo ra chỉ d&ugrave;ng được trong block bao quanh n&oacute;. C&ograve;n biến var th&igrave; c&oacute; thể sử dụng rộng hơn l&agrave; c&oacute; thể d&ugrave;ng xuy&ecirc;n suốt trong function chứa n&oacute;. Nếu biến khai b&aacute;o bởi var nằm ở v&ugrave;ng global scope th&igrave; n&oacute; tạo lu&ocirc;n thuộc t&iacute;nh mới cho global object (&ldquo;this&rdquo;) c&ograve;n biến let th&igrave; kh&ocirc;ng.</p>

<p>var x = &ldquo;global&rdquo;; let y = &ldquo;global&rdquo;; console.log(this.x); // &ldquo;global&rdquo; console.log(this.y); // undefined</p>

<p>C&ograve;n với Javascript th&igrave; ch&uacute;ng ta chỉ c&oacute; mỗi var th&ocirc;i. var name = &ldquo;Bugati&rdquo;; Nếu như ch&uacute;ng ta muốn khai b&aacute;o biến với kiểu dữ liệu trong Typescript: var name: string = &ldquo;Bugati&rdquo;;</p>

<p>Qua đ&oacute; c&oacute; thể thấy Typescript cung cấp một sự r&otilde; r&agrave;ng hơn về kiểu dữ liệu, điều n&agrave;y gi&uacute;p dễ d&agrave;ng tổ chức code hơn cũng như dễ d&agrave;ng hơn rất nhiều trong việc debug so với Javascript, bởi nhiều khi c&oacute; những lỗi logic về kiểu dữ liệu m&agrave; ch&uacute;ng ta rất kh&oacute; để ph&aacute;t hiện.</p>

<p>Kh&ocirc;ng thể kh&ocirc;ng n&oacute;i rằng Javascript vẫn l&agrave; một trong những ng&ocirc;n ngữ rất phổ biến hiện nay. Tuy vậy th&igrave; những ưu điểm của Typescript l&agrave; kh&ocirc;ng thể phủ nhận. Bởi những ứng dụng web c&oacute; quy m&ocirc; hầu hết đều sử dụng những framework front-end phổ biến, v&agrave; khi l&agrave;m việc với ch&uacute;ng th&igrave; bạn mới hiểu được sự tiện dụng, hiệu quả m&agrave; Typescript mang lại. ngu&ocirc;̀n: viblo</p>
', 1, 3, CAST(N'2021-12-23T15:39:39.773' AS DateTime))
INSERT [dbo].[Posts] ([id_post], [title], [description], [status], [id_user], [createdAt]) VALUES (10, N'Lập trình hướng đối tượng oop', N'<p>Hi anh em f8,</p>

<p>H&ocirc;m nay m&igrave;nh sẽ chia sẻ 1 chủ đề v&ocirc; c&ugrave;ng quen thuộc với hầu hết c&aacute;c lập tr&igrave;nh vi&ecirc;n - Lập tr&igrave;nh hướng đối tượng(định nghĩa, 4 t&iacute;nh chất oop, v&iacute; dụ demo). Hy vọng sẽ được thảo luận c&ugrave;ng anh em f8.</p>

<p>Kh&ocirc;ng để mọi người chờ l&acirc;u, bắt đầu n&agrave;o!</p>

<p>C&aacute;c bạn c&oacute; thể tham khảo b&agrave;i viết ở viblo:&nbsp;<a href="https://viblo.asia/p/lap-trinh-huong-doi-tuong-oop-L4x5xJxrZBM" rel="noopener noreferrer" target="_blank">https://viblo.asia/p/lap-trinh-huong-doi-tuong-oop-L4x5xJxrZBM</a></p>

<p><strong>1. Định nghĩa</strong></p>

<p><strong>OOP</strong>&nbsp;l&agrave; viết tắt của&nbsp;<strong>Object-Oriented Programming</strong>&nbsp;dịch ra l&agrave; lập tr&igrave;nh hướng đối tượng. Lập tr&igrave;nh hướng đối tượng l&agrave; kỹ thuật, phương ph&aacute;p lập tr&igrave;nh sử dụng c&aacute;c đối tượng (objects) để x&acirc;y dựng ứng dụng. Hầu hết c&aacute;c ng&ocirc;n ngữ như: C#, Java, PHP, Ruby&hellip; đều hỗ trợ lập tr&igrave;nh hướng đối tượng.</p>

<p><strong>Lưu &yacute;:</strong></p>

<ul>
	<li>Lập tr&igrave;nh hướng đối tượng (<strong>OOP</strong>) l&agrave; một kỹ thuật, phương ph&aacute;p lập tr&igrave;nh v&agrave; mỗi lập tr&igrave;nh vi&ecirc;n sẽ c&oacute; c&aacute;ch triển khai, &aacute;p dụng kh&aacute;c nhau t&ugrave;y v&agrave;o từng dự &aacute;n, t&ugrave;y v&agrave;o kinh nghiệm.</li>
	<li>Ngo&agrave;i ra kh&ocirc;ng bắt buộc phải &aacute;p dụng OOP v&agrave;o dự &aacute;n, c&oacute; thể d&ugrave;ng lập tr&igrave;nh hướng h&agrave;m cấu tr&uacute;c (<strong>Procedure Oriented Programming &ndash; POP</strong>) hay c&aacute;c phương ph&aacute;p kh&aacute;c.</li>
</ul>

<p><strong>2. Lợi &iacute;ch</strong></p>

<p>Như ở giới thiệu ở phần 1, ngo&agrave;i OOP ra c&ograve;n c&oacute; c&aacute;c phương ph&aacute;p lập tr&igrave;nh kh&aacute;c. Vậy tại sao OOP lại được ưa chuộng v&agrave; phổ biến trong lập tr&igrave;nh?</p>

<p><strong>OOP c&oacute; c&aacute;c lợi &iacute;ch sau:</strong></p>

<ul>
	<li>C&aacute;ch tiếp cận oop rất thực tế. Dễ m&ocirc; h&igrave;nh h&oacute;a c&aacute;c b&agrave;i to&aacute;n, c&aacute;c đối tượng b&ecirc;n ngo&agrave;i đời sống th&agrave;nh m&atilde; code.</li>
</ul>

<p>V&iacute; dụ như ngo&agrave;i đời thực b&aacute;n c&oacute; thực thể lập tr&igrave;nh vi&ecirc;n, c&oacute; c&aacute;c h&agrave;nh động lấy y&ecirc;u cầu, viết code, deploy sản phẩm. Ta c&oacute; thể tạo ra class&nbsp;<strong>Developer</strong>&nbsp;với c&aacute;c methods:&nbsp;<strong>AnalyzeRequirement</strong>,&nbsp;<strong>WriteCode</strong>,&nbsp;<strong>Deploy</strong>&nbsp;tương ứng.</p>

<ul>
	<li>Dễ bảo tr&igrave;, dễ mở rộng v&agrave; code nh&igrave;n gọn g&ograve;n sạch hơn. Về ưu điểm n&agrave;y th&igrave; sau khi đi qua c&aacute;c t&iacute;nh chất của&nbsp;<strong>OOP</strong>&nbsp;ở phần tiếp theo c&aacute;c bạn sẽ hiểu r&otilde; hơn.</li>
</ul>

<p><strong>Lưu &yacute;:</strong>&nbsp;Việc &aacute;p dụng OOP c&oacute; gi&uacute;p clean code, dễ reuse, dễ scale hay kh&ocirc;ng c&ograve;n t&ugrave;y thuộc v&agrave;o kinh nghiệm v&agrave; tư duy &aacute;p dụng kỹ thuật OOP của mỗi người. C&ugrave;ng 1 kỹ thuật sẽ c&oacute; c&aacute;c c&aacute;ch l&agrave;m tốt, chưa tốt kh&aacute;c nhau.</p>

<p><strong>3. Class v&agrave; Object</strong>&nbsp;<img alt="image.png" src="https://cdn.fullstack.edu.vn/f8-learning/blog_posts/1021/6173ad752e21b.png" /></p>

<p>Trong OOP,&nbsp;<strong>Class</strong>&nbsp;l&agrave; 1 kiểu dữ liệu, 1 khu&ocirc;n mẫu gi&uacute;p m&ocirc; h&igrave;nh h&oacute;a c&aacute;c đối tượng thực tế.&nbsp;<strong>Class</strong>&nbsp;sẽ c&oacute; c&aacute;c thuộc t&iacute;nh (<strong>properties</strong>) v&agrave; c&aacute;c phương thức (<strong>methods</strong>) tương ứng với thuộc t&iacute;nh v&agrave; h&agrave;nh động thực tế b&ecirc;n ngo&agrave;i.</p>

<p>V&iacute; dụ:</p>

<pre>
<code>//(C# code)
public class Developer
{
       private string Name {get;set;}
       public void AnalyzeRequirement()
       {
              //Do something
       }

       public void WriteCode()
       {
              //Do something
       }

       public void Deploy()
       {
              //Do something
       }
}
</code></pre>

<p>Copy</p>

<p>Nếu ta coi&nbsp;<strong>Class</strong>&nbsp;l&agrave; 1 khu&ocirc;n mẫu th&igrave;&nbsp;<strong>Object</strong>(đối tượng) l&agrave; 1 thể hiện được tạo ra từ khu&ocirc;n mẫu đ&oacute;.</p>

<p>V&iacute; dụ:&nbsp;<strong>Lớp (Class)</strong>&nbsp;sẽ c&oacute; c&aacute;c thể hiện l&agrave; c&aacute;c&nbsp;<strong>Đối tượng(Object)</strong>&nbsp;như: BackendDeveloper, FrontendDeveloper, FullStackDeveloper.</p>

<p>Ti&ecirc;p theo ch&uacute;ng ta sẽ c&ugrave;ng nhau t&igrave;m hiểu 4 t&iacute;nh chất của lập tr&igrave;nh hướng đối tượng (OOP).</p>

<p><strong>4. T&iacute;nh đ&oacute;ng g&oacute;i (Encapsulation)</strong>&nbsp;<img alt="image.png" src="https://cdn.fullstack.edu.vn/f8-learning/blog_posts/1021/6173b53194671.png" />&nbsp;<strong>T&iacute;nh đ&oacute;ng g&oacute;i (Encapsulation)</strong>&nbsp;hay c&ograve;n gọi l&agrave;&nbsp;<strong>hiding information</strong>&nbsp;gi&uacute;p gom nh&oacute;m lại c&aacute;c thuộc t&iacute;nh (properties), phương thức (methods) v&agrave; nhiều th&agrave;nh phần kh&aacute;c th&agrave;nh một đối tượng hay một đơn vị.</p>

<p>T&iacute;nh đ&oacute;ng g&oacute;i được triển khai bằng c&aacute;ch sử dụng&nbsp;<strong>access modifier</strong>: public, private, protected, internal.</p>

<ul>
	<li><strong>public</strong>: C&oacute; thể truy cập từ bất cứ đ&acirc;u</li>
	<li><strong>private</strong>: Chỉ c&oacute; thể truy cập ở b&ecirc;n trong class</li>
	<li><strong>protected</strong>: Chỉ c&oacute; thể truy cập ở b&ecirc;n trong class v&agrave; c&aacute;c class kế thừa từ class đ&oacute;</li>
	<li><strong>internal</strong>: Giống như public nhưng chỉ hạn chế trong 1&nbsp;<strong>assembly</strong>.</li>
</ul>

<p><strong>Giải th&iacute;ch về intenal:</strong>&nbsp;Hiểu đơn giản l&agrave; ta c&oacute; 1 ứng dụng U gọi 1 thư viện b&ecirc;n ngo&agrave;i L. Trong thư viện L n&agrave;y c&oacute; class C khai b&aacute;o internal. C&aacute;c class kh&aacute;c trong thư viện L n&agrave;y c&oacute; thể truy cập class C n&agrave;y nhưng ứng dụng U th&igrave; kh&ocirc;ng thể do kh&aacute;c assembly.</p>

<p>V&iacute; dụ:</p>

<pre>
<code>//(C# code)
public class BankAccount
{
	private string Name {get;set;}
	
	private string AccountNumber {get;set;}
	
	private Datetime CreateDate {get;set;}

	public string GetAccountName()
    {
	    return Name;
     }
}
</code></pre>

<p>Copy</p>

<p><strong>5. T&iacute;nh kế thừa (Inheritance)</strong>&nbsp;<img alt="image.png" src="https://cdn.fullstack.edu.vn/f8-learning/blog_posts/1021/6173b58943a83.png" />&nbsp;T&iacute;nh kế thừa cho ph&eacute;p tạo ra 1 class con từ 1 class c&oacute; sẵn v&agrave; mở rộng class đ&oacute;. C&aacute;c class con c&oacute; thể kế thừa lại c&aacute;c thuộc t&iacute;nh (properties) v&agrave; phương thức (methods) của class cha, c&oacute; thể kh&ocirc;ng cần định nghĩa lại c&aacute;c phương thức hoặc t&aacute;i định nghĩa (override) hoặc th&ecirc;m c&aacute;c phương thức sử dụng ri&ecirc;ng ở lớp con. T&iacute;nh chất n&agrave;y gi&uacute;p t&aacute;i sử dụng, tận dụng m&atilde; nguồn c&oacute; sẵn.</p>

<p>V&iacute; dụ:</p>

<pre>
<code>//(C# code)
class Vehicle  // base class (parent) 
{
  public string brand = &quot;Ford&quot;;  // Vehicle field
  public void honk()             // Vehicle method 
  {                    
    Console.WriteLine(&quot;Tuut, tuut!&quot;);
  }
}

class Car : Vehicle  // derived class (child)
{
  public string modelName = &quot;Mustang&quot;;  // Car field
}

class Program
{
  static void Main(string[] args)
  {
    // Create a myCar object
    Car myCar = new Car();

    // Call the honk() method (From the Vehicle class) on the myCar object
    myCar.honk();

    // Display the value of the brand field (from the Vehicle class) and the value of the modelName from the Car class
    Console.WriteLine(myCar.brand + &quot; &quot; + myCar.modelName);
  }
}

</code></pre>

<p>Copy</p>

<p><strong>6. T&iacute;nh đa h&igrave;nh (Polymorphism)</strong>&nbsp;<img alt="image.png" src="https://cdn.fullstack.edu.vn/f8-learning/blog_posts/1021/6173b61bca6dc.png" /></p>

<p>T&iacute;nh đa h&igrave;nh cho ph&eacute;p một h&agrave;nh động c&oacute; thể được thực hiện bằng nhiều c&aacute;ch kh&aacute;c nhau.</p>

<p>C&oacute; 2 c&aacute;ch vận dụng t&iacute;nh đa h&igrave;nh:</p>

<ul>
	<li>Method&nbsp;<strong>overloading</strong>(đa h&igrave;nh khi bi&ecirc;n dịch(<strong>compile time</strong>)): Trong 1 lớp (class) c&aacute;c phương thức (methods) c&oacute; c&ugrave;ng t&ecirc;n nhưng kiểu trả về v&agrave; tham số truyền v&agrave;o kh&aacute;c nhau (số lượng, kiểu)</li>
</ul>

<p>V&iacute; dụ:</p>

<pre>
<code>//(C# code)
public class BankAccount()
{
	public object GetAccountInformation(int bankId)
    {
	//To do something
    }

	public object GetAccountInformation(string bankName)
    {
	//To do something
    }

    public object GetAccountInformation(string bankName, string address)
    {
	//To do something
    }
}
</code></pre>

<p>Copy</p>

<ul>
	<li>Method&nbsp;<strong>overriding</strong>(đa h&igrave;nh ở thời điểm thực thi(<strong>runtime</strong>)): C&aacute;c phương thức được thực hiện ở c&aacute;c lớp con kế thừa từ lớp cha (base class). Nội dung thực hiện b&ecirc;n trong mỗi lớp kh&aacute;c nhau t&ugrave;y v&agrave;o logic nghiệp vụ. Chỉ khi n&agrave;o runtime ta mới biết được đối tượng sẽ sử dụng phương thức n&agrave;o.</li>
</ul>

<p>V&iacute; dụ:</p>

<pre>
<code>//(C# code)
public class BankAccount //Base class
{
	public decimal GetTotalPrice()
	{
		//To do something
    }
}

public class CreditCard: BankAccount 
{
    public decimal GetTotalPrice()
	{
		//To do something
    }
}

public class DebitCard: BankAccount 
{
    public decimal GetTotalPrice()
	{
		//To do something
    }
}

public class Program
{
       public static void Main(string[] args)
       {
               BankAccount bank = new CreditCard();
               Console.WriteLine(bank .GetTotalPrice());
               Console.Read();
       }
}
</code></pre>

<p>Copy</p>

<p><strong>7. T&iacute;nh trừu tượng (Abstraction)</strong></p>

<p>So với 3 t&iacute;nh chất tr&ecirc;n th&igrave; t&iacute;nh trừu tượng để giải th&iacute;ch hơi kh&oacute; hiểu 1 t&iacute; bởi v&igrave; rất trừu tượng. ^^</p>

<p>T&iacute;nh trừu tượng cho ph&eacute;p tổng qu&aacute;t h&oacute;a một đối tượng. Nghĩa l&agrave; ẩn đi những th&ocirc;ng tin chi tiết b&ecirc;n trong, chỉ thể hiện ra những th&ocirc;ng tin b&ecirc;n ngo&agrave;i. V&agrave; nh&igrave;n v&agrave;o th&ocirc;ng tin b&ecirc;n ngo&agrave;i đ&oacute; ta c&oacute; thể hiểu được đối tượng đ&oacute; l&agrave;m g&igrave;.</p>

<p>T&iacute;nh chất n&agrave;y được thể hiện qua việc sử dụng&nbsp;<strong>interface</strong>&nbsp;hoặc&nbsp;<strong>abstract class</strong>&nbsp;.</p>

<p><strong>Lưu &yacute;:</strong>&nbsp;C&acirc;u thần ch&uacute;&nbsp;<strong>Abstraction</strong>&nbsp;-&nbsp;<strong>Ẩn chi tiết, thể hiện tổng quan.</strong></p>

<p>V&iacute; dụ: khi thực hiện h&agrave;nh động thanh to&aacute;n sẽ c&oacute; c&oacute; nhiều bước v&agrave; nghiệp vụ b&ecirc;n trong h&agrave;nh động n&agrave;y. Bằng c&aacute;ch chia t&aacute;ch nhỏ nghiệp vụ th&agrave;nh từng phương thức v&agrave; sử dụng interface ta c&oacute; thể dể d&agrave;ng hiểu được tổng quan những bước, những h&agrave;nh động khi thanh to&aacute;n. M&agrave; kh&ocirc;ng cần đi v&agrave;o chi tiết mỗi h&agrave;nh động l&agrave;m g&igrave;.</p>

<pre>
<code>//C# code
//Checkout:
public Interface Checkout
{
//Chỉ hiển thị t&ecirc;n phương thức, tham số, kiểu trả về
//kh&ocirc;ng thể hiện c&aacute;ch thực hiện chi tiết, logic nghiệp vụ b&ecirc;n trong
	Bool ValidateAccount(object BankAccount); 
	Decimal CaculateTotalPrice(object BankAccount);
	int Checkout(object BankAccount));
}

</code></pre>

<p>Copy</p>

<p><strong>Tổng kết:</strong>&nbsp;Qua b&agrave;i n&agrave;y ch&uacute;ng ta đ&atilde; c&ugrave;ng nhau t&igrave;m hiểu cơ bản về lập tr&igrave;nh hướng đối tượng, c&aacute;c t&iacute;nh chất v&agrave; v&iacute; dụ code demo. L&yacute; thuyết lập tr&igrave;nh OOP đều giống nhau nhưng t&ugrave;y v&agrave;o kinh nghiệm, tư duy m&agrave; mỗi lập tr&igrave;nh vi&ecirc;n sẽ c&oacute; c&aacute;ch hiểu, c&aacute;ch triển khai kh&aacute;c nhau. Hy vọng b&agrave;i viết n&agrave;y sẽ gi&uacute;p &iacute;ch cho những bạn mới tiếp cận lập tr&igrave;nh hướng đối tượng OOP.</p>

<p>Nếu c&oacute; c&acirc;u hỏi hay vấn đề muốn thảo luận trao đổi th&igrave; h&atilde;y comment dưới b&agrave;i viết nh&eacute;. Hy vọng được thảo luận c&ugrave;ng anh em.</p>

<p>Nếu thấy b&agrave;i viết hay v&agrave; bổ &iacute;ch th&igrave; cho m&igrave;nh xin 1 tym nh&eacute;. Cảm ơn v&agrave; ch&uacute;c c&aacute;c anh em f8 một ng&agrave;y cuối tuần tuyệt vời!</p>
', 1, 3, CAST(N'2021-12-23T15:40:16.050' AS DateTime))
INSERT [dbo].[Posts] ([id_post], [title], [description], [status], [id_user], [createdAt]) VALUES (11, N'Xử lý bất đồng bộ trong Javascript - Phần 2 ', N'<h3><span style="font-size:14px">Async/await l&agrave; cơ chế gi&uacute;p bạn thực thi c&aacute;c thao t&aacute;c bất đồng bộ một c&aacute;ch tuần tự hơn , gi&uacute;p đoạn code nh&igrave;n qua tưởng như đồng bộ nhưng thực ra lại l&agrave; chạy bất đồng bộ, gi&uacute;p ch&uacute;ng ta dễ h&igrave;nh dung hơn.</span></h3>

<p><strong>3.2.1 Async</strong></p>

<p>Để định nghĩa một h&agrave;m bất đồng bộ với async, ta cần khai b&aacute;o từ kh&oacute;a async ngay trước từ kh&oacute;a định nghĩa h&agrave;m.</p>

<p>Regular function:</p>

<pre>
<code>async function getUser() {
    return ...
}
</code></pre>

<p>Function expression:</p>

<pre>
<code>getUser = async function() {
    return ...
}
</code></pre>

<p>Kết hợp với c&uacute; ph&aacute;p arrow function của ES6</p>

<pre>
<code>getUser = async () =&gt; { ... }
</code></pre>

<p>Gi&aacute; trị trả về của&nbsp;<em>AsyncFunction</em>&nbsp;sẽ lu&ocirc;n l&agrave; một *Promise * mặc cho bạn c&oacute; gọi&nbsp;<em>await</em>&nbsp;hay kh&ocirc;ng, nếu trong code kh&ocirc;ng trả về&nbsp;<em>Promise</em>&nbsp;n&agrave;o th&igrave; sẽ c&oacute; một promise mới được resolve với gi&aacute; trị l&uacute;c đầu (nếu kh&ocirc;ng c&oacute; gi&aacute; trị n&agrave;o trong return kết quả trả về sẽ l&agrave; undefine).&nbsp;<em>Promise</em>&nbsp;n&agrave;y sẽ ở trạng th&aacute;i th&agrave;nh c&ocirc;ng với kết quả được trả về qua từ kh&oacute;a return của h&agrave;m async, hoặc ở trạng th&aacute;i thất bại với kết quả được đẩy qua từ kh&oacute;a throw trong h&agrave;m async.</p>

<p><strong>3.1.2 Await</strong></p>

<p>Về cơ bản th&igrave;&nbsp;<em>await</em>&nbsp;gi&uacute;p cho c&uacute; ph&aacute;p tr&ocirc;ng dễ hiểu hơn, thay th&igrave; phải d&ugrave;ng&nbsp;<em>then()</em>&nbsp;nối tiếp nhau th&igrave; chỉ cần đặt await trước mỗi h&agrave;m m&agrave; ch&uacute;ng ta muốn đợi kết quả của thao t&aacute;c bất đồng bộ. Chỉ d&ugrave;ng được&nbsp;<em>await</em>&nbsp;trong h&agrave;m n&agrave;o c&oacute; async đứng ph&iacute;a trước.</p>
', 1, 4, CAST(N'2021-12-23T15:41:26.340' AS DateTime))
SET IDENTITY_INSERT [dbo].[Posts] OFF
GO
SET IDENTITY_INSERT [dbo].[Users] ON 

INSERT [dbo].[Users] ([id_user], [password], [fullname], [email], [status]) VALUES (1, N'a916938188dc916c35fba826dd78633b', N'Người dùng ', N'nguoidung@gmail.com', 1)
INSERT [dbo].[Users] ([id_user], [password], [fullname], [email], [status]) VALUES (3, N'25f9e794323b453885f5181f1b624db', N'Lê Văn C', N'levanc@gmail.com', 1)
INSERT [dbo].[Users] ([id_user], [password], [fullname], [email], [status]) VALUES (4, N'25f9e794323b453885f5181f1b624db', N'Văn Huy', N'nguyenvanhuy@gmail.com', 1)
INSERT [dbo].[Users] ([id_user], [password], [fullname], [email], [status]) VALUES (5, N'25f9e794323b453885f5181f1b624db', N'Nguyễn Minh A', N'nguyenminha@gmail.com', 0)
SET IDENTITY_INSERT [dbo].[Users] OFF
GO
/****** Object:  Index [IX_id_post]    Script Date: 12/23/2021 4:12:37 PM ******/
CREATE NONCLUSTERED INDEX [IX_id_post] ON [dbo].[Comments]
(
	[id_post] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_id_user]    Script Date: 12/23/2021 4:12:37 PM ******/
CREATE NONCLUSTERED INDEX [IX_id_user] ON [dbo].[Comments]
(
	[id_user] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_id_user]    Script Date: 12/23/2021 4:12:37 PM ******/
CREATE NONCLUSTERED INDEX [IX_id_user] ON [dbo].[Posts]
(
	[id_user] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Comments]  WITH CHECK ADD  CONSTRAINT [FK_dbo.Comments_dbo.Posts_id_post] FOREIGN KEY([id_post])
REFERENCES [dbo].[Posts] ([id_post])
GO
ALTER TABLE [dbo].[Comments] CHECK CONSTRAINT [FK_dbo.Comments_dbo.Posts_id_post]
GO
ALTER TABLE [dbo].[Comments]  WITH CHECK ADD  CONSTRAINT [FK_dbo.Comments_dbo.Users_id_user] FOREIGN KEY([id_user])
REFERENCES [dbo].[Users] ([id_user])
GO
ALTER TABLE [dbo].[Comments] CHECK CONSTRAINT [FK_dbo.Comments_dbo.Users_id_user]
GO
ALTER TABLE [dbo].[Posts]  WITH CHECK ADD  CONSTRAINT [FK_dbo.Posts_dbo.Users_id_user] FOREIGN KEY([id_user])
REFERENCES [dbo].[Users] ([id_user])
GO
ALTER TABLE [dbo].[Posts] CHECK CONSTRAINT [FK_dbo.Posts_dbo.Users_id_user]
GO
USE [master]
GO
ALTER DATABASE [DBForumCoder] SET  READ_WRITE 
GO
