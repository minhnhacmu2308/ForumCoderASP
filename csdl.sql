USE [master]
GO
/****** Object:  Database [DBForumCoder]    Script Date: 11/21/2021 5:18:56 PM ******/
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
/****** Object:  Table [dbo].[__MigrationHistory]    Script Date: 11/21/2021 5:18:56 PM ******/
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
/****** Object:  Table [dbo].[Comments]    Script Date: 11/21/2021 5:18:56 PM ******/
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
/****** Object:  Table [dbo].[Courses]    Script Date: 11/21/2021 5:18:56 PM ******/
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
/****** Object:  Table [dbo].[Posts]    Script Date: 11/21/2021 5:18:56 PM ******/
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
/****** Object:  Table [dbo].[Users]    Script Date: 11/21/2021 5:18:56 PM ******/
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
SET IDENTITY_INSERT [dbo].[Courses] ON 

INSERT [dbo].[Courses] ([id_course], [name], [description], [image], [createdAt], [status]) VALUES (1, N'HTML, CSS từ Zero đến Hero', N'<p>Trong khóa này chúng ta sẽ cùng nhau xây dựng giao diện 2 trang web là The Band &amp; Shopee.</p><h3><strong>Bạn sẽ học được gì</strong></h3><ul><li>Biết cách xây dựng giao diện web với HTML, CSS</li><li>Biết cách phân tích giao diện website</li><li>Biết cách đặt tên class CSS theo chuẩn BEM</li><li>Biết cách làm giao diện web responsive</li><li>Làm chủ Flexbox khi dựng bố cục website</li><li>Sở hữu 2 giao diện web khi học xong khóa học</li><li>Biết cách tự tạo động lực cho bản thân</li><li>Biết cách tự học những kiến thức mới</li></ul><h3><strong>Nội dung khóa học</strong></h3><ul><li>13 phần</li><li>•</li><li>113 bài học</li><li>•</li><li>Thời lượng 27 giờ 21 phút</li></ul><p><strong>Mở rộng tất cả</strong></p><p>&nbsp;</p><p><strong>1. Giới thiệu2 bài học</strong></p><p><strong>2. Làm quen với công cụ2 bài học</strong></p><p><strong>3. Làm quen với HTML5 bài học</strong></p><p><strong>4. Làm quen với CSS9 bài học</strong></p><p><strong>5. Đệm, viền và khoảng lề4 bài học</strong></p><p><strong>6. Thuộc tính tạo nền6 bài học</strong></p><p><strong>7. Thuộc tính vị trí4 bài học</strong></p><p><strong>8. Xây dựng web The band19 bài học</strong></p><p><strong>9. Responsive web The band11 bài học</strong></p><p><strong>10. Dựng bố cục web với Flexbox4 bài học</strong></p><p><strong>11. Quy ước đặt tên class BEM4 bài học</strong></p><p><strong>12. Xây dựng web Shopee42 bài học</strong></p><p><strong>13. Tự bay với đôi cánh của bạn1 bài học</strong></p><h3><strong>Yêu cầu</strong></h3><ul><li>Máy vi tính kết nối internet (Windows, Ubuntu hoặc MacOS)</li><li>Ý thức tự học cao, trách nhiệm cao, kiên trì bền bỉ không ngại cái khó</li><li>Không được nóng vội, bình tĩnh học, làm bài tập sau mỗi bài học</li><li>Khi học nếu có khúc mắc hãy tham gia hỏi/đáp tại group FB: Học lập trình web (fullstack.edu.vn)</li><li>Bạn không cần biết gì hơn nữa, trong khóa học tôi sẽ chỉ cho bạn những gì bạn cần phải biết</li></ul>', N'6377285453346706282.png', CAST(N'2021-11-18T17:48:53.470' AS DateTime), 1)
INSERT [dbo].[Courses] ([id_course], [name], [description], [image], [createdAt], [status]) VALUES (2, N'JavaScript Cơ Bản', N'<p>Học Javascript cơ bản phù hợp cho người chưa từng học lập trình. Với hơn 100 bài học và có bài tập thực hành sau mỗi bài học.</p><h3><strong>Bạn sẽ học được gì</strong></h3><ul><li>Hiểu chi tiết về các khái niệm cơ bản trong JS</li><li>Xây dựng được website đầu tiên kết hợp với JS</li><li>Tự tin khi phỏng vấn với kiến thức vững chắc</li><li>Có nền tảng để học các thư viện và framework JS</li><li>Nắm chắc các tính năng trong phiên bản ES6</li><li>Thành thạo DOM APIs để tương tác với trang web</li><li>Ghi nhớ các khái niệm nhờ bài tập trắc nghiệm</li><li>Nâng cao tư duy với các bài kiểm tra với testcases</li></ul><h3><strong>Nội dung khóa học</strong></h3><ul><li>9 phần</li><li>•</li><li>120 bài học</li><li>•</li><li>Thời lượng 24 giờ 05 phút</li></ul><p><strong>Thu nhỏ tất cả</strong></p><p>&nbsp;</p><p><strong>1. Giới thiệu2 bài học</strong></p><p>&nbsp;</p><p><strong>2. Làm quen23 bài học</strong></p><p>&nbsp;</p><p><strong>3. Kiến thức cốt lõi (phần 1)44 bài học</strong></p><p>&nbsp;</p><p>&nbsp;</p><p><strong>4. HTML DOM17 bài học</strong></p><p>&nbsp;</p><p><strong>5. Kiến thức cốt lõi (phần 2)11 bài học</strong></p><p>&nbsp;</p><p><strong>6. ECMAScript 6+12 bài học</strong></p><p>&nbsp;</p><p><strong>7. Các bài thực hành2 bài học</strong></p><p>&nbsp;</p><p><strong>8. Kiến thức bổ sung2 bài học</strong></p><p>&nbsp;</p><p><strong>9. Nên học thêm (thực hành)7 bài học</strong></p><p>&nbsp;</p><h3><strong>Yêu cầu</strong></h3><ul><li>Máy vi tính kết nối internet (Windows, Ubuntu hoặc MacOS)</li><li>Ý thức tự học cao, trách nhiệm cao, kiên trì bền bỉ không ngại cái khó</li><li>Không được nóng vội, bình tĩnh học, làm bài tập sau mỗi bài học</li><li>Khi học nếu có khúc mắc hãy tham gia hỏi/đáp tại group FB: Học lập trình web (fullstack.edu.vn)</li><li>Bạn không cần biết gì hơn nữa, trong khóa học tôi sẽ chỉ cho bạn những gì bạn cần phải biết</li></ul>', N'6377285477084274071.png', CAST(N'2021-11-18T17:52:50.843' AS DateTime), 1)
INSERT [dbo].[Courses] ([id_course], [name], [description], [image], [createdAt], [status]) VALUES (3, N'Responsive Với Grid System', N'<p>Trong khóa này chúng ta sẽ học về cách xây dựng giao diện web responsive với Grid System, tương tự Bootstrap 4.</p><h3><strong>Bạn sẽ học được gì</strong></h3><ul><li>Biết cách xây dựng website Responsive</li><li>Hiểu được tư tưởng thiết kế với Grid system</li><li>Tự tay xây dựng được thư viện CSS Grid</li><li>Tự hiểu được Grid layout trong bootstrap</li></ul><h3><strong>Nội dung khóa học</strong></h3><ul><li>7 phần</li><li>•</li><li>34 bài học</li><li>•</li><li>Thời lượng 06 giờ 31 phút</li></ul><p><strong>Mở rộng tất cả</strong></p><p>&nbsp;</p><p><strong>1. Giới thiệu2 bài học</strong></p><p>&nbsp;</p><p><strong>2. Cài đặt công cụ1 bài học</strong></p><p>&nbsp;</p><p><strong>3. Khái niệm cốt lõi4 bài học</strong></p><p>&nbsp;</p><p><strong>4. Thực hành nhỏ2 bài học</strong></p><p>&nbsp;</p><p><strong>5. Hệ thống lưới8 bài học</strong></p><p>&nbsp;</p><p><strong>6. Áp dụng vào thực tế5 bài học</strong></p><p>&nbsp;</p><p><strong>7. Responsive web Shopee12 bài học</strong></p><p>&nbsp;</p><h3><strong>Yêu cầu</strong></h3>', N'6377285482093100543.png', CAST(N'2021-11-18T17:53:40.933' AS DateTime), 1)
INSERT [dbo].[Courses] ([id_course], [name], [description], [image], [createdAt], [status]) VALUES (4, N'HTML, CSS Tips & Tricks', N'<h2><strong>HTML, CSS Tips &amp; Tricks</strong></h2><p>Tutorials về HTML, CSS, UI, UX sẽ được tổng hợp tại khóa học này, các video có nội dung ngắn gọn, súc tích giúp học viên có thể ứng dụng ngay vào thực tế</p><h3><strong>Bạn sẽ học được gì</strong></h3><ul><li>Cách làm đúng đắn trong thực tế (best practice)</li><li>Các thủ thuật, kinh nghiệm xây dựng UI, UX</li><li>Các kỹ năng nâng cao khi xây dựng giao diện web</li><li>Kinh nghiệm, thủ thuật tối ưu ứng dụng Front-end</li></ul><h3><strong>Nội dung khóa học</strong></h3><ul><li>1 phần</li><li>•</li><li>7 bài học</li><li>•</li><li>Thời lượng 02 giờ 09 phút</li></ul><p><strong>Mở rộng tất cả</strong></p><p>&nbsp;</p><p><strong>1. Tutorials7 bài học</strong></p><p>&nbsp;</p><h3><strong>Yêu cầu</strong></h3>', N'6377285486016160885.png', CAST(N'2021-11-18T17:54:20.163' AS DateTime), 1)
INSERT [dbo].[Courses] ([id_course], [name], [description], [image], [createdAt], [status]) VALUES (5, N'Node & ExpressJS', N'<p>Học Back-end với Node &amp; ExpressJS framework, hiểu các khái niệm khi làm Back-end và xây dựng RESTful API cho trang web.</p><h3><strong>Bạn sẽ học được gì</strong></h3><ul><li>Nắm chắc lý thuyết chung trong việc xây dựng web</li><li>Biết cách làm việc với Mongoose, MongoDB trong NodeJS</li><li>Xây dựng web với Express bằng kiến thức thực tế</li><li>Biết cách xây dựng API theo chuẩn RESTful API</li><li>Nắm chắc lý thuyết về API và RESTful API</li><li>Được chia sẻ lại kinh nghiệm làm việc thực tế</li><li>Nắm chắc khái niệm về giao thức HTTP</li><li>Hiểu rõ tư tưởng và cách hoạt động của mô hình MVC</li><li>Học được cách tổ chức code trong thực tế</li><li>Biết cách deploy (triển khai) website lên internet</li></ul><h3><strong>Nội dung khóa học</strong></h3><ul><li>3 phần</li><li>•</li><li>36 bài học</li><li>•</li><li>Thời lượng 12 giờ 08 phút</li></ul><p><strong>Mở rộng tất cả</strong></p><p>&nbsp;</p><p><strong>1. Bắt đầu8 bài học</strong></p><p>&nbsp;</p><p><strong>2. Kiến thức cốt lõi8 bài học</strong></p><p>&nbsp;</p><p><strong>3. Xây dựng website20 bài học</strong></p><p>&nbsp;</p><h3><strong>Yêu cầu</strong></h3><ul><li>Có kiến thức cơ bản về HTML, CSS và Javascript</li><li>Nắm chắc các tính năng trong Javascript ES6</li><li>Có hiểu biết về lập trình bất đồng bộ trong Javascript</li><li>Sở hữu máy tính kết nối internet HDH Windows, Ubuntu hoặc MacOS</li><li>Ý thức cao, trách nhiệm cao trong việc tự học. Thực hành lại sau mỗi bài học</li><li>Khi học nếu có khúc mắc hãy tham gia hỏi/đáp tại group FB: Học lập trình web (fullstack.edu.vn)</li><li>Bạn không cần biết gì hơn nữa, trong khóa học tôi sẽ chỉ cho bạn những gì bạn cần phải biết</li></ul>', N'6377285489496971366.png', CAST(N'2021-11-18T17:54:55.070' AS DateTime), 1)
INSERT [dbo].[Courses] ([id_course], [name], [description], [image], [createdAt], [status]) VALUES (6, N'Kiến Thức Nhập Môn', N'<p>Để có cái nhìn tổng quan về ngành IT - Lập trình web các bạn nên xem các videos tại khóa này trước nhé.</p><h3><strong>Bạn sẽ học được gì</strong></h3><ul><li>Các kiến thức cơ bản, nền móng của ngành IT</li><li>Các mô hình, kiến trúc cơ bản khi triển khai ứng dụng</li><li>Các khái niệm, thuật ngữ cốt lõi khi triển khai ứng dụng</li><li>Hiểu hơn về cách internet và máy vi tính hoạt động</li></ul><h3><strong>Nội dung khóa học</strong></h3><ul><li>4 phần</li><li>•</li><li>8 bài học</li><li>•</li><li>Thời lượng 02 giờ 15 phút</li></ul><p><strong>Mở rộng tất cả</strong></p><p>&nbsp;</p><p><strong>1. Khái niệm kỹ thuật cần biết2 bài học</strong></p><p>&nbsp;</p><p><strong>2. Phương pháp học tập2 bài học</strong></p><p>&nbsp;</p><p><strong>3. Tư duy phát triển1 bài học</strong></p><p>&nbsp;</p><p><strong>4. Tham khảo thêm3 bài học</strong></p><p>&nbsp;</p><h3><strong>Yêu cầu</strong></h3>', N'6377285492493637667.png', CAST(N'2021-11-18T17:55:24.940' AS DateTime), 1)
INSERT [dbo].[Courses] ([id_course], [name], [description], [image], [createdAt], [status]) VALUES (7, N'JavaScript Nâng Cao', N'<p>Hiểu sâu hơn về cách Javascript hoạt động, tìm hiểu về IIFE, closure, reference types, this keyword, bind, call, apply, prototype, ...</p><h3><strong>Bạn sẽ học được gì</strong></h3><ul><li>Được học kiến thức miễn phí với nội dung chất lượng hơn mất phí</li><li>Các kiến thức nâng cao của Javascript giúp code trở nên tối ưu hơn</li><li>Hiểu được cách tư duy nâng cao của các lập trình viên có kinh nghiệm</li><li>Hiểu được các khái niệm khó như từ khóa this, phương thức bind, call, apply &amp; xử lý bất đồng bộ</li><li>Có nền tảng Javascript vững chắc để làm việc với mọi thư viện, framework viết bởi Javascript</li><li>Nâng cao cơ hội thành công khi phỏng vấn xin việc nhờ kiến thức chuyên môn vững chắc</li></ul><h3><strong>Nội dung khóa học</strong></h3><ul><li>2 phần</li><li>•</li><li>14 bài học</li><li>•</li><li>Thời lượng 06 giờ 27 phút</li></ul><p><strong>Mở rộng tất cả</strong></p><p>&nbsp;</p><p><strong>1. Nội dung khóa nâng cao12 bài học</strong></p><p>&nbsp;</p><p><strong>2. Các bài thực hành2 bài học</strong></p><p>&nbsp;</p><h3><strong>Yêu cầu</strong></h3><ul><li>Hoàn thành khóa học Javascript cơ bản tại F8 hoặc đã nắm chắc Javascript cơ bản</li><li>Tuy duy mở để dễ dàng tiếp nhận các tư tưởng mới được chia sẻ trong các bài học</li><li>Máy vi tính kết nối internet (Windows, Ubuntu hoặc MacOS)</li><li>Ý thức cao, trách nhiệm cao trong việc tự học. Thực hành lại sau mỗi bài học</li><li>Khi học nếu có khúc mắc hãy tham gia hỏi/đáp tại group FB: Học lập trình web (fullstack.edu.vn)</li><li>Bạn không cần biết gì hơn nữa, trong khóa học tôi sẽ chỉ cho bạn những gì bạn cần phải biết</li></ul>', N'6377285496939788849.png', CAST(N'2021-11-18T17:56:09.400' AS DateTime), 1)
SET IDENTITY_INSERT [dbo].[Courses] OFF
GO
SET IDENTITY_INSERT [dbo].[Posts] ON 

INSERT [dbo].[Posts] ([id_post], [title], [description], [status], [id_user], [createdAt]) VALUES (2, N'abc', N'Khóa học ReactJS từ cơ bản tới nâng cao, kết quả của khóa học này là bạn có thể làm hầu hết các dự án thường gặp với ReactJS. Cuối khóa học này bạn sẽ sở hữu một dự án giống Tiktok.com, bạn có thể tự tin đi xin việc khi nắm chắc các kiến thức được chia sẻ trong khóa học này.', 1, 1, CAST(N'2021-11-20T00:00:00.000' AS DateTime))
INSERT [dbo].[Posts] ([id_post], [title], [description], [status], [id_user], [createdAt]) VALUES (3, N'Cho e hỏi cách code đoạn php a', N'<p><em><strong>Xin ch&agrave;o mọi ngguowif hihi</strong></em></p>
', 1, 3, CAST(N'2021-11-21T15:06:13.987' AS DateTime))
SET IDENTITY_INSERT [dbo].[Posts] OFF
GO
SET IDENTITY_INSERT [dbo].[Users] ON 

INSERT [dbo].[Users] ([id_user], [password], [fullname], [email], [status]) VALUES (1, N'a916938188dc916c35fba826dd78633b', N'Người dùng ', N'nguoidung@gmail.com', 1)
INSERT [dbo].[Users] ([id_user], [password], [fullname], [email], [status]) VALUES (3, N'156d64253c9a871dd9cbc43da8494b5', N'Lê Văn C', N'levanc@gmail.com', 1)
SET IDENTITY_INSERT [dbo].[Users] OFF
GO
/****** Object:  Index [IX_id_post]    Script Date: 11/21/2021 5:18:56 PM ******/
CREATE NONCLUSTERED INDEX [IX_id_post] ON [dbo].[Comments]
(
	[id_post] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_id_user]    Script Date: 11/21/2021 5:18:56 PM ******/
CREATE NONCLUSTERED INDEX [IX_id_user] ON [dbo].[Comments]
(
	[id_user] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_id_user]    Script Date: 11/21/2021 5:18:56 PM ******/
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
