USE [master]
GO
/****** Object:  Database [WorksTokV2]    Script Date: 9/8/2022 11:55:07 PM ******/
CREATE DATABASE [WorksTokV2]
GO
USE [WorksTokV2]
GO
/****** Object:  Table [dbo].[Client]    Script Date: 9/8/2022 11:55:07 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Client](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](100) NOT NULL,
	[ChatId] [bigint] NOT NULL,
 CONSTRAINT [pk_Client] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Company]    Script Date: 9/8/2022 11:55:07 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Company](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](100) NOT NULL,
	[ITN] [varchar](50) NOT NULL,
	[Address] [varchar](200) NOT NULL,
	[PhoneNumber] [varchar](20) NOT NULL,
	[CompanyCommissionRate] [float] NOT NULL,
	[SystemCommissionRate] [float] NOT NULL,
 CONSTRAINT [pk_Company] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Employee]    Script Date: 9/8/2022 11:55:07 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Employee](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[FirstName] [varchar](50) NOT NULL,
	[MiddleName] [varchar](50) NULL,
	[LastName] [varchar](50) NOT NULL,
	[DateOfBirth] [varchar](20) NOT NULL,
	[PhoneNumber] [varchar](20) NOT NULL,
	[Comment] [varchar](max) NULL,
	[CompanyId] [int] NOT NULL,
 CONSTRAINT [pk_Employee] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[HolidayDays]    Script Date: 9/8/2022 11:55:07 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[HolidayDays](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[CompanyId] [int] NOT NULL,
	[Name] [varchar](50) NOT NULL,
	[StartHolidayDate] [date] NOT NULL,
	[EndHolidayDate] [date] NOT NULL,
	[EveryYear] [smallint] NOT NULL,
	[AdditivePercentage] [float] NOT NULL,
	[Comment] [varchar](max) NULL,
 CONSTRAINT [pk_HolidayDays] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Profession]    Script Date: 9/8/2022 11:55:07 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Profession](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](100) NOT NULL,
	[Description] [varchar](max) NULL,
 CONSTRAINT [pk_Profession] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ProfessionOfEmployee]    Script Date: 9/8/2022 11:55:07 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ProfessionOfEmployee](
	[EmployeeId] [int] NOT NULL,
	[ProfessionId] [int] NOT NULL,
 CONSTRAINT [pk_ProfessionOfEmployee] PRIMARY KEY CLUSTERED 
(
	[EmployeeId] ASC,
	[ProfessionId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Schedule]    Script Date: 9/8/2022 11:55:07 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Schedule](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[EmployeeId] [int] NOT NULL,
	[DayOfWeek] [int] NOT NULL,
	[StartWorkTime] [time](7) NOT NULL,
	[FinishWorkTime] [time](7) NOT NULL,
 CONSTRAINT [pk_Schedule] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[VacationDays]    Script Date: 9/8/2022 11:55:07 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[VacationDays](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[EmployeeId] [int] NOT NULL,
	[StartVacationDate] [date] NOT NULL,
	[EndVacationDate] [date] NULL,
	[Comment] [varchar](max) NULL,
 CONSTRAINT [pk_VacationDays] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Withdrawals]    Script Date: 9/8/2022 11:55:07 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Withdrawals](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[EmployeeId] [int] NOT NULL,
	[CreateDateTime] [datetime2](7) NOT NULL,
	[Amount] [decimal](10, 2) NOT NULL,
	[FinishedDateTime] [datetime2](7) NULL,
 CONSTRAINT [pk_Withdrawals] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[WorkRequest]    Script Date: 9/8/2022 11:55:07 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[WorkRequest](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[ClientId] [int] NOT NULL,
	[CreateTime] [datetime2](7) NOT NULL,
	[EmployeeId] [int] NOT NULL,
	[FullfilledDate] [datetime2](7) NOT NULL,
	[Address] [varchar](200) NOT NULL,
	[TaskDescription] [varchar](300) NULL,
	[IsAccepted] [bit] NULL,
	[BeginWorkTime] [datetime2](7) NULL,
	[CompleteWorkTime] [datetime2](7) NULL,
	[WorkTypeId] [int] NOT NULL,
	[WithdrawalsId] [int] NULL,
	[UserAssessment] [int] NULL,
 CONSTRAINT [pk_WorkRequest] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[WorkType]    Script Date: 9/8/2022 11:55:07 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[WorkType](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](100) NOT NULL,
	[Price] [int] NOT NULL,
	[Description] [varchar](max) NULL,
 CONSTRAINT [pk_WorkType] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[WorkTypeOfEmployee]    Script Date: 9/8/2022 11:55:07 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[WorkTypeOfEmployee](
	[WorkTypeId] [int] NOT NULL,
	[EmployeeId] [int] NOT NULL,
 CONSTRAINT [pk_WorkTypeOfEmployee] PRIMARY KEY CLUSTERED 
(
	[WorkTypeId] ASC,
	[EmployeeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[WorkTypeOfProfession]    Script Date: 9/8/2022 11:55:07 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[WorkTypeOfProfession](
	[WorkTypeId] [int] NOT NULL,
	[ProfessionId] [int] NOT NULL,
 CONSTRAINT [pk_WorkTypeOfProfession] PRIMARY KEY CLUSTERED 
(
	[WorkTypeId] ASC,
	[ProfessionId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Client] ON 
GO
INSERT [dbo].[Client] ([Id], [Name], [ChatId]) VALUES (1, N'Dan Wong', 81039)
GO
INSERT [dbo].[Client] ([Id], [Name], [ChatId]) VALUES (2, N'Grant May', 88433)
GO
INSERT [dbo].[Client] ([Id], [Name], [ChatId]) VALUES (3, N'Ron Harvey', 20280)
GO
INSERT [dbo].[Client] ([Id], [Name], [ChatId]) VALUES (4, N'Ruby Murray', 88029)
GO
INSERT [dbo].[Client] ([Id], [Name], [ChatId]) VALUES (5, N'Sue Turner', 67014)
GO
INSERT [dbo].[Client] ([Id], [Name], [ChatId]) VALUES (6, N'Ernest Floyd', 41242)
GO
INSERT [dbo].[Client] ([Id], [Name], [ChatId]) VALUES (7, N'Donna Graham', 88343)
GO
INSERT [dbo].[Client] ([Id], [Name], [ChatId]) VALUES (8, N'Salvador Harrison', 29845)
GO
INSERT [dbo].[Client] ([Id], [Name], [ChatId]) VALUES (9, N'Tami Alvarado', 45669)
GO
INSERT [dbo].[Client] ([Id], [Name], [ChatId]) VALUES (10, N'Krista Jefferson', 89467)
GO
INSERT [dbo].[Client] ([Id], [Name], [ChatId]) VALUES (11, N'Cristina Douglas', 85188)
GO
INSERT [dbo].[Client] ([Id], [Name], [ChatId]) VALUES (12, N'Della Sanders', 18893)
GO
INSERT [dbo].[Client] ([Id], [Name], [ChatId]) VALUES (13, N'Henry Greer', 53414)
GO
INSERT [dbo].[Client] ([Id], [Name], [ChatId]) VALUES (14, N'Jay Fleming', 22473)
GO
INSERT [dbo].[Client] ([Id], [Name], [ChatId]) VALUES (15, N'Gloria Ingram', 31605)
GO
INSERT [dbo].[Client] ([Id], [Name], [ChatId]) VALUES (16, N'Andy Chapman', 22006)
GO
INSERT [dbo].[Client] ([Id], [Name], [ChatId]) VALUES (17, N'Laurie Morris', 35186)
GO
INSERT [dbo].[Client] ([Id], [Name], [ChatId]) VALUES (18, N'Caleb Owens', 47447)
GO
INSERT [dbo].[Client] ([Id], [Name], [ChatId]) VALUES (19, N'Terry Strickland', 57627)
GO
INSERT [dbo].[Client] ([Id], [Name], [ChatId]) VALUES (20, N'Benny Collier', 52721)
GO
INSERT [dbo].[Client] ([Id], [Name], [ChatId]) VALUES (21, N'Essie Fields', 47849)
GO
INSERT [dbo].[Client] ([Id], [Name], [ChatId]) VALUES (22, N'Juana Hamilton', 13579)
GO
INSERT [dbo].[Client] ([Id], [Name], [ChatId]) VALUES (23, N'Wm Thompson', 53650)
GO
INSERT [dbo].[Client] ([Id], [Name], [ChatId]) VALUES (24, N'Pam Potter', 51684)
GO
INSERT [dbo].[Client] ([Id], [Name], [ChatId]) VALUES (25, N'Constance Poole', 42501)
GO
INSERT [dbo].[Client] ([Id], [Name], [ChatId]) VALUES (26, N'Doris Barber', 61977)
GO
INSERT [dbo].[Client] ([Id], [Name], [ChatId]) VALUES (27, N'Alexander Roy', 74348)
GO
INSERT [dbo].[Client] ([Id], [Name], [ChatId]) VALUES (28, N'Rose Jensen', 55693)
GO
INSERT [dbo].[Client] ([Id], [Name], [ChatId]) VALUES (29, N'Paul Padilla', 87176)
GO
INSERT [dbo].[Client] ([Id], [Name], [ChatId]) VALUES (30, N'Cecelia Martinez', 77246)
GO
INSERT [dbo].[Client] ([Id], [Name], [ChatId]) VALUES (31, N'Debbie Gross', 55424)
GO
INSERT [dbo].[Client] ([Id], [Name], [ChatId]) VALUES (32, N'Archie Watson', 30534)
GO
INSERT [dbo].[Client] ([Id], [Name], [ChatId]) VALUES (33, N'Viola Daniel', 98911)
GO
INSERT [dbo].[Client] ([Id], [Name], [ChatId]) VALUES (34, N'Jordan Cummings', 16140)
GO
INSERT [dbo].[Client] ([Id], [Name], [ChatId]) VALUES (35, N'Rachel Smith', 27738)
GO
INSERT [dbo].[Client] ([Id], [Name], [ChatId]) VALUES (36, N'Devin Ford', 40469)
GO
INSERT [dbo].[Client] ([Id], [Name], [ChatId]) VALUES (37, N'Delia Jacobs', 88176)
GO
INSERT [dbo].[Client] ([Id], [Name], [ChatId]) VALUES (38, N'Garrett Bates', 27111)
GO
INSERT [dbo].[Client] ([Id], [Name], [ChatId]) VALUES (39, N'Norma Ortiz', 39401)
GO
INSERT [dbo].[Client] ([Id], [Name], [ChatId]) VALUES (40, N'Melinda Knight', 39010)
GO
INSERT [dbo].[Client] ([Id], [Name], [ChatId]) VALUES (41, N'Ricky Park', 19267)
GO
INSERT [dbo].[Client] ([Id], [Name], [ChatId]) VALUES (42, N'Darrel Kelly', 42192)
GO
INSERT [dbo].[Client] ([Id], [Name], [ChatId]) VALUES (43, N'Byron Saunders', 74078)
GO
INSERT [dbo].[Client] ([Id], [Name], [ChatId]) VALUES (44, N'Mario Hardy', 71430)
GO
INSERT [dbo].[Client] ([Id], [Name], [ChatId]) VALUES (45, N'Frank Fowler', 37410)
GO
INSERT [dbo].[Client] ([Id], [Name], [ChatId]) VALUES (46, N'Alma Burns', 69227)
GO
INSERT [dbo].[Client] ([Id], [Name], [ChatId]) VALUES (47, N'Bridget Bowen', 62910)
GO
INSERT [dbo].[Client] ([Id], [Name], [ChatId]) VALUES (48, N'Oscar Wade', 49363)
GO
INSERT [dbo].[Client] ([Id], [Name], [ChatId]) VALUES (49, N'Warren Allen', 77053)
GO
INSERT [dbo].[Client] ([Id], [Name], [ChatId]) VALUES (50, N'Jean Green', 58140)
GO
INSERT [dbo].[Client] ([Id], [Name], [ChatId]) VALUES (51, N'Victor Brown', 68232)
GO
INSERT [dbo].[Client] ([Id], [Name], [ChatId]) VALUES (52, N'Kellie Welch', 61803)
GO
INSERT [dbo].[Client] ([Id], [Name], [ChatId]) VALUES (53, N'Kelley Moreno', 36099)
GO
INSERT [dbo].[Client] ([Id], [Name], [ChatId]) VALUES (54, N'Anne Collins', 59676)
GO
INSERT [dbo].[Client] ([Id], [Name], [ChatId]) VALUES (55, N'Diane Andrews', 59565)
GO
INSERT [dbo].[Client] ([Id], [Name], [ChatId]) VALUES (56, N'Rene Barton', 44822)
GO
INSERT [dbo].[Client] ([Id], [Name], [ChatId]) VALUES (57, N'Fred Hansen', 37697)
GO
INSERT [dbo].[Client] ([Id], [Name], [ChatId]) VALUES (58, N'Dean Joseph', 58853)
GO
INSERT [dbo].[Client] ([Id], [Name], [ChatId]) VALUES (59, N'Mike Higgins', 16243)
GO
INSERT [dbo].[Client] ([Id], [Name], [ChatId]) VALUES (60, N'Gina Foster', 94410)
GO
SET IDENTITY_INSERT [dbo].[Client] OFF
GO
SET IDENTITY_INSERT [dbo].[Company] ON 
GO
INSERT [dbo].[Company] ([Id], [Name], [ITN], [Address], [PhoneNumber], [CompanyCommissionRate], [SystemCommissionRate]) VALUES (1, N'OOO BuildStroy', N'45646 4564564564', N'Russia, Kazan, Domovoy 5, office 6', N'8 980 256 22 53', 0.15, 0.025)
GO
INSERT [dbo].[Company] ([Id], [Name], [ITN], [Address], [PhoneNumber], [CompanyCommissionRate], [SystemCommissionRate]) VALUES (2, N'OAO FreshBuild', N'32445 4564567897', N'Russia, Perm, Kirova 13, 198', N'8 900 900 22 00', 0.125, 0.025)
GO
INSERT [dbo].[Company] ([Id], [Name], [ITN], [Address], [PhoneNumber], [CompanyCommissionRate], [SystemCommissionRate]) VALUES (3, N'OOO Samorez', N'95645 4564545645', N'Russia, Moscow, Lenina 287, 1', N'8 999 123 12 12', 0.8, 0.05)
GO
SET IDENTITY_INSERT [dbo].[Company] OFF
GO
SET IDENTITY_INSERT [dbo].[Employee] ON 
GO
INSERT [dbo].[Employee] ([Id], [FirstName], [MiddleName], [LastName], [DateOfBirth], [PhoneNumber], [Comment], [CompanyId]) VALUES (1, N'Daniel', N'', N'Giraffe', N'1956-06-16', N'75110361216', N'', 1)
GO
INSERT [dbo].[Employee] ([Id], [FirstName], [MiddleName], [LastName], [DateOfBirth], [PhoneNumber], [Comment], [CompanyId]) VALUES (2, N'Katherine', N'', N'Rhinoceros', N'1956-12-10', N'76158629923', N'', 2)
GO
INSERT [dbo].[Employee] ([Id], [FirstName], [MiddleName], [LastName], [DateOfBirth], [PhoneNumber], [Comment], [CompanyId]) VALUES (3, N'Jake', N'', N'Chameleon', N'1957-05-25', N'70977207895', N'', 3)
GO
INSERT [dbo].[Employee] ([Id], [FirstName], [MiddleName], [LastName], [DateOfBirth], [PhoneNumber], [Comment], [CompanyId]) VALUES (4, N'Catherine', N'', N'Kangaroo', N'1957-11-17', N'75243924892', N'', 3)
GO
INSERT [dbo].[Employee] ([Id], [FirstName], [MiddleName], [LastName], [DateOfBirth], [PhoneNumber], [Comment], [CompanyId]) VALUES (5, N'Wayne', N'', N'Gorilla', N'1959-08-12', N'76199132005', N'', 1)
GO
INSERT [dbo].[Employee] ([Id], [FirstName], [MiddleName], [LastName], [DateOfBirth], [PhoneNumber], [Comment], [CompanyId]) VALUES (6, N'Shawn', N'', N'Ostrich', N'1959-10-22', N'79395051089', N'', 2)
GO
INSERT [dbo].[Employee] ([Id], [FirstName], [MiddleName], [LastName], [DateOfBirth], [PhoneNumber], [Comment], [CompanyId]) VALUES (7, N'Nancy', N'', N'Rabbit', N'1960-10-01', N'74678418143', N'', 3)
GO
INSERT [dbo].[Employee] ([Id], [FirstName], [MiddleName], [LastName], [DateOfBirth], [PhoneNumber], [Comment], [CompanyId]) VALUES (8, N'Susan', N'', N'Monkey', N'1961-01-01', N'71470922841', N'', 3)
GO
INSERT [dbo].[Employee] ([Id], [FirstName], [MiddleName], [LastName], [DateOfBirth], [PhoneNumber], [Comment], [CompanyId]) VALUES (9, N'Philip', N'', N'Beaver', N'1961-11-18', N'78542417465', N'', 3)
GO
INSERT [dbo].[Employee] ([Id], [FirstName], [MiddleName], [LastName], [DateOfBirth], [PhoneNumber], [Comment], [CompanyId]) VALUES (10, N'Roger', N'', N'Hamster', N'1962-12-04', N'77260799072', N'', 1)
GO
INSERT [dbo].[Employee] ([Id], [FirstName], [MiddleName], [LastName], [DateOfBirth], [PhoneNumber], [Comment], [CompanyId]) VALUES (11, N'Sharon', N'', N'Raccoon', N'1964-06-19', N'73382284222', N'', 2)
GO
INSERT [dbo].[Employee] ([Id], [FirstName], [MiddleName], [LastName], [DateOfBirth], [PhoneNumber], [Comment], [CompanyId]) VALUES (12, N'Shirley', N'White', N'Bear', N'1965-10-03', N'74861193266', N'', 3)
GO
INSERT [dbo].[Employee] ([Id], [FirstName], [MiddleName], [LastName], [DateOfBirth], [PhoneNumber], [Comment], [CompanyId]) VALUES (13, N'Anna', N'', N'Deer', N'1966-06-25', N'77580952248', N'', 1)
GO
INSERT [dbo].[Employee] ([Id], [FirstName], [MiddleName], [LastName], [DateOfBirth], [PhoneNumber], [Comment], [CompanyId]) VALUES (14, N'Willie', N'', N'Hedgehog', N'1966-07-14', N'79950417908', N'', 1)
GO
INSERT [dbo].[Employee] ([Id], [FirstName], [MiddleName], [LastName], [DateOfBirth], [PhoneNumber], [Comment], [CompanyId]) VALUES (15, N'Emily', N'', N'Boar', N'1966-09-25', N'74465226533', N'', 2)
GO
INSERT [dbo].[Employee] ([Id], [FirstName], [MiddleName], [LastName], [DateOfBirth], [PhoneNumber], [Comment], [CompanyId]) VALUES (16, N'Kyle', N'', N'Meerkat', N'1966-10-19', N'74897982936', N'', 2)
GO
INSERT [dbo].[Employee] ([Id], [FirstName], [MiddleName], [LastName], [DateOfBirth], [PhoneNumber], [Comment], [CompanyId]) VALUES (17, N'Rose', N'', N'Sloth', N'1969-12-26', N'73170387083', N'', 3)
GO
INSERT [dbo].[Employee] ([Id], [FirstName], [MiddleName], [LastName], [DateOfBirth], [PhoneNumber], [Comment], [CompanyId]) VALUES (18, N'Douglas', N'', N'Penguin', N'1970-05-26', N'79402689623', N'', 3)
GO
INSERT [dbo].[Employee] ([Id], [FirstName], [MiddleName], [LastName], [DateOfBirth], [PhoneNumber], [Comment], [CompanyId]) VALUES (19, N'Joan', N'', N'Parrot', N'1973-01-16', N'75403667554', N'', 2)
GO
INSERT [dbo].[Employee] ([Id], [FirstName], [MiddleName], [LastName], [DateOfBirth], [PhoneNumber], [Comment], [CompanyId]) VALUES (20, N'Steven', N'', N'Duck', N'1973-06-07', N'71005311421', N'', 2)
GO
INSERT [dbo].[Employee] ([Id], [FirstName], [MiddleName], [LastName], [DateOfBirth], [PhoneNumber], [Comment], [CompanyId]) VALUES (21, N'Dennis', N'', N'Goat', N'1973-06-09', N'77540450268', N'', 2)
GO
INSERT [dbo].[Employee] ([Id], [FirstName], [MiddleName], [LastName], [DateOfBirth], [PhoneNumber], [Comment], [CompanyId]) VALUES (22, N'Michelle', N'', N'Llama', N'1974-03-03', N'76171288250', N'', 3)
GO
INSERT [dbo].[Employee] ([Id], [FirstName], [MiddleName], [LastName], [DateOfBirth], [PhoneNumber], [Comment], [CompanyId]) VALUES (23, N'Donald', N'', N'Turtle', N'1974-06-18', N'77776403514', N'', 3)
GO
INSERT [dbo].[Employee] ([Id], [FirstName], [MiddleName], [LastName], [DateOfBirth], [PhoneNumber], [Comment], [CompanyId]) VALUES (24, N'Dylan', N'', N'Zebra', N'1974-10-09', N'79172162417', N'', 2)
GO
INSERT [dbo].[Employee] ([Id], [FirstName], [MiddleName], [LastName], [DateOfBirth], [PhoneNumber], [Comment], [CompanyId]) VALUES (25, N'Michael', N'', N'Lemur', N'1975-03-16', N'73841945149', N'', 3)
GO
INSERT [dbo].[Employee] ([Id], [FirstName], [MiddleName], [LastName], [DateOfBirth], [PhoneNumber], [Comment], [CompanyId]) VALUES (26, N'Joe', N'', N'Lion', N'1975-03-21', N'79766547300', N'', 3)
GO
INSERT [dbo].[Employee] ([Id], [FirstName], [MiddleName], [LastName], [DateOfBirth], [PhoneNumber], [Comment], [CompanyId]) VALUES (27, N'Evelyn', N'', N'Crocodile', N'1975-05-23', N'71244855314', N'', 3)
GO
INSERT [dbo].[Employee] ([Id], [FirstName], [MiddleName], [LastName], [DateOfBirth], [PhoneNumber], [Comment], [CompanyId]) VALUES (28, N'Melissa', N'', N'Owl', N'1975-11-11', N'71771911472', N'', 3)
GO
INSERT [dbo].[Employee] ([Id], [FirstName], [MiddleName], [LastName], [DateOfBirth], [PhoneNumber], [Comment], [CompanyId]) VALUES (29, N'Heather', N'', N'Hippo', N'1977-04-19', N'72328319620', N'', 1)
GO
INSERT [dbo].[Employee] ([Id], [FirstName], [MiddleName], [LastName], [DateOfBirth], [PhoneNumber], [Comment], [CompanyId]) VALUES (30, N'Janice', N'', N'Panda', N'1977-12-12', N'71655540811', N'', 3)
GO
INSERT [dbo].[Employee] ([Id], [FirstName], [MiddleName], [LastName], [DateOfBirth], [PhoneNumber], [Comment], [CompanyId]) VALUES (31, N'Marilyn', N'', N'Horse', N'1978-05-03', N'72846109364', N'', 2)
GO
INSERT [dbo].[Employee] ([Id], [FirstName], [MiddleName], [LastName], [DateOfBirth], [PhoneNumber], [Comment], [CompanyId]) VALUES (32, N'Louis', N'', N'Camel', N'1978-07-27', N'75601156425', N'', 2)
GO
INSERT [dbo].[Employee] ([Id], [FirstName], [MiddleName], [LastName], [DateOfBirth], [PhoneNumber], [Comment], [CompanyId]) VALUES (33, N'Maria', N'', N'Cheetah', N'1979-10-12', N'78214064614', N'', 2)
GO
INSERT [dbo].[Employee] ([Id], [FirstName], [MiddleName], [LastName], [DateOfBirth], [PhoneNumber], [Comment], [CompanyId]) VALUES (34, N'Danielle', N'', N'Wolf', N'1980-11-17', N'75785174356', N'', 1)
GO
INSERT [dbo].[Employee] ([Id], [FirstName], [MiddleName], [LastName], [DateOfBirth], [PhoneNumber], [Comment], [CompanyId]) VALUES (35, N'Konnor', N'', N'Snake', N'1981-05-14', N'71779290741', N'', 2)
GO
INSERT [dbo].[Employee] ([Id], [FirstName], [MiddleName], [LastName], [DateOfBirth], [PhoneNumber], [Comment], [CompanyId]) VALUES (36, N'Nicholas', N'', N'Walrus', N'1983-06-02', N'79946389074', N'', 2)
GO
INSERT [dbo].[Employee] ([Id], [FirstName], [MiddleName], [LastName], [DateOfBirth], [PhoneNumber], [Comment], [CompanyId]) VALUES (37, N'Ruth', N'', N'Bear', N'1984-10-14', N'75838825873', N'', 1)
GO
INSERT [dbo].[Employee] ([Id], [FirstName], [MiddleName], [LastName], [DateOfBirth], [PhoneNumber], [Comment], [CompanyId]) VALUES (38, N'Brenda', N'', N'Bull', N'1985-01-13', N'73815489289', N'', 3)
GO
INSERT [dbo].[Employee] ([Id], [FirstName], [MiddleName], [LastName], [DateOfBirth], [PhoneNumber], [Comment], [CompanyId]) VALUES (39, N'Kelly', N'', N'Fox', N'1987-05-10', N'72409282195', N'', 1)
GO
INSERT [dbo].[Employee] ([Id], [FirstName], [MiddleName], [LastName], [DateOfBirth], [PhoneNumber], [Comment], [CompanyId]) VALUES (40, N'Jordan', N'', N'Elephant', N'1987-11-24', N'70297753470', N'', 2)
GO
INSERT [dbo].[Employee] ([Id], [FirstName], [MiddleName], [LastName], [DateOfBirth], [PhoneNumber], [Comment], [CompanyId]) VALUES (41, N'Isabella', N'', N'Ant', N'1987-12-14', N'70343138131', N'', 2)
GO
INSERT [dbo].[Employee] ([Id], [FirstName], [MiddleName], [LastName], [DateOfBirth], [PhoneNumber], [Comment], [CompanyId]) VALUES (42, N'Alice', N'', N'Eagle', N'1988-01-17', N'74138013761', N'', 3)
GO
INSERT [dbo].[Employee] ([Id], [FirstName], [MiddleName], [LastName], [DateOfBirth], [PhoneNumber], [Comment], [CompanyId]) VALUES (43, N'Alan', N'', N'Elk', N'1989-07-22', N'70728695666', N'', 2)
GO
INSERT [dbo].[Employee] ([Id], [FirstName], [MiddleName], [LastName], [DateOfBirth], [PhoneNumber], [Comment], [CompanyId]) VALUES (44, N'Angela', N'Gray', N'Goat', N'1989-11-19', N'76954686424', N'', 3)
GO
INSERT [dbo].[Employee] ([Id], [FirstName], [MiddleName], [LastName], [DateOfBirth], [PhoneNumber], [Comment], [CompanyId]) VALUES (45, N'Benjamin', N'', N'Koala', N'1991-08-08', N'73701561491', N'', 1)
GO
INSERT [dbo].[Employee] ([Id], [FirstName], [MiddleName], [LastName], [DateOfBirth], [PhoneNumber], [Comment], [CompanyId]) VALUES (46, N'Zachary', N'', N'Donkey', N'1994-02-06', N'71081657631', N'', 1)
GO
INSERT [dbo].[Employee] ([Id], [FirstName], [MiddleName], [LastName], [DateOfBirth], [PhoneNumber], [Comment], [CompanyId]) VALUES (47, N'Abigail', N'', N'Goose', N'1995-03-08', N'77831883582', N'', 3)
GO
INSERT [dbo].[Employee] ([Id], [FirstName], [MiddleName], [LastName], [DateOfBirth], [PhoneNumber], [Comment], [CompanyId]) VALUES (48, N'Noah', N'', N'Puma', N'1995-04-20', N'77289745911', N'', 3)
GO
INSERT [dbo].[Employee] ([Id], [FirstName], [MiddleName], [LastName], [DateOfBirth], [PhoneNumber], [Comment], [CompanyId]) VALUES (49, N'Madison', N'', N'Frog', N'1996-06-21', N'72802460943', N'', 2)
GO
INSERT [dbo].[Employee] ([Id], [FirstName], [MiddleName], [LastName], [DateOfBirth], [PhoneNumber], [Comment], [CompanyId]) VALUES (50, N'Bryan', N'', N'Tiger', N'1999-09-28', N'71650538330', N'', 1)
GO
SET IDENTITY_INSERT [dbo].[Employee] OFF
GO
SET IDENTITY_INSERT [dbo].[HolidayDays] ON 
GO
INSERT [dbo].[HolidayDays] ([Id], [CompanyId], [Name], [StartHolidayDate], [EndHolidayDate], [EveryYear], [AdditivePercentage], [Comment]) VALUES (1, 1, N'New Year', CAST(N'2021-12-31' AS Date), CAST(N'2022-01-08' AS Date), 1, 2, N'')
GO
INSERT [dbo].[HolidayDays] ([Id], [CompanyId], [Name], [StartHolidayDate], [EndHolidayDate], [EveryYear], [AdditivePercentage], [Comment]) VALUES (2, 1, N'Birthday Gen. Directors', CAST(N'2022-04-16' AS Date), CAST(N'2022-04-16' AS Date), 1, 0.5, N'')
GO
INSERT [dbo].[HolidayDays] ([Id], [CompanyId], [Name], [StartHolidayDate], [EndHolidayDate], [EveryYear], [AdditivePercentage], [Comment]) VALUES (3, 1, N'Builder''s Day', CAST(N'2022-08-14' AS Date), CAST(N'2022-08-14' AS Date), 1, 2, N'')
GO
INSERT [dbo].[HolidayDays] ([Id], [CompanyId], [Name], [StartHolidayDate], [EndHolidayDate], [EveryYear], [AdditivePercentage], [Comment]) VALUES (4, 1, N'National Unity Day', CAST(N'2022-11-04' AS Date), CAST(N'2022-11-04' AS Date), 1, 0.75, N'')
GO
INSERT [dbo].[HolidayDays] ([Id], [CompanyId], [Name], [StartHolidayDate], [EndHolidayDate], [EveryYear], [AdditivePercentage], [Comment]) VALUES (5, 1, N'Groundhog day', CAST(N'2022-12-10' AS Date), CAST(N'2022-12-10' AS Date), 0, 0.5, N'')
GO
INSERT [dbo].[HolidayDays] ([Id], [CompanyId], [Name], [StartHolidayDate], [EndHolidayDate], [EveryYear], [AdditivePercentage], [Comment]) VALUES (6, 2, N'New Year', CAST(N'2021-12-31' AS Date), CAST(N'2022-01-08' AS Date), 1, 1, N'')
GO
INSERT [dbo].[HolidayDays] ([Id], [CompanyId], [Name], [StartHolidayDate], [EndHolidayDate], [EveryYear], [AdditivePercentage], [Comment]) VALUES (7, 2, N'8-Mar', CAST(N'2022-03-08' AS Date), CAST(N'2022-03-08' AS Date), 1, 0.25, N'')
GO
INSERT [dbo].[HolidayDays] ([Id], [CompanyId], [Name], [StartHolidayDate], [EndHolidayDate], [EveryYear], [AdditivePercentage], [Comment]) VALUES (8, 2, N'Builder''s Day', CAST(N'2022-08-14' AS Date), CAST(N'2022-08-16' AS Date), 1, 1, N'')
GO
INSERT [dbo].[HolidayDays] ([Id], [CompanyId], [Name], [StartHolidayDate], [EndHolidayDate], [EveryYear], [AdditivePercentage], [Comment]) VALUES (9, 2, N'National Unity Day', CAST(N'2022-11-04' AS Date), CAST(N'2022-11-04' AS Date), 1, 0.4, N'')
GO
INSERT [dbo].[HolidayDays] ([Id], [CompanyId], [Name], [StartHolidayDate], [EndHolidayDate], [EveryYear], [AdditivePercentage], [Comment]) VALUES (10, 2, N'Summer solstice', CAST(N'2022-07-01' AS Date), CAST(N'2022-07-01' AS Date), 0, 0.25, N'')
GO
INSERT [dbo].[HolidayDays] ([Id], [CompanyId], [Name], [StartHolidayDate], [EndHolidayDate], [EveryYear], [AdditivePercentage], [Comment]) VALUES (11, 3, N'New Year', CAST(N'2021-12-31' AS Date), CAST(N'2022-01-13' AS Date), 1, 2, N'')
GO
INSERT [dbo].[HolidayDays] ([Id], [CompanyId], [Name], [StartHolidayDate], [EndHolidayDate], [EveryYear], [AdditivePercentage], [Comment]) VALUES (12, 3, N'8-Mar', CAST(N'2022-03-08' AS Date), CAST(N'2022-03-08' AS Date), 1, 0.5, N'')
GO
INSERT [dbo].[HolidayDays] ([Id], [CompanyId], [Name], [StartHolidayDate], [EndHolidayDate], [EveryYear], [AdditivePercentage], [Comment]) VALUES (13, 3, N'Builder''s Day', CAST(N'2022-08-14' AS Date), CAST(N'2022-08-14' AS Date), 1, 2, N'')
GO
INSERT [dbo].[HolidayDays] ([Id], [CompanyId], [Name], [StartHolidayDate], [EndHolidayDate], [EveryYear], [AdditivePercentage], [Comment]) VALUES (14, 3, N'Company birthday', CAST(N'2022-11-05' AS Date), CAST(N'2022-11-06' AS Date), 1, 1, N'')
GO
INSERT [dbo].[HolidayDays] ([Id], [CompanyId], [Name], [StartHolidayDate], [EndHolidayDate], [EveryYear], [AdditivePercentage], [Comment]) VALUES (15, 3, N'Halloween', CAST(N'2022-10-31' AS Date), CAST(N'2022-10-31' AS Date), 0, 1, N'')
GO
SET IDENTITY_INSERT [dbo].[HolidayDays] OFF
GO
SET IDENTITY_INSERT [dbo].[Profession] ON 
GO
INSERT [dbo].[Profession] ([Id], [Name], [Description]) VALUES (1, N'Civil engineer', N'')
GO
INSERT [dbo].[Profession] ([Id], [Name], [Description]) VALUES (2, N'Architect', N'')
GO
INSERT [dbo].[Profession] ([Id], [Name], [Description]) VALUES (3, N'Construction restorer', N'')
GO
INSERT [dbo].[Profession] ([Id], [Name], [Description]) VALUES (4, N'Painter-plasterer', N'')
GO
INSERT [dbo].[Profession] ([Id], [Name], [Description]) VALUES (5, N'Finisher', N'')
GO
INSERT [dbo].[Profession] ([Id], [Name], [Description]) VALUES (6, N'Concrete worker', N'')
GO
INSERT [dbo].[Profession] ([Id], [Name], [Description]) VALUES (7, N'Mason', N'')
GO
INSERT [dbo].[Profession] ([Id], [Name], [Description]) VALUES (8, N'Gardener', N'')
GO
SET IDENTITY_INSERT [dbo].[Profession] OFF
GO
SET IDENTITY_INSERT [dbo].[Schedule] ON 
GO
INSERT [dbo].[Schedule] ([Id], [EmployeeId], [DayOfWeek], [StartWorkTime], [FinishWorkTime]) VALUES (1, 40, 0, CAST(N'10:00:00' AS Time), CAST(N'16:00:00' AS Time))
GO
INSERT [dbo].[Schedule] ([Id], [EmployeeId], [DayOfWeek], [StartWorkTime], [FinishWorkTime]) VALUES (2, 40, 1, CAST(N'07:00:00' AS Time), CAST(N'15:00:00' AS Time))
GO
INSERT [dbo].[Schedule] ([Id], [EmployeeId], [DayOfWeek], [StartWorkTime], [FinishWorkTime]) VALUES (3, 40, 3, CAST(N'09:00:00' AS Time), CAST(N'15:00:00' AS Time))
GO
INSERT [dbo].[Schedule] ([Id], [EmployeeId], [DayOfWeek], [StartWorkTime], [FinishWorkTime]) VALUES (4, 40, 4, CAST(N'09:00:00' AS Time), CAST(N'21:00:00' AS Time))
GO
INSERT [dbo].[Schedule] ([Id], [EmployeeId], [DayOfWeek], [StartWorkTime], [FinishWorkTime]) VALUES (5, 40, 5, CAST(N'10:00:00' AS Time), CAST(N'22:00:00' AS Time))
GO
INSERT [dbo].[Schedule] ([Id], [EmployeeId], [DayOfWeek], [StartWorkTime], [FinishWorkTime]) VALUES (6, 40, 6, CAST(N'10:00:00' AS Time), CAST(N'19:00:00' AS Time))
GO
INSERT [dbo].[Schedule] ([Id], [EmployeeId], [DayOfWeek], [StartWorkTime], [FinishWorkTime]) VALUES (7, 41, 1, CAST(N'10:00:00' AS Time), CAST(N'18:00:00' AS Time))
GO
INSERT [dbo].[Schedule] ([Id], [EmployeeId], [DayOfWeek], [StartWorkTime], [FinishWorkTime]) VALUES (8, 41, 3, CAST(N'06:00:00' AS Time), CAST(N'21:00:00' AS Time))
GO
INSERT [dbo].[Schedule] ([Id], [EmployeeId], [DayOfWeek], [StartWorkTime], [FinishWorkTime]) VALUES (9, 41, 4, CAST(N'10:00:00' AS Time), CAST(N'16:00:00' AS Time))
GO
INSERT [dbo].[Schedule] ([Id], [EmployeeId], [DayOfWeek], [StartWorkTime], [FinishWorkTime]) VALUES (10, 41, 6, CAST(N'06:00:00' AS Time), CAST(N'17:00:00' AS Time))
GO
INSERT [dbo].[Schedule] ([Id], [EmployeeId], [DayOfWeek], [StartWorkTime], [FinishWorkTime]) VALUES (11, 43, 2, CAST(N'09:00:00' AS Time), CAST(N'16:00:00' AS Time))
GO
INSERT [dbo].[Schedule] ([Id], [EmployeeId], [DayOfWeek], [StartWorkTime], [FinishWorkTime]) VALUES (12, 43, 3, CAST(N'07:00:00' AS Time), CAST(N'15:00:00' AS Time))
GO
INSERT [dbo].[Schedule] ([Id], [EmployeeId], [DayOfWeek], [StartWorkTime], [FinishWorkTime]) VALUES (13, 43, 4, CAST(N'07:00:00' AS Time), CAST(N'19:00:00' AS Time))
GO
INSERT [dbo].[Schedule] ([Id], [EmployeeId], [DayOfWeek], [StartWorkTime], [FinishWorkTime]) VALUES (14, 43, 5, CAST(N'07:00:00' AS Time), CAST(N'20:00:00' AS Time))
GO
INSERT [dbo].[Schedule] ([Id], [EmployeeId], [DayOfWeek], [StartWorkTime], [FinishWorkTime]) VALUES (15, 43, 6, CAST(N'08:00:00' AS Time), CAST(N'15:00:00' AS Time))
GO
INSERT [dbo].[Schedule] ([Id], [EmployeeId], [DayOfWeek], [StartWorkTime], [FinishWorkTime]) VALUES (16, 3, 1, CAST(N'10:00:00' AS Time), CAST(N'22:00:00' AS Time))
GO
INSERT [dbo].[Schedule] ([Id], [EmployeeId], [DayOfWeek], [StartWorkTime], [FinishWorkTime]) VALUES (17, 3, 2, CAST(N'07:00:00' AS Time), CAST(N'14:00:00' AS Time))
GO
INSERT [dbo].[Schedule] ([Id], [EmployeeId], [DayOfWeek], [StartWorkTime], [FinishWorkTime]) VALUES (18, 3, 4, CAST(N'09:00:00' AS Time), CAST(N'16:00:00' AS Time))
GO
INSERT [dbo].[Schedule] ([Id], [EmployeeId], [DayOfWeek], [StartWorkTime], [FinishWorkTime]) VALUES (19, 3, 5, CAST(N'07:00:00' AS Time), CAST(N'19:00:00' AS Time))
GO
INSERT [dbo].[Schedule] ([Id], [EmployeeId], [DayOfWeek], [StartWorkTime], [FinishWorkTime]) VALUES (20, 20, 1, CAST(N'10:00:00' AS Time), CAST(N'15:00:00' AS Time))
GO
INSERT [dbo].[Schedule] ([Id], [EmployeeId], [DayOfWeek], [StartWorkTime], [FinishWorkTime]) VALUES (21, 20, 2, CAST(N'06:00:00' AS Time), CAST(N'18:00:00' AS Time))
GO
INSERT [dbo].[Schedule] ([Id], [EmployeeId], [DayOfWeek], [StartWorkTime], [FinishWorkTime]) VALUES (22, 20, 4, CAST(N'10:00:00' AS Time), CAST(N'18:00:00' AS Time))
GO
INSERT [dbo].[Schedule] ([Id], [EmployeeId], [DayOfWeek], [StartWorkTime], [FinishWorkTime]) VALUES (23, 20, 5, CAST(N'10:00:00' AS Time), CAST(N'14:00:00' AS Time))
GO
INSERT [dbo].[Schedule] ([Id], [EmployeeId], [DayOfWeek], [StartWorkTime], [FinishWorkTime]) VALUES (24, 46, 1, CAST(N'06:00:00' AS Time), CAST(N'20:00:00' AS Time))
GO
INSERT [dbo].[Schedule] ([Id], [EmployeeId], [DayOfWeek], [StartWorkTime], [FinishWorkTime]) VALUES (25, 46, 2, CAST(N'07:00:00' AS Time), CAST(N'16:00:00' AS Time))
GO
INSERT [dbo].[Schedule] ([Id], [EmployeeId], [DayOfWeek], [StartWorkTime], [FinishWorkTime]) VALUES (26, 46, 4, CAST(N'09:00:00' AS Time), CAST(N'21:00:00' AS Time))
GO
INSERT [dbo].[Schedule] ([Id], [EmployeeId], [DayOfWeek], [StartWorkTime], [FinishWorkTime]) VALUES (27, 46, 5, CAST(N'08:00:00' AS Time), CAST(N'17:00:00' AS Time))
GO
INSERT [dbo].[Schedule] ([Id], [EmployeeId], [DayOfWeek], [StartWorkTime], [FinishWorkTime]) VALUES (28, 46, 6, CAST(N'08:00:00' AS Time), CAST(N'16:00:00' AS Time))
GO
INSERT [dbo].[Schedule] ([Id], [EmployeeId], [DayOfWeek], [StartWorkTime], [FinishWorkTime]) VALUES (29, 27, 1, CAST(N'08:00:00' AS Time), CAST(N'18:00:00' AS Time))
GO
INSERT [dbo].[Schedule] ([Id], [EmployeeId], [DayOfWeek], [StartWorkTime], [FinishWorkTime]) VALUES (30, 27, 2, CAST(N'06:00:00' AS Time), CAST(N'14:00:00' AS Time))
GO
INSERT [dbo].[Schedule] ([Id], [EmployeeId], [DayOfWeek], [StartWorkTime], [FinishWorkTime]) VALUES (31, 27, 5, CAST(N'07:00:00' AS Time), CAST(N'17:00:00' AS Time))
GO
INSERT [dbo].[Schedule] ([Id], [EmployeeId], [DayOfWeek], [StartWorkTime], [FinishWorkTime]) VALUES (32, 8, 2, CAST(N'07:00:00' AS Time), CAST(N'17:00:00' AS Time))
GO
INSERT [dbo].[Schedule] ([Id], [EmployeeId], [DayOfWeek], [StartWorkTime], [FinishWorkTime]) VALUES (33, 8, 6, CAST(N'10:00:00' AS Time), CAST(N'17:00:00' AS Time))
GO
INSERT [dbo].[Schedule] ([Id], [EmployeeId], [DayOfWeek], [StartWorkTime], [FinishWorkTime]) VALUES (34, 50, 2, CAST(N'06:00:00' AS Time), CAST(N'21:00:00' AS Time))
GO
INSERT [dbo].[Schedule] ([Id], [EmployeeId], [DayOfWeek], [StartWorkTime], [FinishWorkTime]) VALUES (35, 50, 3, CAST(N'08:00:00' AS Time), CAST(N'20:00:00' AS Time))
GO
INSERT [dbo].[Schedule] ([Id], [EmployeeId], [DayOfWeek], [StartWorkTime], [FinishWorkTime]) VALUES (36, 50, 5, CAST(N'08:00:00' AS Time), CAST(N'16:00:00' AS Time))
GO
INSERT [dbo].[Schedule] ([Id], [EmployeeId], [DayOfWeek], [StartWorkTime], [FinishWorkTime]) VALUES (37, 50, 6, CAST(N'10:00:00' AS Time), CAST(N'18:00:00' AS Time))
GO
INSERT [dbo].[Schedule] ([Id], [EmployeeId], [DayOfWeek], [StartWorkTime], [FinishWorkTime]) VALUES (38, 30, 1, CAST(N'08:00:00' AS Time), CAST(N'22:00:00' AS Time))
GO
INSERT [dbo].[Schedule] ([Id], [EmployeeId], [DayOfWeek], [StartWorkTime], [FinishWorkTime]) VALUES (39, 30, 2, CAST(N'10:00:00' AS Time), CAST(N'18:00:00' AS Time))
GO
INSERT [dbo].[Schedule] ([Id], [EmployeeId], [DayOfWeek], [StartWorkTime], [FinishWorkTime]) VALUES (40, 30, 3, CAST(N'08:00:00' AS Time), CAST(N'17:00:00' AS Time))
GO
INSERT [dbo].[Schedule] ([Id], [EmployeeId], [DayOfWeek], [StartWorkTime], [FinishWorkTime]) VALUES (41, 30, 4, CAST(N'06:00:00' AS Time), CAST(N'15:00:00' AS Time))
GO
INSERT [dbo].[Schedule] ([Id], [EmployeeId], [DayOfWeek], [StartWorkTime], [FinishWorkTime]) VALUES (42, 30, 5, CAST(N'06:00:00' AS Time), CAST(N'14:00:00' AS Time))
GO
INSERT [dbo].[Schedule] ([Id], [EmployeeId], [DayOfWeek], [StartWorkTime], [FinishWorkTime]) VALUES (43, 30, 6, CAST(N'06:00:00' AS Time), CAST(N'15:00:00' AS Time))
GO
INSERT [dbo].[Schedule] ([Id], [EmployeeId], [DayOfWeek], [StartWorkTime], [FinishWorkTime]) VALUES (44, 28, 0, CAST(N'07:00:00' AS Time), CAST(N'22:00:00' AS Time))
GO
INSERT [dbo].[Schedule] ([Id], [EmployeeId], [DayOfWeek], [StartWorkTime], [FinishWorkTime]) VALUES (45, 28, 2, CAST(N'09:00:00' AS Time), CAST(N'18:00:00' AS Time))
GO
INSERT [dbo].[Schedule] ([Id], [EmployeeId], [DayOfWeek], [StartWorkTime], [FinishWorkTime]) VALUES (46, 28, 3, CAST(N'08:00:00' AS Time), CAST(N'22:00:00' AS Time))
GO
INSERT [dbo].[Schedule] ([Id], [EmployeeId], [DayOfWeek], [StartWorkTime], [FinishWorkTime]) VALUES (47, 28, 5, CAST(N'08:00:00' AS Time), CAST(N'20:00:00' AS Time))
GO
INSERT [dbo].[Schedule] ([Id], [EmployeeId], [DayOfWeek], [StartWorkTime], [FinishWorkTime]) VALUES (48, 35, 1, CAST(N'09:00:00' AS Time), CAST(N'15:00:00' AS Time))
GO
INSERT [dbo].[Schedule] ([Id], [EmployeeId], [DayOfWeek], [StartWorkTime], [FinishWorkTime]) VALUES (49, 35, 4, CAST(N'08:00:00' AS Time), CAST(N'19:00:00' AS Time))
GO
INSERT [dbo].[Schedule] ([Id], [EmployeeId], [DayOfWeek], [StartWorkTime], [FinishWorkTime]) VALUES (50, 35, 5, CAST(N'06:00:00' AS Time), CAST(N'20:00:00' AS Time))
GO
INSERT [dbo].[Schedule] ([Id], [EmployeeId], [DayOfWeek], [StartWorkTime], [FinishWorkTime]) VALUES (51, 29, 1, CAST(N'08:00:00' AS Time), CAST(N'15:00:00' AS Time))
GO
INSERT [dbo].[Schedule] ([Id], [EmployeeId], [DayOfWeek], [StartWorkTime], [FinishWorkTime]) VALUES (52, 29, 2, CAST(N'06:00:00' AS Time), CAST(N'16:00:00' AS Time))
GO
INSERT [dbo].[Schedule] ([Id], [EmployeeId], [DayOfWeek], [StartWorkTime], [FinishWorkTime]) VALUES (53, 29, 3, CAST(N'09:00:00' AS Time), CAST(N'16:00:00' AS Time))
GO
INSERT [dbo].[Schedule] ([Id], [EmployeeId], [DayOfWeek], [StartWorkTime], [FinishWorkTime]) VALUES (54, 29, 4, CAST(N'10:00:00' AS Time), CAST(N'17:00:00' AS Time))
GO
INSERT [dbo].[Schedule] ([Id], [EmployeeId], [DayOfWeek], [StartWorkTime], [FinishWorkTime]) VALUES (55, 29, 5, CAST(N'09:00:00' AS Time), CAST(N'22:00:00' AS Time))
GO
INSERT [dbo].[Schedule] ([Id], [EmployeeId], [DayOfWeek], [StartWorkTime], [FinishWorkTime]) VALUES (56, 39, 1, CAST(N'10:00:00' AS Time), CAST(N'21:00:00' AS Time))
GO
INSERT [dbo].[Schedule] ([Id], [EmployeeId], [DayOfWeek], [StartWorkTime], [FinishWorkTime]) VALUES (57, 39, 4, CAST(N'09:00:00' AS Time), CAST(N'19:00:00' AS Time))
GO
INSERT [dbo].[Schedule] ([Id], [EmployeeId], [DayOfWeek], [StartWorkTime], [FinishWorkTime]) VALUES (58, 49, 1, CAST(N'07:00:00' AS Time), CAST(N'16:00:00' AS Time))
GO
INSERT [dbo].[Schedule] ([Id], [EmployeeId], [DayOfWeek], [StartWorkTime], [FinishWorkTime]) VALUES (59, 49, 2, CAST(N'08:00:00' AS Time), CAST(N'14:00:00' AS Time))
GO
INSERT [dbo].[Schedule] ([Id], [EmployeeId], [DayOfWeek], [StartWorkTime], [FinishWorkTime]) VALUES (60, 49, 3, CAST(N'10:00:00' AS Time), CAST(N'17:00:00' AS Time))
GO
INSERT [dbo].[Schedule] ([Id], [EmployeeId], [DayOfWeek], [StartWorkTime], [FinishWorkTime]) VALUES (61, 49, 5, CAST(N'09:00:00' AS Time), CAST(N'15:00:00' AS Time))
GO
INSERT [dbo].[Schedule] ([Id], [EmployeeId], [DayOfWeek], [StartWorkTime], [FinishWorkTime]) VALUES (62, 49, 6, CAST(N'09:00:00' AS Time), CAST(N'17:00:00' AS Time))
GO
INSERT [dbo].[Schedule] ([Id], [EmployeeId], [DayOfWeek], [StartWorkTime], [FinishWorkTime]) VALUES (63, 31, 1, CAST(N'06:00:00' AS Time), CAST(N'14:00:00' AS Time))
GO
INSERT [dbo].[Schedule] ([Id], [EmployeeId], [DayOfWeek], [StartWorkTime], [FinishWorkTime]) VALUES (64, 31, 2, CAST(N'06:00:00' AS Time), CAST(N'19:00:00' AS Time))
GO
INSERT [dbo].[Schedule] ([Id], [EmployeeId], [DayOfWeek], [StartWorkTime], [FinishWorkTime]) VALUES (65, 31, 3, CAST(N'09:00:00' AS Time), CAST(N'14:00:00' AS Time))
GO
INSERT [dbo].[Schedule] ([Id], [EmployeeId], [DayOfWeek], [StartWorkTime], [FinishWorkTime]) VALUES (66, 31, 5, CAST(N'10:00:00' AS Time), CAST(N'20:00:00' AS Time))
GO
INSERT [dbo].[Schedule] ([Id], [EmployeeId], [DayOfWeek], [StartWorkTime], [FinishWorkTime]) VALUES (67, 31, 6, CAST(N'07:00:00' AS Time), CAST(N'15:00:00' AS Time))
GO
INSERT [dbo].[Schedule] ([Id], [EmployeeId], [DayOfWeek], [StartWorkTime], [FinishWorkTime]) VALUES (68, 17, 1, CAST(N'09:00:00' AS Time), CAST(N'17:00:00' AS Time))
GO
INSERT [dbo].[Schedule] ([Id], [EmployeeId], [DayOfWeek], [StartWorkTime], [FinishWorkTime]) VALUES (69, 17, 4, CAST(N'06:00:00' AS Time), CAST(N'18:00:00' AS Time))
GO
INSERT [dbo].[Schedule] ([Id], [EmployeeId], [DayOfWeek], [StartWorkTime], [FinishWorkTime]) VALUES (70, 17, 5, CAST(N'06:00:00' AS Time), CAST(N'18:00:00' AS Time))
GO
INSERT [dbo].[Schedule] ([Id], [EmployeeId], [DayOfWeek], [StartWorkTime], [FinishWorkTime]) VALUES (71, 17, 6, CAST(N'06:00:00' AS Time), CAST(N'14:00:00' AS Time))
GO
INSERT [dbo].[Schedule] ([Id], [EmployeeId], [DayOfWeek], [StartWorkTime], [FinishWorkTime]) VALUES (72, 11, 1, CAST(N'06:00:00' AS Time), CAST(N'14:00:00' AS Time))
GO
INSERT [dbo].[Schedule] ([Id], [EmployeeId], [DayOfWeek], [StartWorkTime], [FinishWorkTime]) VALUES (73, 11, 2, CAST(N'09:00:00' AS Time), CAST(N'14:00:00' AS Time))
GO
INSERT [dbo].[Schedule] ([Id], [EmployeeId], [DayOfWeek], [StartWorkTime], [FinishWorkTime]) VALUES (74, 11, 3, CAST(N'09:00:00' AS Time), CAST(N'21:00:00' AS Time))
GO
INSERT [dbo].[Schedule] ([Id], [EmployeeId], [DayOfWeek], [StartWorkTime], [FinishWorkTime]) VALUES (75, 11, 4, CAST(N'06:00:00' AS Time), CAST(N'18:00:00' AS Time))
GO
INSERT [dbo].[Schedule] ([Id], [EmployeeId], [DayOfWeek], [StartWorkTime], [FinishWorkTime]) VALUES (76, 11, 6, CAST(N'07:00:00' AS Time), CAST(N'19:00:00' AS Time))
GO
INSERT [dbo].[Schedule] ([Id], [EmployeeId], [DayOfWeek], [StartWorkTime], [FinishWorkTime]) VALUES (77, 45, 0, CAST(N'08:00:00' AS Time), CAST(N'22:00:00' AS Time))
GO
INSERT [dbo].[Schedule] ([Id], [EmployeeId], [DayOfWeek], [StartWorkTime], [FinishWorkTime]) VALUES (78, 45, 2, CAST(N'09:00:00' AS Time), CAST(N'18:00:00' AS Time))
GO
INSERT [dbo].[Schedule] ([Id], [EmployeeId], [DayOfWeek], [StartWorkTime], [FinishWorkTime]) VALUES (79, 45, 4, CAST(N'08:00:00' AS Time), CAST(N'19:00:00' AS Time))
GO
INSERT [dbo].[Schedule] ([Id], [EmployeeId], [DayOfWeek], [StartWorkTime], [FinishWorkTime]) VALUES (80, 45, 5, CAST(N'10:00:00' AS Time), CAST(N'21:00:00' AS Time))
GO
INSERT [dbo].[Schedule] ([Id], [EmployeeId], [DayOfWeek], [StartWorkTime], [FinishWorkTime]) VALUES (81, 38, 0, CAST(N'09:00:00' AS Time), CAST(N'15:00:00' AS Time))
GO
INSERT [dbo].[Schedule] ([Id], [EmployeeId], [DayOfWeek], [StartWorkTime], [FinishWorkTime]) VALUES (82, 38, 1, CAST(N'09:00:00' AS Time), CAST(N'18:00:00' AS Time))
GO
INSERT [dbo].[Schedule] ([Id], [EmployeeId], [DayOfWeek], [StartWorkTime], [FinishWorkTime]) VALUES (83, 38, 2, CAST(N'08:00:00' AS Time), CAST(N'17:00:00' AS Time))
GO
INSERT [dbo].[Schedule] ([Id], [EmployeeId], [DayOfWeek], [StartWorkTime], [FinishWorkTime]) VALUES (84, 38, 5, CAST(N'08:00:00' AS Time), CAST(N'15:00:00' AS Time))
GO
INSERT [dbo].[Schedule] ([Id], [EmployeeId], [DayOfWeek], [StartWorkTime], [FinishWorkTime]) VALUES (85, 25, 1, CAST(N'07:00:00' AS Time), CAST(N'14:00:00' AS Time))
GO
INSERT [dbo].[Schedule] ([Id], [EmployeeId], [DayOfWeek], [StartWorkTime], [FinishWorkTime]) VALUES (86, 25, 2, CAST(N'06:00:00' AS Time), CAST(N'20:00:00' AS Time))
GO
INSERT [dbo].[Schedule] ([Id], [EmployeeId], [DayOfWeek], [StartWorkTime], [FinishWorkTime]) VALUES (87, 25, 3, CAST(N'06:00:00' AS Time), CAST(N'21:00:00' AS Time))
GO
INSERT [dbo].[Schedule] ([Id], [EmployeeId], [DayOfWeek], [StartWorkTime], [FinishWorkTime]) VALUES (88, 25, 5, CAST(N'06:00:00' AS Time), CAST(N'14:00:00' AS Time))
GO
INSERT [dbo].[Schedule] ([Id], [EmployeeId], [DayOfWeek], [StartWorkTime], [FinishWorkTime]) VALUES (89, 42, 0, CAST(N'06:00:00' AS Time), CAST(N'17:00:00' AS Time))
GO
INSERT [dbo].[Schedule] ([Id], [EmployeeId], [DayOfWeek], [StartWorkTime], [FinishWorkTime]) VALUES (90, 42, 1, CAST(N'10:00:00' AS Time), CAST(N'20:00:00' AS Time))
GO
INSERT [dbo].[Schedule] ([Id], [EmployeeId], [DayOfWeek], [StartWorkTime], [FinishWorkTime]) VALUES (91, 42, 3, CAST(N'09:00:00' AS Time), CAST(N'17:00:00' AS Time))
GO
INSERT [dbo].[Schedule] ([Id], [EmployeeId], [DayOfWeek], [StartWorkTime], [FinishWorkTime]) VALUES (92, 42, 4, CAST(N'09:00:00' AS Time), CAST(N'14:00:00' AS Time))
GO
INSERT [dbo].[Schedule] ([Id], [EmployeeId], [DayOfWeek], [StartWorkTime], [FinishWorkTime]) VALUES (93, 42, 6, CAST(N'10:00:00' AS Time), CAST(N'15:00:00' AS Time))
GO
INSERT [dbo].[Schedule] ([Id], [EmployeeId], [DayOfWeek], [StartWorkTime], [FinishWorkTime]) VALUES (94, 15, 0, CAST(N'08:00:00' AS Time), CAST(N'18:00:00' AS Time))
GO
INSERT [dbo].[Schedule] ([Id], [EmployeeId], [DayOfWeek], [StartWorkTime], [FinishWorkTime]) VALUES (95, 15, 1, CAST(N'09:00:00' AS Time), CAST(N'19:00:00' AS Time))
GO
INSERT [dbo].[Schedule] ([Id], [EmployeeId], [DayOfWeek], [StartWorkTime], [FinishWorkTime]) VALUES (96, 15, 2, CAST(N'06:00:00' AS Time), CAST(N'20:00:00' AS Time))
GO
INSERT [dbo].[Schedule] ([Id], [EmployeeId], [DayOfWeek], [StartWorkTime], [FinishWorkTime]) VALUES (97, 15, 3, CAST(N'08:00:00' AS Time), CAST(N'14:00:00' AS Time))
GO
INSERT [dbo].[Schedule] ([Id], [EmployeeId], [DayOfWeek], [StartWorkTime], [FinishWorkTime]) VALUES (98, 15, 5, CAST(N'07:00:00' AS Time), CAST(N'16:00:00' AS Time))
GO
INSERT [dbo].[Schedule] ([Id], [EmployeeId], [DayOfWeek], [StartWorkTime], [FinishWorkTime]) VALUES (99, 7, 0, CAST(N'09:00:00' AS Time), CAST(N'15:00:00' AS Time))
GO
INSERT [dbo].[Schedule] ([Id], [EmployeeId], [DayOfWeek], [StartWorkTime], [FinishWorkTime]) VALUES (100, 7, 1, CAST(N'08:00:00' AS Time), CAST(N'22:00:00' AS Time))
GO
INSERT [dbo].[Schedule] ([Id], [EmployeeId], [DayOfWeek], [StartWorkTime], [FinishWorkTime]) VALUES (101, 7, 2, CAST(N'06:00:00' AS Time), CAST(N'22:00:00' AS Time))
GO
INSERT [dbo].[Schedule] ([Id], [EmployeeId], [DayOfWeek], [StartWorkTime], [FinishWorkTime]) VALUES (102, 7, 3, CAST(N'09:00:00' AS Time), CAST(N'22:00:00' AS Time))
GO
INSERT [dbo].[Schedule] ([Id], [EmployeeId], [DayOfWeek], [StartWorkTime], [FinishWorkTime]) VALUES (103, 7, 4, CAST(N'10:00:00' AS Time), CAST(N'21:00:00' AS Time))
GO
INSERT [dbo].[Schedule] ([Id], [EmployeeId], [DayOfWeek], [StartWorkTime], [FinishWorkTime]) VALUES (104, 7, 5, CAST(N'10:00:00' AS Time), CAST(N'20:00:00' AS Time))
GO
INSERT [dbo].[Schedule] ([Id], [EmployeeId], [DayOfWeek], [StartWorkTime], [FinishWorkTime]) VALUES (105, 7, 6, CAST(N'08:00:00' AS Time), CAST(N'14:00:00' AS Time))
GO
INSERT [dbo].[Schedule] ([Id], [EmployeeId], [DayOfWeek], [StartWorkTime], [FinishWorkTime]) VALUES (106, 12, 0, CAST(N'10:00:00' AS Time), CAST(N'22:00:00' AS Time))
GO
INSERT [dbo].[Schedule] ([Id], [EmployeeId], [DayOfWeek], [StartWorkTime], [FinishWorkTime]) VALUES (107, 12, 2, CAST(N'06:00:00' AS Time), CAST(N'17:00:00' AS Time))
GO
INSERT [dbo].[Schedule] ([Id], [EmployeeId], [DayOfWeek], [StartWorkTime], [FinishWorkTime]) VALUES (108, 12, 4, CAST(N'10:00:00' AS Time), CAST(N'20:00:00' AS Time))
GO
INSERT [dbo].[Schedule] ([Id], [EmployeeId], [DayOfWeek], [StartWorkTime], [FinishWorkTime]) VALUES (109, 16, 0, CAST(N'06:00:00' AS Time), CAST(N'17:00:00' AS Time))
GO
INSERT [dbo].[Schedule] ([Id], [EmployeeId], [DayOfWeek], [StartWorkTime], [FinishWorkTime]) VALUES (110, 16, 2, CAST(N'07:00:00' AS Time), CAST(N'17:00:00' AS Time))
GO
INSERT [dbo].[Schedule] ([Id], [EmployeeId], [DayOfWeek], [StartWorkTime], [FinishWorkTime]) VALUES (111, 16, 4, CAST(N'06:00:00' AS Time), CAST(N'19:00:00' AS Time))
GO
INSERT [dbo].[Schedule] ([Id], [EmployeeId], [DayOfWeek], [StartWorkTime], [FinishWorkTime]) VALUES (112, 16, 5, CAST(N'06:00:00' AS Time), CAST(N'20:00:00' AS Time))
GO
INSERT [dbo].[Schedule] ([Id], [EmployeeId], [DayOfWeek], [StartWorkTime], [FinishWorkTime]) VALUES (113, 1, 0, CAST(N'06:00:00' AS Time), CAST(N'19:00:00' AS Time))
GO
INSERT [dbo].[Schedule] ([Id], [EmployeeId], [DayOfWeek], [StartWorkTime], [FinishWorkTime]) VALUES (114, 1, 2, CAST(N'09:00:00' AS Time), CAST(N'16:00:00' AS Time))
GO
INSERT [dbo].[Schedule] ([Id], [EmployeeId], [DayOfWeek], [StartWorkTime], [FinishWorkTime]) VALUES (115, 1, 3, CAST(N'06:00:00' AS Time), CAST(N'16:00:00' AS Time))
GO
INSERT [dbo].[Schedule] ([Id], [EmployeeId], [DayOfWeek], [StartWorkTime], [FinishWorkTime]) VALUES (116, 1, 4, CAST(N'07:00:00' AS Time), CAST(N'21:00:00' AS Time))
GO
INSERT [dbo].[Schedule] ([Id], [EmployeeId], [DayOfWeek], [StartWorkTime], [FinishWorkTime]) VALUES (117, 1, 5, CAST(N'07:00:00' AS Time), CAST(N'18:00:00' AS Time))
GO
INSERT [dbo].[Schedule] ([Id], [EmployeeId], [DayOfWeek], [StartWorkTime], [FinishWorkTime]) VALUES (118, 4, 0, CAST(N'07:00:00' AS Time), CAST(N'16:00:00' AS Time))
GO
INSERT [dbo].[Schedule] ([Id], [EmployeeId], [DayOfWeek], [StartWorkTime], [FinishWorkTime]) VALUES (119, 4, 4, CAST(N'09:00:00' AS Time), CAST(N'19:00:00' AS Time))
GO
INSERT [dbo].[Schedule] ([Id], [EmployeeId], [DayOfWeek], [StartWorkTime], [FinishWorkTime]) VALUES (120, 4, 5, CAST(N'09:00:00' AS Time), CAST(N'15:00:00' AS Time))
GO
INSERT [dbo].[Schedule] ([Id], [EmployeeId], [DayOfWeek], [StartWorkTime], [FinishWorkTime]) VALUES (121, 19, 1, CAST(N'10:00:00' AS Time), CAST(N'19:00:00' AS Time))
GO
INSERT [dbo].[Schedule] ([Id], [EmployeeId], [DayOfWeek], [StartWorkTime], [FinishWorkTime]) VALUES (122, 19, 2, CAST(N'09:00:00' AS Time), CAST(N'17:00:00' AS Time))
GO
INSERT [dbo].[Schedule] ([Id], [EmployeeId], [DayOfWeek], [StartWorkTime], [FinishWorkTime]) VALUES (123, 19, 3, CAST(N'06:00:00' AS Time), CAST(N'14:00:00' AS Time))
GO
INSERT [dbo].[Schedule] ([Id], [EmployeeId], [DayOfWeek], [StartWorkTime], [FinishWorkTime]) VALUES (124, 19, 6, CAST(N'09:00:00' AS Time), CAST(N'14:00:00' AS Time))
GO
INSERT [dbo].[Schedule] ([Id], [EmployeeId], [DayOfWeek], [StartWorkTime], [FinishWorkTime]) VALUES (125, 32, 1, CAST(N'08:00:00' AS Time), CAST(N'18:00:00' AS Time))
GO
INSERT [dbo].[Schedule] ([Id], [EmployeeId], [DayOfWeek], [StartWorkTime], [FinishWorkTime]) VALUES (126, 32, 2, CAST(N'09:00:00' AS Time), CAST(N'19:00:00' AS Time))
GO
INSERT [dbo].[Schedule] ([Id], [EmployeeId], [DayOfWeek], [StartWorkTime], [FinishWorkTime]) VALUES (127, 32, 3, CAST(N'07:00:00' AS Time), CAST(N'14:00:00' AS Time))
GO
INSERT [dbo].[Schedule] ([Id], [EmployeeId], [DayOfWeek], [StartWorkTime], [FinishWorkTime]) VALUES (128, 32, 4, CAST(N'08:00:00' AS Time), CAST(N'15:00:00' AS Time))
GO
INSERT [dbo].[Schedule] ([Id], [EmployeeId], [DayOfWeek], [StartWorkTime], [FinishWorkTime]) VALUES (129, 34, 1, CAST(N'09:00:00' AS Time), CAST(N'20:00:00' AS Time))
GO
INSERT [dbo].[Schedule] ([Id], [EmployeeId], [DayOfWeek], [StartWorkTime], [FinishWorkTime]) VALUES (130, 34, 2, CAST(N'07:00:00' AS Time), CAST(N'21:00:00' AS Time))
GO
INSERT [dbo].[Schedule] ([Id], [EmployeeId], [DayOfWeek], [StartWorkTime], [FinishWorkTime]) VALUES (131, 34, 3, CAST(N'06:00:00' AS Time), CAST(N'21:00:00' AS Time))
GO
INSERT [dbo].[Schedule] ([Id], [EmployeeId], [DayOfWeek], [StartWorkTime], [FinishWorkTime]) VALUES (132, 34, 5, CAST(N'07:00:00' AS Time), CAST(N'19:00:00' AS Time))
GO
INSERT [dbo].[Schedule] ([Id], [EmployeeId], [DayOfWeek], [StartWorkTime], [FinishWorkTime]) VALUES (133, 34, 6, CAST(N'06:00:00' AS Time), CAST(N'22:00:00' AS Time))
GO
INSERT [dbo].[Schedule] ([Id], [EmployeeId], [DayOfWeek], [StartWorkTime], [FinishWorkTime]) VALUES (134, 37, 1, CAST(N'10:00:00' AS Time), CAST(N'17:00:00' AS Time))
GO
INSERT [dbo].[Schedule] ([Id], [EmployeeId], [DayOfWeek], [StartWorkTime], [FinishWorkTime]) VALUES (135, 37, 3, CAST(N'10:00:00' AS Time), CAST(N'14:00:00' AS Time))
GO
INSERT [dbo].[Schedule] ([Id], [EmployeeId], [DayOfWeek], [StartWorkTime], [FinishWorkTime]) VALUES (136, 37, 4, CAST(N'09:00:00' AS Time), CAST(N'21:00:00' AS Time))
GO
INSERT [dbo].[Schedule] ([Id], [EmployeeId], [DayOfWeek], [StartWorkTime], [FinishWorkTime]) VALUES (137, 2, 1, CAST(N'07:00:00' AS Time), CAST(N'17:00:00' AS Time))
GO
INSERT [dbo].[Schedule] ([Id], [EmployeeId], [DayOfWeek], [StartWorkTime], [FinishWorkTime]) VALUES (138, 2, 2, CAST(N'10:00:00' AS Time), CAST(N'15:00:00' AS Time))
GO
INSERT [dbo].[Schedule] ([Id], [EmployeeId], [DayOfWeek], [StartWorkTime], [FinishWorkTime]) VALUES (139, 2, 3, CAST(N'10:00:00' AS Time), CAST(N'14:00:00' AS Time))
GO
INSERT [dbo].[Schedule] ([Id], [EmployeeId], [DayOfWeek], [StartWorkTime], [FinishWorkTime]) VALUES (140, 22, 0, CAST(N'07:00:00' AS Time), CAST(N'17:00:00' AS Time))
GO
INSERT [dbo].[Schedule] ([Id], [EmployeeId], [DayOfWeek], [StartWorkTime], [FinishWorkTime]) VALUES (141, 22, 1, CAST(N'08:00:00' AS Time), CAST(N'20:00:00' AS Time))
GO
INSERT [dbo].[Schedule] ([Id], [EmployeeId], [DayOfWeek], [StartWorkTime], [FinishWorkTime]) VALUES (142, 22, 2, CAST(N'10:00:00' AS Time), CAST(N'15:00:00' AS Time))
GO
INSERT [dbo].[Schedule] ([Id], [EmployeeId], [DayOfWeek], [StartWorkTime], [FinishWorkTime]) VALUES (143, 22, 3, CAST(N'10:00:00' AS Time), CAST(N'16:00:00' AS Time))
GO
INSERT [dbo].[Schedule] ([Id], [EmployeeId], [DayOfWeek], [StartWorkTime], [FinishWorkTime]) VALUES (144, 22, 4, CAST(N'09:00:00' AS Time), CAST(N'17:00:00' AS Time))
GO
INSERT [dbo].[Schedule] ([Id], [EmployeeId], [DayOfWeek], [StartWorkTime], [FinishWorkTime]) VALUES (145, 22, 5, CAST(N'09:00:00' AS Time), CAST(N'17:00:00' AS Time))
GO
INSERT [dbo].[Schedule] ([Id], [EmployeeId], [DayOfWeek], [StartWorkTime], [FinishWorkTime]) VALUES (146, 22, 6, CAST(N'08:00:00' AS Time), CAST(N'19:00:00' AS Time))
GO
INSERT [dbo].[Schedule] ([Id], [EmployeeId], [DayOfWeek], [StartWorkTime], [FinishWorkTime]) VALUES (147, 5, 1, CAST(N'07:00:00' AS Time), CAST(N'14:00:00' AS Time))
GO
INSERT [dbo].[Schedule] ([Id], [EmployeeId], [DayOfWeek], [StartWorkTime], [FinishWorkTime]) VALUES (148, 5, 4, CAST(N'08:00:00' AS Time), CAST(N'21:00:00' AS Time))
GO
INSERT [dbo].[Schedule] ([Id], [EmployeeId], [DayOfWeek], [StartWorkTime], [FinishWorkTime]) VALUES (149, 5, 5, CAST(N'10:00:00' AS Time), CAST(N'16:00:00' AS Time))
GO
INSERT [dbo].[Schedule] ([Id], [EmployeeId], [DayOfWeek], [StartWorkTime], [FinishWorkTime]) VALUES (150, 5, 6, CAST(N'08:00:00' AS Time), CAST(N'18:00:00' AS Time))
GO
INSERT [dbo].[Schedule] ([Id], [EmployeeId], [DayOfWeek], [StartWorkTime], [FinishWorkTime]) VALUES (151, 44, 2, CAST(N'07:00:00' AS Time), CAST(N'22:00:00' AS Time))
GO
INSERT [dbo].[Schedule] ([Id], [EmployeeId], [DayOfWeek], [StartWorkTime], [FinishWorkTime]) VALUES (152, 44, 5, CAST(N'10:00:00' AS Time), CAST(N'14:00:00' AS Time))
GO
INSERT [dbo].[Schedule] ([Id], [EmployeeId], [DayOfWeek], [StartWorkTime], [FinishWorkTime]) VALUES (153, 10, 0, CAST(N'06:00:00' AS Time), CAST(N'22:00:00' AS Time))
GO
INSERT [dbo].[Schedule] ([Id], [EmployeeId], [DayOfWeek], [StartWorkTime], [FinishWorkTime]) VALUES (154, 10, 1, CAST(N'07:00:00' AS Time), CAST(N'20:00:00' AS Time))
GO
INSERT [dbo].[Schedule] ([Id], [EmployeeId], [DayOfWeek], [StartWorkTime], [FinishWorkTime]) VALUES (155, 10, 2, CAST(N'06:00:00' AS Time), CAST(N'22:00:00' AS Time))
GO
INSERT [dbo].[Schedule] ([Id], [EmployeeId], [DayOfWeek], [StartWorkTime], [FinishWorkTime]) VALUES (156, 10, 4, CAST(N'07:00:00' AS Time), CAST(N'22:00:00' AS Time))
GO
INSERT [dbo].[Schedule] ([Id], [EmployeeId], [DayOfWeek], [StartWorkTime], [FinishWorkTime]) VALUES (157, 10, 6, CAST(N'07:00:00' AS Time), CAST(N'15:00:00' AS Time))
GO
INSERT [dbo].[Schedule] ([Id], [EmployeeId], [DayOfWeek], [StartWorkTime], [FinishWorkTime]) VALUES (158, 48, 0, CAST(N'08:00:00' AS Time), CAST(N'18:00:00' AS Time))
GO
INSERT [dbo].[Schedule] ([Id], [EmployeeId], [DayOfWeek], [StartWorkTime], [FinishWorkTime]) VALUES (159, 48, 1, CAST(N'09:00:00' AS Time), CAST(N'17:00:00' AS Time))
GO
INSERT [dbo].[Schedule] ([Id], [EmployeeId], [DayOfWeek], [StartWorkTime], [FinishWorkTime]) VALUES (160, 48, 3, CAST(N'09:00:00' AS Time), CAST(N'17:00:00' AS Time))
GO
INSERT [dbo].[Schedule] ([Id], [EmployeeId], [DayOfWeek], [StartWorkTime], [FinishWorkTime]) VALUES (161, 48, 4, CAST(N'06:00:00' AS Time), CAST(N'21:00:00' AS Time))
GO
INSERT [dbo].[Schedule] ([Id], [EmployeeId], [DayOfWeek], [StartWorkTime], [FinishWorkTime]) VALUES (162, 48, 5, CAST(N'10:00:00' AS Time), CAST(N'18:00:00' AS Time))
GO
INSERT [dbo].[Schedule] ([Id], [EmployeeId], [DayOfWeek], [StartWorkTime], [FinishWorkTime]) VALUES (163, 48, 6, CAST(N'07:00:00' AS Time), CAST(N'15:00:00' AS Time))
GO
INSERT [dbo].[Schedule] ([Id], [EmployeeId], [DayOfWeek], [StartWorkTime], [FinishWorkTime]) VALUES (164, 21, 0, CAST(N'06:00:00' AS Time), CAST(N'16:00:00' AS Time))
GO
INSERT [dbo].[Schedule] ([Id], [EmployeeId], [DayOfWeek], [StartWorkTime], [FinishWorkTime]) VALUES (165, 21, 2, CAST(N'08:00:00' AS Time), CAST(N'14:00:00' AS Time))
GO
INSERT [dbo].[Schedule] ([Id], [EmployeeId], [DayOfWeek], [StartWorkTime], [FinishWorkTime]) VALUES (166, 21, 3, CAST(N'08:00:00' AS Time), CAST(N'22:00:00' AS Time))
GO
INSERT [dbo].[Schedule] ([Id], [EmployeeId], [DayOfWeek], [StartWorkTime], [FinishWorkTime]) VALUES (167, 21, 5, CAST(N'08:00:00' AS Time), CAST(N'17:00:00' AS Time))
GO
INSERT [dbo].[Schedule] ([Id], [EmployeeId], [DayOfWeek], [StartWorkTime], [FinishWorkTime]) VALUES (168, 13, 1, CAST(N'09:00:00' AS Time), CAST(N'16:00:00' AS Time))
GO
INSERT [dbo].[Schedule] ([Id], [EmployeeId], [DayOfWeek], [StartWorkTime], [FinishWorkTime]) VALUES (169, 13, 4, CAST(N'10:00:00' AS Time), CAST(N'16:00:00' AS Time))
GO
INSERT [dbo].[Schedule] ([Id], [EmployeeId], [DayOfWeek], [StartWorkTime], [FinishWorkTime]) VALUES (170, 13, 5, CAST(N'10:00:00' AS Time), CAST(N'18:00:00' AS Time))
GO
INSERT [dbo].[Schedule] ([Id], [EmployeeId], [DayOfWeek], [StartWorkTime], [FinishWorkTime]) VALUES (171, 13, 6, CAST(N'07:00:00' AS Time), CAST(N'15:00:00' AS Time))
GO
INSERT [dbo].[Schedule] ([Id], [EmployeeId], [DayOfWeek], [StartWorkTime], [FinishWorkTime]) VALUES (172, 23, 0, CAST(N'07:00:00' AS Time), CAST(N'17:00:00' AS Time))
GO
INSERT [dbo].[Schedule] ([Id], [EmployeeId], [DayOfWeek], [StartWorkTime], [FinishWorkTime]) VALUES (173, 23, 2, CAST(N'06:00:00' AS Time), CAST(N'16:00:00' AS Time))
GO
INSERT [dbo].[Schedule] ([Id], [EmployeeId], [DayOfWeek], [StartWorkTime], [FinishWorkTime]) VALUES (174, 23, 4, CAST(N'09:00:00' AS Time), CAST(N'19:00:00' AS Time))
GO
INSERT [dbo].[Schedule] ([Id], [EmployeeId], [DayOfWeek], [StartWorkTime], [FinishWorkTime]) VALUES (175, 47, 1, CAST(N'09:00:00' AS Time), CAST(N'22:00:00' AS Time))
GO
INSERT [dbo].[Schedule] ([Id], [EmployeeId], [DayOfWeek], [StartWorkTime], [FinishWorkTime]) VALUES (176, 47, 4, CAST(N'07:00:00' AS Time), CAST(N'17:00:00' AS Time))
GO
INSERT [dbo].[Schedule] ([Id], [EmployeeId], [DayOfWeek], [StartWorkTime], [FinishWorkTime]) VALUES (177, 47, 6, CAST(N'07:00:00' AS Time), CAST(N'22:00:00' AS Time))
GO
INSERT [dbo].[Schedule] ([Id], [EmployeeId], [DayOfWeek], [StartWorkTime], [FinishWorkTime]) VALUES (178, 33, 1, CAST(N'06:00:00' AS Time), CAST(N'20:00:00' AS Time))
GO
INSERT [dbo].[Schedule] ([Id], [EmployeeId], [DayOfWeek], [StartWorkTime], [FinishWorkTime]) VALUES (179, 33, 2, CAST(N'10:00:00' AS Time), CAST(N'14:00:00' AS Time))
GO
INSERT [dbo].[Schedule] ([Id], [EmployeeId], [DayOfWeek], [StartWorkTime], [FinishWorkTime]) VALUES (180, 33, 3, CAST(N'07:00:00' AS Time), CAST(N'19:00:00' AS Time))
GO
INSERT [dbo].[Schedule] ([Id], [EmployeeId], [DayOfWeek], [StartWorkTime], [FinishWorkTime]) VALUES (181, 33, 5, CAST(N'06:00:00' AS Time), CAST(N'14:00:00' AS Time))
GO
INSERT [dbo].[Schedule] ([Id], [EmployeeId], [DayOfWeek], [StartWorkTime], [FinishWorkTime]) VALUES (182, 33, 6, CAST(N'10:00:00' AS Time), CAST(N'18:00:00' AS Time))
GO
INSERT [dbo].[Schedule] ([Id], [EmployeeId], [DayOfWeek], [StartWorkTime], [FinishWorkTime]) VALUES (183, 9, 1, CAST(N'07:00:00' AS Time), CAST(N'22:00:00' AS Time))
GO
INSERT [dbo].[Schedule] ([Id], [EmployeeId], [DayOfWeek], [StartWorkTime], [FinishWorkTime]) VALUES (184, 9, 2, CAST(N'09:00:00' AS Time), CAST(N'18:00:00' AS Time))
GO
INSERT [dbo].[Schedule] ([Id], [EmployeeId], [DayOfWeek], [StartWorkTime], [FinishWorkTime]) VALUES (185, 9, 3, CAST(N'08:00:00' AS Time), CAST(N'16:00:00' AS Time))
GO
INSERT [dbo].[Schedule] ([Id], [EmployeeId], [DayOfWeek], [StartWorkTime], [FinishWorkTime]) VALUES (186, 9, 4, CAST(N'10:00:00' AS Time), CAST(N'22:00:00' AS Time))
GO
INSERT [dbo].[Schedule] ([Id], [EmployeeId], [DayOfWeek], [StartWorkTime], [FinishWorkTime]) VALUES (187, 9, 6, CAST(N'07:00:00' AS Time), CAST(N'19:00:00' AS Time))
GO
INSERT [dbo].[Schedule] ([Id], [EmployeeId], [DayOfWeek], [StartWorkTime], [FinishWorkTime]) VALUES (188, 24, 0, CAST(N'07:00:00' AS Time), CAST(N'18:00:00' AS Time))
GO
INSERT [dbo].[Schedule] ([Id], [EmployeeId], [DayOfWeek], [StartWorkTime], [FinishWorkTime]) VALUES (189, 24, 2, CAST(N'10:00:00' AS Time), CAST(N'19:00:00' AS Time))
GO
INSERT [dbo].[Schedule] ([Id], [EmployeeId], [DayOfWeek], [StartWorkTime], [FinishWorkTime]) VALUES (190, 24, 3, CAST(N'08:00:00' AS Time), CAST(N'20:00:00' AS Time))
GO
INSERT [dbo].[Schedule] ([Id], [EmployeeId], [DayOfWeek], [StartWorkTime], [FinishWorkTime]) VALUES (191, 24, 5, CAST(N'09:00:00' AS Time), CAST(N'19:00:00' AS Time))
GO
INSERT [dbo].[Schedule] ([Id], [EmployeeId], [DayOfWeek], [StartWorkTime], [FinishWorkTime]) VALUES (192, 6, 0, CAST(N'10:00:00' AS Time), CAST(N'14:00:00' AS Time))
GO
INSERT [dbo].[Schedule] ([Id], [EmployeeId], [DayOfWeek], [StartWorkTime], [FinishWorkTime]) VALUES (193, 6, 1, CAST(N'07:00:00' AS Time), CAST(N'17:00:00' AS Time))
GO
INSERT [dbo].[Schedule] ([Id], [EmployeeId], [DayOfWeek], [StartWorkTime], [FinishWorkTime]) VALUES (194, 6, 2, CAST(N'10:00:00' AS Time), CAST(N'18:00:00' AS Time))
GO
INSERT [dbo].[Schedule] ([Id], [EmployeeId], [DayOfWeek], [StartWorkTime], [FinishWorkTime]) VALUES (195, 6, 4, CAST(N'07:00:00' AS Time), CAST(N'19:00:00' AS Time))
GO
INSERT [dbo].[Schedule] ([Id], [EmployeeId], [DayOfWeek], [StartWorkTime], [FinishWorkTime]) VALUES (196, 6, 5, CAST(N'10:00:00' AS Time), CAST(N'19:00:00' AS Time))
GO
INSERT [dbo].[Schedule] ([Id], [EmployeeId], [DayOfWeek], [StartWorkTime], [FinishWorkTime]) VALUES (197, 6, 6, CAST(N'08:00:00' AS Time), CAST(N'21:00:00' AS Time))
GO
INSERT [dbo].[Schedule] ([Id], [EmployeeId], [DayOfWeek], [StartWorkTime], [FinishWorkTime]) VALUES (198, 18, 0, CAST(N'09:00:00' AS Time), CAST(N'17:00:00' AS Time))
GO
INSERT [dbo].[Schedule] ([Id], [EmployeeId], [DayOfWeek], [StartWorkTime], [FinishWorkTime]) VALUES (199, 18, 2, CAST(N'10:00:00' AS Time), CAST(N'18:00:00' AS Time))
GO
INSERT [dbo].[Schedule] ([Id], [EmployeeId], [DayOfWeek], [StartWorkTime], [FinishWorkTime]) VALUES (200, 18, 3, CAST(N'09:00:00' AS Time), CAST(N'17:00:00' AS Time))
GO
INSERT [dbo].[Schedule] ([Id], [EmployeeId], [DayOfWeek], [StartWorkTime], [FinishWorkTime]) VALUES (201, 18, 4, CAST(N'06:00:00' AS Time), CAST(N'18:00:00' AS Time))
GO
INSERT [dbo].[Schedule] ([Id], [EmployeeId], [DayOfWeek], [StartWorkTime], [FinishWorkTime]) VALUES (202, 18, 5, CAST(N'06:00:00' AS Time), CAST(N'16:00:00' AS Time))
GO
INSERT [dbo].[Schedule] ([Id], [EmployeeId], [DayOfWeek], [StartWorkTime], [FinishWorkTime]) VALUES (203, 18, 6, CAST(N'06:00:00' AS Time), CAST(N'20:00:00' AS Time))
GO
INSERT [dbo].[Schedule] ([Id], [EmployeeId], [DayOfWeek], [StartWorkTime], [FinishWorkTime]) VALUES (204, 26, 0, CAST(N'08:00:00' AS Time), CAST(N'19:00:00' AS Time))
GO
INSERT [dbo].[Schedule] ([Id], [EmployeeId], [DayOfWeek], [StartWorkTime], [FinishWorkTime]) VALUES (205, 26, 1, CAST(N'07:00:00' AS Time), CAST(N'19:00:00' AS Time))
GO
INSERT [dbo].[Schedule] ([Id], [EmployeeId], [DayOfWeek], [StartWorkTime], [FinishWorkTime]) VALUES (206, 26, 2, CAST(N'09:00:00' AS Time), CAST(N'14:00:00' AS Time))
GO
INSERT [dbo].[Schedule] ([Id], [EmployeeId], [DayOfWeek], [StartWorkTime], [FinishWorkTime]) VALUES (207, 26, 3, CAST(N'10:00:00' AS Time), CAST(N'16:00:00' AS Time))
GO
INSERT [dbo].[Schedule] ([Id], [EmployeeId], [DayOfWeek], [StartWorkTime], [FinishWorkTime]) VALUES (208, 26, 4, CAST(N'06:00:00' AS Time), CAST(N'17:00:00' AS Time))
GO
INSERT [dbo].[Schedule] ([Id], [EmployeeId], [DayOfWeek], [StartWorkTime], [FinishWorkTime]) VALUES (209, 26, 5, CAST(N'09:00:00' AS Time), CAST(N'14:00:00' AS Time))
GO
INSERT [dbo].[Schedule] ([Id], [EmployeeId], [DayOfWeek], [StartWorkTime], [FinishWorkTime]) VALUES (210, 26, 6, CAST(N'09:00:00' AS Time), CAST(N'18:00:00' AS Time))
GO
INSERT [dbo].[Schedule] ([Id], [EmployeeId], [DayOfWeek], [StartWorkTime], [FinishWorkTime]) VALUES (211, 36, 1, CAST(N'10:00:00' AS Time), CAST(N'21:00:00' AS Time))
GO
INSERT [dbo].[Schedule] ([Id], [EmployeeId], [DayOfWeek], [StartWorkTime], [FinishWorkTime]) VALUES (212, 36, 2, CAST(N'10:00:00' AS Time), CAST(N'14:00:00' AS Time))
GO
INSERT [dbo].[Schedule] ([Id], [EmployeeId], [DayOfWeek], [StartWorkTime], [FinishWorkTime]) VALUES (213, 36, 4, CAST(N'10:00:00' AS Time), CAST(N'19:00:00' AS Time))
GO
INSERT [dbo].[Schedule] ([Id], [EmployeeId], [DayOfWeek], [StartWorkTime], [FinishWorkTime]) VALUES (214, 36, 5, CAST(N'10:00:00' AS Time), CAST(N'15:00:00' AS Time))
GO
INSERT [dbo].[Schedule] ([Id], [EmployeeId], [DayOfWeek], [StartWorkTime], [FinishWorkTime]) VALUES (215, 36, 6, CAST(N'09:00:00' AS Time), CAST(N'15:00:00' AS Time))
GO
INSERT [dbo].[Schedule] ([Id], [EmployeeId], [DayOfWeek], [StartWorkTime], [FinishWorkTime]) VALUES (216, 14, 0, CAST(N'08:00:00' AS Time), CAST(N'17:00:00' AS Time))
GO
INSERT [dbo].[Schedule] ([Id], [EmployeeId], [DayOfWeek], [StartWorkTime], [FinishWorkTime]) VALUES (217, 14, 1, CAST(N'06:00:00' AS Time), CAST(N'16:00:00' AS Time))
GO
INSERT [dbo].[Schedule] ([Id], [EmployeeId], [DayOfWeek], [StartWorkTime], [FinishWorkTime]) VALUES (218, 14, 3, CAST(N'07:00:00' AS Time), CAST(N'17:00:00' AS Time))
GO
INSERT [dbo].[Schedule] ([Id], [EmployeeId], [DayOfWeek], [StartWorkTime], [FinishWorkTime]) VALUES (219, 14, 5, CAST(N'06:00:00' AS Time), CAST(N'21:00:00' AS Time))
GO
INSERT [dbo].[Schedule] ([Id], [EmployeeId], [DayOfWeek], [StartWorkTime], [FinishWorkTime]) VALUES (220, 14, 6, CAST(N'06:00:00' AS Time), CAST(N'15:00:00' AS Time))
GO
SET IDENTITY_INSERT [dbo].[Schedule] OFF
GO
SET IDENTITY_INSERT [dbo].[Withdrawals] ON 
GO
INSERT [dbo].[Withdrawals] ([Id], [EmployeeId], [CreateDateTime], [Amount], [FinishedDateTime]) VALUES (2, 49, CAST(N'2022-09-06T16:22:46.0000000' AS DateTime2), CAST(1965.84 AS Decimal(10, 2)), NULL)
GO
INSERT [dbo].[Withdrawals] ([Id], [EmployeeId], [CreateDateTime], [Amount], [FinishedDateTime]) VALUES (3, 50, CAST(N'2022-09-06T16:23:04.0000000' AS DateTime2), CAST(2366.33 AS Decimal(10, 2)), NULL)
GO
SET IDENTITY_INSERT [dbo].[Withdrawals] OFF
GO
SET IDENTITY_INSERT [dbo].[WorkRequest] ON 
GO
INSERT [dbo].[WorkRequest] ([Id], [ClientId], [CreateTime], [EmployeeId], [FullfilledDate], [Address], [TaskDescription], [IsAccepted], [BeginWorkTime], [CompleteWorkTime], [WorkTypeId], [WithdrawalsId], [UserAssessment]) VALUES (1, 37, CAST(N'2022-06-01T06:31:08.0000000' AS DateTime2), 11, CAST(N'2022-06-08T00:00:00.0000000' AS DateTime2), N'7919 Market St. Peoria, IL 61604', NULL, 1, CAST(N'2022-06-08T09:44:30.0000000' AS DateTime2), CAST(N'2022-06-08T16:30:25.0000000' AS DateTime2), 19, NULL, 2)
GO
INSERT [dbo].[WorkRequest] ([Id], [ClientId], [CreateTime], [EmployeeId], [FullfilledDate], [Address], [TaskDescription], [IsAccepted], [BeginWorkTime], [CompleteWorkTime], [WorkTypeId], [WithdrawalsId], [UserAssessment]) VALUES (2, 45, CAST(N'2022-06-01T09:42:20.0000000' AS DateTime2), 16, CAST(N'2022-06-03T00:00:00.0000000' AS DateTime2), N'784 Whitemarsh Ave. Belleville, NJ 07109', NULL, 1, CAST(N'2022-06-03T09:28:35.0000000' AS DateTime2), CAST(N'2022-06-03T16:22:52.0000000' AS DateTime2), 30, NULL, 1)
GO
INSERT [dbo].[WorkRequest] ([Id], [ClientId], [CreateTime], [EmployeeId], [FullfilledDate], [Address], [TaskDescription], [IsAccepted], [BeginWorkTime], [CompleteWorkTime], [WorkTypeId], [WithdrawalsId], [UserAssessment]) VALUES (3, 21, CAST(N'2022-06-01T10:48:13.0000000' AS DateTime2), 31, CAST(N'2022-06-02T00:00:00.0000000' AS DateTime2), N'83 Marvon Dr. Decatur, GA 30030', NULL, 1, CAST(N'2022-06-02T10:09:25.0000000' AS DateTime2), CAST(N'2022-06-02T17:23:04.0000000' AS DateTime2), 32, NULL, 5)
GO
INSERT [dbo].[WorkRequest] ([Id], [ClientId], [CreateTime], [EmployeeId], [FullfilledDate], [Address], [TaskDescription], [IsAccepted], [BeginWorkTime], [CompleteWorkTime], [WorkTypeId], [WithdrawalsId], [UserAssessment]) VALUES (4, 46, CAST(N'2022-06-01T14:54:09.0000000' AS DateTime2), 26, CAST(N'2022-06-08T00:00:00.0000000' AS DateTime2), N'3 West Catherine Lane Ogden, UT 84404', NULL, 1, CAST(N'2022-06-08T09:21:20.0000000' AS DateTime2), CAST(N'2022-06-08T17:16:46.0000000' AS DateTime2), 10, NULL, 2)
GO
INSERT [dbo].[WorkRequest] ([Id], [ClientId], [CreateTime], [EmployeeId], [FullfilledDate], [Address], [TaskDescription], [IsAccepted], [BeginWorkTime], [CompleteWorkTime], [WorkTypeId], [WithdrawalsId], [UserAssessment]) VALUES (5, 52, CAST(N'2022-06-01T18:23:00.0000000' AS DateTime2), 37, CAST(N'2022-06-06T00:00:00.0000000' AS DateTime2), N'70 W. Inverness St. Crawfordsville, IN 47933', NULL, 1, CAST(N'2022-06-06T08:18:26.0000000' AS DateTime2), CAST(N'2022-06-06T19:14:39.0000000' AS DateTime2), 23, NULL, 2)
GO
INSERT [dbo].[WorkRequest] ([Id], [ClientId], [CreateTime], [EmployeeId], [FullfilledDate], [Address], [TaskDescription], [IsAccepted], [BeginWorkTime], [CompleteWorkTime], [WorkTypeId], [WithdrawalsId], [UserAssessment]) VALUES (6, 48, CAST(N'2022-06-02T11:58:59.0000000' AS DateTime2), 23, CAST(N'2022-06-04T00:00:00.0000000' AS DateTime2), N'123 SE. Lafayette Lane Malvern, PA 19355', NULL, 1, CAST(N'2022-06-04T10:28:09.0000000' AS DateTime2), CAST(N'2022-06-04T18:22:56.0000000' AS DateTime2), 22, NULL, 4)
GO
INSERT [dbo].[WorkRequest] ([Id], [ClientId], [CreateTime], [EmployeeId], [FullfilledDate], [Address], [TaskDescription], [IsAccepted], [BeginWorkTime], [CompleteWorkTime], [WorkTypeId], [WithdrawalsId], [UserAssessment]) VALUES (7, 31, CAST(N'2022-06-02T12:37:18.0000000' AS DateTime2), 36, CAST(N'2022-06-04T00:00:00.0000000' AS DateTime2), N'519 Oxford Lane Saint Johns, FL 32259', NULL, 1, CAST(N'2022-06-04T09:25:29.0000000' AS DateTime2), CAST(N'2022-06-04T19:10:43.0000000' AS DateTime2), 18, NULL, 5)
GO
INSERT [dbo].[WorkRequest] ([Id], [ClientId], [CreateTime], [EmployeeId], [FullfilledDate], [Address], [TaskDescription], [IsAccepted], [BeginWorkTime], [CompleteWorkTime], [WorkTypeId], [WithdrawalsId], [UserAssessment]) VALUES (8, 46, CAST(N'2022-06-03T10:14:54.0000000' AS DateTime2), 35, CAST(N'2022-06-09T00:00:00.0000000' AS DateTime2), N'87 Studebaker Street Tampa, FL 33604', NULL, 1, CAST(N'2022-06-09T10:12:57.0000000' AS DateTime2), CAST(N'2022-06-09T20:14:46.0000000' AS DateTime2), 24, NULL, 2)
GO
INSERT [dbo].[WorkRequest] ([Id], [ClientId], [CreateTime], [EmployeeId], [FullfilledDate], [Address], [TaskDescription], [IsAccepted], [BeginWorkTime], [CompleteWorkTime], [WorkTypeId], [WithdrawalsId], [UserAssessment]) VALUES (9, 27, CAST(N'2022-06-03T13:59:58.0000000' AS DateTime2), 28, CAST(N'2022-06-04T00:00:00.0000000' AS DateTime2), N'5 Henry Smith Road Brownsburg, IN 46112', NULL, 1, CAST(N'2022-06-04T09:48:20.0000000' AS DateTime2), CAST(N'2022-06-04T17:41:44.0000000' AS DateTime2), 24, NULL, 1)
GO
INSERT [dbo].[WorkRequest] ([Id], [ClientId], [CreateTime], [EmployeeId], [FullfilledDate], [Address], [TaskDescription], [IsAccepted], [BeginWorkTime], [CompleteWorkTime], [WorkTypeId], [WithdrawalsId], [UserAssessment]) VALUES (10, 5, CAST(N'2022-06-03T21:01:20.0000000' AS DateTime2), 12, CAST(N'2022-06-10T00:00:00.0000000' AS DateTime2), N'878 S. Sugar Court High Point, NC 27265', NULL, 1, CAST(N'2022-06-10T10:22:49.0000000' AS DateTime2), CAST(N'2022-06-10T18:14:21.0000000' AS DateTime2), 22, NULL, 3)
GO
INSERT [dbo].[WorkRequest] ([Id], [ClientId], [CreateTime], [EmployeeId], [FullfilledDate], [Address], [TaskDescription], [IsAccepted], [BeginWorkTime], [CompleteWorkTime], [WorkTypeId], [WithdrawalsId], [UserAssessment]) VALUES (11, 11, CAST(N'2022-06-04T06:31:53.0000000' AS DateTime2), 13, CAST(N'2022-06-09T00:00:00.0000000' AS DateTime2), N'63 Kingston Rd. Mcminnville, TN 37110', NULL, 1, CAST(N'2022-06-09T09:29:04.0000000' AS DateTime2), CAST(N'2022-06-09T17:36:33.0000000' AS DateTime2), 13, NULL, 1)
GO
INSERT [dbo].[WorkRequest] ([Id], [ClientId], [CreateTime], [EmployeeId], [FullfilledDate], [Address], [TaskDescription], [IsAccepted], [BeginWorkTime], [CompleteWorkTime], [WorkTypeId], [WithdrawalsId], [UserAssessment]) VALUES (12, 3, CAST(N'2022-06-04T13:10:12.0000000' AS DateTime2), 15, CAST(N'2022-06-08T00:00:00.0000000' AS DateTime2), N'193 Wentworth Avenue Havertown, PA 19083', NULL, 1, CAST(N'2022-06-08T08:16:53.0000000' AS DateTime2), CAST(N'2022-06-08T18:19:44.0000000' AS DateTime2), 10, NULL, 5)
GO
INSERT [dbo].[WorkRequest] ([Id], [ClientId], [CreateTime], [EmployeeId], [FullfilledDate], [Address], [TaskDescription], [IsAccepted], [BeginWorkTime], [CompleteWorkTime], [WorkTypeId], [WithdrawalsId], [UserAssessment]) VALUES (13, 54, CAST(N'2022-06-04T13:50:03.0000000' AS DateTime2), 26, CAST(N'2022-06-09T00:00:00.0000000' AS DateTime2), N'731 Rockcrest Ave. Rockville, MD 20850', NULL, 0, CAST(N'2022-06-09T10:00:00.0000000' AS DateTime2), CAST(N'2022-06-09T16:00:00.0000000' AS DateTime2), 28, NULL, NULL)
GO
INSERT [dbo].[WorkRequest] ([Id], [ClientId], [CreateTime], [EmployeeId], [FullfilledDate], [Address], [TaskDescription], [IsAccepted], [BeginWorkTime], [CompleteWorkTime], [WorkTypeId], [WithdrawalsId], [UserAssessment]) VALUES (14, 56, CAST(N'2022-06-04T17:01:14.0000000' AS DateTime2), 14, CAST(N'2022-06-05T00:00:00.0000000' AS DateTime2), N'288 Wakehurst Ave. Conway, SC 29526', NULL, 1, CAST(N'2022-06-05T09:57:14.0000000' AS DateTime2), CAST(N'2022-06-05T18:19:00.0000000' AS DateTime2), 14, NULL, 3)
GO
INSERT [dbo].[WorkRequest] ([Id], [ClientId], [CreateTime], [EmployeeId], [FullfilledDate], [Address], [TaskDescription], [IsAccepted], [BeginWorkTime], [CompleteWorkTime], [WorkTypeId], [WithdrawalsId], [UserAssessment]) VALUES (15, 2, CAST(N'2022-06-05T12:02:28.0000000' AS DateTime2), 16, CAST(N'2022-06-08T00:00:00.0000000' AS DateTime2), N'1 Meadow St. Ashland, OH 44805', NULL, 1, CAST(N'2022-06-08T09:25:32.0000000' AS DateTime2), CAST(N'2022-06-08T16:05:47.0000000' AS DateTime2), 19, NULL, 4)
GO
INSERT [dbo].[WorkRequest] ([Id], [ClientId], [CreateTime], [EmployeeId], [FullfilledDate], [Address], [TaskDescription], [IsAccepted], [BeginWorkTime], [CompleteWorkTime], [WorkTypeId], [WithdrawalsId], [UserAssessment]) VALUES (16, 57, CAST(N'2022-06-05T16:41:38.0000000' AS DateTime2), 39, CAST(N'2022-06-10T00:00:00.0000000' AS DateTime2), N'154 East Lantern Ave. Port Orange, FL 32127', NULL, 1, CAST(N'2022-06-10T09:15:59.0000000' AS DateTime2), CAST(N'2022-06-10T16:01:58.0000000' AS DateTime2), 14, NULL, 3)
GO
INSERT [dbo].[WorkRequest] ([Id], [ClientId], [CreateTime], [EmployeeId], [FullfilledDate], [Address], [TaskDescription], [IsAccepted], [BeginWorkTime], [CompleteWorkTime], [WorkTypeId], [WithdrawalsId], [UserAssessment]) VALUES (17, 55, CAST(N'2022-06-05T17:01:21.0000000' AS DateTime2), 37, CAST(N'2022-06-07T00:00:00.0000000' AS DateTime2), N'58 West Street Villa Park, IL 60181', NULL, 1, CAST(N'2022-06-07T10:03:18.0000000' AS DateTime2), CAST(N'2022-06-07T16:52:27.0000000' AS DateTime2), 15, NULL, 4)
GO
INSERT [dbo].[WorkRequest] ([Id], [ClientId], [CreateTime], [EmployeeId], [FullfilledDate], [Address], [TaskDescription], [IsAccepted], [BeginWorkTime], [CompleteWorkTime], [WorkTypeId], [WithdrawalsId], [UserAssessment]) VALUES (18, 54, CAST(N'2022-06-05T18:56:31.0000000' AS DateTime2), 23, CAST(N'2022-06-06T00:00:00.0000000' AS DateTime2), N'4 Manor Dr. Jamaica Plain, MA 02130', NULL, 1, CAST(N'2022-06-06T09:28:33.0000000' AS DateTime2), CAST(N'2022-06-06T15:46:21.0000000' AS DateTime2), 9, NULL, 1)
GO
INSERT [dbo].[WorkRequest] ([Id], [ClientId], [CreateTime], [EmployeeId], [FullfilledDate], [Address], [TaskDescription], [IsAccepted], [BeginWorkTime], [CompleteWorkTime], [WorkTypeId], [WithdrawalsId], [UserAssessment]) VALUES (19, 14, CAST(N'2022-06-06T18:45:42.0000000' AS DateTime2), 12, CAST(N'2022-06-13T00:00:00.0000000' AS DateTime2), N'858 Philmont Street Sanford, NC 27330', NULL, 1, CAST(N'2022-06-13T09:12:53.0000000' AS DateTime2), CAST(N'2022-06-13T18:44:28.0000000' AS DateTime2), 32, NULL, 1)
GO
INSERT [dbo].[WorkRequest] ([Id], [ClientId], [CreateTime], [EmployeeId], [FullfilledDate], [Address], [TaskDescription], [IsAccepted], [BeginWorkTime], [CompleteWorkTime], [WorkTypeId], [WithdrawalsId], [UserAssessment]) VALUES (20, 57, CAST(N'2022-06-07T06:07:39.0000000' AS DateTime2), 42, CAST(N'2022-06-14T00:00:00.0000000' AS DateTime2), N'536 Hall Street Basking Ridge, NJ 07920', NULL, 0, CAST(N'2022-06-14T10:00:00.0000000' AS DateTime2), CAST(N'2022-06-14T16:00:00.0000000' AS DateTime2), 17, NULL, NULL)
GO
INSERT [dbo].[WorkRequest] ([Id], [ClientId], [CreateTime], [EmployeeId], [FullfilledDate], [Address], [TaskDescription], [IsAccepted], [BeginWorkTime], [CompleteWorkTime], [WorkTypeId], [WithdrawalsId], [UserAssessment]) VALUES (21, 43, CAST(N'2022-06-07T07:30:01.0000000' AS DateTime2), 12, CAST(N'2022-06-08T00:00:00.0000000' AS DateTime2), N'8894 S. Wintergreen Street Ridgecrest, CA 93555', NULL, 1, CAST(N'2022-06-08T09:38:45.0000000' AS DateTime2), CAST(N'2022-06-08T20:23:15.0000000' AS DateTime2), 10, NULL, 2)
GO
INSERT [dbo].[WorkRequest] ([Id], [ClientId], [CreateTime], [EmployeeId], [FullfilledDate], [Address], [TaskDescription], [IsAccepted], [BeginWorkTime], [CompleteWorkTime], [WorkTypeId], [WithdrawalsId], [UserAssessment]) VALUES (22, 27, CAST(N'2022-06-07T07:47:26.0000000' AS DateTime2), 20, CAST(N'2022-06-09T00:00:00.0000000' AS DateTime2), N'883 El Dorado Ave. Rockaway, NJ 07866', NULL, 0, CAST(N'2022-06-09T10:00:00.0000000' AS DateTime2), CAST(N'2022-06-09T16:00:00.0000000' AS DateTime2), 28, NULL, NULL)
GO
INSERT [dbo].[WorkRequest] ([Id], [ClientId], [CreateTime], [EmployeeId], [FullfilledDate], [Address], [TaskDescription], [IsAccepted], [BeginWorkTime], [CompleteWorkTime], [WorkTypeId], [WithdrawalsId], [UserAssessment]) VALUES (23, 45, CAST(N'2022-06-07T14:55:52.0000000' AS DateTime2), 38, CAST(N'2022-06-14T00:00:00.0000000' AS DateTime2), N'17 Roosevelt Ave. Stroudsburg, PA 18360', NULL, 1, CAST(N'2022-06-14T10:05:07.0000000' AS DateTime2), CAST(N'2022-06-14T19:42:53.0000000' AS DateTime2), 8, NULL, 5)
GO
INSERT [dbo].[WorkRequest] ([Id], [ClientId], [CreateTime], [EmployeeId], [FullfilledDate], [Address], [TaskDescription], [IsAccepted], [BeginWorkTime], [CompleteWorkTime], [WorkTypeId], [WithdrawalsId], [UserAssessment]) VALUES (24, 29, CAST(N'2022-06-07T15:10:01.0000000' AS DateTime2), 17, CAST(N'2022-06-14T00:00:00.0000000' AS DateTime2), N'118 Shub Farm St. San Angelo, TX 76901', NULL, 0, CAST(N'2022-06-14T10:00:00.0000000' AS DateTime2), CAST(N'2022-06-14T16:00:00.0000000' AS DateTime2), 26, NULL, NULL)
GO
INSERT [dbo].[WorkRequest] ([Id], [ClientId], [CreateTime], [EmployeeId], [FullfilledDate], [Address], [TaskDescription], [IsAccepted], [BeginWorkTime], [CompleteWorkTime], [WorkTypeId], [WithdrawalsId], [UserAssessment]) VALUES (25, 2, CAST(N'2022-06-07T16:10:17.0000000' AS DateTime2), 18, CAST(N'2022-06-08T00:00:00.0000000' AS DateTime2), N'40 Windfall St. Port Washington, NY 11050', NULL, 1, CAST(N'2022-06-08T08:29:19.0000000' AS DateTime2), CAST(N'2022-06-08T16:54:41.0000000' AS DateTime2), 16, NULL, 1)
GO
INSERT [dbo].[WorkRequest] ([Id], [ClientId], [CreateTime], [EmployeeId], [FullfilledDate], [Address], [TaskDescription], [IsAccepted], [BeginWorkTime], [CompleteWorkTime], [WorkTypeId], [WithdrawalsId], [UserAssessment]) VALUES (26, 42, CAST(N'2022-06-07T20:39:03.0000000' AS DateTime2), 2, CAST(N'2022-06-09T00:00:00.0000000' AS DateTime2), N'9592 Marlborough Ave. Maryville, TN 37803', NULL, 1, CAST(N'2022-06-09T09:11:15.0000000' AS DateTime2), CAST(N'2022-06-09T15:54:44.0000000' AS DateTime2), 21, NULL, 1)
GO
INSERT [dbo].[WorkRequest] ([Id], [ClientId], [CreateTime], [EmployeeId], [FullfilledDate], [Address], [TaskDescription], [IsAccepted], [BeginWorkTime], [CompleteWorkTime], [WorkTypeId], [WithdrawalsId], [UserAssessment]) VALUES (27, 40, CAST(N'2022-06-08T06:34:52.0000000' AS DateTime2), 5, CAST(N'2022-06-15T00:00:00.0000000' AS DateTime2), N'182 Sheffield Street Avon, IN 46123', NULL, 0, CAST(N'2022-06-15T10:00:00.0000000' AS DateTime2), CAST(N'2022-06-15T16:00:00.0000000' AS DateTime2), 28, NULL, NULL)
GO
INSERT [dbo].[WorkRequest] ([Id], [ClientId], [CreateTime], [EmployeeId], [FullfilledDate], [Address], [TaskDescription], [IsAccepted], [BeginWorkTime], [CompleteWorkTime], [WorkTypeId], [WithdrawalsId], [UserAssessment]) VALUES (28, 53, CAST(N'2022-06-08T07:10:27.0000000' AS DateTime2), 4, CAST(N'2022-06-14T00:00:00.0000000' AS DateTime2), N'8984 Bay Lane Bradenton, FL 34203', NULL, 1, CAST(N'2022-06-14T09:58:18.0000000' AS DateTime2), CAST(N'2022-06-14T19:19:38.0000000' AS DateTime2), 13, NULL, 2)
GO
INSERT [dbo].[WorkRequest] ([Id], [ClientId], [CreateTime], [EmployeeId], [FullfilledDate], [Address], [TaskDescription], [IsAccepted], [BeginWorkTime], [CompleteWorkTime], [WorkTypeId], [WithdrawalsId], [UserAssessment]) VALUES (29, 44, CAST(N'2022-06-08T10:00:56.0000000' AS DateTime2), 43, CAST(N'2022-06-10T00:00:00.0000000' AS DateTime2), N'991 North Adams Circle Bethlehem, PA 18015', NULL, 1, CAST(N'2022-06-10T09:17:45.0000000' AS DateTime2), CAST(N'2022-06-10T17:24:01.0000000' AS DateTime2), 19, NULL, 5)
GO
INSERT [dbo].[WorkRequest] ([Id], [ClientId], [CreateTime], [EmployeeId], [FullfilledDate], [Address], [TaskDescription], [IsAccepted], [BeginWorkTime], [CompleteWorkTime], [WorkTypeId], [WithdrawalsId], [UserAssessment]) VALUES (30, 43, CAST(N'2022-06-08T15:57:59.0000000' AS DateTime2), 48, CAST(N'2022-06-13T00:00:00.0000000' AS DateTime2), N'19 Miles St. Halethorpe, MD 21227', NULL, 1, CAST(N'2022-06-13T08:33:54.0000000' AS DateTime2), CAST(N'2022-06-13T19:31:08.0000000' AS DateTime2), 20, NULL, 2)
GO
INSERT [dbo].[WorkRequest] ([Id], [ClientId], [CreateTime], [EmployeeId], [FullfilledDate], [Address], [TaskDescription], [IsAccepted], [BeginWorkTime], [CompleteWorkTime], [WorkTypeId], [WithdrawalsId], [UserAssessment]) VALUES (31, 45, CAST(N'2022-06-08T16:21:17.0000000' AS DateTime2), 5, CAST(N'2022-06-12T00:00:00.0000000' AS DateTime2), N'9384 Bow Ridge Ave. Baton Rouge, LA 70806', NULL, 1, CAST(N'2022-06-12T09:26:14.0000000' AS DateTime2), CAST(N'2022-06-12T19:23:40.0000000' AS DateTime2), 17, NULL, 3)
GO
INSERT [dbo].[WorkRequest] ([Id], [ClientId], [CreateTime], [EmployeeId], [FullfilledDate], [Address], [TaskDescription], [IsAccepted], [BeginWorkTime], [CompleteWorkTime], [WorkTypeId], [WithdrawalsId], [UserAssessment]) VALUES (32, 2, CAST(N'2022-06-08T17:57:42.0000000' AS DateTime2), 18, CAST(N'2022-06-13T00:00:00.0000000' AS DateTime2), N'49 Ivy Lane Chesapeake, VA 23320', NULL, 0, CAST(N'2022-06-13T10:00:00.0000000' AS DateTime2), CAST(N'2022-06-13T16:00:00.0000000' AS DateTime2), 31, NULL, NULL)
GO
INSERT [dbo].[WorkRequest] ([Id], [ClientId], [CreateTime], [EmployeeId], [FullfilledDate], [Address], [TaskDescription], [IsAccepted], [BeginWorkTime], [CompleteWorkTime], [WorkTypeId], [WithdrawalsId], [UserAssessment]) VALUES (33, 57, CAST(N'2022-06-08T18:46:11.0000000' AS DateTime2), 26, CAST(N'2022-06-09T00:00:00.0000000' AS DateTime2), N'4 Mulberry Ave. Long Branch, NJ 07740', NULL, 1, CAST(N'2022-06-09T08:29:28.0000000' AS DateTime2), CAST(N'2022-06-09T17:54:56.0000000' AS DateTime2), 21, NULL, 2)
GO
INSERT [dbo].[WorkRequest] ([Id], [ClientId], [CreateTime], [EmployeeId], [FullfilledDate], [Address], [TaskDescription], [IsAccepted], [BeginWorkTime], [CompleteWorkTime], [WorkTypeId], [WithdrawalsId], [UserAssessment]) VALUES (34, 47, CAST(N'2022-06-09T07:05:42.0000000' AS DateTime2), 32, CAST(N'2022-06-12T00:00:00.0000000' AS DateTime2), N'205 West River Ave. Goshen, IN 46526', NULL, 0, CAST(N'2022-06-12T10:00:00.0000000' AS DateTime2), CAST(N'2022-06-12T16:00:00.0000000' AS DateTime2), 29, NULL, NULL)
GO
INSERT [dbo].[WorkRequest] ([Id], [ClientId], [CreateTime], [EmployeeId], [FullfilledDate], [Address], [TaskDescription], [IsAccepted], [BeginWorkTime], [CompleteWorkTime], [WorkTypeId], [WithdrawalsId], [UserAssessment]) VALUES (35, 22, CAST(N'2022-06-09T08:33:11.0000000' AS DateTime2), 34, CAST(N'2022-06-10T00:00:00.0000000' AS DateTime2), N'8250 Fremont St. Union, NJ 07083', NULL, 1, CAST(N'2022-06-10T08:38:40.0000000' AS DateTime2), CAST(N'2022-06-10T16:23:42.0000000' AS DateTime2), 8, NULL, 2)
GO
INSERT [dbo].[WorkRequest] ([Id], [ClientId], [CreateTime], [EmployeeId], [FullfilledDate], [Address], [TaskDescription], [IsAccepted], [BeginWorkTime], [CompleteWorkTime], [WorkTypeId], [WithdrawalsId], [UserAssessment]) VALUES (36, 14, CAST(N'2022-06-09T13:19:12.0000000' AS DateTime2), 11, CAST(N'2022-06-14T00:00:00.0000000' AS DateTime2), N'8799 Homestead Drive Carmel, NY 10512', NULL, 1, CAST(N'2022-06-14T09:44:54.0000000' AS DateTime2), CAST(N'2022-06-14T18:43:42.0000000' AS DateTime2), 10, NULL, 2)
GO
INSERT [dbo].[WorkRequest] ([Id], [ClientId], [CreateTime], [EmployeeId], [FullfilledDate], [Address], [TaskDescription], [IsAccepted], [BeginWorkTime], [CompleteWorkTime], [WorkTypeId], [WithdrawalsId], [UserAssessment]) VALUES (37, 5, CAST(N'2022-06-09T17:48:13.0000000' AS DateTime2), 47, CAST(N'2022-06-15T00:00:00.0000000' AS DateTime2), N'9609 Goldfield Dr. Little Falls, NJ 07424', NULL, 1, CAST(N'2022-06-15T09:48:30.0000000' AS DateTime2), CAST(N'2022-06-15T18:27:23.0000000' AS DateTime2), 22, NULL, 3)
GO
INSERT [dbo].[WorkRequest] ([Id], [ClientId], [CreateTime], [EmployeeId], [FullfilledDate], [Address], [TaskDescription], [IsAccepted], [BeginWorkTime], [CompleteWorkTime], [WorkTypeId], [WithdrawalsId], [UserAssessment]) VALUES (38, 12, CAST(N'2022-06-09T19:20:48.0000000' AS DateTime2), 46, CAST(N'2022-06-12T00:00:00.0000000' AS DateTime2), N'7968 South Brookside Road Natchez, MS 39120', NULL, 1, CAST(N'2022-06-12T09:17:51.0000000' AS DateTime2), CAST(N'2022-06-12T15:35:52.0000000' AS DateTime2), 21, NULL, 3)
GO
INSERT [dbo].[WorkRequest] ([Id], [ClientId], [CreateTime], [EmployeeId], [FullfilledDate], [Address], [TaskDescription], [IsAccepted], [BeginWorkTime], [CompleteWorkTime], [WorkTypeId], [WithdrawalsId], [UserAssessment]) VALUES (39, 54, CAST(N'2022-06-10T09:09:08.0000000' AS DateTime2), 25, CAST(N'2022-06-14T00:00:00.0000000' AS DateTime2), N'9282 Tailwater St. Elizabethton, TN 37643', NULL, 1, CAST(N'2022-06-14T09:03:46.0000000' AS DateTime2), CAST(N'2022-06-14T18:37:09.0000000' AS DateTime2), 14, NULL, 1)
GO
INSERT [dbo].[WorkRequest] ([Id], [ClientId], [CreateTime], [EmployeeId], [FullfilledDate], [Address], [TaskDescription], [IsAccepted], [BeginWorkTime], [CompleteWorkTime], [WorkTypeId], [WithdrawalsId], [UserAssessment]) VALUES (40, 44, CAST(N'2022-06-10T15:29:07.0000000' AS DateTime2), 26, CAST(N'2022-06-16T00:00:00.0000000' AS DateTime2), N'740 Tunnel Ave. Corpus Christi, TX 78418', NULL, 1, CAST(N'2022-06-16T09:25:15.0000000' AS DateTime2), CAST(N'2022-06-16T20:18:11.0000000' AS DateTime2), 19, NULL, 1)
GO
INSERT [dbo].[WorkRequest] ([Id], [ClientId], [CreateTime], [EmployeeId], [FullfilledDate], [Address], [TaskDescription], [IsAccepted], [BeginWorkTime], [CompleteWorkTime], [WorkTypeId], [WithdrawalsId], [UserAssessment]) VALUES (41, 21, CAST(N'2022-06-10T16:01:49.0000000' AS DateTime2), 31, CAST(N'2022-06-16T00:00:00.0000000' AS DateTime2), N'348 Amherst Drive Fort Walton Beach, FL 32547', NULL, 0, CAST(N'2022-06-16T10:00:00.0000000' AS DateTime2), CAST(N'2022-06-16T16:00:00.0000000' AS DateTime2), 11, NULL, NULL)
GO
INSERT [dbo].[WorkRequest] ([Id], [ClientId], [CreateTime], [EmployeeId], [FullfilledDate], [Address], [TaskDescription], [IsAccepted], [BeginWorkTime], [CompleteWorkTime], [WorkTypeId], [WithdrawalsId], [UserAssessment]) VALUES (42, 6, CAST(N'2022-06-10T18:46:31.0000000' AS DateTime2), 50, CAST(N'2022-06-17T00:00:00.0000000' AS DateTime2), N'4 East Jockey Hollow St. Oak Creek, WI 53154', NULL, 1, CAST(N'2022-06-17T09:25:00.0000000' AS DateTime2), CAST(N'2022-06-17T19:39:28.0000000' AS DateTime2), 25, 3, 1)
GO
INSERT [dbo].[WorkRequest] ([Id], [ClientId], [CreateTime], [EmployeeId], [FullfilledDate], [Address], [TaskDescription], [IsAccepted], [BeginWorkTime], [CompleteWorkTime], [WorkTypeId], [WithdrawalsId], [UserAssessment]) VALUES (43, 35, CAST(N'2022-06-11T07:14:32.0000000' AS DateTime2), 27, CAST(N'2022-06-14T00:00:00.0000000' AS DateTime2), N'69 Yukon St. Staunton, VA 24401', NULL, 1, CAST(N'2022-06-14T08:19:15.0000000' AS DateTime2), CAST(N'2022-06-14T16:52:49.0000000' AS DateTime2), 14, NULL, 2)
GO
INSERT [dbo].[WorkRequest] ([Id], [ClientId], [CreateTime], [EmployeeId], [FullfilledDate], [Address], [TaskDescription], [IsAccepted], [BeginWorkTime], [CompleteWorkTime], [WorkTypeId], [WithdrawalsId], [UserAssessment]) VALUES (44, 20, CAST(N'2022-06-11T11:21:40.0000000' AS DateTime2), 39, CAST(N'2022-06-14T00:00:00.0000000' AS DateTime2), N'77 8th St. Cambridge, MA 02138', NULL, 1, CAST(N'2022-06-14T10:21:14.0000000' AS DateTime2), CAST(N'2022-06-14T15:55:40.0000000' AS DateTime2), 8, NULL, 4)
GO
INSERT [dbo].[WorkRequest] ([Id], [ClientId], [CreateTime], [EmployeeId], [FullfilledDate], [Address], [TaskDescription], [IsAccepted], [BeginWorkTime], [CompleteWorkTime], [WorkTypeId], [WithdrawalsId], [UserAssessment]) VALUES (45, 32, CAST(N'2022-06-11T13:51:46.0000000' AS DateTime2), 35, CAST(N'2022-06-18T00:00:00.0000000' AS DateTime2), N'9606 Bay Meadows Lane Grosse Pointe, MI 48236', NULL, 1, CAST(N'2022-06-18T08:48:26.0000000' AS DateTime2), CAST(N'2022-06-18T19:29:56.0000000' AS DateTime2), 28, NULL, 3)
GO
INSERT [dbo].[WorkRequest] ([Id], [ClientId], [CreateTime], [EmployeeId], [FullfilledDate], [Address], [TaskDescription], [IsAccepted], [BeginWorkTime], [CompleteWorkTime], [WorkTypeId], [WithdrawalsId], [UserAssessment]) VALUES (46, 60, CAST(N'2022-06-11T20:34:48.0000000' AS DateTime2), 45, CAST(N'2022-06-15T00:00:00.0000000' AS DateTime2), N'15 University Street Wooster, OH 44691', NULL, 1, CAST(N'2022-06-15T09:58:29.0000000' AS DateTime2), CAST(N'2022-06-15T18:12:38.0000000' AS DateTime2), 13, NULL, 1)
GO
INSERT [dbo].[WorkRequest] ([Id], [ClientId], [CreateTime], [EmployeeId], [FullfilledDate], [Address], [TaskDescription], [IsAccepted], [BeginWorkTime], [CompleteWorkTime], [WorkTypeId], [WithdrawalsId], [UserAssessment]) VALUES (47, 48, CAST(N'2022-06-12T20:23:46.0000000' AS DateTime2), 38, CAST(N'2022-06-13T00:00:00.0000000' AS DateTime2), N'344 William Drive Dyersburg, TN 38024', NULL, 1, CAST(N'2022-06-13T10:27:05.0000000' AS DateTime2), CAST(N'2022-06-13T17:33:24.0000000' AS DateTime2), 31, NULL, 4)
GO
INSERT [dbo].[WorkRequest] ([Id], [ClientId], [CreateTime], [EmployeeId], [FullfilledDate], [Address], [TaskDescription], [IsAccepted], [BeginWorkTime], [CompleteWorkTime], [WorkTypeId], [WithdrawalsId], [UserAssessment]) VALUES (48, 52, CAST(N'2022-06-13T19:22:53.0000000' AS DateTime2), 26, CAST(N'2022-06-20T00:00:00.0000000' AS DateTime2), N'167 Silver Spear Drive Clearwater, FL 33756', NULL, 1, CAST(N'2022-06-20T09:20:01.0000000' AS DateTime2), CAST(N'2022-06-20T18:09:04.0000000' AS DateTime2), 13, NULL, 5)
GO
INSERT [dbo].[WorkRequest] ([Id], [ClientId], [CreateTime], [EmployeeId], [FullfilledDate], [Address], [TaskDescription], [IsAccepted], [BeginWorkTime], [CompleteWorkTime], [WorkTypeId], [WithdrawalsId], [UserAssessment]) VALUES (49, 25, CAST(N'2022-06-14T14:26:47.0000000' AS DateTime2), 28, CAST(N'2022-06-15T00:00:00.0000000' AS DateTime2), N'387 Holly St. Cuyahoga Falls, OH 44221', NULL, 0, CAST(N'2022-06-15T10:00:00.0000000' AS DateTime2), CAST(N'2022-06-15T16:00:00.0000000' AS DateTime2), 11, NULL, NULL)
GO
INSERT [dbo].[WorkRequest] ([Id], [ClientId], [CreateTime], [EmployeeId], [FullfilledDate], [Address], [TaskDescription], [IsAccepted], [BeginWorkTime], [CompleteWorkTime], [WorkTypeId], [WithdrawalsId], [UserAssessment]) VALUES (50, 10, CAST(N'2022-06-14T16:58:42.0000000' AS DateTime2), 37, CAST(N'2022-06-21T00:00:00.0000000' AS DateTime2), N'8238 W. Market St. Norwich, CT 06360', NULL, 1, CAST(N'2022-06-21T09:48:49.0000000' AS DateTime2), CAST(N'2022-06-21T17:35:10.0000000' AS DateTime2), 32, NULL, 1)
GO
INSERT [dbo].[WorkRequest] ([Id], [ClientId], [CreateTime], [EmployeeId], [FullfilledDate], [Address], [TaskDescription], [IsAccepted], [BeginWorkTime], [CompleteWorkTime], [WorkTypeId], [WithdrawalsId], [UserAssessment]) VALUES (51, 13, CAST(N'2022-06-14T19:32:53.0000000' AS DateTime2), 47, CAST(N'2022-06-19T00:00:00.0000000' AS DateTime2), N'474 Cypress Drive Lowell, MA 01851', NULL, 1, CAST(N'2022-06-19T08:04:03.0000000' AS DateTime2), CAST(N'2022-06-19T18:28:37.0000000' AS DateTime2), 18, NULL, 3)
GO
INSERT [dbo].[WorkRequest] ([Id], [ClientId], [CreateTime], [EmployeeId], [FullfilledDate], [Address], [TaskDescription], [IsAccepted], [BeginWorkTime], [CompleteWorkTime], [WorkTypeId], [WithdrawalsId], [UserAssessment]) VALUES (52, 36, CAST(N'2022-06-15T12:06:37.0000000' AS DateTime2), 28, CAST(N'2022-06-21T00:00:00.0000000' AS DateTime2), N'86 Broad Ave. New Haven, CT 06511', NULL, 0, CAST(N'2022-06-21T10:00:00.0000000' AS DateTime2), CAST(N'2022-06-21T16:00:00.0000000' AS DateTime2), 7, NULL, NULL)
GO
INSERT [dbo].[WorkRequest] ([Id], [ClientId], [CreateTime], [EmployeeId], [FullfilledDate], [Address], [TaskDescription], [IsAccepted], [BeginWorkTime], [CompleteWorkTime], [WorkTypeId], [WithdrawalsId], [UserAssessment]) VALUES (53, 48, CAST(N'2022-06-15T12:26:06.0000000' AS DateTime2), 36, CAST(N'2022-06-16T00:00:00.0000000' AS DateTime2), N'499 Summit Ave. Toms River, NJ 08753', NULL, 0, CAST(N'2022-06-16T10:00:00.0000000' AS DateTime2), CAST(N'2022-06-16T16:00:00.0000000' AS DateTime2), 30, NULL, NULL)
GO
INSERT [dbo].[WorkRequest] ([Id], [ClientId], [CreateTime], [EmployeeId], [FullfilledDate], [Address], [TaskDescription], [IsAccepted], [BeginWorkTime], [CompleteWorkTime], [WorkTypeId], [WithdrawalsId], [UserAssessment]) VALUES (54, 5, CAST(N'2022-06-15T12:41:36.0000000' AS DateTime2), 15, CAST(N'2022-06-17T00:00:00.0000000' AS DateTime2), N'7856 Old Williams St. Elkton, MD 21921', NULL, 1, CAST(N'2022-06-17T10:23:51.0000000' AS DateTime2), CAST(N'2022-06-17T19:07:35.0000000' AS DateTime2), 31, NULL, 1)
GO
INSERT [dbo].[WorkRequest] ([Id], [ClientId], [CreateTime], [EmployeeId], [FullfilledDate], [Address], [TaskDescription], [IsAccepted], [BeginWorkTime], [CompleteWorkTime], [WorkTypeId], [WithdrawalsId], [UserAssessment]) VALUES (55, 60, CAST(N'2022-06-15T16:31:17.0000000' AS DateTime2), 18, CAST(N'2022-06-22T00:00:00.0000000' AS DateTime2), N'96 Mill Pond St. Edison, NJ 08817', NULL, 1, CAST(N'2022-06-22T09:47:03.0000000' AS DateTime2), CAST(N'2022-06-22T19:42:07.0000000' AS DateTime2), 16, NULL, 4)
GO
INSERT [dbo].[WorkRequest] ([Id], [ClientId], [CreateTime], [EmployeeId], [FullfilledDate], [Address], [TaskDescription], [IsAccepted], [BeginWorkTime], [CompleteWorkTime], [WorkTypeId], [WithdrawalsId], [UserAssessment]) VALUES (56, 41, CAST(N'2022-06-16T12:06:06.0000000' AS DateTime2), 46, CAST(N'2022-06-22T00:00:00.0000000' AS DateTime2), N'7 Country St. Braintree, MA 02184', NULL, 0, CAST(N'2022-06-22T10:00:00.0000000' AS DateTime2), CAST(N'2022-06-22T16:00:00.0000000' AS DateTime2), 29, NULL, NULL)
GO
INSERT [dbo].[WorkRequest] ([Id], [ClientId], [CreateTime], [EmployeeId], [FullfilledDate], [Address], [TaskDescription], [IsAccepted], [BeginWorkTime], [CompleteWorkTime], [WorkTypeId], [WithdrawalsId], [UserAssessment]) VALUES (57, 18, CAST(N'2022-06-16T15:42:33.0000000' AS DateTime2), 5, CAST(N'2022-06-23T00:00:00.0000000' AS DateTime2), N'656 Brewery Ave. Blacksburg, VA 24060', NULL, 0, CAST(N'2022-06-23T10:00:00.0000000' AS DateTime2), CAST(N'2022-06-23T16:00:00.0000000' AS DateTime2), 30, NULL, NULL)
GO
INSERT [dbo].[WorkRequest] ([Id], [ClientId], [CreateTime], [EmployeeId], [FullfilledDate], [Address], [TaskDescription], [IsAccepted], [BeginWorkTime], [CompleteWorkTime], [WorkTypeId], [WithdrawalsId], [UserAssessment]) VALUES (58, 40, CAST(N'2022-06-16T19:07:01.0000000' AS DateTime2), 45, CAST(N'2022-06-21T00:00:00.0000000' AS DateTime2), N'8055 Pennsylvania St. Apopka, FL 32703', NULL, 1, CAST(N'2022-06-21T09:43:44.0000000' AS DateTime2), CAST(N'2022-06-21T15:07:48.0000000' AS DateTime2), 12, NULL, 3)
GO
INSERT [dbo].[WorkRequest] ([Id], [ClientId], [CreateTime], [EmployeeId], [FullfilledDate], [Address], [TaskDescription], [IsAccepted], [BeginWorkTime], [CompleteWorkTime], [WorkTypeId], [WithdrawalsId], [UserAssessment]) VALUES (59, 58, CAST(N'2022-06-17T06:33:44.0000000' AS DateTime2), 6, CAST(N'2022-06-20T00:00:00.0000000' AS DateTime2), N'30 Monroe Street Bemidji, MN 56601', NULL, 1, CAST(N'2022-06-20T08:47:31.0000000' AS DateTime2), CAST(N'2022-06-20T18:02:40.0000000' AS DateTime2), 27, NULL, 1)
GO
INSERT [dbo].[WorkRequest] ([Id], [ClientId], [CreateTime], [EmployeeId], [FullfilledDate], [Address], [TaskDescription], [IsAccepted], [BeginWorkTime], [CompleteWorkTime], [WorkTypeId], [WithdrawalsId], [UserAssessment]) VALUES (60, 15, CAST(N'2022-06-17T18:56:30.0000000' AS DateTime2), 24, CAST(N'2022-06-22T00:00:00.0000000' AS DateTime2), N'990 Henry Lane Waxhaw, NC 28173', NULL, 1, CAST(N'2022-06-22T09:16:23.0000000' AS DateTime2), CAST(N'2022-06-22T18:49:57.0000000' AS DateTime2), 31, NULL, 2)
GO
INSERT [dbo].[WorkRequest] ([Id], [ClientId], [CreateTime], [EmployeeId], [FullfilledDate], [Address], [TaskDescription], [IsAccepted], [BeginWorkTime], [CompleteWorkTime], [WorkTypeId], [WithdrawalsId], [UserAssessment]) VALUES (61, 13, CAST(N'2022-06-17T20:40:52.0000000' AS DateTime2), 29, CAST(N'2022-06-23T00:00:00.0000000' AS DateTime2), N'537 Bay St. Hamden, CT 06514', NULL, 1, CAST(N'2022-06-23T09:29:24.0000000' AS DateTime2), CAST(N'2022-06-23T19:31:44.0000000' AS DateTime2), 30, NULL, 3)
GO
INSERT [dbo].[WorkRequest] ([Id], [ClientId], [CreateTime], [EmployeeId], [FullfilledDate], [Address], [TaskDescription], [IsAccepted], [BeginWorkTime], [CompleteWorkTime], [WorkTypeId], [WithdrawalsId], [UserAssessment]) VALUES (62, 32, CAST(N'2022-06-17T21:01:58.0000000' AS DateTime2), 37, CAST(N'2022-06-22T00:00:00.0000000' AS DateTime2), N'84 Roosevelt Drive Warminster, PA 18974', NULL, 0, CAST(N'2022-06-22T10:00:00.0000000' AS DateTime2), CAST(N'2022-06-22T16:00:00.0000000' AS DateTime2), 29, NULL, NULL)
GO
INSERT [dbo].[WorkRequest] ([Id], [ClientId], [CreateTime], [EmployeeId], [FullfilledDate], [Address], [TaskDescription], [IsAccepted], [BeginWorkTime], [CompleteWorkTime], [WorkTypeId], [WithdrawalsId], [UserAssessment]) VALUES (63, 24, CAST(N'2022-06-17T21:33:49.0000000' AS DateTime2), 21, CAST(N'2022-06-23T00:00:00.0000000' AS DateTime2), N'227 Chapel Ave. Bloomfield, NJ 07003', NULL, 1, CAST(N'2022-06-23T09:07:51.0000000' AS DateTime2), CAST(N'2022-06-23T15:08:52.0000000' AS DateTime2), 32, NULL, 4)
GO
INSERT [dbo].[WorkRequest] ([Id], [ClientId], [CreateTime], [EmployeeId], [FullfilledDate], [Address], [TaskDescription], [IsAccepted], [BeginWorkTime], [CompleteWorkTime], [WorkTypeId], [WithdrawalsId], [UserAssessment]) VALUES (64, 50, CAST(N'2022-06-18T09:27:15.0000000' AS DateTime2), 35, CAST(N'2022-06-20T00:00:00.0000000' AS DateTime2), N'76 Livingston Rd. Forney, TX 75126', NULL, 1, CAST(N'2022-06-20T09:11:02.0000000' AS DateTime2), CAST(N'2022-06-20T18:39:08.0000000' AS DateTime2), 10, NULL, 4)
GO
INSERT [dbo].[WorkRequest] ([Id], [ClientId], [CreateTime], [EmployeeId], [FullfilledDate], [Address], [TaskDescription], [IsAccepted], [BeginWorkTime], [CompleteWorkTime], [WorkTypeId], [WithdrawalsId], [UserAssessment]) VALUES (65, 14, CAST(N'2022-06-18T19:36:07.0000000' AS DateTime2), 32, CAST(N'2022-06-24T00:00:00.0000000' AS DateTime2), N'148 SE. Hill Dr. Redondo Beach, CA 90278', NULL, 1, CAST(N'2022-06-24T08:01:39.0000000' AS DateTime2), CAST(N'2022-06-24T16:19:04.0000000' AS DateTime2), 13, NULL, 4)
GO
INSERT [dbo].[WorkRequest] ([Id], [ClientId], [CreateTime], [EmployeeId], [FullfilledDate], [Address], [TaskDescription], [IsAccepted], [BeginWorkTime], [CompleteWorkTime], [WorkTypeId], [WithdrawalsId], [UserAssessment]) VALUES (66, 60, CAST(N'2022-06-19T11:57:38.0000000' AS DateTime2), 2, CAST(N'2022-06-22T00:00:00.0000000' AS DateTime2), N'92 Marsh Road Ellicott City, MD 21042', NULL, 1, CAST(N'2022-06-22T09:35:10.0000000' AS DateTime2), CAST(N'2022-06-22T16:07:54.0000000' AS DateTime2), 16, NULL, 2)
GO
INSERT [dbo].[WorkRequest] ([Id], [ClientId], [CreateTime], [EmployeeId], [FullfilledDate], [Address], [TaskDescription], [IsAccepted], [BeginWorkTime], [CompleteWorkTime], [WorkTypeId], [WithdrawalsId], [UserAssessment]) VALUES (67, 44, CAST(N'2022-06-19T13:02:29.0000000' AS DateTime2), 39, CAST(N'2022-06-20T00:00:00.0000000' AS DateTime2), N'69 Pine Road West Springfield, MA 01089', NULL, 1, CAST(N'2022-06-20T08:20:54.0000000' AS DateTime2), CAST(N'2022-06-20T16:42:22.0000000' AS DateTime2), 23, NULL, 3)
GO
INSERT [dbo].[WorkRequest] ([Id], [ClientId], [CreateTime], [EmployeeId], [FullfilledDate], [Address], [TaskDescription], [IsAccepted], [BeginWorkTime], [CompleteWorkTime], [WorkTypeId], [WithdrawalsId], [UserAssessment]) VALUES (68, 45, CAST(N'2022-06-19T14:03:19.0000000' AS DateTime2), 37, CAST(N'2022-06-23T00:00:00.0000000' AS DateTime2), N'182 Cedar Road Malden, MA 02148', NULL, 1, CAST(N'2022-06-23T09:58:59.0000000' AS DateTime2), CAST(N'2022-06-23T20:08:09.0000000' AS DateTime2), 24, NULL, 2)
GO
INSERT [dbo].[WorkRequest] ([Id], [ClientId], [CreateTime], [EmployeeId], [FullfilledDate], [Address], [TaskDescription], [IsAccepted], [BeginWorkTime], [CompleteWorkTime], [WorkTypeId], [WithdrawalsId], [UserAssessment]) VALUES (69, 7, CAST(N'2022-06-19T16:36:46.0000000' AS DateTime2), 2, CAST(N'2022-06-23T00:00:00.0000000' AS DateTime2), N'6 N. Mulberry Dr. Rosedale, NY 11422', NULL, 1, CAST(N'2022-06-23T09:22:14.0000000' AS DateTime2), CAST(N'2022-06-23T19:03:36.0000000' AS DateTime2), 18, NULL, 2)
GO
INSERT [dbo].[WorkRequest] ([Id], [ClientId], [CreateTime], [EmployeeId], [FullfilledDate], [Address], [TaskDescription], [IsAccepted], [BeginWorkTime], [CompleteWorkTime], [WorkTypeId], [WithdrawalsId], [UserAssessment]) VALUES (70, 1, CAST(N'2022-06-19T17:56:04.0000000' AS DateTime2), 45, CAST(N'2022-06-26T00:00:00.0000000' AS DateTime2), N'553 S. Chestnut St. Baltimore, MD 21206', NULL, 1, CAST(N'2022-06-26T08:54:15.0000000' AS DateTime2), CAST(N'2022-06-26T19:53:37.0000000' AS DateTime2), 28, NULL, 4)
GO
INSERT [dbo].[WorkRequest] ([Id], [ClientId], [CreateTime], [EmployeeId], [FullfilledDate], [Address], [TaskDescription], [IsAccepted], [BeginWorkTime], [CompleteWorkTime], [WorkTypeId], [WithdrawalsId], [UserAssessment]) VALUES (71, 52, CAST(N'2022-06-19T19:59:26.0000000' AS DateTime2), 42, CAST(N'2022-06-26T00:00:00.0000000' AS DateTime2), N'271 Stillwater Street Dekalb, IL 60115', NULL, 0, CAST(N'2022-06-26T10:00:00.0000000' AS DateTime2), CAST(N'2022-06-26T16:00:00.0000000' AS DateTime2), 26, NULL, NULL)
GO
INSERT [dbo].[WorkRequest] ([Id], [ClientId], [CreateTime], [EmployeeId], [FullfilledDate], [Address], [TaskDescription], [IsAccepted], [BeginWorkTime], [CompleteWorkTime], [WorkTypeId], [WithdrawalsId], [UserAssessment]) VALUES (72, 55, CAST(N'2022-06-20T13:40:52.0000000' AS DateTime2), 2, CAST(N'2022-06-23T00:00:00.0000000' AS DateTime2), N'9520 Wagon Dr. Menomonee Falls, WI 53051', NULL, 0, CAST(N'2022-06-23T10:00:00.0000000' AS DateTime2), CAST(N'2022-06-23T16:00:00.0000000' AS DateTime2), 10, NULL, NULL)
GO
INSERT [dbo].[WorkRequest] ([Id], [ClientId], [CreateTime], [EmployeeId], [FullfilledDate], [Address], [TaskDescription], [IsAccepted], [BeginWorkTime], [CompleteWorkTime], [WorkTypeId], [WithdrawalsId], [UserAssessment]) VALUES (73, 40, CAST(N'2022-06-20T16:08:05.0000000' AS DateTime2), 21, CAST(N'2022-06-27T00:00:00.0000000' AS DateTime2), N'22 Brook St. Raleigh, NC 27603', NULL, 0, CAST(N'2022-06-27T10:00:00.0000000' AS DateTime2), CAST(N'2022-06-27T16:00:00.0000000' AS DateTime2), 15, NULL, NULL)
GO
INSERT [dbo].[WorkRequest] ([Id], [ClientId], [CreateTime], [EmployeeId], [FullfilledDate], [Address], [TaskDescription], [IsAccepted], [BeginWorkTime], [CompleteWorkTime], [WorkTypeId], [WithdrawalsId], [UserAssessment]) VALUES (74, 16, CAST(N'2022-06-21T07:07:19.0000000' AS DateTime2), 10, CAST(N'2022-06-22T00:00:00.0000000' AS DateTime2), N'480 Old Railroad Ave. Randolph, MA 02368', NULL, 1, CAST(N'2022-06-22T08:24:30.0000000' AS DateTime2), CAST(N'2022-06-22T16:17:17.0000000' AS DateTime2), 19, NULL, 4)
GO
INSERT [dbo].[WorkRequest] ([Id], [ClientId], [CreateTime], [EmployeeId], [FullfilledDate], [Address], [TaskDescription], [IsAccepted], [BeginWorkTime], [CompleteWorkTime], [WorkTypeId], [WithdrawalsId], [UserAssessment]) VALUES (75, 8, CAST(N'2022-06-21T19:15:07.0000000' AS DateTime2), 6, CAST(N'2022-06-25T00:00:00.0000000' AS DateTime2), N'397 E. Saxon Lane Ooltewah, TN 37363', NULL, 0, CAST(N'2022-06-25T10:00:00.0000000' AS DateTime2), CAST(N'2022-06-25T16:00:00.0000000' AS DateTime2), 9, NULL, NULL)
GO
INSERT [dbo].[WorkRequest] ([Id], [ClientId], [CreateTime], [EmployeeId], [FullfilledDate], [Address], [TaskDescription], [IsAccepted], [BeginWorkTime], [CompleteWorkTime], [WorkTypeId], [WithdrawalsId], [UserAssessment]) VALUES (76, 10, CAST(N'2022-06-22T12:16:42.0000000' AS DateTime2), 8, CAST(N'2022-06-27T00:00:00.0000000' AS DateTime2), N'7615 West Shirley St. Loganville, GA 30052', NULL, 1, CAST(N'2022-06-27T09:49:49.0000000' AS DateTime2), CAST(N'2022-06-27T17:45:32.0000000' AS DateTime2), 24, NULL, 3)
GO
INSERT [dbo].[WorkRequest] ([Id], [ClientId], [CreateTime], [EmployeeId], [FullfilledDate], [Address], [TaskDescription], [IsAccepted], [BeginWorkTime], [CompleteWorkTime], [WorkTypeId], [WithdrawalsId], [UserAssessment]) VALUES (77, 22, CAST(N'2022-06-22T14:30:41.0000000' AS DateTime2), 45, CAST(N'2022-06-28T00:00:00.0000000' AS DateTime2), N'7551 Washington Lane North Fort Myers, FL 33917', NULL, 1, CAST(N'2022-06-28T08:25:33.0000000' AS DateTime2), CAST(N'2022-06-28T19:25:53.0000000' AS DateTime2), 31, NULL, 5)
GO
INSERT [dbo].[WorkRequest] ([Id], [ClientId], [CreateTime], [EmployeeId], [FullfilledDate], [Address], [TaskDescription], [IsAccepted], [BeginWorkTime], [CompleteWorkTime], [WorkTypeId], [WithdrawalsId], [UserAssessment]) VALUES (78, 11, CAST(N'2022-06-22T21:04:55.0000000' AS DateTime2), 48, CAST(N'2022-06-26T00:00:00.0000000' AS DateTime2), N'87 East Strawberry Street Prattville, AL 36067', NULL, 1, CAST(N'2022-06-26T09:38:21.0000000' AS DateTime2), CAST(N'2022-06-26T17:52:47.0000000' AS DateTime2), 7, NULL, 5)
GO
INSERT [dbo].[WorkRequest] ([Id], [ClientId], [CreateTime], [EmployeeId], [FullfilledDate], [Address], [TaskDescription], [IsAccepted], [BeginWorkTime], [CompleteWorkTime], [WorkTypeId], [WithdrawalsId], [UserAssessment]) VALUES (79, 34, CAST(N'2022-06-23T12:31:14.0000000' AS DateTime2), 15, CAST(N'2022-06-28T00:00:00.0000000' AS DateTime2), N'424 Clinton Street Centreville, VA 20120', NULL, 1, CAST(N'2022-06-28T09:55:03.0000000' AS DateTime2), CAST(N'2022-06-28T16:06:17.0000000' AS DateTime2), 10, NULL, 1)
GO
INSERT [dbo].[WorkRequest] ([Id], [ClientId], [CreateTime], [EmployeeId], [FullfilledDate], [Address], [TaskDescription], [IsAccepted], [BeginWorkTime], [CompleteWorkTime], [WorkTypeId], [WithdrawalsId], [UserAssessment]) VALUES (80, 4, CAST(N'2022-06-23T13:51:01.0000000' AS DateTime2), 4, CAST(N'2022-06-25T00:00:00.0000000' AS DateTime2), N'9286 W. Riverside Street Reading, MA 01867', NULL, 1, CAST(N'2022-06-25T10:10:15.0000000' AS DateTime2), CAST(N'2022-06-25T17:23:04.0000000' AS DateTime2), 18, NULL, 2)
GO
INSERT [dbo].[WorkRequest] ([Id], [ClientId], [CreateTime], [EmployeeId], [FullfilledDate], [Address], [TaskDescription], [IsAccepted], [BeginWorkTime], [CompleteWorkTime], [WorkTypeId], [WithdrawalsId], [UserAssessment]) VALUES (81, 2, CAST(N'2022-06-24T10:22:14.0000000' AS DateTime2), 26, CAST(N'2022-06-29T00:00:00.0000000' AS DateTime2), N'908 White Street Ravenna, OH 44266', NULL, 1, CAST(N'2022-06-29T08:06:06.0000000' AS DateTime2), CAST(N'2022-06-29T18:06:28.0000000' AS DateTime2), 11, NULL, 3)
GO
INSERT [dbo].[WorkRequest] ([Id], [ClientId], [CreateTime], [EmployeeId], [FullfilledDate], [Address], [TaskDescription], [IsAccepted], [BeginWorkTime], [CompleteWorkTime], [WorkTypeId], [WithdrawalsId], [UserAssessment]) VALUES (82, 15, CAST(N'2022-06-24T10:38:47.0000000' AS DateTime2), 21, CAST(N'2022-06-29T00:00:00.0000000' AS DateTime2), N'284 North Somerset Avenue Richmond, VA 23223', NULL, 0, CAST(N'2022-06-29T10:00:00.0000000' AS DateTime2), CAST(N'2022-06-29T16:00:00.0000000' AS DateTime2), 14, NULL, NULL)
GO
INSERT [dbo].[WorkRequest] ([Id], [ClientId], [CreateTime], [EmployeeId], [FullfilledDate], [Address], [TaskDescription], [IsAccepted], [BeginWorkTime], [CompleteWorkTime], [WorkTypeId], [WithdrawalsId], [UserAssessment]) VALUES (83, 52, CAST(N'2022-06-24T15:43:10.0000000' AS DateTime2), 13, CAST(N'2022-06-28T00:00:00.0000000' AS DateTime2), N'630 Ridgewood Ave. Faribault, MN 55021', NULL, 1, CAST(N'2022-06-28T09:29:47.0000000' AS DateTime2), CAST(N'2022-06-28T17:53:12.0000000' AS DateTime2), 6, NULL, 1)
GO
INSERT [dbo].[WorkRequest] ([Id], [ClientId], [CreateTime], [EmployeeId], [FullfilledDate], [Address], [TaskDescription], [IsAccepted], [BeginWorkTime], [CompleteWorkTime], [WorkTypeId], [WithdrawalsId], [UserAssessment]) VALUES (84, 1, CAST(N'2022-06-24T17:14:29.0000000' AS DateTime2), 4, CAST(N'2022-07-01T00:00:00.0000000' AS DateTime2), N'9032 Spruce St. Xenia, OH 45385', NULL, 0, CAST(N'2022-07-01T10:00:00.0000000' AS DateTime2), CAST(N'2022-07-01T16:00:00.0000000' AS DateTime2), 28, NULL, NULL)
GO
INSERT [dbo].[WorkRequest] ([Id], [ClientId], [CreateTime], [EmployeeId], [FullfilledDate], [Address], [TaskDescription], [IsAccepted], [BeginWorkTime], [CompleteWorkTime], [WorkTypeId], [WithdrawalsId], [UserAssessment]) VALUES (85, 54, CAST(N'2022-06-26T09:08:25.0000000' AS DateTime2), 50, CAST(N'2022-06-27T00:00:00.0000000' AS DateTime2), N'895 Armstrong St. Seymour, IN 47274', NULL, 1, CAST(N'2022-06-27T10:10:35.0000000' AS DateTime2), CAST(N'2022-06-27T20:06:34.0000000' AS DateTime2), 24, 3, 3)
GO
INSERT [dbo].[WorkRequest] ([Id], [ClientId], [CreateTime], [EmployeeId], [FullfilledDate], [Address], [TaskDescription], [IsAccepted], [BeginWorkTime], [CompleteWorkTime], [WorkTypeId], [WithdrawalsId], [UserAssessment]) VALUES (86, 32, CAST(N'2022-06-26T10:15:32.0000000' AS DateTime2), 3, CAST(N'2022-06-29T00:00:00.0000000' AS DateTime2), N'8426 Winding Way St. Southaven, MS 38671', NULL, 1, CAST(N'2022-06-29T09:23:34.0000000' AS DateTime2), CAST(N'2022-06-29T15:23:14.0000000' AS DateTime2), 21, NULL, 2)
GO
INSERT [dbo].[WorkRequest] ([Id], [ClientId], [CreateTime], [EmployeeId], [FullfilledDate], [Address], [TaskDescription], [IsAccepted], [BeginWorkTime], [CompleteWorkTime], [WorkTypeId], [WithdrawalsId], [UserAssessment]) VALUES (87, 14, CAST(N'2022-06-26T15:41:50.0000000' AS DateTime2), 7, CAST(N'2022-06-28T00:00:00.0000000' AS DateTime2), N'9864 Depot St. Middleton, WI 53562', NULL, 1, CAST(N'2022-06-28T08:26:07.0000000' AS DateTime2), CAST(N'2022-06-28T18:06:30.0000000' AS DateTime2), 16, NULL, 3)
GO
INSERT [dbo].[WorkRequest] ([Id], [ClientId], [CreateTime], [EmployeeId], [FullfilledDate], [Address], [TaskDescription], [IsAccepted], [BeginWorkTime], [CompleteWorkTime], [WorkTypeId], [WithdrawalsId], [UserAssessment]) VALUES (88, 39, CAST(N'2022-06-26T16:07:51.0000000' AS DateTime2), 12, CAST(N'2022-06-27T00:00:00.0000000' AS DateTime2), N'18 River Lane Dedham, MA 02026', NULL, 1, CAST(N'2022-06-27T08:29:52.0000000' AS DateTime2), CAST(N'2022-06-27T18:22:47.0000000' AS DateTime2), 29, NULL, 3)
GO
INSERT [dbo].[WorkRequest] ([Id], [ClientId], [CreateTime], [EmployeeId], [FullfilledDate], [Address], [TaskDescription], [IsAccepted], [BeginWorkTime], [CompleteWorkTime], [WorkTypeId], [WithdrawalsId], [UserAssessment]) VALUES (89, 12, CAST(N'2022-06-26T16:48:22.0000000' AS DateTime2), 19, CAST(N'2022-06-28T00:00:00.0000000' AS DateTime2), N'63 Sutor Road Jacksonville, NC 28540', NULL, 1, CAST(N'2022-06-28T09:10:58.0000000' AS DateTime2), CAST(N'2022-06-28T17:04:26.0000000' AS DateTime2), 23, NULL, 4)
GO
INSERT [dbo].[WorkRequest] ([Id], [ClientId], [CreateTime], [EmployeeId], [FullfilledDate], [Address], [TaskDescription], [IsAccepted], [BeginWorkTime], [CompleteWorkTime], [WorkTypeId], [WithdrawalsId], [UserAssessment]) VALUES (90, 29, CAST(N'2022-06-26T20:44:26.0000000' AS DateTime2), 13, CAST(N'2022-07-01T00:00:00.0000000' AS DateTime2), N'9249 Wilson St. Greensboro, NC 27405', NULL, 1, CAST(N'2022-07-01T09:55:17.0000000' AS DateTime2), CAST(N'2022-07-01T15:13:49.0000000' AS DateTime2), 21, NULL, 2)
GO
INSERT [dbo].[WorkRequest] ([Id], [ClientId], [CreateTime], [EmployeeId], [FullfilledDate], [Address], [TaskDescription], [IsAccepted], [BeginWorkTime], [CompleteWorkTime], [WorkTypeId], [WithdrawalsId], [UserAssessment]) VALUES (91, 17, CAST(N'2022-06-27T13:21:57.0000000' AS DateTime2), 20, CAST(N'2022-06-29T00:00:00.0000000' AS DateTime2), N'931 E. Big Rock Cove Street Norwood, MA 02062', NULL, 0, CAST(N'2022-06-29T10:00:00.0000000' AS DateTime2), CAST(N'2022-06-29T16:00:00.0000000' AS DateTime2), 12, NULL, NULL)
GO
INSERT [dbo].[WorkRequest] ([Id], [ClientId], [CreateTime], [EmployeeId], [FullfilledDate], [Address], [TaskDescription], [IsAccepted], [BeginWorkTime], [CompleteWorkTime], [WorkTypeId], [WithdrawalsId], [UserAssessment]) VALUES (92, 14, CAST(N'2022-06-27T13:48:18.0000000' AS DateTime2), 6, CAST(N'2022-07-02T00:00:00.0000000' AS DateTime2), N'7039 Smith Lane Flowery Branch, GA 30542', NULL, 1, CAST(N'2022-07-02T09:03:33.0000000' AS DateTime2), CAST(N'2022-07-02T15:25:49.0000000' AS DateTime2), 8, NULL, 2)
GO
INSERT [dbo].[WorkRequest] ([Id], [ClientId], [CreateTime], [EmployeeId], [FullfilledDate], [Address], [TaskDescription], [IsAccepted], [BeginWorkTime], [CompleteWorkTime], [WorkTypeId], [WithdrawalsId], [UserAssessment]) VALUES (93, 15, CAST(N'2022-06-27T17:44:33.0000000' AS DateTime2), 3, CAST(N'2022-06-30T00:00:00.0000000' AS DateTime2), N'26 Garfield St. Macon, GA 31204', NULL, 1, CAST(N'2022-06-30T10:01:51.0000000' AS DateTime2), CAST(N'2022-06-30T16:27:37.0000000' AS DateTime2), 13, NULL, 1)
GO
INSERT [dbo].[WorkRequest] ([Id], [ClientId], [CreateTime], [EmployeeId], [FullfilledDate], [Address], [TaskDescription], [IsAccepted], [BeginWorkTime], [CompleteWorkTime], [WorkTypeId], [WithdrawalsId], [UserAssessment]) VALUES (94, 4, CAST(N'2022-06-27T20:42:01.0000000' AS DateTime2), 24, CAST(N'2022-06-28T00:00:00.0000000' AS DateTime2), N'3 NE. Country St. Middleburg, FL 32068', NULL, 1, CAST(N'2022-06-28T09:58:39.0000000' AS DateTime2), CAST(N'2022-06-28T15:30:39.0000000' AS DateTime2), 17, NULL, 1)
GO
INSERT [dbo].[WorkRequest] ([Id], [ClientId], [CreateTime], [EmployeeId], [FullfilledDate], [Address], [TaskDescription], [IsAccepted], [BeginWorkTime], [CompleteWorkTime], [WorkTypeId], [WithdrawalsId], [UserAssessment]) VALUES (95, 39, CAST(N'2022-06-28T08:59:03.0000000' AS DateTime2), 31, CAST(N'2022-07-05T00:00:00.0000000' AS DateTime2), N'729 Augusta Ave. Minneapolis, MN 55406', NULL, 0, CAST(N'2022-07-05T10:00:00.0000000' AS DateTime2), CAST(N'2022-07-05T16:00:00.0000000' AS DateTime2), 32, NULL, NULL)
GO
INSERT [dbo].[WorkRequest] ([Id], [ClientId], [CreateTime], [EmployeeId], [FullfilledDate], [Address], [TaskDescription], [IsAccepted], [BeginWorkTime], [CompleteWorkTime], [WorkTypeId], [WithdrawalsId], [UserAssessment]) VALUES (96, 29, CAST(N'2022-06-28T11:44:58.0000000' AS DateTime2), 11, CAST(N'2022-06-29T00:00:00.0000000' AS DateTime2), N'644 High Point Court San Jose, CA 95127', NULL, 0, CAST(N'2022-06-29T10:00:00.0000000' AS DateTime2), CAST(N'2022-06-29T16:00:00.0000000' AS DateTime2), 9, NULL, NULL)
GO
INSERT [dbo].[WorkRequest] ([Id], [ClientId], [CreateTime], [EmployeeId], [FullfilledDate], [Address], [TaskDescription], [IsAccepted], [BeginWorkTime], [CompleteWorkTime], [WorkTypeId], [WithdrawalsId], [UserAssessment]) VALUES (97, 26, CAST(N'2022-06-28T13:48:42.0000000' AS DateTime2), 26, CAST(N'2022-06-30T00:00:00.0000000' AS DateTime2), N'226 Riverside Street Fond Du Lac, WI 54935', NULL, 1, CAST(N'2022-06-30T09:17:41.0000000' AS DateTime2), CAST(N'2022-06-30T18:40:22.0000000' AS DateTime2), 12, NULL, 3)
GO
INSERT [dbo].[WorkRequest] ([Id], [ClientId], [CreateTime], [EmployeeId], [FullfilledDate], [Address], [TaskDescription], [IsAccepted], [BeginWorkTime], [CompleteWorkTime], [WorkTypeId], [WithdrawalsId], [UserAssessment]) VALUES (98, 19, CAST(N'2022-06-28T15:01:46.0000000' AS DateTime2), 22, CAST(N'2022-07-03T00:00:00.0000000' AS DateTime2), N'9160 South Dunbar Court Marquette, MI 49855', NULL, 1, CAST(N'2022-07-03T08:32:30.0000000' AS DateTime2), CAST(N'2022-07-03T15:19:57.0000000' AS DateTime2), 28, NULL, 4)
GO
INSERT [dbo].[WorkRequest] ([Id], [ClientId], [CreateTime], [EmployeeId], [FullfilledDate], [Address], [TaskDescription], [IsAccepted], [BeginWorkTime], [CompleteWorkTime], [WorkTypeId], [WithdrawalsId], [UserAssessment]) VALUES (99, 41, CAST(N'2022-06-29T08:54:00.0000000' AS DateTime2), 2, CAST(N'2022-07-04T00:00:00.0000000' AS DateTime2), N'75 Fremont Ave. Marysville, OH 43040', NULL, 1, CAST(N'2022-07-04T09:19:25.0000000' AS DateTime2), CAST(N'2022-07-04T16:38:40.0000000' AS DateTime2), 32, NULL, 1)
GO
INSERT [dbo].[WorkRequest] ([Id], [ClientId], [CreateTime], [EmployeeId], [FullfilledDate], [Address], [TaskDescription], [IsAccepted], [BeginWorkTime], [CompleteWorkTime], [WorkTypeId], [WithdrawalsId], [UserAssessment]) VALUES (100, 16, CAST(N'2022-06-29T09:26:19.0000000' AS DateTime2), 2, CAST(N'2022-07-05T00:00:00.0000000' AS DateTime2), N'8422 Heather Avenue North Canton, OH 44720', NULL, 0, CAST(N'2022-07-05T10:00:00.0000000' AS DateTime2), CAST(N'2022-07-05T16:00:00.0000000' AS DateTime2), 9, NULL, NULL)
GO
INSERT [dbo].[WorkRequest] ([Id], [ClientId], [CreateTime], [EmployeeId], [FullfilledDate], [Address], [TaskDescription], [IsAccepted], [BeginWorkTime], [CompleteWorkTime], [WorkTypeId], [WithdrawalsId], [UserAssessment]) VALUES (101, 14, CAST(N'2022-06-29T20:15:22.0000000' AS DateTime2), 33, CAST(N'2022-07-04T00:00:00.0000000' AS DateTime2), N'511 Argyle St. Cincinnati, OH 45211', NULL, 1, CAST(N'2022-07-04T10:29:38.0000000' AS DateTime2), CAST(N'2022-07-04T16:43:27.0000000' AS DateTime2), 8, NULL, 1)
GO
INSERT [dbo].[WorkRequest] ([Id], [ClientId], [CreateTime], [EmployeeId], [FullfilledDate], [Address], [TaskDescription], [IsAccepted], [BeginWorkTime], [CompleteWorkTime], [WorkTypeId], [WithdrawalsId], [UserAssessment]) VALUES (102, 51, CAST(N'2022-06-29T21:30:29.0000000' AS DateTime2), 7, CAST(N'2022-07-03T00:00:00.0000000' AS DateTime2), N'563 West Galvin Avenue Dunedin, FL 34698', NULL, 1, CAST(N'2022-07-03T08:59:55.0000000' AS DateTime2), CAST(N'2022-07-03T18:41:18.0000000' AS DateTime2), 23, NULL, 5)
GO
INSERT [dbo].[WorkRequest] ([Id], [ClientId], [CreateTime], [EmployeeId], [FullfilledDate], [Address], [TaskDescription], [IsAccepted], [BeginWorkTime], [CompleteWorkTime], [WorkTypeId], [WithdrawalsId], [UserAssessment]) VALUES (103, 4, CAST(N'2022-06-30T12:32:19.0000000' AS DateTime2), 39, CAST(N'2022-07-01T00:00:00.0000000' AS DateTime2), N'78 Cardinal Road Gastonia, NC 28052', NULL, 1, CAST(N'2022-07-01T08:00:43.0000000' AS DateTime2), CAST(N'2022-07-01T17:16:07.0000000' AS DateTime2), 28, NULL, 3)
GO
INSERT [dbo].[WorkRequest] ([Id], [ClientId], [CreateTime], [EmployeeId], [FullfilledDate], [Address], [TaskDescription], [IsAccepted], [BeginWorkTime], [CompleteWorkTime], [WorkTypeId], [WithdrawalsId], [UserAssessment]) VALUES (104, 9, CAST(N'2022-06-30T14:52:13.0000000' AS DateTime2), 22, CAST(N'2022-07-02T00:00:00.0000000' AS DateTime2), N'853 Rockland Avenue Asbury Park, NJ 07712', NULL, 0, CAST(N'2022-07-02T10:00:00.0000000' AS DateTime2), CAST(N'2022-07-02T16:00:00.0000000' AS DateTime2), 21, NULL, NULL)
GO
INSERT [dbo].[WorkRequest] ([Id], [ClientId], [CreateTime], [EmployeeId], [FullfilledDate], [Address], [TaskDescription], [IsAccepted], [BeginWorkTime], [CompleteWorkTime], [WorkTypeId], [WithdrawalsId], [UserAssessment]) VALUES (105, 41, CAST(N'2022-06-30T17:20:33.0000000' AS DateTime2), 9, CAST(N'2022-07-01T00:00:00.0000000' AS DateTime2), N'361 Rockwell Rd. Hoffman Estates, IL 60169', NULL, 1, CAST(N'2022-07-01T10:03:51.0000000' AS DateTime2), CAST(N'2022-07-01T15:16:41.0000000' AS DateTime2), 7, NULL, 3)
GO
INSERT [dbo].[WorkRequest] ([Id], [ClientId], [CreateTime], [EmployeeId], [FullfilledDate], [Address], [TaskDescription], [IsAccepted], [BeginWorkTime], [CompleteWorkTime], [WorkTypeId], [WithdrawalsId], [UserAssessment]) VALUES (106, 44, CAST(N'2022-06-30T18:16:51.0000000' AS DateTime2), 18, CAST(N'2022-07-06T00:00:00.0000000' AS DateTime2), N'617 Logan St. Highland Park, IL 60035', NULL, 0, CAST(N'2022-07-06T10:00:00.0000000' AS DateTime2), CAST(N'2022-07-06T16:00:00.0000000' AS DateTime2), 19, NULL, NULL)
GO
INSERT [dbo].[WorkRequest] ([Id], [ClientId], [CreateTime], [EmployeeId], [FullfilledDate], [Address], [TaskDescription], [IsAccepted], [BeginWorkTime], [CompleteWorkTime], [WorkTypeId], [WithdrawalsId], [UserAssessment]) VALUES (107, 44, CAST(N'2022-07-01T14:26:41.0000000' AS DateTime2), 43, CAST(N'2022-07-02T00:00:00.0000000' AS DateTime2), N'49 Augusta Ave. North Bergen, NJ 07047', NULL, 0, CAST(N'2022-07-02T10:00:00.0000000' AS DateTime2), CAST(N'2022-07-02T16:00:00.0000000' AS DateTime2), 13, NULL, NULL)
GO
INSERT [dbo].[WorkRequest] ([Id], [ClientId], [CreateTime], [EmployeeId], [FullfilledDate], [Address], [TaskDescription], [IsAccepted], [BeginWorkTime], [CompleteWorkTime], [WorkTypeId], [WithdrawalsId], [UserAssessment]) VALUES (108, 33, CAST(N'2022-07-01T21:12:44.0000000' AS DateTime2), 46, CAST(N'2022-07-04T00:00:00.0000000' AS DateTime2), N'8222 Brewery Road San Pablo, CA 94806', NULL, 1, CAST(N'2022-07-04T08:17:03.0000000' AS DateTime2), CAST(N'2022-07-04T15:05:04.0000000' AS DateTime2), 23, NULL, 2)
GO
INSERT [dbo].[WorkRequest] ([Id], [ClientId], [CreateTime], [EmployeeId], [FullfilledDate], [Address], [TaskDescription], [IsAccepted], [BeginWorkTime], [CompleteWorkTime], [WorkTypeId], [WithdrawalsId], [UserAssessment]) VALUES (109, 33, CAST(N'2022-07-02T08:02:09.0000000' AS DateTime2), 6, CAST(N'2022-07-07T00:00:00.0000000' AS DateTime2), N'173 Bayberry Ave. Hammonton, NJ 08037', NULL, 1, CAST(N'2022-07-07T08:13:45.0000000' AS DateTime2), CAST(N'2022-07-07T20:05:16.0000000' AS DateTime2), 14, NULL, 3)
GO
INSERT [dbo].[WorkRequest] ([Id], [ClientId], [CreateTime], [EmployeeId], [FullfilledDate], [Address], [TaskDescription], [IsAccepted], [BeginWorkTime], [CompleteWorkTime], [WorkTypeId], [WithdrawalsId], [UserAssessment]) VALUES (110, 5, CAST(N'2022-07-02T12:02:31.0000000' AS DateTime2), 3, CAST(N'2022-07-09T00:00:00.0000000' AS DateTime2), N'642 George Lane Glendale, AZ 85302', NULL, 0, CAST(N'2022-07-09T10:00:00.0000000' AS DateTime2), CAST(N'2022-07-09T16:00:00.0000000' AS DateTime2), 29, NULL, NULL)
GO
INSERT [dbo].[WorkRequest] ([Id], [ClientId], [CreateTime], [EmployeeId], [FullfilledDate], [Address], [TaskDescription], [IsAccepted], [BeginWorkTime], [CompleteWorkTime], [WorkTypeId], [WithdrawalsId], [UserAssessment]) VALUES (111, 8, CAST(N'2022-07-02T13:10:23.0000000' AS DateTime2), 40, CAST(N'2022-07-09T00:00:00.0000000' AS DateTime2), N'844 Shore Street Erie, PA 16506', NULL, 1, CAST(N'2022-07-09T08:17:38.0000000' AS DateTime2), CAST(N'2022-07-09T18:11:12.0000000' AS DateTime2), 23, NULL, 4)
GO
INSERT [dbo].[WorkRequest] ([Id], [ClientId], [CreateTime], [EmployeeId], [FullfilledDate], [Address], [TaskDescription], [IsAccepted], [BeginWorkTime], [CompleteWorkTime], [WorkTypeId], [WithdrawalsId], [UserAssessment]) VALUES (112, 21, CAST(N'2022-07-02T13:28:21.0000000' AS DateTime2), 9, CAST(N'2022-07-06T00:00:00.0000000' AS DateTime2), N'8424 Tunnel Street Taunton, MA 02780', NULL, 0, CAST(N'2022-07-06T10:00:00.0000000' AS DateTime2), CAST(N'2022-07-06T16:00:00.0000000' AS DateTime2), 22, NULL, NULL)
GO
INSERT [dbo].[WorkRequest] ([Id], [ClientId], [CreateTime], [EmployeeId], [FullfilledDate], [Address], [TaskDescription], [IsAccepted], [BeginWorkTime], [CompleteWorkTime], [WorkTypeId], [WithdrawalsId], [UserAssessment]) VALUES (113, 30, CAST(N'2022-07-02T15:09:33.0000000' AS DateTime2), 7, CAST(N'2022-07-09T00:00:00.0000000' AS DateTime2), N'8847 Cactus Street Erlanger, KY 41018', NULL, 0, CAST(N'2022-07-09T10:00:00.0000000' AS DateTime2), CAST(N'2022-07-09T16:00:00.0000000' AS DateTime2), 23, NULL, NULL)
GO
INSERT [dbo].[WorkRequest] ([Id], [ClientId], [CreateTime], [EmployeeId], [FullfilledDate], [Address], [TaskDescription], [IsAccepted], [BeginWorkTime], [CompleteWorkTime], [WorkTypeId], [WithdrawalsId], [UserAssessment]) VALUES (114, 20, CAST(N'2022-07-02T21:39:02.0000000' AS DateTime2), 14, CAST(N'2022-07-06T00:00:00.0000000' AS DateTime2), N'97 East Sussex Dr. Lakewood, NJ 08701', NULL, 1, CAST(N'2022-07-06T08:46:53.0000000' AS DateTime2), CAST(N'2022-07-06T15:40:13.0000000' AS DateTime2), 6, NULL, 2)
GO
INSERT [dbo].[WorkRequest] ([Id], [ClientId], [CreateTime], [EmployeeId], [FullfilledDate], [Address], [TaskDescription], [IsAccepted], [BeginWorkTime], [CompleteWorkTime], [WorkTypeId], [WithdrawalsId], [UserAssessment]) VALUES (115, 27, CAST(N'2022-07-03T06:10:57.0000000' AS DateTime2), 8, CAST(N'2022-07-04T00:00:00.0000000' AS DateTime2), N'189 Woodsman St. Bettendorf, IA 52722', NULL, 0, CAST(N'2022-07-04T10:00:00.0000000' AS DateTime2), CAST(N'2022-07-04T16:00:00.0000000' AS DateTime2), 16, NULL, NULL)
GO
INSERT [dbo].[WorkRequest] ([Id], [ClientId], [CreateTime], [EmployeeId], [FullfilledDate], [Address], [TaskDescription], [IsAccepted], [BeginWorkTime], [CompleteWorkTime], [WorkTypeId], [WithdrawalsId], [UserAssessment]) VALUES (116, 59, CAST(N'2022-07-03T09:25:06.0000000' AS DateTime2), 26, CAST(N'2022-07-09T00:00:00.0000000' AS DateTime2), N'77 Rock Maple Dr. Yorktown Heights, NY 10598', NULL, 1, CAST(N'2022-07-09T08:31:33.0000000' AS DateTime2), CAST(N'2022-07-09T19:47:29.0000000' AS DateTime2), 6, NULL, 4)
GO
INSERT [dbo].[WorkRequest] ([Id], [ClientId], [CreateTime], [EmployeeId], [FullfilledDate], [Address], [TaskDescription], [IsAccepted], [BeginWorkTime], [CompleteWorkTime], [WorkTypeId], [WithdrawalsId], [UserAssessment]) VALUES (117, 47, CAST(N'2022-07-03T10:02:40.0000000' AS DateTime2), 16, CAST(N'2022-07-05T00:00:00.0000000' AS DateTime2), N'156 Beech Street New Bern, NC 28560', NULL, 0, CAST(N'2022-07-05T10:00:00.0000000' AS DateTime2), CAST(N'2022-07-05T16:00:00.0000000' AS DateTime2), 17, NULL, NULL)
GO
INSERT [dbo].[WorkRequest] ([Id], [ClientId], [CreateTime], [EmployeeId], [FullfilledDate], [Address], [TaskDescription], [IsAccepted], [BeginWorkTime], [CompleteWorkTime], [WorkTypeId], [WithdrawalsId], [UserAssessment]) VALUES (118, 30, CAST(N'2022-07-03T12:11:21.0000000' AS DateTime2), 50, CAST(N'2022-07-08T00:00:00.0000000' AS DateTime2), N'8537 Wayne Ave. Grand Island, NE 68801', NULL, 0, CAST(N'2022-07-08T10:00:00.0000000' AS DateTime2), CAST(N'2022-07-08T16:00:00.0000000' AS DateTime2), 25, NULL, NULL)
GO
INSERT [dbo].[WorkRequest] ([Id], [ClientId], [CreateTime], [EmployeeId], [FullfilledDate], [Address], [TaskDescription], [IsAccepted], [BeginWorkTime], [CompleteWorkTime], [WorkTypeId], [WithdrawalsId], [UserAssessment]) VALUES (119, 41, CAST(N'2022-07-03T15:50:47.0000000' AS DateTime2), 10, CAST(N'2022-07-09T00:00:00.0000000' AS DateTime2), N'80 Jefferson Road Lake Villa, IL 60046', NULL, 1, CAST(N'2022-07-09T08:17:04.0000000' AS DateTime2), CAST(N'2022-07-09T20:26:45.0000000' AS DateTime2), 14, NULL, 3)
GO
INSERT [dbo].[WorkRequest] ([Id], [ClientId], [CreateTime], [EmployeeId], [FullfilledDate], [Address], [TaskDescription], [IsAccepted], [BeginWorkTime], [CompleteWorkTime], [WorkTypeId], [WithdrawalsId], [UserAssessment]) VALUES (120, 15, CAST(N'2022-07-03T17:55:17.0000000' AS DateTime2), 17, CAST(N'2022-07-10T00:00:00.0000000' AS DateTime2), N'9550 Olive Ave. San Carlos, CA 94070', NULL, 0, CAST(N'2022-07-10T10:00:00.0000000' AS DateTime2), CAST(N'2022-07-10T16:00:00.0000000' AS DateTime2), 15, NULL, NULL)
GO
INSERT [dbo].[WorkRequest] ([Id], [ClientId], [CreateTime], [EmployeeId], [FullfilledDate], [Address], [TaskDescription], [IsAccepted], [BeginWorkTime], [CompleteWorkTime], [WorkTypeId], [WithdrawalsId], [UserAssessment]) VALUES (121, 32, CAST(N'2022-07-03T20:02:20.0000000' AS DateTime2), 16, CAST(N'2022-07-04T00:00:00.0000000' AS DateTime2), N'8672 Colonial Street Sarasota, FL 34231', NULL, 0, CAST(N'2022-07-04T10:00:00.0000000' AS DateTime2), CAST(N'2022-07-04T16:00:00.0000000' AS DateTime2), 14, NULL, NULL)
GO
INSERT [dbo].[WorkRequest] ([Id], [ClientId], [CreateTime], [EmployeeId], [FullfilledDate], [Address], [TaskDescription], [IsAccepted], [BeginWorkTime], [CompleteWorkTime], [WorkTypeId], [WithdrawalsId], [UserAssessment]) VALUES (122, 32, CAST(N'2022-07-04T11:08:53.0000000' AS DateTime2), 18, CAST(N'2022-07-06T00:00:00.0000000' AS DateTime2), N'925 East Westport Road Galloway, OH 43119', NULL, 1, CAST(N'2022-07-06T10:20:42.0000000' AS DateTime2), CAST(N'2022-07-06T16:51:20.0000000' AS DateTime2), 19, NULL, 1)
GO
INSERT [dbo].[WorkRequest] ([Id], [ClientId], [CreateTime], [EmployeeId], [FullfilledDate], [Address], [TaskDescription], [IsAccepted], [BeginWorkTime], [CompleteWorkTime], [WorkTypeId], [WithdrawalsId], [UserAssessment]) VALUES (123, 29, CAST(N'2022-07-04T12:08:54.0000000' AS DateTime2), 46, CAST(N'2022-07-07T00:00:00.0000000' AS DateTime2), N'543 Big Rock Cove Rd. New Orleans, LA 70115', NULL, 1, CAST(N'2022-07-07T08:52:20.0000000' AS DateTime2), CAST(N'2022-07-07T18:56:23.0000000' AS DateTime2), 29, NULL, 5)
GO
INSERT [dbo].[WorkRequest] ([Id], [ClientId], [CreateTime], [EmployeeId], [FullfilledDate], [Address], [TaskDescription], [IsAccepted], [BeginWorkTime], [CompleteWorkTime], [WorkTypeId], [WithdrawalsId], [UserAssessment]) VALUES (124, 49, CAST(N'2022-07-04T17:48:08.0000000' AS DateTime2), 20, CAST(N'2022-07-07T00:00:00.0000000' AS DateTime2), N'40 West Creek St. Kalamazoo, MI 49009', NULL, 0, CAST(N'2022-07-07T10:00:00.0000000' AS DateTime2), CAST(N'2022-07-07T16:00:00.0000000' AS DateTime2), 13, NULL, NULL)
GO
INSERT [dbo].[WorkRequest] ([Id], [ClientId], [CreateTime], [EmployeeId], [FullfilledDate], [Address], [TaskDescription], [IsAccepted], [BeginWorkTime], [CompleteWorkTime], [WorkTypeId], [WithdrawalsId], [UserAssessment]) VALUES (125, 8, CAST(N'2022-07-04T17:51:51.0000000' AS DateTime2), 9, CAST(N'2022-07-05T00:00:00.0000000' AS DateTime2), N'147 North St Paul Lane Wayne, NJ 07470', NULL, 0, CAST(N'2022-07-05T10:00:00.0000000' AS DateTime2), CAST(N'2022-07-05T16:00:00.0000000' AS DateTime2), 14, NULL, NULL)
GO
INSERT [dbo].[WorkRequest] ([Id], [ClientId], [CreateTime], [EmployeeId], [FullfilledDate], [Address], [TaskDescription], [IsAccepted], [BeginWorkTime], [CompleteWorkTime], [WorkTypeId], [WithdrawalsId], [UserAssessment]) VALUES (126, 13, CAST(N'2022-07-04T18:17:21.0000000' AS DateTime2), 9, CAST(N'2022-07-06T00:00:00.0000000' AS DateTime2), N'243 Hilldale St. Potomac, MD 20854', NULL, 1, CAST(N'2022-07-06T10:19:35.0000000' AS DateTime2), CAST(N'2022-07-06T18:07:57.0000000' AS DateTime2), 6, NULL, 1)
GO
INSERT [dbo].[WorkRequest] ([Id], [ClientId], [CreateTime], [EmployeeId], [FullfilledDate], [Address], [TaskDescription], [IsAccepted], [BeginWorkTime], [CompleteWorkTime], [WorkTypeId], [WithdrawalsId], [UserAssessment]) VALUES (127, 31, CAST(N'2022-07-04T21:22:07.0000000' AS DateTime2), 1, CAST(N'2022-07-10T00:00:00.0000000' AS DateTime2), N'199 Sherwood Ave. Chevy Chase, MD 20815', NULL, 1, CAST(N'2022-07-10T09:30:53.0000000' AS DateTime2), CAST(N'2022-07-10T18:50:36.0000000' AS DateTime2), 26, NULL, 2)
GO
INSERT [dbo].[WorkRequest] ([Id], [ClientId], [CreateTime], [EmployeeId], [FullfilledDate], [Address], [TaskDescription], [IsAccepted], [BeginWorkTime], [CompleteWorkTime], [WorkTypeId], [WithdrawalsId], [UserAssessment]) VALUES (128, 21, CAST(N'2022-07-06T07:13:40.0000000' AS DateTime2), 40, CAST(N'2022-07-11T00:00:00.0000000' AS DateTime2), N'7280 Water St. Oak Ridge, TN 37830', NULL, 0, CAST(N'2022-07-11T10:00:00.0000000' AS DateTime2), CAST(N'2022-07-11T16:00:00.0000000' AS DateTime2), 12, NULL, NULL)
GO
INSERT [dbo].[WorkRequest] ([Id], [ClientId], [CreateTime], [EmployeeId], [FullfilledDate], [Address], [TaskDescription], [IsAccepted], [BeginWorkTime], [CompleteWorkTime], [WorkTypeId], [WithdrawalsId], [UserAssessment]) VALUES (129, 60, CAST(N'2022-07-06T07:44:47.0000000' AS DateTime2), 44, CAST(N'2022-07-13T00:00:00.0000000' AS DateTime2), N'9039 Walnut St. Lake In The Hills, IL 60156', NULL, 1, CAST(N'2022-07-13T08:35:41.0000000' AS DateTime2), CAST(N'2022-07-13T19:19:11.0000000' AS DateTime2), 6, NULL, 3)
GO
INSERT [dbo].[WorkRequest] ([Id], [ClientId], [CreateTime], [EmployeeId], [FullfilledDate], [Address], [TaskDescription], [IsAccepted], [BeginWorkTime], [CompleteWorkTime], [WorkTypeId], [WithdrawalsId], [UserAssessment]) VALUES (130, 6, CAST(N'2022-07-06T08:07:49.0000000' AS DateTime2), 47, CAST(N'2022-07-07T00:00:00.0000000' AS DateTime2), N'616 Rockcrest Road Williamsport, PA 17701', NULL, 1, CAST(N'2022-07-07T08:55:48.0000000' AS DateTime2), CAST(N'2022-07-07T19:34:09.0000000' AS DateTime2), 28, NULL, 3)
GO
INSERT [dbo].[WorkRequest] ([Id], [ClientId], [CreateTime], [EmployeeId], [FullfilledDate], [Address], [TaskDescription], [IsAccepted], [BeginWorkTime], [CompleteWorkTime], [WorkTypeId], [WithdrawalsId], [UserAssessment]) VALUES (131, 23, CAST(N'2022-07-06T08:58:02.0000000' AS DateTime2), 46, CAST(N'2022-07-08T00:00:00.0000000' AS DateTime2), N'9184 Griffin St. Mokena, IL 60448', NULL, 1, CAST(N'2022-07-08T08:21:59.0000000' AS DateTime2), CAST(N'2022-07-08T19:23:10.0000000' AS DateTime2), 30, NULL, 1)
GO
INSERT [dbo].[WorkRequest] ([Id], [ClientId], [CreateTime], [EmployeeId], [FullfilledDate], [Address], [TaskDescription], [IsAccepted], [BeginWorkTime], [CompleteWorkTime], [WorkTypeId], [WithdrawalsId], [UserAssessment]) VALUES (132, 18, CAST(N'2022-07-06T11:30:37.0000000' AS DateTime2), 18, CAST(N'2022-07-11T00:00:00.0000000' AS DateTime2), N'44 Bridle Court Trussville, AL 35173', NULL, 1, CAST(N'2022-07-11T09:32:30.0000000' AS DateTime2), CAST(N'2022-07-11T17:43:22.0000000' AS DateTime2), 7, NULL, 1)
GO
INSERT [dbo].[WorkRequest] ([Id], [ClientId], [CreateTime], [EmployeeId], [FullfilledDate], [Address], [TaskDescription], [IsAccepted], [BeginWorkTime], [CompleteWorkTime], [WorkTypeId], [WithdrawalsId], [UserAssessment]) VALUES (133, 43, CAST(N'2022-07-06T13:32:23.0000000' AS DateTime2), 39, CAST(N'2022-07-07T00:00:00.0000000' AS DateTime2), N'94 Mountainview Ave. Soddy Daisy, TN 37379', NULL, 1, CAST(N'2022-07-07T09:36:32.0000000' AS DateTime2), CAST(N'2022-07-07T15:27:24.0000000' AS DateTime2), 22, NULL, 4)
GO
INSERT [dbo].[WorkRequest] ([Id], [ClientId], [CreateTime], [EmployeeId], [FullfilledDate], [Address], [TaskDescription], [IsAccepted], [BeginWorkTime], [CompleteWorkTime], [WorkTypeId], [WithdrawalsId], [UserAssessment]) VALUES (134, 6, CAST(N'2022-07-06T14:04:29.0000000' AS DateTime2), 2, CAST(N'2022-07-11T00:00:00.0000000' AS DateTime2), N'447 Marconi Rd. Coraopolis, PA 15108', NULL, 1, CAST(N'2022-07-11T08:55:10.0000000' AS DateTime2), CAST(N'2022-07-11T20:06:52.0000000' AS DateTime2), 11, NULL, 3)
GO
INSERT [dbo].[WorkRequest] ([Id], [ClientId], [CreateTime], [EmployeeId], [FullfilledDate], [Address], [TaskDescription], [IsAccepted], [BeginWorkTime], [CompleteWorkTime], [WorkTypeId], [WithdrawalsId], [UserAssessment]) VALUES (135, 55, CAST(N'2022-07-06T17:27:57.0000000' AS DateTime2), 1, CAST(N'2022-07-07T00:00:00.0000000' AS DateTime2), N'244 Glenlake St. Solon, OH 44139', NULL, 1, CAST(N'2022-07-07T10:16:17.0000000' AS DateTime2), CAST(N'2022-07-07T17:12:08.0000000' AS DateTime2), 27, NULL, 3)
GO
INSERT [dbo].[WorkRequest] ([Id], [ClientId], [CreateTime], [EmployeeId], [FullfilledDate], [Address], [TaskDescription], [IsAccepted], [BeginWorkTime], [CompleteWorkTime], [WorkTypeId], [WithdrawalsId], [UserAssessment]) VALUES (136, 23, CAST(N'2022-07-06T19:24:58.0000000' AS DateTime2), 4, CAST(N'2022-07-13T00:00:00.0000000' AS DateTime2), N'1 Primrose Street Bowie, MD 20715', NULL, 1, CAST(N'2022-07-13T09:05:55.0000000' AS DateTime2), CAST(N'2022-07-13T16:10:04.0000000' AS DateTime2), 9, NULL, 1)
GO
INSERT [dbo].[WorkRequest] ([Id], [ClientId], [CreateTime], [EmployeeId], [FullfilledDate], [Address], [TaskDescription], [IsAccepted], [BeginWorkTime], [CompleteWorkTime], [WorkTypeId], [WithdrawalsId], [UserAssessment]) VALUES (137, 11, CAST(N'2022-07-07T06:33:17.0000000' AS DateTime2), 23, CAST(N'2022-07-12T00:00:00.0000000' AS DateTime2), N'8608 Olive Street Dawsonville, GA 30534', NULL, 0, CAST(N'2022-07-12T10:00:00.0000000' AS DateTime2), CAST(N'2022-07-12T16:00:00.0000000' AS DateTime2), 26, NULL, NULL)
GO
INSERT [dbo].[WorkRequest] ([Id], [ClientId], [CreateTime], [EmployeeId], [FullfilledDate], [Address], [TaskDescription], [IsAccepted], [BeginWorkTime], [CompleteWorkTime], [WorkTypeId], [WithdrawalsId], [UserAssessment]) VALUES (138, 34, CAST(N'2022-07-08T07:01:21.0000000' AS DateTime2), 7, CAST(N'2022-07-13T00:00:00.0000000' AS DateTime2), N'9433 Sunset St. Hendersonville, NC 28792', NULL, 1, CAST(N'2022-07-13T09:10:44.0000000' AS DateTime2), CAST(N'2022-07-13T19:43:58.0000000' AS DateTime2), 16, NULL, 3)
GO
INSERT [dbo].[WorkRequest] ([Id], [ClientId], [CreateTime], [EmployeeId], [FullfilledDate], [Address], [TaskDescription], [IsAccepted], [BeginWorkTime], [CompleteWorkTime], [WorkTypeId], [WithdrawalsId], [UserAssessment]) VALUES (139, 40, CAST(N'2022-07-08T12:46:21.0000000' AS DateTime2), 43, CAST(N'2022-07-15T00:00:00.0000000' AS DateTime2), N'46 La Sierra Road King Of Prussia, PA 19406', NULL, 1, CAST(N'2022-07-15T08:05:54.0000000' AS DateTime2), CAST(N'2022-07-15T18:39:38.0000000' AS DateTime2), 27, NULL, 1)
GO
INSERT [dbo].[WorkRequest] ([Id], [ClientId], [CreateTime], [EmployeeId], [FullfilledDate], [Address], [TaskDescription], [IsAccepted], [BeginWorkTime], [CompleteWorkTime], [WorkTypeId], [WithdrawalsId], [UserAssessment]) VALUES (140, 10, CAST(N'2022-07-08T14:56:52.0000000' AS DateTime2), 36, CAST(N'2022-07-12T00:00:00.0000000' AS DateTime2), N'921 Howard Ave. Sicklerville, NJ 08081', NULL, 0, CAST(N'2022-07-12T10:00:00.0000000' AS DateTime2), CAST(N'2022-07-12T16:00:00.0000000' AS DateTime2), 13, NULL, NULL)
GO
INSERT [dbo].[WorkRequest] ([Id], [ClientId], [CreateTime], [EmployeeId], [FullfilledDate], [Address], [TaskDescription], [IsAccepted], [BeginWorkTime], [CompleteWorkTime], [WorkTypeId], [WithdrawalsId], [UserAssessment]) VALUES (141, 31, CAST(N'2022-07-08T16:56:20.0000000' AS DateTime2), 25, CAST(N'2022-07-09T00:00:00.0000000' AS DateTime2), N'563 Beach Ave. Stuart, FL 34997', NULL, 1, CAST(N'2022-07-09T09:57:18.0000000' AS DateTime2), CAST(N'2022-07-09T19:06:18.0000000' AS DateTime2), 10, NULL, 1)
GO
INSERT [dbo].[WorkRequest] ([Id], [ClientId], [CreateTime], [EmployeeId], [FullfilledDate], [Address], [TaskDescription], [IsAccepted], [BeginWorkTime], [CompleteWorkTime], [WorkTypeId], [WithdrawalsId], [UserAssessment]) VALUES (142, 30, CAST(N'2022-07-08T21:24:03.0000000' AS DateTime2), 42, CAST(N'2022-07-10T00:00:00.0000000' AS DateTime2), N'6 Wayne Avenue Beloit, WI 53511', NULL, 1, CAST(N'2022-07-10T09:58:50.0000000' AS DateTime2), CAST(N'2022-07-10T19:02:37.0000000' AS DateTime2), 7, NULL, 4)
GO
INSERT [dbo].[WorkRequest] ([Id], [ClientId], [CreateTime], [EmployeeId], [FullfilledDate], [Address], [TaskDescription], [IsAccepted], [BeginWorkTime], [CompleteWorkTime], [WorkTypeId], [WithdrawalsId], [UserAssessment]) VALUES (143, 31, CAST(N'2022-07-09T06:19:27.0000000' AS DateTime2), 12, CAST(N'2022-07-16T00:00:00.0000000' AS DateTime2), N'8767 Cedar Swamp St. Lebanon, PA 17042', NULL, 0, CAST(N'2022-07-16T10:00:00.0000000' AS DateTime2), CAST(N'2022-07-16T16:00:00.0000000' AS DateTime2), 25, NULL, NULL)
GO
INSERT [dbo].[WorkRequest] ([Id], [ClientId], [CreateTime], [EmployeeId], [FullfilledDate], [Address], [TaskDescription], [IsAccepted], [BeginWorkTime], [CompleteWorkTime], [WorkTypeId], [WithdrawalsId], [UserAssessment]) VALUES (144, 8, CAST(N'2022-07-09T07:56:33.0000000' AS DateTime2), 23, CAST(N'2022-07-13T00:00:00.0000000' AS DateTime2), N'7720 Swanson Ave. Goldsboro, NC 27530', NULL, 1, CAST(N'2022-07-13T09:32:18.0000000' AS DateTime2), CAST(N'2022-07-13T17:24:09.0000000' AS DateTime2), 8, NULL, 2)
GO
INSERT [dbo].[WorkRequest] ([Id], [ClientId], [CreateTime], [EmployeeId], [FullfilledDate], [Address], [TaskDescription], [IsAccepted], [BeginWorkTime], [CompleteWorkTime], [WorkTypeId], [WithdrawalsId], [UserAssessment]) VALUES (145, 51, CAST(N'2022-07-09T08:49:14.0000000' AS DateTime2), 45, CAST(N'2022-07-14T00:00:00.0000000' AS DateTime2), N'726 Country Club Ave. Canton, GA 30114', NULL, 1, CAST(N'2022-07-14T09:45:01.0000000' AS DateTime2), CAST(N'2022-07-14T20:22:54.0000000' AS DateTime2), 32, NULL, 3)
GO
INSERT [dbo].[WorkRequest] ([Id], [ClientId], [CreateTime], [EmployeeId], [FullfilledDate], [Address], [TaskDescription], [IsAccepted], [BeginWorkTime], [CompleteWorkTime], [WorkTypeId], [WithdrawalsId], [UserAssessment]) VALUES (146, 59, CAST(N'2022-07-09T14:30:36.0000000' AS DateTime2), 14, CAST(N'2022-07-16T00:00:00.0000000' AS DateTime2), N'7222 2nd Dr. Jersey City, NJ 07302', NULL, 1, CAST(N'2022-07-16T09:38:09.0000000' AS DateTime2), CAST(N'2022-07-16T18:12:06.0000000' AS DateTime2), 30, NULL, 3)
GO
INSERT [dbo].[WorkRequest] ([Id], [ClientId], [CreateTime], [EmployeeId], [FullfilledDate], [Address], [TaskDescription], [IsAccepted], [BeginWorkTime], [CompleteWorkTime], [WorkTypeId], [WithdrawalsId], [UserAssessment]) VALUES (147, 18, CAST(N'2022-07-09T16:06:12.0000000' AS DateTime2), 37, CAST(N'2022-07-15T00:00:00.0000000' AS DateTime2), N'887 Addison Dr. Powder Springs, GA 30127', NULL, 1, CAST(N'2022-07-15T08:25:45.0000000' AS DateTime2), CAST(N'2022-07-15T20:21:49.0000000' AS DateTime2), 29, NULL, 3)
GO
INSERT [dbo].[WorkRequest] ([Id], [ClientId], [CreateTime], [EmployeeId], [FullfilledDate], [Address], [TaskDescription], [IsAccepted], [BeginWorkTime], [CompleteWorkTime], [WorkTypeId], [WithdrawalsId], [UserAssessment]) VALUES (148, 17, CAST(N'2022-07-09T21:45:17.0000000' AS DateTime2), 32, CAST(N'2022-07-12T00:00:00.0000000' AS DateTime2), N'8005 4th Court Palm Bay, FL 32907', NULL, 1, CAST(N'2022-07-12T10:14:18.0000000' AS DateTime2), CAST(N'2022-07-12T15:42:46.0000000' AS DateTime2), 9, NULL, 5)
GO
INSERT [dbo].[WorkRequest] ([Id], [ClientId], [CreateTime], [EmployeeId], [FullfilledDate], [Address], [TaskDescription], [IsAccepted], [BeginWorkTime], [CompleteWorkTime], [WorkTypeId], [WithdrawalsId], [UserAssessment]) VALUES (149, 14, CAST(N'2022-07-10T08:25:42.0000000' AS DateTime2), 22, CAST(N'2022-07-14T00:00:00.0000000' AS DateTime2), N'8730 Anderson Drive Chillicothe, OH 45601', NULL, 1, CAST(N'2022-07-14T10:24:17.0000000' AS DateTime2), CAST(N'2022-07-14T18:58:26.0000000' AS DateTime2), 26, NULL, 1)
GO
INSERT [dbo].[WorkRequest] ([Id], [ClientId], [CreateTime], [EmployeeId], [FullfilledDate], [Address], [TaskDescription], [IsAccepted], [BeginWorkTime], [CompleteWorkTime], [WorkTypeId], [WithdrawalsId], [UserAssessment]) VALUES (150, 51, CAST(N'2022-07-10T08:42:36.0000000' AS DateTime2), 14, CAST(N'2022-07-15T00:00:00.0000000' AS DateTime2), N'5 Ridge St. Collegeville, PA 19426', NULL, 0, CAST(N'2022-07-15T10:00:00.0000000' AS DateTime2), CAST(N'2022-07-15T16:00:00.0000000' AS DateTime2), 28, NULL, NULL)
GO
INSERT [dbo].[WorkRequest] ([Id], [ClientId], [CreateTime], [EmployeeId], [FullfilledDate], [Address], [TaskDescription], [IsAccepted], [BeginWorkTime], [CompleteWorkTime], [WorkTypeId], [WithdrawalsId], [UserAssessment]) VALUES (151, 58, CAST(N'2022-07-10T16:27:59.0000000' AS DateTime2), 45, CAST(N'2022-07-15T00:00:00.0000000' AS DateTime2), N'11 Roehampton Lane Winter Springs, FL 32708', NULL, 0, CAST(N'2022-07-15T10:00:00.0000000' AS DateTime2), CAST(N'2022-07-15T16:00:00.0000000' AS DateTime2), 23, NULL, NULL)
GO
INSERT [dbo].[WorkRequest] ([Id], [ClientId], [CreateTime], [EmployeeId], [FullfilledDate], [Address], [TaskDescription], [IsAccepted], [BeginWorkTime], [CompleteWorkTime], [WorkTypeId], [WithdrawalsId], [UserAssessment]) VALUES (152, 22, CAST(N'2022-07-10T17:50:11.0000000' AS DateTime2), 40, CAST(N'2022-07-16T00:00:00.0000000' AS DateTime2), N'266 Woodsman Rd. Clover, SC 29710', NULL, 0, CAST(N'2022-07-16T10:00:00.0000000' AS DateTime2), CAST(N'2022-07-16T16:00:00.0000000' AS DateTime2), 23, NULL, NULL)
GO
INSERT [dbo].[WorkRequest] ([Id], [ClientId], [CreateTime], [EmployeeId], [FullfilledDate], [Address], [TaskDescription], [IsAccepted], [BeginWorkTime], [CompleteWorkTime], [WorkTypeId], [WithdrawalsId], [UserAssessment]) VALUES (153, 17, CAST(N'2022-07-10T18:04:21.0000000' AS DateTime2), 36, CAST(N'2022-07-16T00:00:00.0000000' AS DateTime2), N'9971 Ridgewood Lane Ossining, NY 10562', NULL, 0, CAST(N'2022-07-16T10:00:00.0000000' AS DateTime2), CAST(N'2022-07-16T16:00:00.0000000' AS DateTime2), 23, NULL, NULL)
GO
INSERT [dbo].[WorkRequest] ([Id], [ClientId], [CreateTime], [EmployeeId], [FullfilledDate], [Address], [TaskDescription], [IsAccepted], [BeginWorkTime], [CompleteWorkTime], [WorkTypeId], [WithdrawalsId], [UserAssessment]) VALUES (154, 9, CAST(N'2022-07-10T19:30:50.0000000' AS DateTime2), 18, CAST(N'2022-07-11T00:00:00.0000000' AS DateTime2), N'94 Glenlake St. Niagara Falls, NY 14304', NULL, 0, CAST(N'2022-07-11T10:00:00.0000000' AS DateTime2), CAST(N'2022-07-11T16:00:00.0000000' AS DateTime2), 8, NULL, NULL)
GO
INSERT [dbo].[WorkRequest] ([Id], [ClientId], [CreateTime], [EmployeeId], [FullfilledDate], [Address], [TaskDescription], [IsAccepted], [BeginWorkTime], [CompleteWorkTime], [WorkTypeId], [WithdrawalsId], [UserAssessment]) VALUES (155, 13, CAST(N'2022-07-10T20:13:39.0000000' AS DateTime2), 44, CAST(N'2022-07-17T00:00:00.0000000' AS DateTime2), N'8634 South New Ave. Phoenixville, PA 19460', NULL, 1, CAST(N'2022-07-17T08:18:30.0000000' AS DateTime2), CAST(N'2022-07-17T16:13:51.0000000' AS DateTime2), 13, NULL, 1)
GO
INSERT [dbo].[WorkRequest] ([Id], [ClientId], [CreateTime], [EmployeeId], [FullfilledDate], [Address], [TaskDescription], [IsAccepted], [BeginWorkTime], [CompleteWorkTime], [WorkTypeId], [WithdrawalsId], [UserAssessment]) VALUES (156, 37, CAST(N'2022-07-10T21:29:39.0000000' AS DateTime2), 7, CAST(N'2022-07-15T00:00:00.0000000' AS DateTime2), N'61 Brown St. Stafford, VA 22554', NULL, 1, CAST(N'2022-07-15T09:49:41.0000000' AS DateTime2), CAST(N'2022-07-15T20:13:56.0000000' AS DateTime2), 12, NULL, 3)
GO
INSERT [dbo].[WorkRequest] ([Id], [ClientId], [CreateTime], [EmployeeId], [FullfilledDate], [Address], [TaskDescription], [IsAccepted], [BeginWorkTime], [CompleteWorkTime], [WorkTypeId], [WithdrawalsId], [UserAssessment]) VALUES (157, 23, CAST(N'2022-07-11T06:36:45.0000000' AS DateTime2), 35, CAST(N'2022-07-17T00:00:00.0000000' AS DateTime2), N'80 Wrangler Street Apex, NC 27502', NULL, 0, CAST(N'2022-07-17T10:00:00.0000000' AS DateTime2), CAST(N'2022-07-17T16:00:00.0000000' AS DateTime2), 7, NULL, NULL)
GO
INSERT [dbo].[WorkRequest] ([Id], [ClientId], [CreateTime], [EmployeeId], [FullfilledDate], [Address], [TaskDescription], [IsAccepted], [BeginWorkTime], [CompleteWorkTime], [WorkTypeId], [WithdrawalsId], [UserAssessment]) VALUES (158, 33, CAST(N'2022-07-11T10:04:48.0000000' AS DateTime2), 32, CAST(N'2022-07-16T00:00:00.0000000' AS DateTime2), N'83 Bay Street Germantown, MD 20874', NULL, 1, CAST(N'2022-07-16T08:42:56.0000000' AS DateTime2), CAST(N'2022-07-16T15:28:10.0000000' AS DateTime2), 17, NULL, 5)
GO
INSERT [dbo].[WorkRequest] ([Id], [ClientId], [CreateTime], [EmployeeId], [FullfilledDate], [Address], [TaskDescription], [IsAccepted], [BeginWorkTime], [CompleteWorkTime], [WorkTypeId], [WithdrawalsId], [UserAssessment]) VALUES (159, 13, CAST(N'2022-07-11T10:58:04.0000000' AS DateTime2), 20, CAST(N'2022-07-18T00:00:00.0000000' AS DateTime2), N'573 East Stonybrook St. Henrico, VA 23228', NULL, 1, CAST(N'2022-07-18T08:35:38.0000000' AS DateTime2), CAST(N'2022-07-18T18:09:02.0000000' AS DateTime2), 11, NULL, 3)
GO
INSERT [dbo].[WorkRequest] ([Id], [ClientId], [CreateTime], [EmployeeId], [FullfilledDate], [Address], [TaskDescription], [IsAccepted], [BeginWorkTime], [CompleteWorkTime], [WorkTypeId], [WithdrawalsId], [UserAssessment]) VALUES (160, 7, CAST(N'2022-07-11T14:15:11.0000000' AS DateTime2), 36, CAST(N'2022-07-14T00:00:00.0000000' AS DateTime2), N'52 Creekside Ave. Jupiter, FL 33458', NULL, 1, CAST(N'2022-07-14T08:49:20.0000000' AS DateTime2), CAST(N'2022-07-14T18:20:38.0000000' AS DateTime2), 9, NULL, 5)
GO
INSERT [dbo].[WorkRequest] ([Id], [ClientId], [CreateTime], [EmployeeId], [FullfilledDate], [Address], [TaskDescription], [IsAccepted], [BeginWorkTime], [CompleteWorkTime], [WorkTypeId], [WithdrawalsId], [UserAssessment]) VALUES (161, 20, CAST(N'2022-07-11T14:38:37.0000000' AS DateTime2), 40, CAST(N'2022-07-13T00:00:00.0000000' AS DateTime2), N'37 Albany Street Staten Island, NY 10301', NULL, 0, CAST(N'2022-07-13T10:00:00.0000000' AS DateTime2), CAST(N'2022-07-13T16:00:00.0000000' AS DateTime2), 7, NULL, NULL)
GO
INSERT [dbo].[WorkRequest] ([Id], [ClientId], [CreateTime], [EmployeeId], [FullfilledDate], [Address], [TaskDescription], [IsAccepted], [BeginWorkTime], [CompleteWorkTime], [WorkTypeId], [WithdrawalsId], [UserAssessment]) VALUES (162, 23, CAST(N'2022-07-11T16:05:31.0000000' AS DateTime2), 38, CAST(N'2022-07-15T00:00:00.0000000' AS DateTime2), N'7216 Lake St. Mount Prospect, IL 60056', NULL, 0, CAST(N'2022-07-15T10:00:00.0000000' AS DateTime2), CAST(N'2022-07-15T16:00:00.0000000' AS DateTime2), 19, NULL, NULL)
GO
INSERT [dbo].[WorkRequest] ([Id], [ClientId], [CreateTime], [EmployeeId], [FullfilledDate], [Address], [TaskDescription], [IsAccepted], [BeginWorkTime], [CompleteWorkTime], [WorkTypeId], [WithdrawalsId], [UserAssessment]) VALUES (163, 57, CAST(N'2022-07-11T18:00:54.0000000' AS DateTime2), 10, CAST(N'2022-07-13T00:00:00.0000000' AS DateTime2), N'67 Rockaway Street Stone Mountain, GA 30083', NULL, 1, CAST(N'2022-07-13T10:19:48.0000000' AS DateTime2), CAST(N'2022-07-13T16:46:07.0000000' AS DateTime2), 23, NULL, 3)
GO
INSERT [dbo].[WorkRequest] ([Id], [ClientId], [CreateTime], [EmployeeId], [FullfilledDate], [Address], [TaskDescription], [IsAccepted], [BeginWorkTime], [CompleteWorkTime], [WorkTypeId], [WithdrawalsId], [UserAssessment]) VALUES (164, 2, CAST(N'2022-07-11T19:18:03.0000000' AS DateTime2), 25, CAST(N'2022-07-13T00:00:00.0000000' AS DateTime2), N'191 Amerige Rd. Deerfield Beach, FL 33442', NULL, 1, CAST(N'2022-07-13T09:41:00.0000000' AS DateTime2), CAST(N'2022-07-13T19:18:40.0000000' AS DateTime2), 7, NULL, 4)
GO
INSERT [dbo].[WorkRequest] ([Id], [ClientId], [CreateTime], [EmployeeId], [FullfilledDate], [Address], [TaskDescription], [IsAccepted], [BeginWorkTime], [CompleteWorkTime], [WorkTypeId], [WithdrawalsId], [UserAssessment]) VALUES (165, 43, CAST(N'2022-07-12T09:41:19.0000000' AS DateTime2), 50, CAST(N'2022-07-17T00:00:00.0000000' AS DateTime2), N'8216 Pennington Court Deland, FL 32720', NULL, 0, CAST(N'2022-07-17T10:00:00.0000000' AS DateTime2), CAST(N'2022-07-17T16:00:00.0000000' AS DateTime2), 13, NULL, NULL)
GO
INSERT [dbo].[WorkRequest] ([Id], [ClientId], [CreateTime], [EmployeeId], [FullfilledDate], [Address], [TaskDescription], [IsAccepted], [BeginWorkTime], [CompleteWorkTime], [WorkTypeId], [WithdrawalsId], [UserAssessment]) VALUES (166, 59, CAST(N'2022-07-12T14:18:05.0000000' AS DateTime2), 35, CAST(N'2022-07-14T00:00:00.0000000' AS DateTime2), N'9467 Lincoln Ave. Fenton, MI 48430', NULL, 1, CAST(N'2022-07-14T09:25:37.0000000' AS DateTime2), CAST(N'2022-07-14T20:15:01.0000000' AS DateTime2), 18, NULL, 3)
GO
INSERT [dbo].[WorkRequest] ([Id], [ClientId], [CreateTime], [EmployeeId], [FullfilledDate], [Address], [TaskDescription], [IsAccepted], [BeginWorkTime], [CompleteWorkTime], [WorkTypeId], [WithdrawalsId], [UserAssessment]) VALUES (167, 33, CAST(N'2022-07-12T14:50:05.0000000' AS DateTime2), 16, CAST(N'2022-07-15T00:00:00.0000000' AS DateTime2), N'5 Shub Farm Street Anchorage, AK 99504', NULL, 0, CAST(N'2022-07-15T10:00:00.0000000' AS DateTime2), CAST(N'2022-07-15T16:00:00.0000000' AS DateTime2), 8, NULL, NULL)
GO
INSERT [dbo].[WorkRequest] ([Id], [ClientId], [CreateTime], [EmployeeId], [FullfilledDate], [Address], [TaskDescription], [IsAccepted], [BeginWorkTime], [CompleteWorkTime], [WorkTypeId], [WithdrawalsId], [UserAssessment]) VALUES (168, 54, CAST(N'2022-07-12T14:56:11.0000000' AS DateTime2), 39, CAST(N'2022-07-13T00:00:00.0000000' AS DateTime2), N'1 Meadow Street Paducah, KY 42001', NULL, 0, CAST(N'2022-07-13T10:00:00.0000000' AS DateTime2), CAST(N'2022-07-13T16:00:00.0000000' AS DateTime2), 12, NULL, NULL)
GO
INSERT [dbo].[WorkRequest] ([Id], [ClientId], [CreateTime], [EmployeeId], [FullfilledDate], [Address], [TaskDescription], [IsAccepted], [BeginWorkTime], [CompleteWorkTime], [WorkTypeId], [WithdrawalsId], [UserAssessment]) VALUES (169, 34, CAST(N'2022-07-12T15:19:25.0000000' AS DateTime2), 38, CAST(N'2022-07-14T00:00:00.0000000' AS DateTime2), N'938 Pilgrim Street Rego Park, NY 11374', NULL, 1, CAST(N'2022-07-14T10:05:05.0000000' AS DateTime2), CAST(N'2022-07-14T17:19:05.0000000' AS DateTime2), 7, NULL, 4)
GO
INSERT [dbo].[WorkRequest] ([Id], [ClientId], [CreateTime], [EmployeeId], [FullfilledDate], [Address], [TaskDescription], [IsAccepted], [BeginWorkTime], [CompleteWorkTime], [WorkTypeId], [WithdrawalsId], [UserAssessment]) VALUES (170, 16, CAST(N'2022-07-12T19:54:36.0000000' AS DateTime2), 37, CAST(N'2022-07-15T00:00:00.0000000' AS DateTime2), N'29 Smith Store Dr. Saint Petersburg, FL 33702', NULL, 0, CAST(N'2022-07-15T10:00:00.0000000' AS DateTime2), CAST(N'2022-07-15T16:00:00.0000000' AS DateTime2), 15, NULL, NULL)
GO
INSERT [dbo].[WorkRequest] ([Id], [ClientId], [CreateTime], [EmployeeId], [FullfilledDate], [Address], [TaskDescription], [IsAccepted], [BeginWorkTime], [CompleteWorkTime], [WorkTypeId], [WithdrawalsId], [UserAssessment]) VALUES (171, 23, CAST(N'2022-07-12T21:34:56.0000000' AS DateTime2), 7, CAST(N'2022-07-15T00:00:00.0000000' AS DateTime2), N'618 Newcastle Ave. Tallahassee, FL 32303', NULL, 1, CAST(N'2022-07-15T09:08:33.0000000' AS DateTime2), CAST(N'2022-07-15T16:20:24.0000000' AS DateTime2), 30, NULL, 3)
GO
INSERT [dbo].[WorkRequest] ([Id], [ClientId], [CreateTime], [EmployeeId], [FullfilledDate], [Address], [TaskDescription], [IsAccepted], [BeginWorkTime], [CompleteWorkTime], [WorkTypeId], [WithdrawalsId], [UserAssessment]) VALUES (172, 34, CAST(N'2022-07-13T08:14:04.0000000' AS DateTime2), 15, CAST(N'2022-07-19T00:00:00.0000000' AS DateTime2), N'7857 Victoria St. Romeoville, IL 60446', NULL, 1, CAST(N'2022-07-19T09:57:31.0000000' AS DateTime2), CAST(N'2022-07-19T20:14:46.0000000' AS DateTime2), 12, NULL, 3)
GO
INSERT [dbo].[WorkRequest] ([Id], [ClientId], [CreateTime], [EmployeeId], [FullfilledDate], [Address], [TaskDescription], [IsAccepted], [BeginWorkTime], [CompleteWorkTime], [WorkTypeId], [WithdrawalsId], [UserAssessment]) VALUES (173, 42, CAST(N'2022-07-13T09:11:52.0000000' AS DateTime2), 46, CAST(N'2022-07-16T00:00:00.0000000' AS DateTime2), N'58 Poor House St. Winter Haven, FL 33880', NULL, 1, CAST(N'2022-07-16T09:21:56.0000000' AS DateTime2), CAST(N'2022-07-16T15:12:37.0000000' AS DateTime2), 17, NULL, 4)
GO
INSERT [dbo].[WorkRequest] ([Id], [ClientId], [CreateTime], [EmployeeId], [FullfilledDate], [Address], [TaskDescription], [IsAccepted], [BeginWorkTime], [CompleteWorkTime], [WorkTypeId], [WithdrawalsId], [UserAssessment]) VALUES (174, 44, CAST(N'2022-07-13T12:52:15.0000000' AS DateTime2), 17, CAST(N'2022-07-15T00:00:00.0000000' AS DateTime2), N'396 Water Street North Ridgeville, OH 44039', NULL, 1, CAST(N'2022-07-15T08:57:07.0000000' AS DateTime2), CAST(N'2022-07-15T16:48:47.0000000' AS DateTime2), 29, NULL, 3)
GO
INSERT [dbo].[WorkRequest] ([Id], [ClientId], [CreateTime], [EmployeeId], [FullfilledDate], [Address], [TaskDescription], [IsAccepted], [BeginWorkTime], [CompleteWorkTime], [WorkTypeId], [WithdrawalsId], [UserAssessment]) VALUES (175, 42, CAST(N'2022-07-14T08:31:02.0000000' AS DateTime2), 50, CAST(N'2022-07-20T00:00:00.0000000' AS DateTime2), N'7076 Purple Finch Ave. Troy, NY 12180', NULL, 0, CAST(N'2022-07-20T10:00:00.0000000' AS DateTime2), CAST(N'2022-07-20T16:00:00.0000000' AS DateTime2), 9, NULL, NULL)
GO
INSERT [dbo].[WorkRequest] ([Id], [ClientId], [CreateTime], [EmployeeId], [FullfilledDate], [Address], [TaskDescription], [IsAccepted], [BeginWorkTime], [CompleteWorkTime], [WorkTypeId], [WithdrawalsId], [UserAssessment]) VALUES (176, 3, CAST(N'2022-07-14T11:51:29.0000000' AS DateTime2), 41, CAST(N'2022-07-17T00:00:00.0000000' AS DateTime2), N'7295 E. Cooper Street Tucson, AZ 85718', NULL, 1, CAST(N'2022-07-17T08:39:50.0000000' AS DateTime2), CAST(N'2022-07-17T17:56:06.0000000' AS DateTime2), 31, NULL, 2)
GO
INSERT [dbo].[WorkRequest] ([Id], [ClientId], [CreateTime], [EmployeeId], [FullfilledDate], [Address], [TaskDescription], [IsAccepted], [BeginWorkTime], [CompleteWorkTime], [WorkTypeId], [WithdrawalsId], [UserAssessment]) VALUES (177, 30, CAST(N'2022-07-14T12:42:22.0000000' AS DateTime2), 20, CAST(N'2022-07-16T00:00:00.0000000' AS DateTime2), N'24 North Warren Street Hephzibah, GA 30815', NULL, 0, CAST(N'2022-07-16T10:00:00.0000000' AS DateTime2), CAST(N'2022-07-16T16:00:00.0000000' AS DateTime2), 23, NULL, NULL)
GO
INSERT [dbo].[WorkRequest] ([Id], [ClientId], [CreateTime], [EmployeeId], [FullfilledDate], [Address], [TaskDescription], [IsAccepted], [BeginWorkTime], [CompleteWorkTime], [WorkTypeId], [WithdrawalsId], [UserAssessment]) VALUES (178, 8, CAST(N'2022-07-14T13:02:56.0000000' AS DateTime2), 16, CAST(N'2022-07-17T00:00:00.0000000' AS DateTime2), N'34 Vine St. Hartselle, AL 35640', NULL, 1, CAST(N'2022-07-17T08:27:48.0000000' AS DateTime2), CAST(N'2022-07-17T18:44:10.0000000' AS DateTime2), 23, NULL, 3)
GO
INSERT [dbo].[WorkRequest] ([Id], [ClientId], [CreateTime], [EmployeeId], [FullfilledDate], [Address], [TaskDescription], [IsAccepted], [BeginWorkTime], [CompleteWorkTime], [WorkTypeId], [WithdrawalsId], [UserAssessment]) VALUES (179, 21, CAST(N'2022-07-15T06:07:54.0000000' AS DateTime2), 31, CAST(N'2022-07-21T00:00:00.0000000' AS DateTime2), N'7446 Euclid Court Greenville, NC 27834', NULL, 1, CAST(N'2022-07-21T08:19:32.0000000' AS DateTime2), CAST(N'2022-07-21T19:22:31.0000000' AS DateTime2), 10, NULL, 4)
GO
INSERT [dbo].[WorkRequest] ([Id], [ClientId], [CreateTime], [EmployeeId], [FullfilledDate], [Address], [TaskDescription], [IsAccepted], [BeginWorkTime], [CompleteWorkTime], [WorkTypeId], [WithdrawalsId], [UserAssessment]) VALUES (180, 16, CAST(N'2022-07-15T11:43:04.0000000' AS DateTime2), 31, CAST(N'2022-07-18T00:00:00.0000000' AS DateTime2), N'7381 Ivy Road Oklahoma City, OK 73112', NULL, 1, CAST(N'2022-07-18T08:14:18.0000000' AS DateTime2), CAST(N'2022-07-18T20:10:06.0000000' AS DateTime2), 12, NULL, 4)
GO
INSERT [dbo].[WorkRequest] ([Id], [ClientId], [CreateTime], [EmployeeId], [FullfilledDate], [Address], [TaskDescription], [IsAccepted], [BeginWorkTime], [CompleteWorkTime], [WorkTypeId], [WithdrawalsId], [UserAssessment]) VALUES (181, 32, CAST(N'2022-07-15T14:41:55.0000000' AS DateTime2), 7, CAST(N'2022-07-21T00:00:00.0000000' AS DateTime2), N'959 Prairie St. Hollis, NY 11423', NULL, 0, CAST(N'2022-07-21T10:00:00.0000000' AS DateTime2), CAST(N'2022-07-21T16:00:00.0000000' AS DateTime2), 23, NULL, NULL)
GO
INSERT [dbo].[WorkRequest] ([Id], [ClientId], [CreateTime], [EmployeeId], [FullfilledDate], [Address], [TaskDescription], [IsAccepted], [BeginWorkTime], [CompleteWorkTime], [WorkTypeId], [WithdrawalsId], [UserAssessment]) VALUES (182, 10, CAST(N'2022-07-15T15:15:19.0000000' AS DateTime2), 4, CAST(N'2022-07-21T00:00:00.0000000' AS DateTime2), N'429 Shipley Drive Roanoke, VA 24012', NULL, 0, CAST(N'2022-07-21T10:00:00.0000000' AS DateTime2), CAST(N'2022-07-21T16:00:00.0000000' AS DateTime2), 30, NULL, NULL)
GO
INSERT [dbo].[WorkRequest] ([Id], [ClientId], [CreateTime], [EmployeeId], [FullfilledDate], [Address], [TaskDescription], [IsAccepted], [BeginWorkTime], [CompleteWorkTime], [WorkTypeId], [WithdrawalsId], [UserAssessment]) VALUES (183, 33, CAST(N'2022-07-15T18:01:45.0000000' AS DateTime2), 24, CAST(N'2022-07-20T00:00:00.0000000' AS DateTime2), N'166 E. Pin Oak Street Central Islip, NY 11722', NULL, 1, CAST(N'2022-07-20T08:12:51.0000000' AS DateTime2), CAST(N'2022-07-20T16:42:56.0000000' AS DateTime2), 10, NULL, 3)
GO
INSERT [dbo].[WorkRequest] ([Id], [ClientId], [CreateTime], [EmployeeId], [FullfilledDate], [Address], [TaskDescription], [IsAccepted], [BeginWorkTime], [CompleteWorkTime], [WorkTypeId], [WithdrawalsId], [UserAssessment]) VALUES (184, 46, CAST(N'2022-07-16T10:26:36.0000000' AS DateTime2), 4, CAST(N'2022-07-19T00:00:00.0000000' AS DateTime2), N'6 South River Ave. Feasterville Trevose, PA 19053', NULL, 0, CAST(N'2022-07-19T10:00:00.0000000' AS DateTime2), CAST(N'2022-07-19T16:00:00.0000000' AS DateTime2), 27, NULL, NULL)
GO
INSERT [dbo].[WorkRequest] ([Id], [ClientId], [CreateTime], [EmployeeId], [FullfilledDate], [Address], [TaskDescription], [IsAccepted], [BeginWorkTime], [CompleteWorkTime], [WorkTypeId], [WithdrawalsId], [UserAssessment]) VALUES (185, 27, CAST(N'2022-07-16T11:41:33.0000000' AS DateTime2), 16, CAST(N'2022-07-21T00:00:00.0000000' AS DateTime2), N'873 Halifax Drive Warner Robins, GA 31088', NULL, 0, CAST(N'2022-07-21T10:00:00.0000000' AS DateTime2), CAST(N'2022-07-21T16:00:00.0000000' AS DateTime2), 6, NULL, NULL)
GO
INSERT [dbo].[WorkRequest] ([Id], [ClientId], [CreateTime], [EmployeeId], [FullfilledDate], [Address], [TaskDescription], [IsAccepted], [BeginWorkTime], [CompleteWorkTime], [WorkTypeId], [WithdrawalsId], [UserAssessment]) VALUES (186, 1, CAST(N'2022-07-16T15:37:37.0000000' AS DateTime2), 16, CAST(N'2022-07-23T00:00:00.0000000' AS DateTime2), N'33 Trenton Street Hastings, MN 55033', NULL, 1, CAST(N'2022-07-23T08:21:23.0000000' AS DateTime2), CAST(N'2022-07-23T19:04:24.0000000' AS DateTime2), 24, NULL, 1)
GO
INSERT [dbo].[WorkRequest] ([Id], [ClientId], [CreateTime], [EmployeeId], [FullfilledDate], [Address], [TaskDescription], [IsAccepted], [BeginWorkTime], [CompleteWorkTime], [WorkTypeId], [WithdrawalsId], [UserAssessment]) VALUES (187, 29, CAST(N'2022-07-16T16:21:28.0000000' AS DateTime2), 26, CAST(N'2022-07-17T00:00:00.0000000' AS DateTime2), N'58 Prince Street Monsey, NY 10952', NULL, 0, CAST(N'2022-07-17T10:00:00.0000000' AS DateTime2), CAST(N'2022-07-17T16:00:00.0000000' AS DateTime2), 11, NULL, NULL)
GO
INSERT [dbo].[WorkRequest] ([Id], [ClientId], [CreateTime], [EmployeeId], [FullfilledDate], [Address], [TaskDescription], [IsAccepted], [BeginWorkTime], [CompleteWorkTime], [WorkTypeId], [WithdrawalsId], [UserAssessment]) VALUES (188, 50, CAST(N'2022-07-17T17:13:39.0000000' AS DateTime2), 27, CAST(N'2022-07-23T00:00:00.0000000' AS DateTime2), N'596 Oak Meadow Court Munster, IN 46321', NULL, 1, CAST(N'2022-07-23T09:08:23.0000000' AS DateTime2), CAST(N'2022-07-23T19:13:13.0000000' AS DateTime2), 25, NULL, 1)
GO
INSERT [dbo].[WorkRequest] ([Id], [ClientId], [CreateTime], [EmployeeId], [FullfilledDate], [Address], [TaskDescription], [IsAccepted], [BeginWorkTime], [CompleteWorkTime], [WorkTypeId], [WithdrawalsId], [UserAssessment]) VALUES (189, 1, CAST(N'2022-07-17T20:41:00.0000000' AS DateTime2), 31, CAST(N'2022-07-18T00:00:00.0000000' AS DateTime2), N'347 N. Applegate St. Oswego, NY 13126', NULL, 0, CAST(N'2022-07-18T10:00:00.0000000' AS DateTime2), CAST(N'2022-07-18T16:00:00.0000000' AS DateTime2), 13, NULL, NULL)
GO
INSERT [dbo].[WorkRequest] ([Id], [ClientId], [CreateTime], [EmployeeId], [FullfilledDate], [Address], [TaskDescription], [IsAccepted], [BeginWorkTime], [CompleteWorkTime], [WorkTypeId], [WithdrawalsId], [UserAssessment]) VALUES (190, 11, CAST(N'2022-07-18T06:54:18.0000000' AS DateTime2), 24, CAST(N'2022-07-23T00:00:00.0000000' AS DateTime2), N'7803 East Maiden Ave. Riverview, FL 33569', NULL, 1, CAST(N'2022-07-23T10:07:45.0000000' AS DateTime2), CAST(N'2022-07-23T18:22:54.0000000' AS DateTime2), 15, NULL, 2)
GO
INSERT [dbo].[WorkRequest] ([Id], [ClientId], [CreateTime], [EmployeeId], [FullfilledDate], [Address], [TaskDescription], [IsAccepted], [BeginWorkTime], [CompleteWorkTime], [WorkTypeId], [WithdrawalsId], [UserAssessment]) VALUES (191, 29, CAST(N'2022-07-18T09:18:52.0000000' AS DateTime2), 23, CAST(N'2022-07-22T00:00:00.0000000' AS DateTime2), N'968 Newbridge St. Wakefield, MA 01880', NULL, 1, CAST(N'2022-07-22T10:13:35.0000000' AS DateTime2), CAST(N'2022-07-22T19:14:50.0000000' AS DateTime2), 20, NULL, 2)
GO
INSERT [dbo].[WorkRequest] ([Id], [ClientId], [CreateTime], [EmployeeId], [FullfilledDate], [Address], [TaskDescription], [IsAccepted], [BeginWorkTime], [CompleteWorkTime], [WorkTypeId], [WithdrawalsId], [UserAssessment]) VALUES (192, 46, CAST(N'2022-07-18T11:14:37.0000000' AS DateTime2), 9, CAST(N'2022-07-22T00:00:00.0000000' AS DateTime2), N'7342 Holly Drive Bethesda, MD 20814', NULL, 1, CAST(N'2022-07-22T10:14:44.0000000' AS DateTime2), CAST(N'2022-07-22T15:05:31.0000000' AS DateTime2), 21, NULL, 4)
GO
INSERT [dbo].[WorkRequest] ([Id], [ClientId], [CreateTime], [EmployeeId], [FullfilledDate], [Address], [TaskDescription], [IsAccepted], [BeginWorkTime], [CompleteWorkTime], [WorkTypeId], [WithdrawalsId], [UserAssessment]) VALUES (193, 26, CAST(N'2022-07-18T11:45:28.0000000' AS DateTime2), 46, CAST(N'2022-07-25T00:00:00.0000000' AS DateTime2), N'7012 Gonzales St. Merrimack, NH 03054', NULL, 1, CAST(N'2022-07-25T10:02:53.0000000' AS DateTime2), CAST(N'2022-07-25T19:13:03.0000000' AS DateTime2), 31, NULL, 2)
GO
INSERT [dbo].[WorkRequest] ([Id], [ClientId], [CreateTime], [EmployeeId], [FullfilledDate], [Address], [TaskDescription], [IsAccepted], [BeginWorkTime], [CompleteWorkTime], [WorkTypeId], [WithdrawalsId], [UserAssessment]) VALUES (194, 31, CAST(N'2022-07-18T14:07:56.0000000' AS DateTime2), 31, CAST(N'2022-07-20T00:00:00.0000000' AS DateTime2), N'20 North Holly Street Battle Creek, MI 49015', NULL, 1, CAST(N'2022-07-20T09:00:12.0000000' AS DateTime2), CAST(N'2022-07-20T19:18:45.0000000' AS DateTime2), 31, NULL, 4)
GO
INSERT [dbo].[WorkRequest] ([Id], [ClientId], [CreateTime], [EmployeeId], [FullfilledDate], [Address], [TaskDescription], [IsAccepted], [BeginWorkTime], [CompleteWorkTime], [WorkTypeId], [WithdrawalsId], [UserAssessment]) VALUES (195, 38, CAST(N'2022-07-18T16:21:58.0000000' AS DateTime2), 47, CAST(N'2022-07-25T00:00:00.0000000' AS DateTime2), N'30 Myers St. Coventry, RI 02816', NULL, 0, CAST(N'2022-07-25T10:00:00.0000000' AS DateTime2), CAST(N'2022-07-25T16:00:00.0000000' AS DateTime2), 31, NULL, NULL)
GO
INSERT [dbo].[WorkRequest] ([Id], [ClientId], [CreateTime], [EmployeeId], [FullfilledDate], [Address], [TaskDescription], [IsAccepted], [BeginWorkTime], [CompleteWorkTime], [WorkTypeId], [WithdrawalsId], [UserAssessment]) VALUES (196, 30, CAST(N'2022-07-18T21:08:27.0000000' AS DateTime2), 8, CAST(N'2022-07-24T00:00:00.0000000' AS DateTime2), N'39 N. Princess Road Kennewick, WA 99337', NULL, 1, CAST(N'2022-07-24T09:22:25.0000000' AS DateTime2), CAST(N'2022-07-24T18:24:34.0000000' AS DateTime2), 25, NULL, 4)
GO
INSERT [dbo].[WorkRequest] ([Id], [ClientId], [CreateTime], [EmployeeId], [FullfilledDate], [Address], [TaskDescription], [IsAccepted], [BeginWorkTime], [CompleteWorkTime], [WorkTypeId], [WithdrawalsId], [UserAssessment]) VALUES (197, 20, CAST(N'2022-07-20T08:02:50.0000000' AS DateTime2), 35, CAST(N'2022-07-25T00:00:00.0000000' AS DateTime2), N'99 Whitemarsh Street Indiana, PA 15701', NULL, 0, CAST(N'2022-07-25T10:00:00.0000000' AS DateTime2), CAST(N'2022-07-25T16:00:00.0000000' AS DateTime2), 21, NULL, NULL)
GO
INSERT [dbo].[WorkRequest] ([Id], [ClientId], [CreateTime], [EmployeeId], [FullfilledDate], [Address], [TaskDescription], [IsAccepted], [BeginWorkTime], [CompleteWorkTime], [WorkTypeId], [WithdrawalsId], [UserAssessment]) VALUES (198, 43, CAST(N'2022-07-20T11:48:58.0000000' AS DateTime2), 27, CAST(N'2022-07-21T00:00:00.0000000' AS DateTime2), N'686 Gulf Dr. Westmont, IL 60559', NULL, 1, CAST(N'2022-07-21T09:21:27.0000000' AS DateTime2), CAST(N'2022-07-21T19:06:38.0000000' AS DateTime2), 29, NULL, 5)
GO
INSERT [dbo].[WorkRequest] ([Id], [ClientId], [CreateTime], [EmployeeId], [FullfilledDate], [Address], [TaskDescription], [IsAccepted], [BeginWorkTime], [CompleteWorkTime], [WorkTypeId], [WithdrawalsId], [UserAssessment]) VALUES (199, 60, CAST(N'2022-07-20T11:56:21.0000000' AS DateTime2), 8, CAST(N'2022-07-24T00:00:00.0000000' AS DateTime2), N'582 Oak Valley Ave. Sioux City, IA 51106', NULL, 1, CAST(N'2022-07-24T08:10:03.0000000' AS DateTime2), CAST(N'2022-07-24T19:49:26.0000000' AS DateTime2), 20, NULL, 4)
GO
INSERT [dbo].[WorkRequest] ([Id], [ClientId], [CreateTime], [EmployeeId], [FullfilledDate], [Address], [TaskDescription], [IsAccepted], [BeginWorkTime], [CompleteWorkTime], [WorkTypeId], [WithdrawalsId], [UserAssessment]) VALUES (200, 43, CAST(N'2022-07-20T19:48:29.0000000' AS DateTime2), 45, CAST(N'2022-07-25T00:00:00.0000000' AS DateTime2), N'825 Peninsula St. Utica, NY 13501', NULL, 1, CAST(N'2022-07-25T09:45:54.0000000' AS DateTime2), CAST(N'2022-07-25T15:47:18.0000000' AS DateTime2), 6, NULL, 5)
GO
INSERT [dbo].[WorkRequest] ([Id], [ClientId], [CreateTime], [EmployeeId], [FullfilledDate], [Address], [TaskDescription], [IsAccepted], [BeginWorkTime], [CompleteWorkTime], [WorkTypeId], [WithdrawalsId], [UserAssessment]) VALUES (201, 26, CAST(N'2022-07-21T07:43:39.0000000' AS DateTime2), 34, CAST(N'2022-07-26T00:00:00.0000000' AS DateTime2), N'320 New Saddle St. Arlington, MA 02474', NULL, 1, CAST(N'2022-07-26T08:49:22.0000000' AS DateTime2), CAST(N'2022-07-26T15:28:11.0000000' AS DateTime2), 20, NULL, 3)
GO
INSERT [dbo].[WorkRequest] ([Id], [ClientId], [CreateTime], [EmployeeId], [FullfilledDate], [Address], [TaskDescription], [IsAccepted], [BeginWorkTime], [CompleteWorkTime], [WorkTypeId], [WithdrawalsId], [UserAssessment]) VALUES (202, 45, CAST(N'2022-07-21T07:57:16.0000000' AS DateTime2), 8, CAST(N'2022-07-27T00:00:00.0000000' AS DateTime2), N'1 8th St. Sun City, AZ 85351', NULL, 1, CAST(N'2022-07-27T09:19:07.0000000' AS DateTime2), CAST(N'2022-07-27T20:29:02.0000000' AS DateTime2), 12, NULL, 2)
GO
INSERT [dbo].[WorkRequest] ([Id], [ClientId], [CreateTime], [EmployeeId], [FullfilledDate], [Address], [TaskDescription], [IsAccepted], [BeginWorkTime], [CompleteWorkTime], [WorkTypeId], [WithdrawalsId], [UserAssessment]) VALUES (203, 35, CAST(N'2022-07-21T09:01:16.0000000' AS DateTime2), 3, CAST(N'2022-07-25T00:00:00.0000000' AS DateTime2), N'837 Philmont Ave. Avon Lake, OH 44012', NULL, 1, CAST(N'2022-07-25T09:37:32.0000000' AS DateTime2), CAST(N'2022-07-25T19:00:37.0000000' AS DateTime2), 15, NULL, 4)
GO
INSERT [dbo].[WorkRequest] ([Id], [ClientId], [CreateTime], [EmployeeId], [FullfilledDate], [Address], [TaskDescription], [IsAccepted], [BeginWorkTime], [CompleteWorkTime], [WorkTypeId], [WithdrawalsId], [UserAssessment]) VALUES (204, 52, CAST(N'2022-07-21T09:16:40.0000000' AS DateTime2), 21, CAST(N'2022-07-22T00:00:00.0000000' AS DateTime2), N'9317 Market Ave. Jackson Heights, NY 11372', NULL, 1, CAST(N'2022-07-22T09:40:19.0000000' AS DateTime2), CAST(N'2022-07-22T18:35:59.0000000' AS DateTime2), 15, NULL, 3)
GO
INSERT [dbo].[WorkRequest] ([Id], [ClientId], [CreateTime], [EmployeeId], [FullfilledDate], [Address], [TaskDescription], [IsAccepted], [BeginWorkTime], [CompleteWorkTime], [WorkTypeId], [WithdrawalsId], [UserAssessment]) VALUES (205, 21, CAST(N'2022-07-21T21:58:30.0000000' AS DateTime2), 26, CAST(N'2022-07-25T00:00:00.0000000' AS DateTime2), N'9801 Longfellow Lane Brighton, MA 02135', NULL, 0, CAST(N'2022-07-25T10:00:00.0000000' AS DateTime2), CAST(N'2022-07-25T16:00:00.0000000' AS DateTime2), 16, NULL, NULL)
GO
INSERT [dbo].[WorkRequest] ([Id], [ClientId], [CreateTime], [EmployeeId], [FullfilledDate], [Address], [TaskDescription], [IsAccepted], [BeginWorkTime], [CompleteWorkTime], [WorkTypeId], [WithdrawalsId], [UserAssessment]) VALUES (206, 5, CAST(N'2022-07-22T11:26:41.0000000' AS DateTime2), 9, CAST(N'2022-07-26T00:00:00.0000000' AS DateTime2), N'664 Mayfield Ave. Newtown, PA 18940', NULL, 1, CAST(N'2022-07-26T08:58:58.0000000' AS DateTime2), CAST(N'2022-07-26T15:28:05.0000000' AS DateTime2), 10, NULL, 3)
GO
INSERT [dbo].[WorkRequest] ([Id], [ClientId], [CreateTime], [EmployeeId], [FullfilledDate], [Address], [TaskDescription], [IsAccepted], [BeginWorkTime], [CompleteWorkTime], [WorkTypeId], [WithdrawalsId], [UserAssessment]) VALUES (207, 33, CAST(N'2022-07-22T14:10:45.0000000' AS DateTime2), 38, CAST(N'2022-07-23T00:00:00.0000000' AS DateTime2), N'38 Miller St. Vineland, NJ 08360', NULL, 0, CAST(N'2022-07-23T10:00:00.0000000' AS DateTime2), CAST(N'2022-07-23T16:00:00.0000000' AS DateTime2), 7, NULL, NULL)
GO
INSERT [dbo].[WorkRequest] ([Id], [ClientId], [CreateTime], [EmployeeId], [FullfilledDate], [Address], [TaskDescription], [IsAccepted], [BeginWorkTime], [CompleteWorkTime], [WorkTypeId], [WithdrawalsId], [UserAssessment]) VALUES (208, 37, CAST(N'2022-07-23T06:19:43.0000000' AS DateTime2), 36, CAST(N'2022-07-24T00:00:00.0000000' AS DateTime2), N'1 Dunbar Drive Harleysville, PA 19438', NULL, 1, CAST(N'2022-07-24T10:23:55.0000000' AS DateTime2), CAST(N'2022-07-24T17:32:29.0000000' AS DateTime2), 17, NULL, 2)
GO
INSERT [dbo].[WorkRequest] ([Id], [ClientId], [CreateTime], [EmployeeId], [FullfilledDate], [Address], [TaskDescription], [IsAccepted], [BeginWorkTime], [CompleteWorkTime], [WorkTypeId], [WithdrawalsId], [UserAssessment]) VALUES (209, 33, CAST(N'2022-07-23T07:04:11.0000000' AS DateTime2), 16, CAST(N'2022-07-27T00:00:00.0000000' AS DateTime2), N'9422 Shub Farm Dr. Midland, MI 48640', NULL, 1, CAST(N'2022-07-27T09:32:40.0000000' AS DateTime2), CAST(N'2022-07-27T15:18:09.0000000' AS DateTime2), 19, NULL, 1)
GO
INSERT [dbo].[WorkRequest] ([Id], [ClientId], [CreateTime], [EmployeeId], [FullfilledDate], [Address], [TaskDescription], [IsAccepted], [BeginWorkTime], [CompleteWorkTime], [WorkTypeId], [WithdrawalsId], [UserAssessment]) VALUES (210, 14, CAST(N'2022-07-23T12:13:23.0000000' AS DateTime2), 1, CAST(N'2022-07-30T00:00:00.0000000' AS DateTime2), N'659 Euclid St. Marshfield, WI 54449', NULL, 1, CAST(N'2022-07-30T08:31:36.0000000' AS DateTime2), CAST(N'2022-07-30T19:53:21.0000000' AS DateTime2), 21, NULL, 1)
GO
INSERT [dbo].[WorkRequest] ([Id], [ClientId], [CreateTime], [EmployeeId], [FullfilledDate], [Address], [TaskDescription], [IsAccepted], [BeginWorkTime], [CompleteWorkTime], [WorkTypeId], [WithdrawalsId], [UserAssessment]) VALUES (211, 4, CAST(N'2022-07-23T15:44:26.0000000' AS DateTime2), 30, CAST(N'2022-07-27T00:00:00.0000000' AS DateTime2), N'195 Ohio Lane Morrisville, PA 19067', NULL, 0, CAST(N'2022-07-27T10:00:00.0000000' AS DateTime2), CAST(N'2022-07-27T16:00:00.0000000' AS DateTime2), 32, NULL, NULL)
GO
INSERT [dbo].[WorkRequest] ([Id], [ClientId], [CreateTime], [EmployeeId], [FullfilledDate], [Address], [TaskDescription], [IsAccepted], [BeginWorkTime], [CompleteWorkTime], [WorkTypeId], [WithdrawalsId], [UserAssessment]) VALUES (212, 48, CAST(N'2022-07-23T19:58:47.0000000' AS DateTime2), 1, CAST(N'2022-07-25T00:00:00.0000000' AS DateTime2), N'5 E. Central Dr. Kansas City, MO 64151', NULL, 1, CAST(N'2022-07-25T08:29:59.0000000' AS DateTime2), CAST(N'2022-07-25T16:32:19.0000000' AS DateTime2), 17, NULL, 2)
GO
INSERT [dbo].[WorkRequest] ([Id], [ClientId], [CreateTime], [EmployeeId], [FullfilledDate], [Address], [TaskDescription], [IsAccepted], [BeginWorkTime], [CompleteWorkTime], [WorkTypeId], [WithdrawalsId], [UserAssessment]) VALUES (213, 10, CAST(N'2022-07-24T10:18:39.0000000' AS DateTime2), 2, CAST(N'2022-07-27T00:00:00.0000000' AS DateTime2), N'7588 Strawberry St. Daphne, AL 36526', NULL, 1, CAST(N'2022-07-27T08:55:09.0000000' AS DateTime2), CAST(N'2022-07-27T19:01:32.0000000' AS DateTime2), 23, NULL, 2)
GO
INSERT [dbo].[WorkRequest] ([Id], [ClientId], [CreateTime], [EmployeeId], [FullfilledDate], [Address], [TaskDescription], [IsAccepted], [BeginWorkTime], [CompleteWorkTime], [WorkTypeId], [WithdrawalsId], [UserAssessment]) VALUES (214, 39, CAST(N'2022-07-24T11:04:44.0000000' AS DateTime2), 43, CAST(N'2022-07-27T00:00:00.0000000' AS DateTime2), N'236 Highland Street Minot, ND 58701', NULL, 0, CAST(N'2022-07-27T10:00:00.0000000' AS DateTime2), CAST(N'2022-07-27T16:00:00.0000000' AS DateTime2), 14, NULL, NULL)
GO
INSERT [dbo].[WorkRequest] ([Id], [ClientId], [CreateTime], [EmployeeId], [FullfilledDate], [Address], [TaskDescription], [IsAccepted], [BeginWorkTime], [CompleteWorkTime], [WorkTypeId], [WithdrawalsId], [UserAssessment]) VALUES (215, 36, CAST(N'2022-07-24T13:45:59.0000000' AS DateTime2), 25, CAST(N'2022-07-30T00:00:00.0000000' AS DateTime2), N'928 Corona St. Superior, WI 54880', NULL, 0, CAST(N'2022-07-30T10:00:00.0000000' AS DateTime2), CAST(N'2022-07-30T16:00:00.0000000' AS DateTime2), 31, NULL, NULL)
GO
INSERT [dbo].[WorkRequest] ([Id], [ClientId], [CreateTime], [EmployeeId], [FullfilledDate], [Address], [TaskDescription], [IsAccepted], [BeginWorkTime], [CompleteWorkTime], [WorkTypeId], [WithdrawalsId], [UserAssessment]) VALUES (216, 7, CAST(N'2022-07-24T14:30:18.0000000' AS DateTime2), 16, CAST(N'2022-07-27T00:00:00.0000000' AS DateTime2), N'44 Nichols Drive Grand Forks, ND 58201', NULL, 1, CAST(N'2022-07-27T08:35:48.0000000' AS DateTime2), CAST(N'2022-07-27T19:30:44.0000000' AS DateTime2), 23, NULL, 3)
GO
INSERT [dbo].[WorkRequest] ([Id], [ClientId], [CreateTime], [EmployeeId], [FullfilledDate], [Address], [TaskDescription], [IsAccepted], [BeginWorkTime], [CompleteWorkTime], [WorkTypeId], [WithdrawalsId], [UserAssessment]) VALUES (217, 8, CAST(N'2022-07-24T14:41:42.0000000' AS DateTime2), 43, CAST(N'2022-07-26T00:00:00.0000000' AS DateTime2), N'960 Old High Avenue Lorton, VA 22079', NULL, 0, CAST(N'2022-07-26T10:00:00.0000000' AS DateTime2), CAST(N'2022-07-26T16:00:00.0000000' AS DateTime2), 23, NULL, NULL)
GO
INSERT [dbo].[WorkRequest] ([Id], [ClientId], [CreateTime], [EmployeeId], [FullfilledDate], [Address], [TaskDescription], [IsAccepted], [BeginWorkTime], [CompleteWorkTime], [WorkTypeId], [WithdrawalsId], [UserAssessment]) VALUES (218, 32, CAST(N'2022-07-25T06:31:13.0000000' AS DateTime2), 4, CAST(N'2022-07-27T00:00:00.0000000' AS DateTime2), N'84 South Lincoln Ave. Morgantown, WV 26508', NULL, 1, CAST(N'2022-07-27T08:13:32.0000000' AS DateTime2), CAST(N'2022-07-27T19:59:04.0000000' AS DateTime2), 32, NULL, 2)
GO
INSERT [dbo].[WorkRequest] ([Id], [ClientId], [CreateTime], [EmployeeId], [FullfilledDate], [Address], [TaskDescription], [IsAccepted], [BeginWorkTime], [CompleteWorkTime], [WorkTypeId], [WithdrawalsId], [UserAssessment]) VALUES (219, 18, CAST(N'2022-07-25T14:07:07.0000000' AS DateTime2), 9, CAST(N'2022-07-26T00:00:00.0000000' AS DateTime2), N'76 Livingston Street Poughkeepsie, NY 12601', NULL, 0, CAST(N'2022-07-26T10:00:00.0000000' AS DateTime2), CAST(N'2022-07-26T16:00:00.0000000' AS DateTime2), 21, NULL, NULL)
GO
INSERT [dbo].[WorkRequest] ([Id], [ClientId], [CreateTime], [EmployeeId], [FullfilledDate], [Address], [TaskDescription], [IsAccepted], [BeginWorkTime], [CompleteWorkTime], [WorkTypeId], [WithdrawalsId], [UserAssessment]) VALUES (220, 27, CAST(N'2022-07-25T16:01:44.0000000' AS DateTime2), 21, CAST(N'2022-07-27T00:00:00.0000000' AS DateTime2), N'6 Chestnut Lane Fort Lee, NJ 07024', NULL, 1, CAST(N'2022-07-27T09:50:19.0000000' AS DateTime2), CAST(N'2022-07-27T15:23:07.0000000' AS DateTime2), 29, NULL, 2)
GO
INSERT [dbo].[WorkRequest] ([Id], [ClientId], [CreateTime], [EmployeeId], [FullfilledDate], [Address], [TaskDescription], [IsAccepted], [BeginWorkTime], [CompleteWorkTime], [WorkTypeId], [WithdrawalsId], [UserAssessment]) VALUES (221, 6, CAST(N'2022-07-25T18:55:08.0000000' AS DateTime2), 33, CAST(N'2022-07-30T00:00:00.0000000' AS DateTime2), N'636 Vine Street Holly Springs, NC 27540', NULL, 0, CAST(N'2022-07-30T10:00:00.0000000' AS DateTime2), CAST(N'2022-07-30T16:00:00.0000000' AS DateTime2), 8, NULL, NULL)
GO
INSERT [dbo].[WorkRequest] ([Id], [ClientId], [CreateTime], [EmployeeId], [FullfilledDate], [Address], [TaskDescription], [IsAccepted], [BeginWorkTime], [CompleteWorkTime], [WorkTypeId], [WithdrawalsId], [UserAssessment]) VALUES (222, 2, CAST(N'2022-07-25T21:28:59.0000000' AS DateTime2), 49, CAST(N'2022-07-27T00:00:00.0000000' AS DateTime2), N'4 East Hill Field Street Richardson, TX 75080', NULL, 1, CAST(N'2022-07-27T09:01:00.0000000' AS DateTime2), CAST(N'2022-07-27T18:28:25.0000000' AS DateTime2), 30, 2, 4)
GO
INSERT [dbo].[WorkRequest] ([Id], [ClientId], [CreateTime], [EmployeeId], [FullfilledDate], [Address], [TaskDescription], [IsAccepted], [BeginWorkTime], [CompleteWorkTime], [WorkTypeId], [WithdrawalsId], [UserAssessment]) VALUES (223, 9, CAST(N'2022-07-25T21:44:13.0000000' AS DateTime2), 22, CAST(N'2022-07-28T00:00:00.0000000' AS DateTime2), N'7516 Third St. Noblesville, IN 46060', NULL, 1, CAST(N'2022-07-28T10:04:03.0000000' AS DateTime2), CAST(N'2022-07-28T20:12:45.0000000' AS DateTime2), 18, NULL, 3)
GO
INSERT [dbo].[WorkRequest] ([Id], [ClientId], [CreateTime], [EmployeeId], [FullfilledDate], [Address], [TaskDescription], [IsAccepted], [BeginWorkTime], [CompleteWorkTime], [WorkTypeId], [WithdrawalsId], [UserAssessment]) VALUES (224, 6, CAST(N'2022-07-26T12:23:37.0000000' AS DateTime2), 38, CAST(N'2022-07-29T00:00:00.0000000' AS DateTime2), N'74 Valley Rd. Banning, CA 92220', NULL, 1, CAST(N'2022-07-29T10:17:17.0000000' AS DateTime2), CAST(N'2022-07-29T19:38:29.0000000' AS DateTime2), 8, NULL, 4)
GO
INSERT [dbo].[WorkRequest] ([Id], [ClientId], [CreateTime], [EmployeeId], [FullfilledDate], [Address], [TaskDescription], [IsAccepted], [BeginWorkTime], [CompleteWorkTime], [WorkTypeId], [WithdrawalsId], [UserAssessment]) VALUES (225, 51, CAST(N'2022-07-26T14:31:02.0000000' AS DateTime2), 26, CAST(N'2022-07-27T00:00:00.0000000' AS DateTime2), N'8879 NE. Oak Meadow Ave. Fremont, OH 43420', NULL, 1, CAST(N'2022-07-27T08:14:13.0000000' AS DateTime2), CAST(N'2022-07-27T17:04:12.0000000' AS DateTime2), 21, NULL, 5)
GO
INSERT [dbo].[WorkRequest] ([Id], [ClientId], [CreateTime], [EmployeeId], [FullfilledDate], [Address], [TaskDescription], [IsAccepted], [BeginWorkTime], [CompleteWorkTime], [WorkTypeId], [WithdrawalsId], [UserAssessment]) VALUES (226, 56, CAST(N'2022-07-26T17:11:42.0000000' AS DateTime2), 45, CAST(N'2022-08-02T00:00:00.0000000' AS DateTime2), N'8610 Arlington St. Terre Haute, IN 47802', NULL, 0, CAST(N'2022-08-02T10:00:00.0000000' AS DateTime2), CAST(N'2022-08-02T16:00:00.0000000' AS DateTime2), 27, NULL, NULL)
GO
INSERT [dbo].[WorkRequest] ([Id], [ClientId], [CreateTime], [EmployeeId], [FullfilledDate], [Address], [TaskDescription], [IsAccepted], [BeginWorkTime], [CompleteWorkTime], [WorkTypeId], [WithdrawalsId], [UserAssessment]) VALUES (227, 25, CAST(N'2022-07-26T19:55:56.0000000' AS DateTime2), 40, CAST(N'2022-08-02T00:00:00.0000000' AS DateTime2), N'260 East Brown Rd. Newnan, GA 30263', NULL, 0, CAST(N'2022-08-02T10:00:00.0000000' AS DateTime2), CAST(N'2022-08-02T16:00:00.0000000' AS DateTime2), 31, NULL, NULL)
GO
INSERT [dbo].[WorkRequest] ([Id], [ClientId], [CreateTime], [EmployeeId], [FullfilledDate], [Address], [TaskDescription], [IsAccepted], [BeginWorkTime], [CompleteWorkTime], [WorkTypeId], [WithdrawalsId], [UserAssessment]) VALUES (228, 9, CAST(N'2022-07-27T12:08:21.0000000' AS DateTime2), 50, CAST(N'2022-07-31T00:00:00.0000000' AS DateTime2), N'7821 E. El Dorado Dr. Savage, MN 55378', NULL, 1, CAST(N'2022-07-31T09:49:18.0000000' AS DateTime2), CAST(N'2022-07-31T16:55:31.0000000' AS DateTime2), 30, 3, 4)
GO
INSERT [dbo].[WorkRequest] ([Id], [ClientId], [CreateTime], [EmployeeId], [FullfilledDate], [Address], [TaskDescription], [IsAccepted], [BeginWorkTime], [CompleteWorkTime], [WorkTypeId], [WithdrawalsId], [UserAssessment]) VALUES (229, 58, CAST(N'2022-07-27T14:27:35.0000000' AS DateTime2), 10, CAST(N'2022-07-31T00:00:00.0000000' AS DateTime2), N'97 Princeton Drive Clermont, FL 34711', NULL, 0, CAST(N'2022-07-31T10:00:00.0000000' AS DateTime2), CAST(N'2022-07-31T16:00:00.0000000' AS DateTime2), 14, NULL, NULL)
GO
INSERT [dbo].[WorkRequest] ([Id], [ClientId], [CreateTime], [EmployeeId], [FullfilledDate], [Address], [TaskDescription], [IsAccepted], [BeginWorkTime], [CompleteWorkTime], [WorkTypeId], [WithdrawalsId], [UserAssessment]) VALUES (230, 56, CAST(N'2022-07-27T15:56:31.0000000' AS DateTime2), 42, CAST(N'2022-08-03T00:00:00.0000000' AS DateTime2), N'7753 Santa Clara Drive Spartanburg, SC 29301', NULL, 0, CAST(N'2022-08-03T10:00:00.0000000' AS DateTime2), CAST(N'2022-08-03T16:00:00.0000000' AS DateTime2), 29, NULL, NULL)
GO
INSERT [dbo].[WorkRequest] ([Id], [ClientId], [CreateTime], [EmployeeId], [FullfilledDate], [Address], [TaskDescription], [IsAccepted], [BeginWorkTime], [CompleteWorkTime], [WorkTypeId], [WithdrawalsId], [UserAssessment]) VALUES (231, 34, CAST(N'2022-07-28T07:34:51.0000000' AS DateTime2), 25, CAST(N'2022-08-04T00:00:00.0000000' AS DateTime2), N'7671 S. Ketch Harbour Lane Centereach, NY 11720', NULL, 1, CAST(N'2022-08-04T08:53:50.0000000' AS DateTime2), CAST(N'2022-08-04T18:25:02.0000000' AS DateTime2), 12, NULL, 1)
GO
INSERT [dbo].[WorkRequest] ([Id], [ClientId], [CreateTime], [EmployeeId], [FullfilledDate], [Address], [TaskDescription], [IsAccepted], [BeginWorkTime], [CompleteWorkTime], [WorkTypeId], [WithdrawalsId], [UserAssessment]) VALUES (232, 14, CAST(N'2022-07-28T09:07:56.0000000' AS DateTime2), 47, CAST(N'2022-07-30T00:00:00.0000000' AS DateTime2), N'24 Cambridge Ave. Joliet, IL 60435', NULL, 0, CAST(N'2022-07-30T10:00:00.0000000' AS DateTime2), CAST(N'2022-07-30T16:00:00.0000000' AS DateTime2), 15, NULL, NULL)
GO
INSERT [dbo].[WorkRequest] ([Id], [ClientId], [CreateTime], [EmployeeId], [FullfilledDate], [Address], [TaskDescription], [IsAccepted], [BeginWorkTime], [CompleteWorkTime], [WorkTypeId], [WithdrawalsId], [UserAssessment]) VALUES (233, 14, CAST(N'2022-07-28T10:49:25.0000000' AS DateTime2), 36, CAST(N'2022-08-02T00:00:00.0000000' AS DateTime2), N'728 Henry Drive Bellmore, NY 11710', NULL, 1, CAST(N'2022-08-02T09:31:18.0000000' AS DateTime2), CAST(N'2022-08-02T15:18:38.0000000' AS DateTime2), 6, NULL, 1)
GO
INSERT [dbo].[WorkRequest] ([Id], [ClientId], [CreateTime], [EmployeeId], [FullfilledDate], [Address], [TaskDescription], [IsAccepted], [BeginWorkTime], [CompleteWorkTime], [WorkTypeId], [WithdrawalsId], [UserAssessment]) VALUES (234, 23, CAST(N'2022-07-28T12:48:58.0000000' AS DateTime2), 40, CAST(N'2022-07-30T00:00:00.0000000' AS DateTime2), N'659 West Cottage Lane Olympia, WA 98512', NULL, 0, CAST(N'2022-07-30T10:00:00.0000000' AS DateTime2), CAST(N'2022-07-30T16:00:00.0000000' AS DateTime2), 12, NULL, NULL)
GO
INSERT [dbo].[WorkRequest] ([Id], [ClientId], [CreateTime], [EmployeeId], [FullfilledDate], [Address], [TaskDescription], [IsAccepted], [BeginWorkTime], [CompleteWorkTime], [WorkTypeId], [WithdrawalsId], [UserAssessment]) VALUES (235, 33, CAST(N'2022-07-28T14:00:46.0000000' AS DateTime2), 21, CAST(N'2022-08-02T00:00:00.0000000' AS DateTime2), N'20 Glen Eagles Dr. Meadville, PA 16335', NULL, 1, CAST(N'2022-08-02T10:24:59.0000000' AS DateTime2), CAST(N'2022-08-02T17:18:05.0000000' AS DateTime2), 14, NULL, 1)
GO
INSERT [dbo].[WorkRequest] ([Id], [ClientId], [CreateTime], [EmployeeId], [FullfilledDate], [Address], [TaskDescription], [IsAccepted], [BeginWorkTime], [CompleteWorkTime], [WorkTypeId], [WithdrawalsId], [UserAssessment]) VALUES (236, 32, CAST(N'2022-07-29T06:35:41.0000000' AS DateTime2), 6, CAST(N'2022-08-03T00:00:00.0000000' AS DateTime2), N'9 E. Arrowhead Rd. Hicksville, NY 11801', NULL, 1, CAST(N'2022-08-03T08:01:04.0000000' AS DateTime2), CAST(N'2022-08-03T20:04:32.0000000' AS DateTime2), 19, NULL, 3)
GO
INSERT [dbo].[WorkRequest] ([Id], [ClientId], [CreateTime], [EmployeeId], [FullfilledDate], [Address], [TaskDescription], [IsAccepted], [BeginWorkTime], [CompleteWorkTime], [WorkTypeId], [WithdrawalsId], [UserAssessment]) VALUES (237, 44, CAST(N'2022-07-29T09:17:28.0000000' AS DateTime2), 9, CAST(N'2022-08-05T00:00:00.0000000' AS DateTime2), N'7 Swanson Street Marlborough, MA 01752', NULL, 0, CAST(N'2022-08-05T10:00:00.0000000' AS DateTime2), CAST(N'2022-08-05T16:00:00.0000000' AS DateTime2), 22, NULL, NULL)
GO
INSERT [dbo].[WorkRequest] ([Id], [ClientId], [CreateTime], [EmployeeId], [FullfilledDate], [Address], [TaskDescription], [IsAccepted], [BeginWorkTime], [CompleteWorkTime], [WorkTypeId], [WithdrawalsId], [UserAssessment]) VALUES (238, 38, CAST(N'2022-07-29T15:26:13.0000000' AS DateTime2), 8, CAST(N'2022-08-03T00:00:00.0000000' AS DateTime2), N'1 Studebaker Lane Dothan, AL 36301', NULL, 1, CAST(N'2022-08-03T08:20:21.0000000' AS DateTime2), CAST(N'2022-08-03T16:58:26.0000000' AS DateTime2), 13, NULL, 3)
GO
INSERT [dbo].[WorkRequest] ([Id], [ClientId], [CreateTime], [EmployeeId], [FullfilledDate], [Address], [TaskDescription], [IsAccepted], [BeginWorkTime], [CompleteWorkTime], [WorkTypeId], [WithdrawalsId], [UserAssessment]) VALUES (239, 8, CAST(N'2022-07-30T08:46:46.0000000' AS DateTime2), 16, CAST(N'2022-08-06T00:00:00.0000000' AS DateTime2), N'8 Van Dyke St. Kingston, NY 12401', NULL, 1, CAST(N'2022-08-06T09:38:34.0000000' AS DateTime2), CAST(N'2022-08-06T15:08:32.0000000' AS DateTime2), 24, NULL, 2)
GO
INSERT [dbo].[WorkRequest] ([Id], [ClientId], [CreateTime], [EmployeeId], [FullfilledDate], [Address], [TaskDescription], [IsAccepted], [BeginWorkTime], [CompleteWorkTime], [WorkTypeId], [WithdrawalsId], [UserAssessment]) VALUES (240, 15, CAST(N'2022-07-30T09:34:01.0000000' AS DateTime2), 35, CAST(N'2022-07-31T00:00:00.0000000' AS DateTime2), N'63 Grove Drive Far Rockaway, NY 11691', NULL, 1, CAST(N'2022-07-31T10:11:46.0000000' AS DateTime2), CAST(N'2022-07-31T15:17:25.0000000' AS DateTime2), 17, NULL, 1)
GO
INSERT [dbo].[WorkRequest] ([Id], [ClientId], [CreateTime], [EmployeeId], [FullfilledDate], [Address], [TaskDescription], [IsAccepted], [BeginWorkTime], [CompleteWorkTime], [WorkTypeId], [WithdrawalsId], [UserAssessment]) VALUES (241, 16, CAST(N'2022-07-30T21:01:57.0000000' AS DateTime2), 1, CAST(N'2022-08-02T00:00:00.0000000' AS DateTime2), N'44 Old York St. West Roxbury, MA 02132', NULL, 1, CAST(N'2022-08-02T09:03:09.0000000' AS DateTime2), CAST(N'2022-08-02T16:01:28.0000000' AS DateTime2), 23, NULL, 5)
GO
INSERT [dbo].[WorkRequest] ([Id], [ClientId], [CreateTime], [EmployeeId], [FullfilledDate], [Address], [TaskDescription], [IsAccepted], [BeginWorkTime], [CompleteWorkTime], [WorkTypeId], [WithdrawalsId], [UserAssessment]) VALUES (242, 43, CAST(N'2022-08-01T08:42:36.0000000' AS DateTime2), 32, CAST(N'2022-08-02T00:00:00.0000000' AS DateTime2), N'550 Bayport Drive Bolingbrook, IL 60440', NULL, 1, CAST(N'2022-08-02T09:10:27.0000000' AS DateTime2), CAST(N'2022-08-02T19:15:06.0000000' AS DateTime2), 17, NULL, 3)
GO
INSERT [dbo].[WorkRequest] ([Id], [ClientId], [CreateTime], [EmployeeId], [FullfilledDate], [Address], [TaskDescription], [IsAccepted], [BeginWorkTime], [CompleteWorkTime], [WorkTypeId], [WithdrawalsId], [UserAssessment]) VALUES (243, 35, CAST(N'2022-08-01T19:43:41.0000000' AS DateTime2), 6, CAST(N'2022-08-04T00:00:00.0000000' AS DateTime2), N'9060 High Point Dr. Chicopee, MA 01020', NULL, 1, CAST(N'2022-08-04T08:12:51.0000000' AS DateTime2), CAST(N'2022-08-04T16:41:06.0000000' AS DateTime2), 17, NULL, 2)
GO
INSERT [dbo].[WorkRequest] ([Id], [ClientId], [CreateTime], [EmployeeId], [FullfilledDate], [Address], [TaskDescription], [IsAccepted], [BeginWorkTime], [CompleteWorkTime], [WorkTypeId], [WithdrawalsId], [UserAssessment]) VALUES (244, 21, CAST(N'2022-08-02T17:12:21.0000000' AS DateTime2), 19, CAST(N'2022-08-05T00:00:00.0000000' AS DateTime2), N'9794 N. Water Lane Crofton, MD 21114', NULL, 1, CAST(N'2022-08-05T08:02:52.0000000' AS DateTime2), CAST(N'2022-08-05T16:10:14.0000000' AS DateTime2), 30, NULL, 3)
GO
INSERT [dbo].[WorkRequest] ([Id], [ClientId], [CreateTime], [EmployeeId], [FullfilledDate], [Address], [TaskDescription], [IsAccepted], [BeginWorkTime], [CompleteWorkTime], [WorkTypeId], [WithdrawalsId], [UserAssessment]) VALUES (245, 50, CAST(N'2022-08-02T20:03:13.0000000' AS DateTime2), 16, CAST(N'2022-08-08T00:00:00.0000000' AS DateTime2), N'989 Roberts Lane Fitchburg, MA 01420', NULL, 1, CAST(N'2022-08-08T10:05:47.0000000' AS DateTime2), CAST(N'2022-08-08T15:47:51.0000000' AS DateTime2), 16, NULL, 3)
GO
INSERT [dbo].[WorkRequest] ([Id], [ClientId], [CreateTime], [EmployeeId], [FullfilledDate], [Address], [TaskDescription], [IsAccepted], [BeginWorkTime], [CompleteWorkTime], [WorkTypeId], [WithdrawalsId], [UserAssessment]) VALUES (246, 10, CAST(N'2022-08-03T08:10:25.0000000' AS DateTime2), 45, CAST(N'2022-08-06T00:00:00.0000000' AS DateTime2), N'54 Poor House Dr. West Warwick, RI 02893', NULL, 1, CAST(N'2022-08-06T08:20:22.0000000' AS DateTime2), CAST(N'2022-08-06T15:28:34.0000000' AS DateTime2), 22, NULL, 5)
GO
INSERT [dbo].[WorkRequest] ([Id], [ClientId], [CreateTime], [EmployeeId], [FullfilledDate], [Address], [TaskDescription], [IsAccepted], [BeginWorkTime], [CompleteWorkTime], [WorkTypeId], [WithdrawalsId], [UserAssessment]) VALUES (247, 59, CAST(N'2022-08-03T09:54:46.0000000' AS DateTime2), 33, CAST(N'2022-08-05T00:00:00.0000000' AS DateTime2), N'661 Thatcher Road Jackson, NJ 08527', NULL, 1, CAST(N'2022-08-05T08:24:27.0000000' AS DateTime2), CAST(N'2022-08-05T20:29:16.0000000' AS DateTime2), 7, NULL, 3)
GO
INSERT [dbo].[WorkRequest] ([Id], [ClientId], [CreateTime], [EmployeeId], [FullfilledDate], [Address], [TaskDescription], [IsAccepted], [BeginWorkTime], [CompleteWorkTime], [WorkTypeId], [WithdrawalsId], [UserAssessment]) VALUES (248, 17, CAST(N'2022-08-03T13:35:30.0000000' AS DateTime2), 26, CAST(N'2022-08-10T00:00:00.0000000' AS DateTime2), N'7599 Park Ave. Marcus Hook, PA 19061', NULL, 1, CAST(N'2022-08-10T09:01:10.0000000' AS DateTime2), CAST(N'2022-08-10T19:00:40.0000000' AS DateTime2), 13, NULL, 2)
GO
INSERT [dbo].[WorkRequest] ([Id], [ClientId], [CreateTime], [EmployeeId], [FullfilledDate], [Address], [TaskDescription], [IsAccepted], [BeginWorkTime], [CompleteWorkTime], [WorkTypeId], [WithdrawalsId], [UserAssessment]) VALUES (249, 55, CAST(N'2022-08-03T13:38:18.0000000' AS DateTime2), 3, CAST(N'2022-08-05T00:00:00.0000000' AS DateTime2), N'33 53rd Street Hopewell Junction, NY 12533', NULL, 0, CAST(N'2022-08-05T10:00:00.0000000' AS DateTime2), CAST(N'2022-08-05T16:00:00.0000000' AS DateTime2), 32, NULL, NULL)
GO
INSERT [dbo].[WorkRequest] ([Id], [ClientId], [CreateTime], [EmployeeId], [FullfilledDate], [Address], [TaskDescription], [IsAccepted], [BeginWorkTime], [CompleteWorkTime], [WorkTypeId], [WithdrawalsId], [UserAssessment]) VALUES (250, 41, CAST(N'2022-08-03T15:16:14.0000000' AS DateTime2), 27, CAST(N'2022-08-09T00:00:00.0000000' AS DateTime2), N'793 Sage Lane Wyoming, MI 49509', NULL, 1, CAST(N'2022-08-09T09:22:28.0000000' AS DateTime2), CAST(N'2022-08-09T18:35:31.0000000' AS DateTime2), 28, NULL, 4)
GO
INSERT [dbo].[WorkRequest] ([Id], [ClientId], [CreateTime], [EmployeeId], [FullfilledDate], [Address], [TaskDescription], [IsAccepted], [BeginWorkTime], [CompleteWorkTime], [WorkTypeId], [WithdrawalsId], [UserAssessment]) VALUES (251, 35, CAST(N'2022-08-03T20:55:22.0000000' AS DateTime2), 10, CAST(N'2022-08-10T00:00:00.0000000' AS DateTime2), N'3 Green Hill St. West Islip, NY 11795', NULL, 1, CAST(N'2022-08-10T09:18:51.0000000' AS DateTime2), CAST(N'2022-08-10T15:25:37.0000000' AS DateTime2), 11, NULL, 4)
GO
INSERT [dbo].[WorkRequest] ([Id], [ClientId], [CreateTime], [EmployeeId], [FullfilledDate], [Address], [TaskDescription], [IsAccepted], [BeginWorkTime], [CompleteWorkTime], [WorkTypeId], [WithdrawalsId], [UserAssessment]) VALUES (252, 40, CAST(N'2022-08-04T09:49:12.0000000' AS DateTime2), 16, CAST(N'2022-08-11T00:00:00.0000000' AS DateTime2), N'158 Clay Drive Owatonna, MN 55060', NULL, 0, CAST(N'2022-08-11T10:00:00.0000000' AS DateTime2), CAST(N'2022-08-11T16:00:00.0000000' AS DateTime2), 22, NULL, NULL)
GO
INSERT [dbo].[WorkRequest] ([Id], [ClientId], [CreateTime], [EmployeeId], [FullfilledDate], [Address], [TaskDescription], [IsAccepted], [BeginWorkTime], [CompleteWorkTime], [WorkTypeId], [WithdrawalsId], [UserAssessment]) VALUES (253, 27, CAST(N'2022-08-04T13:28:40.0000000' AS DateTime2), 42, CAST(N'2022-08-11T00:00:00.0000000' AS DateTime2), N'9710 W. Pearl Ave. Kalispell, MT 59901', NULL, 1, CAST(N'2022-08-11T10:26:54.0000000' AS DateTime2), CAST(N'2022-08-11T17:21:30.0000000' AS DateTime2), 20, NULL, 4)
GO
INSERT [dbo].[WorkRequest] ([Id], [ClientId], [CreateTime], [EmployeeId], [FullfilledDate], [Address], [TaskDescription], [IsAccepted], [BeginWorkTime], [CompleteWorkTime], [WorkTypeId], [WithdrawalsId], [UserAssessment]) VALUES (254, 6, CAST(N'2022-08-04T13:47:24.0000000' AS DateTime2), 25, CAST(N'2022-08-09T00:00:00.0000000' AS DateTime2), N'881 Lafayette Avenue Algonquin, IL 60102', NULL, 1, CAST(N'2022-08-09T08:47:57.0000000' AS DateTime2), CAST(N'2022-08-09T20:00:42.0000000' AS DateTime2), 13, NULL, 1)
GO
INSERT [dbo].[WorkRequest] ([Id], [ClientId], [CreateTime], [EmployeeId], [FullfilledDate], [Address], [TaskDescription], [IsAccepted], [BeginWorkTime], [CompleteWorkTime], [WorkTypeId], [WithdrawalsId], [UserAssessment]) VALUES (255, 6, CAST(N'2022-08-05T06:24:57.0000000' AS DateTime2), 20, CAST(N'2022-08-11T00:00:00.0000000' AS DateTime2), N'7262 Grant St. Brunswick, GA 31525', NULL, 1, CAST(N'2022-08-11T09:39:01.0000000' AS DateTime2), CAST(N'2022-08-11T16:28:58.0000000' AS DateTime2), 7, NULL, 3)
GO
INSERT [dbo].[WorkRequest] ([Id], [ClientId], [CreateTime], [EmployeeId], [FullfilledDate], [Address], [TaskDescription], [IsAccepted], [BeginWorkTime], [CompleteWorkTime], [WorkTypeId], [WithdrawalsId], [UserAssessment]) VALUES (256, 12, CAST(N'2022-08-05T10:16:56.0000000' AS DateTime2), 45, CAST(N'2022-08-07T00:00:00.0000000' AS DateTime2), N'42 10th Avenue Canal Winchester, OH 43110', NULL, 1, CAST(N'2022-08-07T08:51:17.0000000' AS DateTime2), CAST(N'2022-08-07T18:22:47.0000000' AS DateTime2), 28, NULL, 4)
GO
INSERT [dbo].[WorkRequest] ([Id], [ClientId], [CreateTime], [EmployeeId], [FullfilledDate], [Address], [TaskDescription], [IsAccepted], [BeginWorkTime], [CompleteWorkTime], [WorkTypeId], [WithdrawalsId], [UserAssessment]) VALUES (257, 49, CAST(N'2022-08-05T12:40:38.0000000' AS DateTime2), 38, CAST(N'2022-08-07T00:00:00.0000000' AS DateTime2), N'482 Foxrun Ave. Lombard, IL 60148', NULL, 0, CAST(N'2022-08-07T10:00:00.0000000' AS DateTime2), CAST(N'2022-08-07T16:00:00.0000000' AS DateTime2), 21, NULL, NULL)
GO
INSERT [dbo].[WorkRequest] ([Id], [ClientId], [CreateTime], [EmployeeId], [FullfilledDate], [Address], [TaskDescription], [IsAccepted], [BeginWorkTime], [CompleteWorkTime], [WorkTypeId], [WithdrawalsId], [UserAssessment]) VALUES (258, 14, CAST(N'2022-08-05T12:48:03.0000000' AS DateTime2), 1, CAST(N'2022-08-08T00:00:00.0000000' AS DateTime2), N'64 Ashley Street Colorado Springs, CO 80911', NULL, 1, CAST(N'2022-08-08T09:49:21.0000000' AS DateTime2), CAST(N'2022-08-08T16:27:01.0000000' AS DateTime2), 16, NULL, 3)
GO
INSERT [dbo].[WorkRequest] ([Id], [ClientId], [CreateTime], [EmployeeId], [FullfilledDate], [Address], [TaskDescription], [IsAccepted], [BeginWorkTime], [CompleteWorkTime], [WorkTypeId], [WithdrawalsId], [UserAssessment]) VALUES (259, 40, CAST(N'2022-08-05T14:04:28.0000000' AS DateTime2), 36, CAST(N'2022-08-08T00:00:00.0000000' AS DateTime2), N'60 NW. Talbot Street Bridgeport, CT 06606', NULL, 0, CAST(N'2022-08-08T10:00:00.0000000' AS DateTime2), CAST(N'2022-08-08T16:00:00.0000000' AS DateTime2), 27, NULL, NULL)
GO
INSERT [dbo].[WorkRequest] ([Id], [ClientId], [CreateTime], [EmployeeId], [FullfilledDate], [Address], [TaskDescription], [IsAccepted], [BeginWorkTime], [CompleteWorkTime], [WorkTypeId], [WithdrawalsId], [UserAssessment]) VALUES (260, 34, CAST(N'2022-08-05T16:03:39.0000000' AS DateTime2), 45, CAST(N'2022-08-12T00:00:00.0000000' AS DateTime2), N'8283 Plymouth Lane Athens, GA 30605', NULL, 0, CAST(N'2022-08-12T10:00:00.0000000' AS DateTime2), CAST(N'2022-08-12T16:00:00.0000000' AS DateTime2), 25, NULL, NULL)
GO
INSERT [dbo].[WorkRequest] ([Id], [ClientId], [CreateTime], [EmployeeId], [FullfilledDate], [Address], [TaskDescription], [IsAccepted], [BeginWorkTime], [CompleteWorkTime], [WorkTypeId], [WithdrawalsId], [UserAssessment]) VALUES (261, 51, CAST(N'2022-08-06T09:08:14.0000000' AS DateTime2), 9, CAST(N'2022-08-13T00:00:00.0000000' AS DateTime2), N'987 Forest Street New Baltimore, MI 48047', NULL, 1, CAST(N'2022-08-13T09:32:56.0000000' AS DateTime2), CAST(N'2022-08-13T17:36:45.0000000' AS DateTime2), 18, NULL, 3)
GO
INSERT [dbo].[WorkRequest] ([Id], [ClientId], [CreateTime], [EmployeeId], [FullfilledDate], [Address], [TaskDescription], [IsAccepted], [BeginWorkTime], [CompleteWorkTime], [WorkTypeId], [WithdrawalsId], [UserAssessment]) VALUES (262, 33, CAST(N'2022-08-06T10:38:40.0000000' AS DateTime2), 39, CAST(N'2022-08-09T00:00:00.0000000' AS DateTime2), N'290 Peninsula Lane Monroe Township, NJ 08831', NULL, 1, CAST(N'2022-08-09T10:16:39.0000000' AS DateTime2), CAST(N'2022-08-09T18:12:40.0000000' AS DateTime2), 28, NULL, 1)
GO
INSERT [dbo].[WorkRequest] ([Id], [ClientId], [CreateTime], [EmployeeId], [FullfilledDate], [Address], [TaskDescription], [IsAccepted], [BeginWorkTime], [CompleteWorkTime], [WorkTypeId], [WithdrawalsId], [UserAssessment]) VALUES (263, 30, CAST(N'2022-08-06T14:17:19.0000000' AS DateTime2), 11, CAST(N'2022-08-10T00:00:00.0000000' AS DateTime2), N'499 Liberty Ave. Clifton Park, NY 12065', NULL, 1, CAST(N'2022-08-10T09:44:25.0000000' AS DateTime2), CAST(N'2022-08-10T17:43:06.0000000' AS DateTime2), 18, NULL, 4)
GO
INSERT [dbo].[WorkRequest] ([Id], [ClientId], [CreateTime], [EmployeeId], [FullfilledDate], [Address], [TaskDescription], [IsAccepted], [BeginWorkTime], [CompleteWorkTime], [WorkTypeId], [WithdrawalsId], [UserAssessment]) VALUES (264, 8, CAST(N'2022-08-06T14:32:51.0000000' AS DateTime2), 49, CAST(N'2022-08-12T00:00:00.0000000' AS DateTime2), N'444 Sherman Ave. Monroe, NY 10950', NULL, 1, CAST(N'2022-08-12T09:52:09.0000000' AS DateTime2), CAST(N'2022-08-12T18:57:32.0000000' AS DateTime2), 15, 2, 3)
GO
INSERT [dbo].[WorkRequest] ([Id], [ClientId], [CreateTime], [EmployeeId], [FullfilledDate], [Address], [TaskDescription], [IsAccepted], [BeginWorkTime], [CompleteWorkTime], [WorkTypeId], [WithdrawalsId], [UserAssessment]) VALUES (265, 21, CAST(N'2022-08-06T14:36:54.0000000' AS DateTime2), 30, CAST(N'2022-08-11T00:00:00.0000000' AS DateTime2), N'983 N. Ivy Drive Canonsburg, PA 15317', NULL, 0, CAST(N'2022-08-11T10:00:00.0000000' AS DateTime2), CAST(N'2022-08-11T16:00:00.0000000' AS DateTime2), 10, NULL, NULL)
GO
INSERT [dbo].[WorkRequest] ([Id], [ClientId], [CreateTime], [EmployeeId], [FullfilledDate], [Address], [TaskDescription], [IsAccepted], [BeginWorkTime], [CompleteWorkTime], [WorkTypeId], [WithdrawalsId], [UserAssessment]) VALUES (266, 27, CAST(N'2022-08-06T19:42:26.0000000' AS DateTime2), 35, CAST(N'2022-08-11T00:00:00.0000000' AS DateTime2), N'5 Lexington St. Anoka, MN 55303', NULL, 1, CAST(N'2022-08-11T09:37:32.0000000' AS DateTime2), CAST(N'2022-08-11T15:38:21.0000000' AS DateTime2), 14, NULL, 4)
GO
INSERT [dbo].[WorkRequest] ([Id], [ClientId], [CreateTime], [EmployeeId], [FullfilledDate], [Address], [TaskDescription], [IsAccepted], [BeginWorkTime], [CompleteWorkTime], [WorkTypeId], [WithdrawalsId], [UserAssessment]) VALUES (267, 42, CAST(N'2022-08-07T07:25:11.0000000' AS DateTime2), 10, CAST(N'2022-08-08T00:00:00.0000000' AS DateTime2), N'52 Pennsylvania Lane Sebastian, FL 32958', NULL, 1, CAST(N'2022-08-08T08:01:14.0000000' AS DateTime2), CAST(N'2022-08-08T17:19:10.0000000' AS DateTime2), 11, NULL, 1)
GO
INSERT [dbo].[WorkRequest] ([Id], [ClientId], [CreateTime], [EmployeeId], [FullfilledDate], [Address], [TaskDescription], [IsAccepted], [BeginWorkTime], [CompleteWorkTime], [WorkTypeId], [WithdrawalsId], [UserAssessment]) VALUES (268, 26, CAST(N'2022-08-07T10:26:05.0000000' AS DateTime2), 24, CAST(N'2022-08-13T00:00:00.0000000' AS DateTime2), N'39 West 8th St. Piqua, OH 45356', NULL, 1, CAST(N'2022-08-13T08:13:34.0000000' AS DateTime2), CAST(N'2022-08-13T19:10:48.0000000' AS DateTime2), 24, NULL, 3)
GO
INSERT [dbo].[WorkRequest] ([Id], [ClientId], [CreateTime], [EmployeeId], [FullfilledDate], [Address], [TaskDescription], [IsAccepted], [BeginWorkTime], [CompleteWorkTime], [WorkTypeId], [WithdrawalsId], [UserAssessment]) VALUES (269, 32, CAST(N'2022-08-07T15:51:14.0000000' AS DateTime2), 33, CAST(N'2022-08-13T00:00:00.0000000' AS DateTime2), N'407 Summer Ave. Wenatchee, WA 98801', NULL, 1, CAST(N'2022-08-13T09:04:07.0000000' AS DateTime2), CAST(N'2022-08-13T17:56:32.0000000' AS DateTime2), 6, NULL, 3)
GO
INSERT [dbo].[WorkRequest] ([Id], [ClientId], [CreateTime], [EmployeeId], [FullfilledDate], [Address], [TaskDescription], [IsAccepted], [BeginWorkTime], [CompleteWorkTime], [WorkTypeId], [WithdrawalsId], [UserAssessment]) VALUES (270, 15, CAST(N'2022-08-08T06:51:17.0000000' AS DateTime2), 49, CAST(N'2022-08-11T00:00:00.0000000' AS DateTime2), N'628 Military Court Skokie, IL 60076', NULL, 1, CAST(N'2022-08-11T10:09:54.0000000' AS DateTime2), CAST(N'2022-08-11T17:10:15.0000000' AS DateTime2), 25, 2, 5)
GO
INSERT [dbo].[WorkRequest] ([Id], [ClientId], [CreateTime], [EmployeeId], [FullfilledDate], [Address], [TaskDescription], [IsAccepted], [BeginWorkTime], [CompleteWorkTime], [WorkTypeId], [WithdrawalsId], [UserAssessment]) VALUES (271, 7, CAST(N'2022-08-08T12:43:20.0000000' AS DateTime2), 33, CAST(N'2022-08-14T00:00:00.0000000' AS DateTime2), N'906 Durham Ave. Hamburg, NY 14075', NULL, 1, CAST(N'2022-08-14T08:07:09.0000000' AS DateTime2), CAST(N'2022-08-14T17:01:41.0000000' AS DateTime2), 11, NULL, 5)
GO
INSERT [dbo].[WorkRequest] ([Id], [ClientId], [CreateTime], [EmployeeId], [FullfilledDate], [Address], [TaskDescription], [IsAccepted], [BeginWorkTime], [CompleteWorkTime], [WorkTypeId], [WithdrawalsId], [UserAssessment]) VALUES (272, 27, CAST(N'2022-08-09T08:20:31.0000000' AS DateTime2), 27, CAST(N'2022-08-16T00:00:00.0000000' AS DateTime2), N'3 Thompson St. Peabody, MA 01960', NULL, 1, CAST(N'2022-08-16T09:36:05.0000000' AS DateTime2), CAST(N'2022-08-16T18:37:39.0000000' AS DateTime2), 8, NULL, 2)
GO
INSERT [dbo].[WorkRequest] ([Id], [ClientId], [CreateTime], [EmployeeId], [FullfilledDate], [Address], [TaskDescription], [IsAccepted], [BeginWorkTime], [CompleteWorkTime], [WorkTypeId], [WithdrawalsId], [UserAssessment]) VALUES (273, 58, CAST(N'2022-08-09T12:02:57.0000000' AS DateTime2), 42, CAST(N'2022-08-13T00:00:00.0000000' AS DateTime2), N'9663 Fairfield Street Rossville, GA 30741', NULL, 1, CAST(N'2022-08-13T08:08:57.0000000' AS DateTime2), CAST(N'2022-08-13T16:03:14.0000000' AS DateTime2), 14, NULL, 3)
GO
INSERT [dbo].[WorkRequest] ([Id], [ClientId], [CreateTime], [EmployeeId], [FullfilledDate], [Address], [TaskDescription], [IsAccepted], [BeginWorkTime], [CompleteWorkTime], [WorkTypeId], [WithdrawalsId], [UserAssessment]) VALUES (274, 41, CAST(N'2022-08-09T18:15:06.0000000' AS DateTime2), 7, CAST(N'2022-08-11T00:00:00.0000000' AS DateTime2), N'3 W. Honey Creek St. Campbell, CA 95008', NULL, 1, CAST(N'2022-08-11T08:56:30.0000000' AS DateTime2), CAST(N'2022-08-11T20:23:14.0000000' AS DateTime2), 31, NULL, 4)
GO
INSERT [dbo].[WorkRequest] ([Id], [ClientId], [CreateTime], [EmployeeId], [FullfilledDate], [Address], [TaskDescription], [IsAccepted], [BeginWorkTime], [CompleteWorkTime], [WorkTypeId], [WithdrawalsId], [UserAssessment]) VALUES (275, 4, CAST(N'2022-08-09T19:46:27.0000000' AS DateTime2), 25, CAST(N'2022-08-10T00:00:00.0000000' AS DateTime2), N'9953 Glen Ridge Street Northbrook, IL 60062', NULL, 1, CAST(N'2022-08-10T09:45:40.0000000' AS DateTime2), CAST(N'2022-08-10T16:46:27.0000000' AS DateTime2), 24, NULL, 3)
GO
INSERT [dbo].[WorkRequest] ([Id], [ClientId], [CreateTime], [EmployeeId], [FullfilledDate], [Address], [TaskDescription], [IsAccepted], [BeginWorkTime], [CompleteWorkTime], [WorkTypeId], [WithdrawalsId], [UserAssessment]) VALUES (276, 23, CAST(N'2022-08-09T21:07:50.0000000' AS DateTime2), 44, CAST(N'2022-08-13T00:00:00.0000000' AS DateTime2), N'21 Center Drive Garfield, NJ 07026', NULL, 1, CAST(N'2022-08-13T08:58:51.0000000' AS DateTime2), CAST(N'2022-08-13T18:42:33.0000000' AS DateTime2), 7, NULL, 1)
GO
INSERT [dbo].[WorkRequest] ([Id], [ClientId], [CreateTime], [EmployeeId], [FullfilledDate], [Address], [TaskDescription], [IsAccepted], [BeginWorkTime], [CompleteWorkTime], [WorkTypeId], [WithdrawalsId], [UserAssessment]) VALUES (277, 34, CAST(N'2022-08-10T08:56:27.0000000' AS DateTime2), 37, CAST(N'2022-08-16T00:00:00.0000000' AS DateTime2), N'19 Rockcrest Rd. Metairie, LA 70001', NULL, 1, CAST(N'2022-08-16T10:07:15.0000000' AS DateTime2), CAST(N'2022-08-16T17:13:25.0000000' AS DateTime2), 21, NULL, 1)
GO
INSERT [dbo].[WorkRequest] ([Id], [ClientId], [CreateTime], [EmployeeId], [FullfilledDate], [Address], [TaskDescription], [IsAccepted], [BeginWorkTime], [CompleteWorkTime], [WorkTypeId], [WithdrawalsId], [UserAssessment]) VALUES (278, 32, CAST(N'2022-08-10T09:49:54.0000000' AS DateTime2), 43, CAST(N'2022-08-14T00:00:00.0000000' AS DateTime2), N'8003 Woodside Street Brentwood, NY 11717', NULL, 1, CAST(N'2022-08-14T08:09:42.0000000' AS DateTime2), CAST(N'2022-08-14T20:29:27.0000000' AS DateTime2), 24, NULL, 1)
GO
INSERT [dbo].[WorkRequest] ([Id], [ClientId], [CreateTime], [EmployeeId], [FullfilledDate], [Address], [TaskDescription], [IsAccepted], [BeginWorkTime], [CompleteWorkTime], [WorkTypeId], [WithdrawalsId], [UserAssessment]) VALUES (279, 35, CAST(N'2022-08-10T13:53:56.0000000' AS DateTime2), 50, CAST(N'2022-08-15T00:00:00.0000000' AS DateTime2), N'819 Westport St. Champlin, MN 55316', NULL, 1, CAST(N'2022-08-15T09:56:44.0000000' AS DateTime2), CAST(N'2022-08-15T19:16:59.0000000' AS DateTime2), 10, 3, 1)
GO
INSERT [dbo].[WorkRequest] ([Id], [ClientId], [CreateTime], [EmployeeId], [FullfilledDate], [Address], [TaskDescription], [IsAccepted], [BeginWorkTime], [CompleteWorkTime], [WorkTypeId], [WithdrawalsId], [UserAssessment]) VALUES (280, 50, CAST(N'2022-08-10T16:26:41.0000000' AS DateTime2), 21, CAST(N'2022-08-11T00:00:00.0000000' AS DateTime2), N'636 Brookside Rd. Christiansburg, VA 24073', NULL, 0, CAST(N'2022-08-11T10:00:00.0000000' AS DateTime2), CAST(N'2022-08-11T16:00:00.0000000' AS DateTime2), 24, NULL, NULL)
GO
INSERT [dbo].[WorkRequest] ([Id], [ClientId], [CreateTime], [EmployeeId], [FullfilledDate], [Address], [TaskDescription], [IsAccepted], [BeginWorkTime], [CompleteWorkTime], [WorkTypeId], [WithdrawalsId], [UserAssessment]) VALUES (281, 31, CAST(N'2022-08-11T16:17:21.0000000' AS DateTime2), 15, CAST(N'2022-08-16T00:00:00.0000000' AS DateTime2), N'90 Euclid Street Royersford, PA 19468', NULL, 0, CAST(N'2022-08-16T10:00:00.0000000' AS DateTime2), CAST(N'2022-08-16T16:00:00.0000000' AS DateTime2), 14, NULL, NULL)
GO
INSERT [dbo].[WorkRequest] ([Id], [ClientId], [CreateTime], [EmployeeId], [FullfilledDate], [Address], [TaskDescription], [IsAccepted], [BeginWorkTime], [CompleteWorkTime], [WorkTypeId], [WithdrawalsId], [UserAssessment]) VALUES (282, 54, CAST(N'2022-08-12T09:29:31.0000000' AS DateTime2), 11, CAST(N'2022-08-14T00:00:00.0000000' AS DateTime2), N'746 Schoolhouse St. Copperas Cove, TX 76522', NULL, 0, CAST(N'2022-08-14T10:00:00.0000000' AS DateTime2), CAST(N'2022-08-14T16:00:00.0000000' AS DateTime2), 25, NULL, NULL)
GO
INSERT [dbo].[WorkRequest] ([Id], [ClientId], [CreateTime], [EmployeeId], [FullfilledDate], [Address], [TaskDescription], [IsAccepted], [BeginWorkTime], [CompleteWorkTime], [WorkTypeId], [WithdrawalsId], [UserAssessment]) VALUES (283, 26, CAST(N'2022-08-12T13:51:36.0000000' AS DateTime2), 48, CAST(N'2022-08-13T00:00:00.0000000' AS DateTime2), N'7562 Cypress Dr. Madison Heights, MI 48071', NULL, 1, CAST(N'2022-08-13T09:44:36.0000000' AS DateTime2), CAST(N'2022-08-13T19:56:37.0000000' AS DateTime2), 8, NULL, 2)
GO
INSERT [dbo].[WorkRequest] ([Id], [ClientId], [CreateTime], [EmployeeId], [FullfilledDate], [Address], [TaskDescription], [IsAccepted], [BeginWorkTime], [CompleteWorkTime], [WorkTypeId], [WithdrawalsId], [UserAssessment]) VALUES (284, 36, CAST(N'2022-08-12T19:21:58.0000000' AS DateTime2), 19, CAST(N'2022-08-16T00:00:00.0000000' AS DateTime2), N'561 Linda Rd. Drexel Hill, PA 19026', NULL, 1, CAST(N'2022-08-16T08:22:49.0000000' AS DateTime2), CAST(N'2022-08-16T15:52:07.0000000' AS DateTime2), 26, NULL, 3)
GO
INSERT [dbo].[WorkRequest] ([Id], [ClientId], [CreateTime], [EmployeeId], [FullfilledDate], [Address], [TaskDescription], [IsAccepted], [BeginWorkTime], [CompleteWorkTime], [WorkTypeId], [WithdrawalsId], [UserAssessment]) VALUES (285, 44, CAST(N'2022-08-13T06:49:30.0000000' AS DateTime2), 26, CAST(N'2022-08-20T00:00:00.0000000' AS DateTime2), N'7407 Forest St. Hollywood, FL 33020', NULL, 1, CAST(N'2022-08-20T09:40:15.0000000' AS DateTime2), CAST(N'2022-08-20T15:30:46.0000000' AS DateTime2), 17, NULL, 1)
GO
INSERT [dbo].[WorkRequest] ([Id], [ClientId], [CreateTime], [EmployeeId], [FullfilledDate], [Address], [TaskDescription], [IsAccepted], [BeginWorkTime], [CompleteWorkTime], [WorkTypeId], [WithdrawalsId], [UserAssessment]) VALUES (286, 14, CAST(N'2022-08-13T06:59:00.0000000' AS DateTime2), 7, CAST(N'2022-08-18T00:00:00.0000000' AS DateTime2), N'779 W. Vale St. Palm Coast, FL 32137', NULL, 1, CAST(N'2022-08-18T10:12:51.0000000' AS DateTime2), CAST(N'2022-08-18T20:27:27.0000000' AS DateTime2), 8, NULL, 5)
GO
INSERT [dbo].[WorkRequest] ([Id], [ClientId], [CreateTime], [EmployeeId], [FullfilledDate], [Address], [TaskDescription], [IsAccepted], [BeginWorkTime], [CompleteWorkTime], [WorkTypeId], [WithdrawalsId], [UserAssessment]) VALUES (287, 13, CAST(N'2022-08-13T08:00:46.0000000' AS DateTime2), 28, CAST(N'2022-08-18T00:00:00.0000000' AS DateTime2), N'65 East Heritage Ave. Plainfield, NJ 07060', NULL, 1, CAST(N'2022-08-18T09:03:30.0000000' AS DateTime2), CAST(N'2022-08-18T18:44:58.0000000' AS DateTime2), 31, NULL, 3)
GO
INSERT [dbo].[WorkRequest] ([Id], [ClientId], [CreateTime], [EmployeeId], [FullfilledDate], [Address], [TaskDescription], [IsAccepted], [BeginWorkTime], [CompleteWorkTime], [WorkTypeId], [WithdrawalsId], [UserAssessment]) VALUES (288, 22, CAST(N'2022-08-13T16:24:17.0000000' AS DateTime2), 44, CAST(N'2022-08-14T00:00:00.0000000' AS DateTime2), N'762 Wellington Street Hernando, MS 38632', NULL, 1, CAST(N'2022-08-14T09:08:59.0000000' AS DateTime2), CAST(N'2022-08-14T17:22:30.0000000' AS DateTime2), 29, NULL, 3)
GO
INSERT [dbo].[WorkRequest] ([Id], [ClientId], [CreateTime], [EmployeeId], [FullfilledDate], [Address], [TaskDescription], [IsAccepted], [BeginWorkTime], [CompleteWorkTime], [WorkTypeId], [WithdrawalsId], [UserAssessment]) VALUES (289, 44, CAST(N'2022-08-13T18:09:41.0000000' AS DateTime2), 13, CAST(N'2022-08-17T00:00:00.0000000' AS DateTime2), N'93 Williams Court Lemont, IL 60439', NULL, 0, CAST(N'2022-08-17T10:00:00.0000000' AS DateTime2), CAST(N'2022-08-17T16:00:00.0000000' AS DateTime2), 31, NULL, NULL)
GO
INSERT [dbo].[WorkRequest] ([Id], [ClientId], [CreateTime], [EmployeeId], [FullfilledDate], [Address], [TaskDescription], [IsAccepted], [BeginWorkTime], [CompleteWorkTime], [WorkTypeId], [WithdrawalsId], [UserAssessment]) VALUES (290, 28, CAST(N'2022-08-14T07:49:27.0000000' AS DateTime2), 31, CAST(N'2022-08-15T00:00:00.0000000' AS DateTime2), N'8648 Mayfair St. Panama City, FL 32404', NULL, 0, CAST(N'2022-08-15T10:00:00.0000000' AS DateTime2), CAST(N'2022-08-15T16:00:00.0000000' AS DateTime2), 7, NULL, NULL)
GO
INSERT [dbo].[WorkRequest] ([Id], [ClientId], [CreateTime], [EmployeeId], [FullfilledDate], [Address], [TaskDescription], [IsAccepted], [BeginWorkTime], [CompleteWorkTime], [WorkTypeId], [WithdrawalsId], [UserAssessment]) VALUES (291, 13, CAST(N'2022-08-14T08:16:08.0000000' AS DateTime2), 11, CAST(N'2022-08-20T00:00:00.0000000' AS DateTime2), N'38 University Lane Meriden, CT 06450', NULL, 1, CAST(N'2022-08-20T08:04:23.0000000' AS DateTime2), CAST(N'2022-08-20T15:37:36.0000000' AS DateTime2), 26, NULL, 4)
GO
INSERT [dbo].[WorkRequest] ([Id], [ClientId], [CreateTime], [EmployeeId], [FullfilledDate], [Address], [TaskDescription], [IsAccepted], [BeginWorkTime], [CompleteWorkTime], [WorkTypeId], [WithdrawalsId], [UserAssessment]) VALUES (292, 32, CAST(N'2022-08-14T09:58:44.0000000' AS DateTime2), 2, CAST(N'2022-08-17T00:00:00.0000000' AS DateTime2), N'1 La Sierra Dr. Elmont, NY 11003', NULL, 0, CAST(N'2022-08-17T10:00:00.0000000' AS DateTime2), CAST(N'2022-08-17T16:00:00.0000000' AS DateTime2), 21, NULL, NULL)
GO
INSERT [dbo].[WorkRequest] ([Id], [ClientId], [CreateTime], [EmployeeId], [FullfilledDate], [Address], [TaskDescription], [IsAccepted], [BeginWorkTime], [CompleteWorkTime], [WorkTypeId], [WithdrawalsId], [UserAssessment]) VALUES (293, 58, CAST(N'2022-08-14T13:11:01.0000000' AS DateTime2), 14, CAST(N'2022-08-20T00:00:00.0000000' AS DateTime2), N'8587 North Second Street Cranford, NJ 07016', NULL, 1, CAST(N'2022-08-20T09:54:58.0000000' AS DateTime2), CAST(N'2022-08-20T16:30:31.0000000' AS DateTime2), 28, NULL, 1)
GO
INSERT [dbo].[WorkRequest] ([Id], [ClientId], [CreateTime], [EmployeeId], [FullfilledDate], [Address], [TaskDescription], [IsAccepted], [BeginWorkTime], [CompleteWorkTime], [WorkTypeId], [WithdrawalsId], [UserAssessment]) VALUES (294, 32, CAST(N'2022-08-14T13:45:22.0000000' AS DateTime2), 16, CAST(N'2022-08-16T00:00:00.0000000' AS DateTime2), N'513 High Ave. Chambersburg, PA 17201', NULL, 1, CAST(N'2022-08-16T09:51:44.0000000' AS DateTime2), CAST(N'2022-08-16T15:09:46.0000000' AS DateTime2), 30, NULL, 3)
GO
INSERT [dbo].[WorkRequest] ([Id], [ClientId], [CreateTime], [EmployeeId], [FullfilledDate], [Address], [TaskDescription], [IsAccepted], [BeginWorkTime], [CompleteWorkTime], [WorkTypeId], [WithdrawalsId], [UserAssessment]) VALUES (295, 56, CAST(N'2022-08-14T14:37:43.0000000' AS DateTime2), 13, CAST(N'2022-08-17T00:00:00.0000000' AS DateTime2), N'252 N. Lake St. Naugatuck, CT 06770', NULL, 1, CAST(N'2022-08-17T09:03:46.0000000' AS DateTime2), CAST(N'2022-08-17T16:47:20.0000000' AS DateTime2), 20, NULL, 1)
GO
INSERT [dbo].[WorkRequest] ([Id], [ClientId], [CreateTime], [EmployeeId], [FullfilledDate], [Address], [TaskDescription], [IsAccepted], [BeginWorkTime], [CompleteWorkTime], [WorkTypeId], [WithdrawalsId], [UserAssessment]) VALUES (296, 37, CAST(N'2022-08-14T18:00:45.0000000' AS DateTime2), 29, CAST(N'2022-08-18T00:00:00.0000000' AS DateTime2), N'413 Wild Horse St. Niceville, FL 32578', NULL, 1, CAST(N'2022-08-18T10:13:39.0000000' AS DateTime2), CAST(N'2022-08-18T17:57:20.0000000' AS DateTime2), 9, NULL, 1)
GO
INSERT [dbo].[WorkRequest] ([Id], [ClientId], [CreateTime], [EmployeeId], [FullfilledDate], [Address], [TaskDescription], [IsAccepted], [BeginWorkTime], [CompleteWorkTime], [WorkTypeId], [WithdrawalsId], [UserAssessment]) VALUES (297, 16, CAST(N'2022-08-15T15:32:41.0000000' AS DateTime2), 41, CAST(N'2022-08-20T00:00:00.0000000' AS DateTime2), N'766 Vine Lane Chardon, OH 44024', NULL, 1, CAST(N'2022-08-20T08:26:58.0000000' AS DateTime2), CAST(N'2022-08-20T18:54:42.0000000' AS DateTime2), 13, NULL, 1)
GO
INSERT [dbo].[WorkRequest] ([Id], [ClientId], [CreateTime], [EmployeeId], [FullfilledDate], [Address], [TaskDescription], [IsAccepted], [BeginWorkTime], [CompleteWorkTime], [WorkTypeId], [WithdrawalsId], [UserAssessment]) VALUES (298, 41, CAST(N'2022-08-16T08:52:43.0000000' AS DateTime2), 5, CAST(N'2022-08-23T00:00:00.0000000' AS DateTime2), N'25 South Cambridge Rd. Saint Cloud, MN 56301', NULL, 0, CAST(N'2022-08-23T10:00:00.0000000' AS DateTime2), CAST(N'2022-08-23T16:00:00.0000000' AS DateTime2), 12, NULL, NULL)
GO
INSERT [dbo].[WorkRequest] ([Id], [ClientId], [CreateTime], [EmployeeId], [FullfilledDate], [Address], [TaskDescription], [IsAccepted], [BeginWorkTime], [CompleteWorkTime], [WorkTypeId], [WithdrawalsId], [UserAssessment]) VALUES (299, 23, CAST(N'2022-08-16T10:47:44.0000000' AS DateTime2), 10, CAST(N'2022-08-23T00:00:00.0000000' AS DateTime2), N'7 Coffee Street Rowlett, TX 75088', NULL, 1, CAST(N'2022-08-23T08:33:53.0000000' AS DateTime2), CAST(N'2022-08-23T20:11:29.0000000' AS DateTime2), 32, NULL, 2)
GO
INSERT [dbo].[WorkRequest] ([Id], [ClientId], [CreateTime], [EmployeeId], [FullfilledDate], [Address], [TaskDescription], [IsAccepted], [BeginWorkTime], [CompleteWorkTime], [WorkTypeId], [WithdrawalsId], [UserAssessment]) VALUES (300, 12, CAST(N'2022-08-16T12:30:47.0000000' AS DateTime2), 14, CAST(N'2022-08-17T00:00:00.0000000' AS DateTime2), N'510 Glendale Rd. Lawrenceville, GA 30043', NULL, 0, CAST(N'2022-08-17T10:00:00.0000000' AS DateTime2), CAST(N'2022-08-17T16:00:00.0000000' AS DateTime2), 7, NULL, NULL)
GO
INSERT [dbo].[WorkRequest] ([Id], [ClientId], [CreateTime], [EmployeeId], [FullfilledDate], [Address], [TaskDescription], [IsAccepted], [BeginWorkTime], [CompleteWorkTime], [WorkTypeId], [WithdrawalsId], [UserAssessment]) VALUES (301, 25, CAST(N'2022-08-16T14:20:20.0000000' AS DateTime2), 45, CAST(N'2022-08-18T00:00:00.0000000' AS DateTime2), N'839 Old Glen Ridge Rd. Franklin Square, NY 11010', NULL, 1, CAST(N'2022-08-18T09:28:32.0000000' AS DateTime2), CAST(N'2022-08-18T18:13:22.0000000' AS DateTime2), 30, NULL, 2)
GO
INSERT [dbo].[WorkRequest] ([Id], [ClientId], [CreateTime], [EmployeeId], [FullfilledDate], [Address], [TaskDescription], [IsAccepted], [BeginWorkTime], [CompleteWorkTime], [WorkTypeId], [WithdrawalsId], [UserAssessment]) VALUES (302, 55, CAST(N'2022-08-17T06:17:24.0000000' AS DateTime2), 1, CAST(N'2022-08-24T00:00:00.0000000' AS DateTime2), N'686 N. Newcastle Ave. Fairfield, CT 06824', NULL, 1, CAST(N'2022-08-24T08:41:00.0000000' AS DateTime2), CAST(N'2022-08-24T15:32:22.0000000' AS DateTime2), 31, NULL, 1)
GO
INSERT [dbo].[WorkRequest] ([Id], [ClientId], [CreateTime], [EmployeeId], [FullfilledDate], [Address], [TaskDescription], [IsAccepted], [BeginWorkTime], [CompleteWorkTime], [WorkTypeId], [WithdrawalsId], [UserAssessment]) VALUES (303, 29, CAST(N'2022-08-17T07:06:44.0000000' AS DateTime2), 39, CAST(N'2022-08-22T00:00:00.0000000' AS DateTime2), N'7729 Mayfair St. East Stroudsburg, PA 18301', NULL, 1, CAST(N'2022-08-22T09:29:27.0000000' AS DateTime2), CAST(N'2022-08-22T19:01:46.0000000' AS DateTime2), 27, NULL, 2)
GO
INSERT [dbo].[WorkRequest] ([Id], [ClientId], [CreateTime], [EmployeeId], [FullfilledDate], [Address], [TaskDescription], [IsAccepted], [BeginWorkTime], [CompleteWorkTime], [WorkTypeId], [WithdrawalsId], [UserAssessment]) VALUES (304, 20, CAST(N'2022-08-17T08:05:08.0000000' AS DateTime2), 16, CAST(N'2022-08-22T00:00:00.0000000' AS DateTime2), N'31 N. Union Drive Cedar Falls, IA 50613', NULL, 1, CAST(N'2022-08-22T08:24:15.0000000' AS DateTime2), CAST(N'2022-08-22T17:01:44.0000000' AS DateTime2), 8, NULL, 2)
GO
INSERT [dbo].[WorkRequest] ([Id], [ClientId], [CreateTime], [EmployeeId], [FullfilledDate], [Address], [TaskDescription], [IsAccepted], [BeginWorkTime], [CompleteWorkTime], [WorkTypeId], [WithdrawalsId], [UserAssessment]) VALUES (305, 2, CAST(N'2022-08-17T09:36:46.0000000' AS DateTime2), 42, CAST(N'2022-08-24T00:00:00.0000000' AS DateTime2), N'91C Bradford St. Raeford, NC 28376', NULL, 1, CAST(N'2022-08-24T08:02:52.0000000' AS DateTime2), CAST(N'2022-08-24T18:33:23.0000000' AS DateTime2), 24, NULL, 4)
GO
INSERT [dbo].[WorkRequest] ([Id], [ClientId], [CreateTime], [EmployeeId], [FullfilledDate], [Address], [TaskDescription], [IsAccepted], [BeginWorkTime], [CompleteWorkTime], [WorkTypeId], [WithdrawalsId], [UserAssessment]) VALUES (306, 47, CAST(N'2022-08-17T10:00:11.0000000' AS DateTime2), 34, CAST(N'2022-08-24T00:00:00.0000000' AS DateTime2), N'51 Mechanic Street West Des Moines, IA 50265', NULL, 1, CAST(N'2022-08-24T09:31:38.0000000' AS DateTime2), CAST(N'2022-08-24T15:41:41.0000000' AS DateTime2), 21, NULL, 5)
GO
INSERT [dbo].[WorkRequest] ([Id], [ClientId], [CreateTime], [EmployeeId], [FullfilledDate], [Address], [TaskDescription], [IsAccepted], [BeginWorkTime], [CompleteWorkTime], [WorkTypeId], [WithdrawalsId], [UserAssessment]) VALUES (307, 20, CAST(N'2022-08-17T10:54:03.0000000' AS DateTime2), 19, CAST(N'2022-08-19T00:00:00.0000000' AS DateTime2), N'539 Tunnel St. Aiken, SC 29803', NULL, 0, CAST(N'2022-08-19T10:00:00.0000000' AS DateTime2), CAST(N'2022-08-19T16:00:00.0000000' AS DateTime2), 32, NULL, NULL)
GO
INSERT [dbo].[WorkRequest] ([Id], [ClientId], [CreateTime], [EmployeeId], [FullfilledDate], [Address], [TaskDescription], [IsAccepted], [BeginWorkTime], [CompleteWorkTime], [WorkTypeId], [WithdrawalsId], [UserAssessment]) VALUES (308, 4, CAST(N'2022-08-17T20:48:14.0000000' AS DateTime2), 39, CAST(N'2022-08-23T00:00:00.0000000' AS DateTime2), N'7827 East Mayflower St. Mchenry, IL 60050', NULL, 1, CAST(N'2022-08-23T10:29:35.0000000' AS DateTime2), CAST(N'2022-08-23T18:48:18.0000000' AS DateTime2), 8, NULL, 2)
GO
INSERT [dbo].[WorkRequest] ([Id], [ClientId], [CreateTime], [EmployeeId], [FullfilledDate], [Address], [TaskDescription], [IsAccepted], [BeginWorkTime], [CompleteWorkTime], [WorkTypeId], [WithdrawalsId], [UserAssessment]) VALUES (309, 15, CAST(N'2022-08-18T07:16:05.0000000' AS DateTime2), 11, CAST(N'2022-08-20T00:00:00.0000000' AS DateTime2), N'6 Livingston Rd. Atwater, CA 95301', NULL, 1, CAST(N'2022-08-20T08:23:01.0000000' AS DateTime2), CAST(N'2022-08-20T15:26:29.0000000' AS DateTime2), 13, NULL, 2)
GO
INSERT [dbo].[WorkRequest] ([Id], [ClientId], [CreateTime], [EmployeeId], [FullfilledDate], [Address], [TaskDescription], [IsAccepted], [BeginWorkTime], [CompleteWorkTime], [WorkTypeId], [WithdrawalsId], [UserAssessment]) VALUES (310, 16, CAST(N'2022-08-18T07:34:54.0000000' AS DateTime2), 9, CAST(N'2022-08-23T00:00:00.0000000' AS DateTime2), N'260 Park Street Merrick, NY 11566', NULL, 1, CAST(N'2022-08-23T09:56:18.0000000' AS DateTime2), CAST(N'2022-08-23T16:47:30.0000000' AS DateTime2), 12, NULL, 4)
GO
INSERT [dbo].[WorkRequest] ([Id], [ClientId], [CreateTime], [EmployeeId], [FullfilledDate], [Address], [TaskDescription], [IsAccepted], [BeginWorkTime], [CompleteWorkTime], [WorkTypeId], [WithdrawalsId], [UserAssessment]) VALUES (311, 46, CAST(N'2022-08-18T13:20:56.0000000' AS DateTime2), 29, CAST(N'2022-08-22T00:00:00.0000000' AS DateTime2), N'70 Dunbar St. Bethpage, NY 11714', NULL, 1, CAST(N'2022-08-22T09:02:30.0000000' AS DateTime2), CAST(N'2022-08-22T17:08:03.0000000' AS DateTime2), 27, NULL, 3)
GO
INSERT [dbo].[WorkRequest] ([Id], [ClientId], [CreateTime], [EmployeeId], [FullfilledDate], [Address], [TaskDescription], [IsAccepted], [BeginWorkTime], [CompleteWorkTime], [WorkTypeId], [WithdrawalsId], [UserAssessment]) VALUES (312, 55, CAST(N'2022-08-18T15:45:42.0000000' AS DateTime2), 46, CAST(N'2022-08-22T00:00:00.0000000' AS DateTime2), N'557 Blackburn Ave. Oak Forest, IL 60452', NULL, 1, CAST(N'2022-08-22T09:53:36.0000000' AS DateTime2), CAST(N'2022-08-22T20:17:48.0000000' AS DateTime2), 14, NULL, 3)
GO
INSERT [dbo].[WorkRequest] ([Id], [ClientId], [CreateTime], [EmployeeId], [FullfilledDate], [Address], [TaskDescription], [IsAccepted], [BeginWorkTime], [CompleteWorkTime], [WorkTypeId], [WithdrawalsId], [UserAssessment]) VALUES (313, 35, CAST(N'2022-08-18T17:38:13.0000000' AS DateTime2), 22, CAST(N'2022-08-22T00:00:00.0000000' AS DateTime2), N'255 West Atlantic Lane South Ozone Park, NY 11420', NULL, 1, CAST(N'2022-08-22T09:20:30.0000000' AS DateTime2), CAST(N'2022-08-22T18:34:48.0000000' AS DateTime2), 9, NULL, 2)
GO
INSERT [dbo].[WorkRequest] ([Id], [ClientId], [CreateTime], [EmployeeId], [FullfilledDate], [Address], [TaskDescription], [IsAccepted], [BeginWorkTime], [CompleteWorkTime], [WorkTypeId], [WithdrawalsId], [UserAssessment]) VALUES (314, 26, CAST(N'2022-08-18T18:10:42.0000000' AS DateTime2), 6, CAST(N'2022-08-23T00:00:00.0000000' AS DateTime2), N'7993 Sulphur Springs Street Hialeah, FL 33010', NULL, 1, CAST(N'2022-08-23T09:01:44.0000000' AS DateTime2), CAST(N'2022-08-23T17:00:39.0000000' AS DateTime2), 24, NULL, 4)
GO
INSERT [dbo].[WorkRequest] ([Id], [ClientId], [CreateTime], [EmployeeId], [FullfilledDate], [Address], [TaskDescription], [IsAccepted], [BeginWorkTime], [CompleteWorkTime], [WorkTypeId], [WithdrawalsId], [UserAssessment]) VALUES (315, 30, CAST(N'2022-08-18T19:40:00.0000000' AS DateTime2), 25, CAST(N'2022-08-20T00:00:00.0000000' AS DateTime2), N'4 Manor Station Ave. Hempstead, NY 11550', NULL, 1, CAST(N'2022-08-20T09:07:10.0000000' AS DateTime2), CAST(N'2022-08-20T19:48:49.0000000' AS DateTime2), 27, NULL, 3)
GO
INSERT [dbo].[WorkRequest] ([Id], [ClientId], [CreateTime], [EmployeeId], [FullfilledDate], [Address], [TaskDescription], [IsAccepted], [BeginWorkTime], [CompleteWorkTime], [WorkTypeId], [WithdrawalsId], [UserAssessment]) VALUES (316, 17, CAST(N'2022-08-19T06:14:34.0000000' AS DateTime2), 35, CAST(N'2022-08-25T00:00:00.0000000' AS DateTime2), N'42 New Ave. Pueblo, CO 81001', NULL, 0, CAST(N'2022-08-25T10:00:00.0000000' AS DateTime2), CAST(N'2022-08-25T16:00:00.0000000' AS DateTime2), 18, NULL, NULL)
GO
INSERT [dbo].[WorkRequest] ([Id], [ClientId], [CreateTime], [EmployeeId], [FullfilledDate], [Address], [TaskDescription], [IsAccepted], [BeginWorkTime], [CompleteWorkTime], [WorkTypeId], [WithdrawalsId], [UserAssessment]) VALUES (317, 40, CAST(N'2022-08-19T10:49:10.0000000' AS DateTime2), 33, CAST(N'2022-08-26T00:00:00.0000000' AS DateTime2), N'287 Ridgewood Ave. Westport, CT 06880', NULL, 1, CAST(N'2022-08-26T08:00:40.0000000' AS DateTime2), CAST(N'2022-08-26T16:32:12.0000000' AS DateTime2), 8, NULL, 1)
GO
INSERT [dbo].[WorkRequest] ([Id], [ClientId], [CreateTime], [EmployeeId], [FullfilledDate], [Address], [TaskDescription], [IsAccepted], [BeginWorkTime], [CompleteWorkTime], [WorkTypeId], [WithdrawalsId], [UserAssessment]) VALUES (318, 56, CAST(N'2022-08-19T15:43:31.0000000' AS DateTime2), 12, CAST(N'2022-08-20T00:00:00.0000000' AS DateTime2), N'72 Pineknoll St. Commack, NY 11725', NULL, 1, CAST(N'2022-08-20T09:41:47.0000000' AS DateTime2), CAST(N'2022-08-20T19:14:31.0000000' AS DateTime2), 22, NULL, 2)
GO
INSERT [dbo].[WorkRequest] ([Id], [ClientId], [CreateTime], [EmployeeId], [FullfilledDate], [Address], [TaskDescription], [IsAccepted], [BeginWorkTime], [CompleteWorkTime], [WorkTypeId], [WithdrawalsId], [UserAssessment]) VALUES (319, 52, CAST(N'2022-08-20T06:53:02.0000000' AS DateTime2), 19, CAST(N'2022-08-21T00:00:00.0000000' AS DateTime2), N'7188 Sunset Ave. North Attleboro, MA 02760', NULL, 0, CAST(N'2022-08-21T10:00:00.0000000' AS DateTime2), CAST(N'2022-08-21T16:00:00.0000000' AS DateTime2), 23, NULL, NULL)
GO
INSERT [dbo].[WorkRequest] ([Id], [ClientId], [CreateTime], [EmployeeId], [FullfilledDate], [Address], [TaskDescription], [IsAccepted], [BeginWorkTime], [CompleteWorkTime], [WorkTypeId], [WithdrawalsId], [UserAssessment]) VALUES (320, 11, CAST(N'2022-08-20T10:29:19.0000000' AS DateTime2), 9, CAST(N'2022-08-21T00:00:00.0000000' AS DateTime2), N'132 W. Ohio Dr. Pomona, CA 91768', NULL, 1, CAST(N'2022-08-21T08:56:59.0000000' AS DateTime2), CAST(N'2022-08-21T15:06:00.0000000' AS DateTime2), 14, NULL, 3)
GO
INSERT [dbo].[WorkRequest] ([Id], [ClientId], [CreateTime], [EmployeeId], [FullfilledDate], [Address], [TaskDescription], [IsAccepted], [BeginWorkTime], [CompleteWorkTime], [WorkTypeId], [WithdrawalsId], [UserAssessment]) VALUES (321, 47, CAST(N'2022-08-20T11:03:58.0000000' AS DateTime2), 46, CAST(N'2022-08-25T00:00:00.0000000' AS DateTime2), N'7523 Leatherwood Court Dearborn, MI 48124', NULL, 1, CAST(N'2022-08-25T10:09:32.0000000' AS DateTime2), CAST(N'2022-08-25T19:16:29.0000000' AS DateTime2), 10, NULL, 4)
GO
INSERT [dbo].[WorkRequest] ([Id], [ClientId], [CreateTime], [EmployeeId], [FullfilledDate], [Address], [TaskDescription], [IsAccepted], [BeginWorkTime], [CompleteWorkTime], [WorkTypeId], [WithdrawalsId], [UserAssessment]) VALUES (322, 44, CAST(N'2022-08-20T12:15:24.0000000' AS DateTime2), 25, CAST(N'2022-08-22T00:00:00.0000000' AS DateTime2), N'839 Temple St. Front Royal, VA 22630', NULL, 0, CAST(N'2022-08-22T10:00:00.0000000' AS DateTime2), CAST(N'2022-08-22T16:00:00.0000000' AS DateTime2), 30, NULL, NULL)
GO
INSERT [dbo].[WorkRequest] ([Id], [ClientId], [CreateTime], [EmployeeId], [FullfilledDate], [Address], [TaskDescription], [IsAccepted], [BeginWorkTime], [CompleteWorkTime], [WorkTypeId], [WithdrawalsId], [UserAssessment]) VALUES (323, 38, CAST(N'2022-08-20T13:54:13.0000000' AS DateTime2), 50, CAST(N'2022-08-24T00:00:00.0000000' AS DateTime2), N'9913 Cooper Lane Logansport, IN 46947', NULL, 1, CAST(N'2022-08-24T08:26:45.0000000' AS DateTime2), CAST(N'2022-08-24T19:34:25.0000000' AS DateTime2), 29, 3, 3)
GO
INSERT [dbo].[WorkRequest] ([Id], [ClientId], [CreateTime], [EmployeeId], [FullfilledDate], [Address], [TaskDescription], [IsAccepted], [BeginWorkTime], [CompleteWorkTime], [WorkTypeId], [WithdrawalsId], [UserAssessment]) VALUES (324, 16, CAST(N'2022-08-20T15:33:00.0000000' AS DateTime2), 43, CAST(N'2022-08-21T00:00:00.0000000' AS DateTime2), N'27 S. Locust Lane Encino, CA 91316', NULL, 0, CAST(N'2022-08-21T10:00:00.0000000' AS DateTime2), CAST(N'2022-08-21T16:00:00.0000000' AS DateTime2), 8, NULL, NULL)
GO
INSERT [dbo].[WorkRequest] ([Id], [ClientId], [CreateTime], [EmployeeId], [FullfilledDate], [Address], [TaskDescription], [IsAccepted], [BeginWorkTime], [CompleteWorkTime], [WorkTypeId], [WithdrawalsId], [UserAssessment]) VALUES (325, 2, CAST(N'2022-08-21T11:09:24.0000000' AS DateTime2), 16, CAST(N'2022-08-23T00:00:00.0000000' AS DateTime2), N'13 Andover Lane South Portland, ME 04106', NULL, 1, CAST(N'2022-08-23T08:45:10.0000000' AS DateTime2), CAST(N'2022-08-23T19:32:38.0000000' AS DateTime2), 23, NULL, 2)
GO
INSERT [dbo].[WorkRequest] ([Id], [ClientId], [CreateTime], [EmployeeId], [FullfilledDate], [Address], [TaskDescription], [IsAccepted], [BeginWorkTime], [CompleteWorkTime], [WorkTypeId], [WithdrawalsId], [UserAssessment]) VALUES (326, 18, CAST(N'2022-08-21T14:52:53.0000000' AS DateTime2), 24, CAST(N'2022-08-26T00:00:00.0000000' AS DateTime2), N'429 James St. Stevens Point, WI 54481', NULL, 0, CAST(N'2022-08-26T10:00:00.0000000' AS DateTime2), CAST(N'2022-08-26T16:00:00.0000000' AS DateTime2), 7, NULL, NULL)
GO
INSERT [dbo].[WorkRequest] ([Id], [ClientId], [CreateTime], [EmployeeId], [FullfilledDate], [Address], [TaskDescription], [IsAccepted], [BeginWorkTime], [CompleteWorkTime], [WorkTypeId], [WithdrawalsId], [UserAssessment]) VALUES (327, 60, CAST(N'2022-08-21T16:27:18.0000000' AS DateTime2), 3, CAST(N'2022-08-28T00:00:00.0000000' AS DateTime2), N'91 South Washington St. Chippewa Falls, WI 54729', NULL, 0, CAST(N'2022-08-28T10:00:00.0000000' AS DateTime2), CAST(N'2022-08-28T16:00:00.0000000' AS DateTime2), 24, NULL, NULL)
GO
INSERT [dbo].[WorkRequest] ([Id], [ClientId], [CreateTime], [EmployeeId], [FullfilledDate], [Address], [TaskDescription], [IsAccepted], [BeginWorkTime], [CompleteWorkTime], [WorkTypeId], [WithdrawalsId], [UserAssessment]) VALUES (328, 47, CAST(N'2022-08-21T16:56:10.0000000' AS DateTime2), 19, CAST(N'2022-08-28T00:00:00.0000000' AS DateTime2), N'361 S. Roberts Street Aberdeen, SD 57401', NULL, 1, CAST(N'2022-08-28T10:25:33.0000000' AS DateTime2), CAST(N'2022-08-28T18:29:57.0000000' AS DateTime2), 24, NULL, 3)
GO
INSERT [dbo].[WorkRequest] ([Id], [ClientId], [CreateTime], [EmployeeId], [FullfilledDate], [Address], [TaskDescription], [IsAccepted], [BeginWorkTime], [CompleteWorkTime], [WorkTypeId], [WithdrawalsId], [UserAssessment]) VALUES (329, 5, CAST(N'2022-08-22T07:49:52.0000000' AS DateTime2), 28, CAST(N'2022-08-29T00:00:00.0000000' AS DateTime2), N'51 Hawthorne Rd. Lakeville, MN 55044', NULL, 1, CAST(N'2022-08-29T10:22:15.0000000' AS DateTime2), CAST(N'2022-08-29T18:51:51.0000000' AS DateTime2), 31, NULL, 5)
GO
INSERT [dbo].[WorkRequest] ([Id], [ClientId], [CreateTime], [EmployeeId], [FullfilledDate], [Address], [TaskDescription], [IsAccepted], [BeginWorkTime], [CompleteWorkTime], [WorkTypeId], [WithdrawalsId], [UserAssessment]) VALUES (330, 10, CAST(N'2022-08-22T13:22:53.0000000' AS DateTime2), 49, CAST(N'2022-08-29T00:00:00.0000000' AS DateTime2), N'167 6th Street Springfield, PA 19064', NULL, 0, CAST(N'2022-08-29T10:00:00.0000000' AS DateTime2), CAST(N'2022-08-29T16:00:00.0000000' AS DateTime2), 30, NULL, NULL)
GO
INSERT [dbo].[WorkRequest] ([Id], [ClientId], [CreateTime], [EmployeeId], [FullfilledDate], [Address], [TaskDescription], [IsAccepted], [BeginWorkTime], [CompleteWorkTime], [WorkTypeId], [WithdrawalsId], [UserAssessment]) VALUES (331, 59, CAST(N'2022-08-22T21:14:14.0000000' AS DateTime2), 19, CAST(N'2022-08-23T00:00:00.0000000' AS DateTime2), N'350 South Thompson Drive Butler, PA 16001', NULL, 1, CAST(N'2022-08-23T10:04:39.0000000' AS DateTime2), CAST(N'2022-08-23T18:19:26.0000000' AS DateTime2), 27, NULL, 4)
GO
INSERT [dbo].[WorkRequest] ([Id], [ClientId], [CreateTime], [EmployeeId], [FullfilledDate], [Address], [TaskDescription], [IsAccepted], [BeginWorkTime], [CompleteWorkTime], [WorkTypeId], [WithdrawalsId], [UserAssessment]) VALUES (332, 46, CAST(N'2022-08-22T21:31:15.0000000' AS DateTime2), 16, CAST(N'2022-08-25T00:00:00.0000000' AS DateTime2), N'9932 Fawn Ave. Farmingdale, NY 11735', NULL, 0, CAST(N'2022-08-25T10:00:00.0000000' AS DateTime2), CAST(N'2022-08-25T16:00:00.0000000' AS DateTime2), 26, NULL, NULL)
GO
INSERT [dbo].[WorkRequest] ([Id], [ClientId], [CreateTime], [EmployeeId], [FullfilledDate], [Address], [TaskDescription], [IsAccepted], [BeginWorkTime], [CompleteWorkTime], [WorkTypeId], [WithdrawalsId], [UserAssessment]) VALUES (333, 4, CAST(N'2022-08-23T07:01:25.0000000' AS DateTime2), 17, CAST(N'2022-08-28T00:00:00.0000000' AS DateTime2), N'801 Ocean Street Tacoma, WA 98444', NULL, 1, CAST(N'2022-08-28T08:46:31.0000000' AS DateTime2), CAST(N'2022-08-28T20:01:36.0000000' AS DateTime2), 25, NULL, 4)
GO
INSERT [dbo].[WorkRequest] ([Id], [ClientId], [CreateTime], [EmployeeId], [FullfilledDate], [Address], [TaskDescription], [IsAccepted], [BeginWorkTime], [CompleteWorkTime], [WorkTypeId], [WithdrawalsId], [UserAssessment]) VALUES (334, 14, CAST(N'2022-08-23T07:27:13.0000000' AS DateTime2), 32, CAST(N'2022-08-26T00:00:00.0000000' AS DateTime2), N'7326 Augusta Dr. Miami Beach, FL 33139', NULL, 0, CAST(N'2022-08-26T10:00:00.0000000' AS DateTime2), CAST(N'2022-08-26T16:00:00.0000000' AS DateTime2), 23, NULL, NULL)
GO
INSERT [dbo].[WorkRequest] ([Id], [ClientId], [CreateTime], [EmployeeId], [FullfilledDate], [Address], [TaskDescription], [IsAccepted], [BeginWorkTime], [CompleteWorkTime], [WorkTypeId], [WithdrawalsId], [UserAssessment]) VALUES (335, 36, CAST(N'2022-08-23T07:28:55.0000000' AS DateTime2), 13, CAST(N'2022-08-30T00:00:00.0000000' AS DateTime2), N'70 Grand St. Howard Beach, NY 11414', NULL, 0, CAST(N'2022-08-30T10:00:00.0000000' AS DateTime2), CAST(N'2022-08-30T16:00:00.0000000' AS DateTime2), 18, NULL, NULL)
GO
INSERT [dbo].[WorkRequest] ([Id], [ClientId], [CreateTime], [EmployeeId], [FullfilledDate], [Address], [TaskDescription], [IsAccepted], [BeginWorkTime], [CompleteWorkTime], [WorkTypeId], [WithdrawalsId], [UserAssessment]) VALUES (336, 19, CAST(N'2022-08-23T09:55:27.0000000' AS DateTime2), 31, CAST(N'2022-08-25T00:00:00.0000000' AS DateTime2), N'11 Glenlake Road Maplewood, NJ 07040', NULL, 0, CAST(N'2022-08-25T10:00:00.0000000' AS DateTime2), CAST(N'2022-08-25T16:00:00.0000000' AS DateTime2), 11, NULL, NULL)
GO
INSERT [dbo].[WorkRequest] ([Id], [ClientId], [CreateTime], [EmployeeId], [FullfilledDate], [Address], [TaskDescription], [IsAccepted], [BeginWorkTime], [CompleteWorkTime], [WorkTypeId], [WithdrawalsId], [UserAssessment]) VALUES (337, 12, CAST(N'2022-08-23T14:01:38.0000000' AS DateTime2), 43, CAST(N'2022-08-27T00:00:00.0000000' AS DateTime2), N'55 West St Margarets St. Princeton, NJ 08540', NULL, 0, CAST(N'2022-08-27T10:00:00.0000000' AS DateTime2), CAST(N'2022-08-27T16:00:00.0000000' AS DateTime2), 21, NULL, NULL)
GO
INSERT [dbo].[WorkRequest] ([Id], [ClientId], [CreateTime], [EmployeeId], [FullfilledDate], [Address], [TaskDescription], [IsAccepted], [BeginWorkTime], [CompleteWorkTime], [WorkTypeId], [WithdrawalsId], [UserAssessment]) VALUES (338, 28, CAST(N'2022-08-23T14:47:51.0000000' AS DateTime2), 48, CAST(N'2022-08-29T00:00:00.0000000' AS DateTime2), N'8120 Church Dr. Fort Worth, TX 76110', NULL, 1, CAST(N'2022-08-29T08:08:39.0000000' AS DateTime2), CAST(N'2022-08-29T19:09:41.0000000' AS DateTime2), 26, NULL, 3)
GO
INSERT [dbo].[WorkRequest] ([Id], [ClientId], [CreateTime], [EmployeeId], [FullfilledDate], [Address], [TaskDescription], [IsAccepted], [BeginWorkTime], [CompleteWorkTime], [WorkTypeId], [WithdrawalsId], [UserAssessment]) VALUES (339, 46, CAST(N'2022-08-24T06:08:39.0000000' AS DateTime2), 36, CAST(N'2022-08-26T00:00:00.0000000' AS DateTime2), N'361 Cambridge St. Aliquippa, PA 15001', NULL, 0, CAST(N'2022-08-26T10:00:00.0000000' AS DateTime2), CAST(N'2022-08-26T16:00:00.0000000' AS DateTime2), 23, NULL, NULL)
GO
INSERT [dbo].[WorkRequest] ([Id], [ClientId], [CreateTime], [EmployeeId], [FullfilledDate], [Address], [TaskDescription], [IsAccepted], [BeginWorkTime], [CompleteWorkTime], [WorkTypeId], [WithdrawalsId], [UserAssessment]) VALUES (340, 2, CAST(N'2022-08-24T09:41:32.0000000' AS DateTime2), 36, CAST(N'2022-08-28T00:00:00.0000000' AS DateTime2), N'8043 Lafayette St. Pittsfield, MA 01201', NULL, 1, CAST(N'2022-08-28T08:53:41.0000000' AS DateTime2), CAST(N'2022-08-28T15:13:38.0000000' AS DateTime2), 9, NULL, 1)
GO
INSERT [dbo].[WorkRequest] ([Id], [ClientId], [CreateTime], [EmployeeId], [FullfilledDate], [Address], [TaskDescription], [IsAccepted], [BeginWorkTime], [CompleteWorkTime], [WorkTypeId], [WithdrawalsId], [UserAssessment]) VALUES (341, 19, CAST(N'2022-08-24T12:22:36.0000000' AS DateTime2), 44, CAST(N'2022-08-30T00:00:00.0000000' AS DateTime2), N'163 Grove Rd. Passaic, NJ 07055', NULL, 0, CAST(N'2022-08-30T10:00:00.0000000' AS DateTime2), CAST(N'2022-08-30T16:00:00.0000000' AS DateTime2), 32, NULL, NULL)
GO
INSERT [dbo].[WorkRequest] ([Id], [ClientId], [CreateTime], [EmployeeId], [FullfilledDate], [Address], [TaskDescription], [IsAccepted], [BeginWorkTime], [CompleteWorkTime], [WorkTypeId], [WithdrawalsId], [UserAssessment]) VALUES (342, 16, CAST(N'2022-08-24T12:47:13.0000000' AS DateTime2), 37, CAST(N'2022-08-25T00:00:00.0000000' AS DateTime2), N'850 Howard Rd. West Fargo, ND 58078', NULL, 1, CAST(N'2022-08-25T09:32:27.0000000' AS DateTime2), CAST(N'2022-08-25T20:09:08.0000000' AS DateTime2), 24, NULL, 4)
GO
INSERT [dbo].[WorkRequest] ([Id], [ClientId], [CreateTime], [EmployeeId], [FullfilledDate], [Address], [TaskDescription], [IsAccepted], [BeginWorkTime], [CompleteWorkTime], [WorkTypeId], [WithdrawalsId], [UserAssessment]) VALUES (343, 18, CAST(N'2022-08-24T13:35:16.0000000' AS DateTime2), 5, CAST(N'2022-08-25T00:00:00.0000000' AS DateTime2), N'256 Victoria Ave. Madison, AL 35758', NULL, 1, CAST(N'2022-08-25T08:01:16.0000000' AS DateTime2), CAST(N'2022-08-25T18:04:45.0000000' AS DateTime2), 24, NULL, 3)
GO
INSERT [dbo].[WorkRequest] ([Id], [ClientId], [CreateTime], [EmployeeId], [FullfilledDate], [Address], [TaskDescription], [IsAccepted], [BeginWorkTime], [CompleteWorkTime], [WorkTypeId], [WithdrawalsId], [UserAssessment]) VALUES (344, 16, CAST(N'2022-08-24T15:52:23.0000000' AS DateTime2), 2, CAST(N'2022-08-31T00:00:00.0000000' AS DateTime2), N'629 Front Drive Coatesville, PA 19320', NULL, 1, CAST(N'2022-08-31T08:28:58.0000000' AS DateTime2), CAST(N'2022-08-31T20:26:22.0000000' AS DateTime2), 7, NULL, 4)
GO
INSERT [dbo].[WorkRequest] ([Id], [ClientId], [CreateTime], [EmployeeId], [FullfilledDate], [Address], [TaskDescription], [IsAccepted], [BeginWorkTime], [CompleteWorkTime], [WorkTypeId], [WithdrawalsId], [UserAssessment]) VALUES (345, 51, CAST(N'2022-08-24T16:15:35.0000000' AS DateTime2), 35, CAST(N'2022-08-29T00:00:00.0000000' AS DateTime2), N'744 Smith Store Rd. Alliance, OH 44601', NULL, 0, CAST(N'2022-08-29T10:00:00.0000000' AS DateTime2), CAST(N'2022-08-29T16:00:00.0000000' AS DateTime2), 14, NULL, NULL)
GO
INSERT [dbo].[WorkRequest] ([Id], [ClientId], [CreateTime], [EmployeeId], [FullfilledDate], [Address], [TaskDescription], [IsAccepted], [BeginWorkTime], [CompleteWorkTime], [WorkTypeId], [WithdrawalsId], [UserAssessment]) VALUES (346, 47, CAST(N'2022-08-24T18:00:22.0000000' AS DateTime2), 47, CAST(N'2022-08-28T00:00:00.0000000' AS DateTime2), N'141 Mechanic St. Tuckerton, NJ 08087', NULL, 0, CAST(N'2022-08-28T10:00:00.0000000' AS DateTime2), CAST(N'2022-08-28T16:00:00.0000000' AS DateTime2), 26, NULL, NULL)
GO
INSERT [dbo].[WorkRequest] ([Id], [ClientId], [CreateTime], [EmployeeId], [FullfilledDate], [Address], [TaskDescription], [IsAccepted], [BeginWorkTime], [CompleteWorkTime], [WorkTypeId], [WithdrawalsId], [UserAssessment]) VALUES (347, 43, CAST(N'2022-08-24T18:28:33.0000000' AS DateTime2), 29, CAST(N'2022-08-29T00:00:00.0000000' AS DateTime2), N'782 Lilac Street Durham, NC 27703', NULL, 0, CAST(N'2022-08-29T10:00:00.0000000' AS DateTime2), CAST(N'2022-08-29T16:00:00.0000000' AS DateTime2), 6, NULL, NULL)
GO
INSERT [dbo].[WorkRequest] ([Id], [ClientId], [CreateTime], [EmployeeId], [FullfilledDate], [Address], [TaskDescription], [IsAccepted], [BeginWorkTime], [CompleteWorkTime], [WorkTypeId], [WithdrawalsId], [UserAssessment]) VALUES (348, 47, CAST(N'2022-08-24T20:25:41.0000000' AS DateTime2), 46, CAST(N'2022-08-27T00:00:00.0000000' AS DateTime2), N'30 Lakeshore Dr. Cartersville, GA 30120', NULL, 0, CAST(N'2022-08-27T10:00:00.0000000' AS DateTime2), CAST(N'2022-08-27T16:00:00.0000000' AS DateTime2), 29, NULL, NULL)
GO
INSERT [dbo].[WorkRequest] ([Id], [ClientId], [CreateTime], [EmployeeId], [FullfilledDate], [Address], [TaskDescription], [IsAccepted], [BeginWorkTime], [CompleteWorkTime], [WorkTypeId], [WithdrawalsId], [UserAssessment]) VALUES (349, 36, CAST(N'2022-08-25T06:29:51.0000000' AS DateTime2), 23, CAST(N'2022-08-27T00:00:00.0000000' AS DateTime2), N'55 Windsor Lane Hickory, NC 28601', NULL, 1, CAST(N'2022-08-27T10:21:01.0000000' AS DateTime2), CAST(N'2022-08-27T16:27:37.0000000' AS DateTime2), 10, NULL, 1)
GO
INSERT [dbo].[WorkRequest] ([Id], [ClientId], [CreateTime], [EmployeeId], [FullfilledDate], [Address], [TaskDescription], [IsAccepted], [BeginWorkTime], [CompleteWorkTime], [WorkTypeId], [WithdrawalsId], [UserAssessment]) VALUES (350, 33, CAST(N'2022-08-25T11:34:43.0000000' AS DateTime2), 19, CAST(N'2022-09-01T00:00:00.0000000' AS DateTime2), N'673 Cottage Court South Windsor, CT 06074', NULL, 1, CAST(N'2022-09-01T08:18:12.0000000' AS DateTime2), CAST(N'2022-09-01T16:58:57.0000000' AS DateTime2), 21, NULL, 4)
GO
INSERT [dbo].[WorkRequest] ([Id], [ClientId], [CreateTime], [EmployeeId], [FullfilledDate], [Address], [TaskDescription], [IsAccepted], [BeginWorkTime], [CompleteWorkTime], [WorkTypeId], [WithdrawalsId], [UserAssessment]) VALUES (351, 26, CAST(N'2022-08-26T07:04:50.0000000' AS DateTime2), 32, CAST(N'2022-09-02T00:00:00.0000000' AS DateTime2), N'665 Grand Rd. East Orange, NJ 07017', NULL, 1, CAST(N'2022-09-02T09:57:59.0000000' AS DateTime2), CAST(N'2022-09-02T15:01:56.0000000' AS DateTime2), 16, NULL, 3)
GO
INSERT [dbo].[WorkRequest] ([Id], [ClientId], [CreateTime], [EmployeeId], [FullfilledDate], [Address], [TaskDescription], [IsAccepted], [BeginWorkTime], [CompleteWorkTime], [WorkTypeId], [WithdrawalsId], [UserAssessment]) VALUES (352, 57, CAST(N'2022-08-26T09:37:08.0000000' AS DateTime2), 37, CAST(N'2022-08-28T00:00:00.0000000' AS DateTime2), N'405 Clay Drive Millville, NJ 08332', NULL, 1, CAST(N'2022-08-28T09:25:19.0000000' AS DateTime2), CAST(N'2022-08-28T20:12:48.0000000' AS DateTime2), 26, NULL, 4)
GO
INSERT [dbo].[WorkRequest] ([Id], [ClientId], [CreateTime], [EmployeeId], [FullfilledDate], [Address], [TaskDescription], [IsAccepted], [BeginWorkTime], [CompleteWorkTime], [WorkTypeId], [WithdrawalsId], [UserAssessment]) VALUES (353, 55, CAST(N'2022-08-26T10:12:40.0000000' AS DateTime2), 50, CAST(N'2022-08-30T00:00:00.0000000' AS DateTime2), N'97 Oklahoma Court Branford, CT 06405', NULL, 1, CAST(N'2022-08-30T09:12:36.0000000' AS DateTime2), CAST(N'2022-08-30T18:58:13.0000000' AS DateTime2), 22, 3, 4)
GO
INSERT [dbo].[WorkRequest] ([Id], [ClientId], [CreateTime], [EmployeeId], [FullfilledDate], [Address], [TaskDescription], [IsAccepted], [BeginWorkTime], [CompleteWorkTime], [WorkTypeId], [WithdrawalsId], [UserAssessment]) VALUES (354, 55, CAST(N'2022-08-26T13:08:34.0000000' AS DateTime2), 46, CAST(N'2022-09-01T00:00:00.0000000' AS DateTime2), N'8248 Pierce Drive Ankeny, IA 50023', NULL, 0, NULL, NULL, 15, NULL, NULL)
GO
INSERT [dbo].[WorkRequest] ([Id], [ClientId], [CreateTime], [EmployeeId], [FullfilledDate], [Address], [TaskDescription], [IsAccepted], [BeginWorkTime], [CompleteWorkTime], [WorkTypeId], [WithdrawalsId], [UserAssessment]) VALUES (355, 39, CAST(N'2022-08-27T07:12:05.0000000' AS DateTime2), 8, CAST(N'2022-09-03T00:00:00.0000000' AS DateTime2), N'9034 Brookside St. Newark, NJ 07103', NULL, 1, CAST(N'2022-09-03T09:47:06.0000000' AS DateTime2), CAST(N'2022-09-03T19:12:43.0000000' AS DateTime2), 18, NULL, 4)
GO
INSERT [dbo].[WorkRequest] ([Id], [ClientId], [CreateTime], [EmployeeId], [FullfilledDate], [Address], [TaskDescription], [IsAccepted], [BeginWorkTime], [CompleteWorkTime], [WorkTypeId], [WithdrawalsId], [UserAssessment]) VALUES (356, 55, CAST(N'2022-08-27T14:56:38.0000000' AS DateTime2), 41, CAST(N'2022-08-29T00:00:00.0000000' AS DateTime2), N'17 Longfellow Court Piscataway, NJ 08854', NULL, 1, CAST(N'2022-08-29T08:17:42.0000000' AS DateTime2), CAST(N'2022-08-29T18:38:55.0000000' AS DateTime2), 15, NULL, 2)
GO
INSERT [dbo].[WorkRequest] ([Id], [ClientId], [CreateTime], [EmployeeId], [FullfilledDate], [Address], [TaskDescription], [IsAccepted], [BeginWorkTime], [CompleteWorkTime], [WorkTypeId], [WithdrawalsId], [UserAssessment]) VALUES (357, 55, CAST(N'2022-08-27T16:26:47.0000000' AS DateTime2), 23, CAST(N'2022-09-03T00:00:00.0000000' AS DateTime2), N'8069 Johnson Dr. Cockeysville, MD 21030', NULL, 1, CAST(N'2022-09-03T09:07:11.0000000' AS DateTime2), CAST(N'2022-09-03T15:06:27.0000000' AS DateTime2), 32, NULL, 2)
GO
INSERT [dbo].[WorkRequest] ([Id], [ClientId], [CreateTime], [EmployeeId], [FullfilledDate], [Address], [TaskDescription], [IsAccepted], [BeginWorkTime], [CompleteWorkTime], [WorkTypeId], [WithdrawalsId], [UserAssessment]) VALUES (358, 4, CAST(N'2022-08-28T07:55:13.0000000' AS DateTime2), 20, CAST(N'2022-09-03T00:00:00.0000000' AS DateTime2), N'46 Pennsylvania Dr. Mechanicsburg, PA 17050', NULL, 0, NULL, NULL, 30, NULL, NULL)
GO
INSERT [dbo].[WorkRequest] ([Id], [ClientId], [CreateTime], [EmployeeId], [FullfilledDate], [Address], [TaskDescription], [IsAccepted], [BeginWorkTime], [CompleteWorkTime], [WorkTypeId], [WithdrawalsId], [UserAssessment]) VALUES (359, 16, CAST(N'2022-08-29T20:06:01.0000000' AS DateTime2), 6, CAST(N'2022-08-31T00:00:00.0000000' AS DateTime2), N'42 Washington Ave. Scarsdale, NY 10583', NULL, 0, CAST(N'2022-08-31T10:00:00.0000000' AS DateTime2), CAST(N'2022-08-31T16:00:00.0000000' AS DateTime2), 21, NULL, NULL)
GO
INSERT [dbo].[WorkRequest] ([Id], [ClientId], [CreateTime], [EmployeeId], [FullfilledDate], [Address], [TaskDescription], [IsAccepted], [BeginWorkTime], [CompleteWorkTime], [WorkTypeId], [WithdrawalsId], [UserAssessment]) VALUES (360, 17, CAST(N'2022-08-30T06:09:57.0000000' AS DateTime2), 45, CAST(N'2022-09-04T00:00:00.0000000' AS DateTime2), N'78 South Depot Ave. Hillsboro, OR 97124', NULL, 1, CAST(N'2022-09-04T10:12:51.0000000' AS DateTime2), CAST(N'2022-09-04T15:35:29.0000000' AS DateTime2), 20, NULL, 1)
GO
INSERT [dbo].[WorkRequest] ([Id], [ClientId], [CreateTime], [EmployeeId], [FullfilledDate], [Address], [TaskDescription], [IsAccepted], [BeginWorkTime], [CompleteWorkTime], [WorkTypeId], [WithdrawalsId], [UserAssessment]) VALUES (361, 18, CAST(N'2022-08-30T14:49:18.0000000' AS DateTime2), 43, CAST(N'2022-09-06T00:00:00.0000000' AS DateTime2), N'24 Fordham Rd. Royal Oak, MI 48067', NULL, 0, NULL, NULL, 12, NULL, NULL)
GO
INSERT [dbo].[WorkRequest] ([Id], [ClientId], [CreateTime], [EmployeeId], [FullfilledDate], [Address], [TaskDescription], [IsAccepted], [BeginWorkTime], [CompleteWorkTime], [WorkTypeId], [WithdrawalsId], [UserAssessment]) VALUES (362, 31, CAST(N'2022-08-30T17:18:53.0000000' AS DateTime2), 27, CAST(N'2022-09-02T00:00:00.0000000' AS DateTime2), N'7 Thatcher Court Grove City, OH 43123', NULL, 1, CAST(N'2022-09-02T08:12:41.0000000' AS DateTime2), CAST(N'2022-09-02T17:38:05.0000000' AS DateTime2), 12, NULL, 3)
GO
INSERT [dbo].[WorkRequest] ([Id], [ClientId], [CreateTime], [EmployeeId], [FullfilledDate], [Address], [TaskDescription], [IsAccepted], [BeginWorkTime], [CompleteWorkTime], [WorkTypeId], [WithdrawalsId], [UserAssessment]) VALUES (363, 14, CAST(N'2022-08-30T20:03:46.0000000' AS DateTime2), 48, CAST(N'2022-09-02T00:00:00.0000000' AS DateTime2), N'429 Primrose Court East Elmhurst, NY 11369', NULL, 1, CAST(N'2022-09-02T09:54:53.0000000' AS DateTime2), CAST(N'2022-09-02T15:23:57.0000000' AS DateTime2), 31, NULL, 2)
GO
INSERT [dbo].[WorkRequest] ([Id], [ClientId], [CreateTime], [EmployeeId], [FullfilledDate], [Address], [TaskDescription], [IsAccepted], [BeginWorkTime], [CompleteWorkTime], [WorkTypeId], [WithdrawalsId], [UserAssessment]) VALUES (364, 13, CAST(N'2022-08-30T20:07:01.0000000' AS DateTime2), 34, CAST(N'2022-09-02T00:00:00.0000000' AS DateTime2), N'7443 South Nichols Lane Ithaca, NY 14850', NULL, 1, CAST(N'2022-09-02T09:26:21.0000000' AS DateTime2), CAST(N'2022-09-02T20:05:33.0000000' AS DateTime2), 28, NULL, 3)
GO
INSERT [dbo].[WorkRequest] ([Id], [ClientId], [CreateTime], [EmployeeId], [FullfilledDate], [Address], [TaskDescription], [IsAccepted], [BeginWorkTime], [CompleteWorkTime], [WorkTypeId], [WithdrawalsId], [UserAssessment]) VALUES (365, 10, CAST(N'2022-08-30T21:45:43.0000000' AS DateTime2), 50, CAST(N'2022-09-05T00:00:00.0000000' AS DateTime2), N'9184 Windfall Drive Irvington, NJ 07111', NULL, 1, CAST(N'2022-09-05T09:27:08.0000000' AS DateTime2), CAST(N'2022-09-05T17:15:55.0000000' AS DateTime2), 17, 3, 2)
GO
INSERT [dbo].[WorkRequest] ([Id], [ClientId], [CreateTime], [EmployeeId], [FullfilledDate], [Address], [TaskDescription], [IsAccepted], [BeginWorkTime], [CompleteWorkTime], [WorkTypeId], [WithdrawalsId], [UserAssessment]) VALUES (366, 11, CAST(N'2022-09-01T10:57:52.0000000' AS DateTime2), 11, CAST(N'2022-09-06T00:00:00.0000000' AS DateTime2), N'1 West Princeton Ave. Fargo, ND 58102', NULL, 0, NULL, NULL, 18, NULL, NULL)
GO
INSERT [dbo].[WorkRequest] ([Id], [ClientId], [CreateTime], [EmployeeId], [FullfilledDate], [Address], [TaskDescription], [IsAccepted], [BeginWorkTime], [CompleteWorkTime], [WorkTypeId], [WithdrawalsId], [UserAssessment]) VALUES (367, 19, CAST(N'2022-09-01T11:57:00.0000000' AS DateTime2), 15, CAST(N'2022-09-07T00:00:00.0000000' AS DateTime2), N'402 Cambridge Lane East Northport, NY 11731', NULL, 1, CAST(N'2022-09-07T08:26:37.0000000' AS DateTime2), CAST(N'2022-09-07T16:32:57.0000000' AS DateTime2), 9, NULL, 1)
GO
INSERT [dbo].[WorkRequest] ([Id], [ClientId], [CreateTime], [EmployeeId], [FullfilledDate], [Address], [TaskDescription], [IsAccepted], [BeginWorkTime], [CompleteWorkTime], [WorkTypeId], [WithdrawalsId], [UserAssessment]) VALUES (368, 9, CAST(N'2022-09-01T14:00:23.0000000' AS DateTime2), 25, CAST(N'2022-09-06T00:00:00.0000000' AS DateTime2), N'9533 Hillcrest Ave. Owensboro, KY 42301', NULL, 1, CAST(N'2022-09-06T08:21:42.0000000' AS DateTime2), CAST(N'2022-09-06T15:56:59.0000000' AS DateTime2), 25, NULL, 5)
GO
INSERT [dbo].[WorkRequest] ([Id], [ClientId], [CreateTime], [EmployeeId], [FullfilledDate], [Address], [TaskDescription], [IsAccepted], [BeginWorkTime], [CompleteWorkTime], [WorkTypeId], [WithdrawalsId], [UserAssessment]) VALUES (369, 10, CAST(N'2022-09-01T17:35:21.0000000' AS DateTime2), 1, CAST(N'2022-09-04T00:00:00.0000000' AS DateTime2), N'2 Bald Hill St. Vienna, VA 22180', NULL, 0, NULL, NULL, 26, NULL, NULL)
GO
INSERT [dbo].[WorkRequest] ([Id], [ClientId], [CreateTime], [EmployeeId], [FullfilledDate], [Address], [TaskDescription], [IsAccepted], [BeginWorkTime], [CompleteWorkTime], [WorkTypeId], [WithdrawalsId], [UserAssessment]) VALUES (370, 23, CAST(N'2022-09-01T21:31:22.0000000' AS DateTime2), 14, CAST(N'2022-09-07T00:00:00.0000000' AS DateTime2), N'67 Paris Hill St. Ridgefield, CT 06877', NULL, 1, CAST(N'2022-09-07T08:28:37.0000000' AS DateTime2), CAST(N'2022-09-07T15:06:06.0000000' AS DateTime2), 14, NULL, 1)
GO
INSERT [dbo].[WorkRequest] ([Id], [ClientId], [CreateTime], [EmployeeId], [FullfilledDate], [Address], [TaskDescription], [IsAccepted], [BeginWorkTime], [CompleteWorkTime], [WorkTypeId], [WithdrawalsId], [UserAssessment]) VALUES (371, 25, CAST(N'2022-09-02T09:51:31.0000000' AS DateTime2), 48, CAST(N'2022-09-09T00:00:00.0000000' AS DateTime2), N'375 West Summit Street Bay City, MI 48706', NULL, 0, NULL, NULL, 30, NULL, NULL)
GO
INSERT [dbo].[WorkRequest] ([Id], [ClientId], [CreateTime], [EmployeeId], [FullfilledDate], [Address], [TaskDescription], [IsAccepted], [BeginWorkTime], [CompleteWorkTime], [WorkTypeId], [WithdrawalsId], [UserAssessment]) VALUES (372, 38, CAST(N'2022-09-02T10:51:30.0000000' AS DateTime2), 43, CAST(N'2022-09-04T00:00:00.0000000' AS DateTime2), N'263 Oxford Lane Murfreesboro, TN 37128', NULL, 0, NULL, NULL, 32, NULL, NULL)
GO
INSERT [dbo].[WorkRequest] ([Id], [ClientId], [CreateTime], [EmployeeId], [FullfilledDate], [Address], [TaskDescription], [IsAccepted], [BeginWorkTime], [CompleteWorkTime], [WorkTypeId], [WithdrawalsId], [UserAssessment]) VALUES (373, 41, CAST(N'2022-09-02T17:23:09.0000000' AS DateTime2), 2, CAST(N'2022-09-04T00:00:00.0000000' AS DateTime2), N'162 Harvey St. Menasha, WI 54952', NULL, 1, CAST(N'2022-09-04T09:18:02.0000000' AS DateTime2), CAST(N'2022-09-04T18:09:32.0000000' AS DateTime2), 21, NULL, 1)
GO
INSERT [dbo].[WorkRequest] ([Id], [ClientId], [CreateTime], [EmployeeId], [FullfilledDate], [Address], [TaskDescription], [IsAccepted], [BeginWorkTime], [CompleteWorkTime], [WorkTypeId], [WithdrawalsId], [UserAssessment]) VALUES (374, 58, CAST(N'2022-09-02T21:35:38.0000000' AS DateTime2), 14, CAST(N'2022-09-07T00:00:00.0000000' AS DateTime2), N'258 W. Fairground Lane Enterprise, AL 36330', NULL, 0, NULL, NULL, 19, NULL, NULL)
GO
INSERT [dbo].[WorkRequest] ([Id], [ClientId], [CreateTime], [EmployeeId], [FullfilledDate], [Address], [TaskDescription], [IsAccepted], [BeginWorkTime], [CompleteWorkTime], [WorkTypeId], [WithdrawalsId], [UserAssessment]) VALUES (375, 15, CAST(N'2022-09-03T06:47:27.0000000' AS DateTime2), 11, CAST(N'2022-09-06T00:00:00.0000000' AS DateTime2), N'429 N. Main St. Liverpool, NY 13090', NULL, 1, CAST(N'2022-09-06T08:04:19.0000000' AS DateTime2), CAST(N'2022-09-06T19:29:22.0000000' AS DateTime2), 22, NULL, 3)
GO
INSERT [dbo].[WorkRequest] ([Id], [ClientId], [CreateTime], [EmployeeId], [FullfilledDate], [Address], [TaskDescription], [IsAccepted], [BeginWorkTime], [CompleteWorkTime], [WorkTypeId], [WithdrawalsId], [UserAssessment]) VALUES (376, 26, CAST(N'2022-09-03T07:16:33.0000000' AS DateTime2), 49, CAST(N'2022-09-06T00:00:00.0000000' AS DateTime2), N'711 Plymouth Drive La Porte, IN 46350', NULL, 1, CAST(N'2022-09-06T09:27:28.0000000' AS DateTime2), CAST(N'2022-09-06T16:58:14.0000000' AS DateTime2), 31, 2, 3)
GO
INSERT [dbo].[WorkRequest] ([Id], [ClientId], [CreateTime], [EmployeeId], [FullfilledDate], [Address], [TaskDescription], [IsAccepted], [BeginWorkTime], [CompleteWorkTime], [WorkTypeId], [WithdrawalsId], [UserAssessment]) VALUES (377, 31, CAST(N'2022-09-03T14:17:18.0000000' AS DateTime2), 19, CAST(N'2022-09-07T00:00:00.0000000' AS DateTime2), N'590 Lafayette Ave. Painesville, OH 44077', NULL, 0, NULL, NULL, 26, NULL, NULL)
GO
INSERT [dbo].[WorkRequest] ([Id], [ClientId], [CreateTime], [EmployeeId], [FullfilledDate], [Address], [TaskDescription], [IsAccepted], [BeginWorkTime], [CompleteWorkTime], [WorkTypeId], [WithdrawalsId], [UserAssessment]) VALUES (378, 28, CAST(N'2022-09-04T06:50:04.0000000' AS DateTime2), 46, CAST(N'2022-09-06T00:00:00.0000000' AS DateTime2), N'1 Woodland Rd. Emporia, KS 66801', NULL, 1, CAST(N'2022-09-06T10:04:24.0000000' AS DateTime2), CAST(N'2022-09-06T16:53:07.0000000' AS DateTime2), 16, NULL, 4)
GO
INSERT [dbo].[WorkRequest] ([Id], [ClientId], [CreateTime], [EmployeeId], [FullfilledDate], [Address], [TaskDescription], [IsAccepted], [BeginWorkTime], [CompleteWorkTime], [WorkTypeId], [WithdrawalsId], [UserAssessment]) VALUES (379, 14, CAST(N'2022-09-04T07:08:36.0000000' AS DateTime2), 49, CAST(N'2022-09-09T00:00:00.0000000' AS DateTime2), N'8227 Brickyard Street Danville, VA 24540', NULL, 1, NULL, NULL, 22, NULL, NULL)
GO
INSERT [dbo].[WorkRequest] ([Id], [ClientId], [CreateTime], [EmployeeId], [FullfilledDate], [Address], [TaskDescription], [IsAccepted], [BeginWorkTime], [CompleteWorkTime], [WorkTypeId], [WithdrawalsId], [UserAssessment]) VALUES (380, 43, CAST(N'2022-09-04T08:56:01.0000000' AS DateTime2), 7, CAST(N'2022-09-05T00:00:00.0000000' AS DateTime2), N'32 Windsor Dr. Leesburg, VA 20175', NULL, 1, CAST(N'2022-09-05T08:59:39.0000000' AS DateTime2), CAST(N'2022-09-05T18:30:52.0000000' AS DateTime2), 26, NULL, 4)
GO
INSERT [dbo].[WorkRequest] ([Id], [ClientId], [CreateTime], [EmployeeId], [FullfilledDate], [Address], [TaskDescription], [IsAccepted], [BeginWorkTime], [CompleteWorkTime], [WorkTypeId], [WithdrawalsId], [UserAssessment]) VALUES (381, 13, CAST(N'2022-09-04T11:07:58.0000000' AS DateTime2), 20, CAST(N'2022-09-10T00:00:00.0000000' AS DateTime2), N'37 Lafayette Drive Woodbridge, VA 22191', NULL, 1, NULL, NULL, 14, NULL, NULL)
GO
INSERT [dbo].[WorkRequest] ([Id], [ClientId], [CreateTime], [EmployeeId], [FullfilledDate], [Address], [TaskDescription], [IsAccepted], [BeginWorkTime], [CompleteWorkTime], [WorkTypeId], [WithdrawalsId], [UserAssessment]) VALUES (382, 44, CAST(N'2022-09-04T13:43:19.0000000' AS DateTime2), 13, CAST(N'2022-09-05T00:00:00.0000000' AS DateTime2), N'7326 Elizabeth Drive Cantonment, FL 32533', NULL, 1, CAST(N'2022-09-05T09:15:02.0000000' AS DateTime2), CAST(N'2022-09-05T15:55:00.0000000' AS DateTime2), 19, NULL, 4)
GO
INSERT [dbo].[WorkRequest] ([Id], [ClientId], [CreateTime], [EmployeeId], [FullfilledDate], [Address], [TaskDescription], [IsAccepted], [BeginWorkTime], [CompleteWorkTime], [WorkTypeId], [WithdrawalsId], [UserAssessment]) VALUES (383, 7, CAST(N'2022-09-04T14:52:23.0000000' AS DateTime2), 15, CAST(N'2022-09-09T00:00:00.0000000' AS DateTime2), N'8271 S. Lincoln Drive Wasilla, AK 99654', NULL, 1, NULL, NULL, 19, NULL, NULL)
GO
INSERT [dbo].[WorkRequest] ([Id], [ClientId], [CreateTime], [EmployeeId], [FullfilledDate], [Address], [TaskDescription], [IsAccepted], [BeginWorkTime], [CompleteWorkTime], [WorkTypeId], [WithdrawalsId], [UserAssessment]) VALUES (384, 9, CAST(N'2022-09-04T19:00:21.0000000' AS DateTime2), 5, CAST(N'2022-09-08T00:00:00.0000000' AS DateTime2), N'817 South Columbia Ave. Cordova, TN 38016', NULL, 1, NULL, NULL, 8, NULL, NULL)
GO
INSERT [dbo].[WorkRequest] ([Id], [ClientId], [CreateTime], [EmployeeId], [FullfilledDate], [Address], [TaskDescription], [IsAccepted], [BeginWorkTime], [CompleteWorkTime], [WorkTypeId], [WithdrawalsId], [UserAssessment]) VALUES (385, 59, CAST(N'2022-09-04T21:11:10.0000000' AS DateTime2), 31, CAST(N'2022-09-06T00:00:00.0000000' AS DateTime2), N'531 E. Riverside Court Lynnwood, WA 98037', NULL, 1, CAST(N'2022-09-06T08:46:12.0000000' AS DateTime2), CAST(N'2022-09-06T20:02:23.0000000' AS DateTime2), 21, NULL, 2)
GO
INSERT [dbo].[WorkRequest] ([Id], [ClientId], [CreateTime], [EmployeeId], [FullfilledDate], [Address], [TaskDescription], [IsAccepted], [BeginWorkTime], [CompleteWorkTime], [WorkTypeId], [WithdrawalsId], [UserAssessment]) VALUES (386, 50, CAST(N'2022-09-04T21:14:50.0000000' AS DateTime2), 17, CAST(N'2022-09-08T00:00:00.0000000' AS DateTime2), N'8287 Church Ave. Fuquay Varina, NC 27526', NULL, 0, NULL, NULL, 26, NULL, NULL)
GO
INSERT [dbo].[WorkRequest] ([Id], [ClientId], [CreateTime], [EmployeeId], [FullfilledDate], [Address], [TaskDescription], [IsAccepted], [BeginWorkTime], [CompleteWorkTime], [WorkTypeId], [WithdrawalsId], [UserAssessment]) VALUES (387, 57, CAST(N'2022-09-05T16:04:00.0000000' AS DateTime2), 43, CAST(N'2022-09-11T00:00:00.0000000' AS DateTime2), N'592 Southampton Circle Yuba City, CA 95993', NULL, 0, NULL, NULL, 27, NULL, NULL)
GO
INSERT [dbo].[WorkRequest] ([Id], [ClientId], [CreateTime], [EmployeeId], [FullfilledDate], [Address], [TaskDescription], [IsAccepted], [BeginWorkTime], [CompleteWorkTime], [WorkTypeId], [WithdrawalsId], [UserAssessment]) VALUES (388, 21, CAST(N'2022-09-05T20:56:28.0000000' AS DateTime2), 6, CAST(N'2022-09-11T00:00:00.0000000' AS DateTime2), N'9515 Pennsylvania Road Santa Cruz, CA 95060', NULL, 1, NULL, NULL, 16, NULL, NULL)
GO
INSERT [dbo].[WorkRequest] ([Id], [ClientId], [CreateTime], [EmployeeId], [FullfilledDate], [Address], [TaskDescription], [IsAccepted], [BeginWorkTime], [CompleteWorkTime], [WorkTypeId], [WithdrawalsId], [UserAssessment]) VALUES (389, 10, CAST(N'2022-09-06T12:40:02.0000000' AS DateTime2), 7, CAST(N'2022-09-12T00:00:00.0000000' AS DateTime2), N'7912 Adams St. Holbrook, NY 11741', NULL, 1, NULL, NULL, 6, NULL, NULL)
GO
INSERT [dbo].[WorkRequest] ([Id], [ClientId], [CreateTime], [EmployeeId], [FullfilledDate], [Address], [TaskDescription], [IsAccepted], [BeginWorkTime], [CompleteWorkTime], [WorkTypeId], [WithdrawalsId], [UserAssessment]) VALUES (390, 36, CAST(N'2022-09-06T12:46:07.0000000' AS DateTime2), 31, CAST(N'2022-09-09T00:00:00.0000000' AS DateTime2), N'64 Spruce Rd. Astoria, NY 11102', NULL, 1, NULL, NULL, 11, NULL, NULL)
GO
INSERT [dbo].[WorkRequest] ([Id], [ClientId], [CreateTime], [EmployeeId], [FullfilledDate], [Address], [TaskDescription], [IsAccepted], [BeginWorkTime], [CompleteWorkTime], [WorkTypeId], [WithdrawalsId], [UserAssessment]) VALUES (391, 23, CAST(N'2022-09-06T13:51:53.0000000' AS DateTime2), 7, CAST(N'2022-09-07T00:00:00.0000000' AS DateTime2), N'7457 South Andover Ave. Greenwood, SC 29646', NULL, 1, CAST(N'2022-09-07T08:05:56.0000000' AS DateTime2), CAST(N'2022-09-07T15:26:55.0000000' AS DateTime2), 20, NULL, 3)
GO
INSERT [dbo].[WorkRequest] ([Id], [ClientId], [CreateTime], [EmployeeId], [FullfilledDate], [Address], [TaskDescription], [IsAccepted], [BeginWorkTime], [CompleteWorkTime], [WorkTypeId], [WithdrawalsId], [UserAssessment]) VALUES (392, 16, CAST(N'2022-09-06T16:50:07.0000000' AS DateTime2), 43, CAST(N'2022-09-09T00:00:00.0000000' AS DateTime2), N'514 Saxton Drive Point Pleasant Beach, NJ 08742', NULL, 1, NULL, NULL, 27, NULL, NULL)
GO
INSERT [dbo].[WorkRequest] ([Id], [ClientId], [CreateTime], [EmployeeId], [FullfilledDate], [Address], [TaskDescription], [IsAccepted], [BeginWorkTime], [CompleteWorkTime], [WorkTypeId], [WithdrawalsId], [UserAssessment]) VALUES (393, 41, CAST(N'2022-09-06T18:52:04.0000000' AS DateTime2), 6, CAST(N'2022-09-08T00:00:00.0000000' AS DateTime2), N'571 Old Santa Clara Drive Milwaukee, WI 53204', NULL, 1, NULL, NULL, 8, NULL, NULL)
GO
INSERT [dbo].[WorkRequest] ([Id], [ClientId], [CreateTime], [EmployeeId], [FullfilledDate], [Address], [TaskDescription], [IsAccepted], [BeginWorkTime], [CompleteWorkTime], [WorkTypeId], [WithdrawalsId], [UserAssessment]) VALUES (394, 7, CAST(N'2022-09-06T21:52:02.0000000' AS DateTime2), 35, CAST(N'2022-09-09T00:00:00.0000000' AS DateTime2), N'85 Creek Dr. Yorktown, VA 23693', NULL, 1, NULL, NULL, 10, NULL, NULL)
GO
INSERT [dbo].[WorkRequest] ([Id], [ClientId], [CreateTime], [EmployeeId], [FullfilledDate], [Address], [TaskDescription], [IsAccepted], [BeginWorkTime], [CompleteWorkTime], [WorkTypeId], [WithdrawalsId], [UserAssessment]) VALUES (395, 44, CAST(N'2022-09-07T06:29:34.0000000' AS DateTime2), 27, CAST(N'2022-09-08T00:00:00.0000000' AS DateTime2), N'426 NW. Rockcrest Street Charlottesville, VA 22901', NULL, 1, NULL, NULL, 28, NULL, NULL)
GO
INSERT [dbo].[WorkRequest] ([Id], [ClientId], [CreateTime], [EmployeeId], [FullfilledDate], [Address], [TaskDescription], [IsAccepted], [BeginWorkTime], [CompleteWorkTime], [WorkTypeId], [WithdrawalsId], [UserAssessment]) VALUES (396, 53, CAST(N'2022-09-07T07:30:51.0000000' AS DateTime2), 6, CAST(N'2022-09-08T00:00:00.0000000' AS DateTime2), N'8190 Trout St. Milledgeville, GA 31061', NULL, 0, NULL, NULL, 27, NULL, NULL)
GO
INSERT [dbo].[WorkRequest] ([Id], [ClientId], [CreateTime], [EmployeeId], [FullfilledDate], [Address], [TaskDescription], [IsAccepted], [BeginWorkTime], [CompleteWorkTime], [WorkTypeId], [WithdrawalsId], [UserAssessment]) VALUES (397, 57, CAST(N'2022-09-07T08:30:54.0000000' AS DateTime2), 17, CAST(N'2022-09-10T00:00:00.0000000' AS DateTime2), N'9097 Ridgewood Dr. Morristown, NJ 07960', NULL, 1, NULL, NULL, 12, NULL, NULL)
GO
INSERT [dbo].[WorkRequest] ([Id], [ClientId], [CreateTime], [EmployeeId], [FullfilledDate], [Address], [TaskDescription], [IsAccepted], [BeginWorkTime], [CompleteWorkTime], [WorkTypeId], [WithdrawalsId], [UserAssessment]) VALUES (398, 12, CAST(N'2022-09-07T09:17:00.0000000' AS DateTime2), 35, CAST(N'2022-09-14T00:00:00.0000000' AS DateTime2), N'67 Iroquois Ave. North Wales, PA 19454', NULL, 1, NULL, NULL, 29, NULL, NULL)
GO
INSERT [dbo].[WorkRequest] ([Id], [ClientId], [CreateTime], [EmployeeId], [FullfilledDate], [Address], [TaskDescription], [IsAccepted], [BeginWorkTime], [CompleteWorkTime], [WorkTypeId], [WithdrawalsId], [UserAssessment]) VALUES (399, 33, CAST(N'2022-09-07T13:42:57.0000000' AS DateTime2), 20, CAST(N'2022-09-09T00:00:00.0000000' AS DateTime2), N'7042 Cypress Court Vernon Hills, IL 60061', NULL, 0, NULL, NULL, 16, NULL, NULL)
GO
INSERT [dbo].[WorkRequest] ([Id], [ClientId], [CreateTime], [EmployeeId], [FullfilledDate], [Address], [TaskDescription], [IsAccepted], [BeginWorkTime], [CompleteWorkTime], [WorkTypeId], [WithdrawalsId], [UserAssessment]) VALUES (400, 7, CAST(N'2022-09-08T13:31:11.0000000' AS DateTime2), 43, CAST(N'2022-09-10T00:00:00.0000000' AS DateTime2), N'7084 Prairie Drive Bartlett, IL 60103', NULL, 0, NULL, NULL, 24, NULL, NULL)
GO
INSERT [dbo].[WorkRequest] ([Id], [ClientId], [CreateTime], [EmployeeId], [FullfilledDate], [Address], [TaskDescription], [IsAccepted], [BeginWorkTime], [CompleteWorkTime], [WorkTypeId], [WithdrawalsId], [UserAssessment]) VALUES (401, 20, CAST(N'2022-09-08T13:59:40.0000000' AS DateTime2), 47, CAST(N'2022-09-14T00:00:00.0000000' AS DateTime2), N'8578 San Pablo St. Millington, TN 38053', NULL, 0, NULL, NULL, 13, NULL, NULL)
GO
INSERT [dbo].[WorkRequest] ([Id], [ClientId], [CreateTime], [EmployeeId], [FullfilledDate], [Address], [TaskDescription], [IsAccepted], [BeginWorkTime], [CompleteWorkTime], [WorkTypeId], [WithdrawalsId], [UserAssessment]) VALUES (402, 4, CAST(N'2022-09-08T15:43:10.0000000' AS DateTime2), 3, CAST(N'2022-09-09T00:00:00.0000000' AS DateTime2), N'495 North Redwood Ave. North Miami Beach, FL 33160', NULL, 0, NULL, NULL, 13, NULL, NULL)
GO
INSERT [dbo].[WorkRequest] ([Id], [ClientId], [CreateTime], [EmployeeId], [FullfilledDate], [Address], [TaskDescription], [IsAccepted], [BeginWorkTime], [CompleteWorkTime], [WorkTypeId], [WithdrawalsId], [UserAssessment]) VALUES (403, 23, CAST(N'2022-09-08T16:04:17.0000000' AS DateTime2), 40, CAST(N'2022-09-12T00:00:00.0000000' AS DateTime2), N'852 Fairground St. Schaumburg, IL 60193', NULL, 0, NULL, NULL, 6, NULL, NULL)
GO
INSERT [dbo].[WorkRequest] ([Id], [ClientId], [CreateTime], [EmployeeId], [FullfilledDate], [Address], [TaskDescription], [IsAccepted], [BeginWorkTime], [CompleteWorkTime], [WorkTypeId], [WithdrawalsId], [UserAssessment]) VALUES (404, 16, CAST(N'2022-09-09T07:01:50.0000000' AS DateTime2), 40, CAST(N'2022-09-10T00:00:00.0000000' AS DateTime2), N'79 Heritage St. Lancaster, NY 14086', NULL, 0, NULL, NULL, 15, NULL, NULL)
GO
INSERT [dbo].[WorkRequest] ([Id], [ClientId], [CreateTime], [EmployeeId], [FullfilledDate], [Address], [TaskDescription], [IsAccepted], [BeginWorkTime], [CompleteWorkTime], [WorkTypeId], [WithdrawalsId], [UserAssessment]) VALUES (405, 60, CAST(N'2022-09-09T10:33:30.0000000' AS DateTime2), 48, CAST(N'2022-09-14T00:00:00.0000000' AS DateTime2), N'48 Silver Spear St. Rockville Centre, NY 11570', NULL, 0, NULL, NULL, 8, NULL, NULL)
GO
INSERT [dbo].[WorkRequest] ([Id], [ClientId], [CreateTime], [EmployeeId], [FullfilledDate], [Address], [TaskDescription], [IsAccepted], [BeginWorkTime], [CompleteWorkTime], [WorkTypeId], [WithdrawalsId], [UserAssessment]) VALUES (406, 44, CAST(N'2022-09-09T13:29:06.0000000' AS DateTime2), 5, CAST(N'2022-09-16T00:00:00.0000000' AS DateTime2), N'35 Johnson Dr. Port Huron, MI 48060', NULL, 0, NULL, NULL, 15, NULL, NULL)
GO
INSERT [dbo].[WorkRequest] ([Id], [ClientId], [CreateTime], [EmployeeId], [FullfilledDate], [Address], [TaskDescription], [IsAccepted], [BeginWorkTime], [CompleteWorkTime], [WorkTypeId], [WithdrawalsId], [UserAssessment]) VALUES (407, 20, CAST(N'2022-09-09T19:18:37.0000000' AS DateTime2), 29, CAST(N'2022-09-12T00:00:00.0000000' AS DateTime2), N'66 Tower Ave. Whitestone, NY 11357', NULL, 0, NULL, NULL, 25, NULL, NULL)
GO
INSERT [dbo].[WorkRequest] ([Id], [ClientId], [CreateTime], [EmployeeId], [FullfilledDate], [Address], [TaskDescription], [IsAccepted], [BeginWorkTime], [CompleteWorkTime], [WorkTypeId], [WithdrawalsId], [UserAssessment]) VALUES (408, 27, CAST(N'2022-09-09T20:06:40.0000000' AS DateTime2), 22, CAST(N'2022-09-11T00:00:00.0000000' AS DateTime2), N'7429 Aspen Drive Hamilton, OH 45011', NULL, 0, NULL, NULL, 21, NULL, NULL)
GO
INSERT [dbo].[WorkRequest] ([Id], [ClientId], [CreateTime], [EmployeeId], [FullfilledDate], [Address], [TaskDescription], [IsAccepted], [BeginWorkTime], [CompleteWorkTime], [WorkTypeId], [WithdrawalsId], [UserAssessment]) VALUES (409, 49, CAST(N'2022-09-09T20:47:33.0000000' AS DateTime2), 38, CAST(N'2022-09-11T00:00:00.0000000' AS DateTime2), N'631 Honey Creek Ave. Marietta, GA 30008', NULL, 0, NULL, NULL, 23, NULL, NULL)
GO
INSERT [dbo].[WorkRequest] ([Id], [ClientId], [CreateTime], [EmployeeId], [FullfilledDate], [Address], [TaskDescription], [IsAccepted], [BeginWorkTime], [CompleteWorkTime], [WorkTypeId], [WithdrawalsId], [UserAssessment]) VALUES (410, 58, CAST(N'2022-09-10T10:06:45.0000000' AS DateTime2), 12, CAST(N'2022-09-17T00:00:00.0000000' AS DateTime2), N'89 6th St. South Lyon, MI 48178', NULL, 0, NULL, NULL, 18, NULL, NULL)
GO
INSERT [dbo].[WorkRequest] ([Id], [ClientId], [CreateTime], [EmployeeId], [FullfilledDate], [Address], [TaskDescription], [IsAccepted], [BeginWorkTime], [CompleteWorkTime], [WorkTypeId], [WithdrawalsId], [UserAssessment]) VALUES (411, 37, CAST(N'2022-09-10T11:28:32.0000000' AS DateTime2), 19, CAST(N'2022-09-14T00:00:00.0000000' AS DateTime2), N'31 Summit Court Allentown, PA 18102', NULL, 0, NULL, NULL, 19, NULL, NULL)
GO
INSERT [dbo].[WorkRequest] ([Id], [ClientId], [CreateTime], [EmployeeId], [FullfilledDate], [Address], [TaskDescription], [IsAccepted], [BeginWorkTime], [CompleteWorkTime], [WorkTypeId], [WithdrawalsId], [UserAssessment]) VALUES (412, 56, CAST(N'2022-09-10T16:19:26.0000000' AS DateTime2), 4, CAST(N'2022-09-14T00:00:00.0000000' AS DateTime2), N'73 Liberty Ave. Vista, CA 92083', NULL, 0, NULL, NULL, 23, NULL, NULL)
GO
INSERT [dbo].[WorkRequest] ([Id], [ClientId], [CreateTime], [EmployeeId], [FullfilledDate], [Address], [TaskDescription], [IsAccepted], [BeginWorkTime], [CompleteWorkTime], [WorkTypeId], [WithdrawalsId], [UserAssessment]) VALUES (413, 39, CAST(N'2022-09-10T18:37:35.0000000' AS DateTime2), 1, CAST(N'2022-09-12T00:00:00.0000000' AS DateTime2), N'8578 Princess Street Jenison, MI 49428', NULL, 0, NULL, NULL, 11, NULL, NULL)
GO
INSERT [dbo].[WorkRequest] ([Id], [ClientId], [CreateTime], [EmployeeId], [FullfilledDate], [Address], [TaskDescription], [IsAccepted], [BeginWorkTime], [CompleteWorkTime], [WorkTypeId], [WithdrawalsId], [UserAssessment]) VALUES (414, 60, CAST(N'2022-09-10T19:43:21.0000000' AS DateTime2), 42, CAST(N'2022-09-16T00:00:00.0000000' AS DateTime2), N'9823 Oak Street Syosset, NY 11791', NULL, 0, NULL, NULL, 19, NULL, NULL)
GO
INSERT [dbo].[WorkRequest] ([Id], [ClientId], [CreateTime], [EmployeeId], [FullfilledDate], [Address], [TaskDescription], [IsAccepted], [BeginWorkTime], [CompleteWorkTime], [WorkTypeId], [WithdrawalsId], [UserAssessment]) VALUES (415, 11, CAST(N'2022-09-10T19:50:20.0000000' AS DateTime2), 13, CAST(N'2022-09-15T00:00:00.0000000' AS DateTime2), N'8488 Wentworth Ave. Littleton, CO 80123', NULL, 0, NULL, NULL, 31, NULL, NULL)
GO
INSERT [dbo].[WorkRequest] ([Id], [ClientId], [CreateTime], [EmployeeId], [FullfilledDate], [Address], [TaskDescription], [IsAccepted], [BeginWorkTime], [CompleteWorkTime], [WorkTypeId], [WithdrawalsId], [UserAssessment]) VALUES (416, 27, CAST(N'2022-09-10T21:50:22.0000000' AS DateTime2), 16, CAST(N'2022-09-16T00:00:00.0000000' AS DateTime2), N'7350 East Anderson Street Wappingers Falls, NY 12590', NULL, 0, NULL, NULL, 26, NULL, NULL)
GO
INSERT [dbo].[WorkRequest] ([Id], [ClientId], [CreateTime], [EmployeeId], [FullfilledDate], [Address], [TaskDescription], [IsAccepted], [BeginWorkTime], [CompleteWorkTime], [WorkTypeId], [WithdrawalsId], [UserAssessment]) VALUES (417, 12, CAST(N'2022-09-11T08:57:52.0000000' AS DateTime2), 35, CAST(N'2022-09-18T00:00:00.0000000' AS DateTime2), N'208 Walt Whitman Dr. Biloxi, MS 39532', NULL, 0, NULL, NULL, 6, NULL, NULL)
GO
INSERT [dbo].[WorkRequest] ([Id], [ClientId], [CreateTime], [EmployeeId], [FullfilledDate], [Address], [TaskDescription], [IsAccepted], [BeginWorkTime], [CompleteWorkTime], [WorkTypeId], [WithdrawalsId], [UserAssessment]) VALUES (418, 29, CAST(N'2022-09-11T10:25:08.0000000' AS DateTime2), 7, CAST(N'2022-09-15T00:00:00.0000000' AS DateTime2), N'9752 Kirkland Drive Enfield, CT 06082', NULL, 0, NULL, NULL, 7, NULL, NULL)
GO
INSERT [dbo].[WorkRequest] ([Id], [ClientId], [CreateTime], [EmployeeId], [FullfilledDate], [Address], [TaskDescription], [IsAccepted], [BeginWorkTime], [CompleteWorkTime], [WorkTypeId], [WithdrawalsId], [UserAssessment]) VALUES (419, 13, CAST(N'2022-09-11T10:34:18.0000000' AS DateTime2), 33, CAST(N'2022-09-12T00:00:00.0000000' AS DateTime2), N'22 Griffin Ave. Fort Wayne, IN 46804', NULL, 0, NULL, NULL, 13, NULL, NULL)
GO
INSERT [dbo].[WorkRequest] ([Id], [ClientId], [CreateTime], [EmployeeId], [FullfilledDate], [Address], [TaskDescription], [IsAccepted], [BeginWorkTime], [CompleteWorkTime], [WorkTypeId], [WithdrawalsId], [UserAssessment]) VALUES (420, 10, CAST(N'2022-09-11T14:47:29.0000000' AS DateTime2), 6, CAST(N'2022-09-16T00:00:00.0000000' AS DateTime2), N'5 North Drive Snohomish, WA 98290', NULL, 0, NULL, NULL, 19, NULL, NULL)
GO
INSERT [dbo].[WorkRequest] ([Id], [ClientId], [CreateTime], [EmployeeId], [FullfilledDate], [Address], [TaskDescription], [IsAccepted], [BeginWorkTime], [CompleteWorkTime], [WorkTypeId], [WithdrawalsId], [UserAssessment]) VALUES (421, 52, CAST(N'2022-09-11T15:34:21.0000000' AS DateTime2), 39, CAST(N'2022-09-16T00:00:00.0000000' AS DateTime2), N'81 Myrtle Ave. Uniondale, NY 11553', NULL, 0, NULL, NULL, 31, NULL, NULL)
GO
INSERT [dbo].[WorkRequest] ([Id], [ClientId], [CreateTime], [EmployeeId], [FullfilledDate], [Address], [TaskDescription], [IsAccepted], [BeginWorkTime], [CompleteWorkTime], [WorkTypeId], [WithdrawalsId], [UserAssessment]) VALUES (422, 11, CAST(N'2022-09-11T18:53:36.0000000' AS DateTime2), 25, CAST(N'2022-09-18T00:00:00.0000000' AS DateTime2), N'8226 Johnson Court Mankato, MN 56001', NULL, 0, NULL, NULL, 10, NULL, NULL)
GO
INSERT [dbo].[WorkRequest] ([Id], [ClientId], [CreateTime], [EmployeeId], [FullfilledDate], [Address], [TaskDescription], [IsAccepted], [BeginWorkTime], [CompleteWorkTime], [WorkTypeId], [WithdrawalsId], [UserAssessment]) VALUES (423, 3, CAST(N'2022-09-11T20:38:40.0000000' AS DateTime2), 30, CAST(N'2022-09-16T00:00:00.0000000' AS DateTime2), N'68 Livingston St. The Villages, FL 32162', NULL, 0, NULL, NULL, 14, NULL, NULL)
GO
INSERT [dbo].[WorkRequest] ([Id], [ClientId], [CreateTime], [EmployeeId], [FullfilledDate], [Address], [TaskDescription], [IsAccepted], [BeginWorkTime], [CompleteWorkTime], [WorkTypeId], [WithdrawalsId], [UserAssessment]) VALUES (424, 31, CAST(N'2022-09-12T06:14:12.0000000' AS DateTime2), 2, CAST(N'2022-09-19T00:00:00.0000000' AS DateTime2), N'275 E. Honey Creek St. Patchogue, NY 11772', NULL, 0, NULL, NULL, 28, NULL, NULL)
GO
INSERT [dbo].[WorkRequest] ([Id], [ClientId], [CreateTime], [EmployeeId], [FullfilledDate], [Address], [TaskDescription], [IsAccepted], [BeginWorkTime], [CompleteWorkTime], [WorkTypeId], [WithdrawalsId], [UserAssessment]) VALUES (425, 38, CAST(N'2022-09-12T06:33:00.0000000' AS DateTime2), 20, CAST(N'2022-09-17T00:00:00.0000000' AS DateTime2), N'7576 Holly St. Council Bluffs, IA 51501', NULL, 0, NULL, NULL, 15, NULL, NULL)
GO
INSERT [dbo].[WorkRequest] ([Id], [ClientId], [CreateTime], [EmployeeId], [FullfilledDate], [Address], [TaskDescription], [IsAccepted], [BeginWorkTime], [CompleteWorkTime], [WorkTypeId], [WithdrawalsId], [UserAssessment]) VALUES (426, 55, CAST(N'2022-09-12T12:42:22.0000000' AS DateTime2), 28, CAST(N'2022-09-17T00:00:00.0000000' AS DateTime2), N'602 Pin Oak St. Burnsville, MN 55337', NULL, 0, NULL, NULL, 6, NULL, NULL)
GO
INSERT [dbo].[WorkRequest] ([Id], [ClientId], [CreateTime], [EmployeeId], [FullfilledDate], [Address], [TaskDescription], [IsAccepted], [BeginWorkTime], [CompleteWorkTime], [WorkTypeId], [WithdrawalsId], [UserAssessment]) VALUES (427, 51, CAST(N'2022-09-13T07:46:35.0000000' AS DateTime2), 14, CAST(N'2022-09-14T00:00:00.0000000' AS DateTime2), N'727 Belmont Avenue Ocean Springs, MS 39564', NULL, 0, NULL, NULL, 28, NULL, NULL)
GO
INSERT [dbo].[WorkRequest] ([Id], [ClientId], [CreateTime], [EmployeeId], [FullfilledDate], [Address], [TaskDescription], [IsAccepted], [BeginWorkTime], [CompleteWorkTime], [WorkTypeId], [WithdrawalsId], [UserAssessment]) VALUES (428, 36, CAST(N'2022-09-13T09:05:59.0000000' AS DateTime2), 5, CAST(N'2022-09-18T00:00:00.0000000' AS DateTime2), N'8 Penn Dr. Ottawa, IL 61350', NULL, 0, NULL, NULL, 29, NULL, NULL)
GO
INSERT [dbo].[WorkRequest] ([Id], [ClientId], [CreateTime], [EmployeeId], [FullfilledDate], [Address], [TaskDescription], [IsAccepted], [BeginWorkTime], [CompleteWorkTime], [WorkTypeId], [WithdrawalsId], [UserAssessment]) VALUES (429, 43, CAST(N'2022-09-13T09:09:00.0000000' AS DateTime2), 1, CAST(N'2022-09-17T00:00:00.0000000' AS DateTime2), N'19 West Oakland St. Bangor, ME 04401', NULL, 0, NULL, NULL, 21, NULL, NULL)
GO
INSERT [dbo].[WorkRequest] ([Id], [ClientId], [CreateTime], [EmployeeId], [FullfilledDate], [Address], [TaskDescription], [IsAccepted], [BeginWorkTime], [CompleteWorkTime], [WorkTypeId], [WithdrawalsId], [UserAssessment]) VALUES (430, 23, CAST(N'2022-09-13T11:50:20.0000000' AS DateTime2), 22, CAST(N'2022-09-15T00:00:00.0000000' AS DateTime2), N'9045 Jockey Hollow Ave. North Olmsted, OH 44070', NULL, 0, NULL, NULL, 31, NULL, NULL)
GO
INSERT [dbo].[WorkRequest] ([Id], [ClientId], [CreateTime], [EmployeeId], [FullfilledDate], [Address], [TaskDescription], [IsAccepted], [BeginWorkTime], [CompleteWorkTime], [WorkTypeId], [WithdrawalsId], [UserAssessment]) VALUES (431, 54, CAST(N'2022-09-13T18:49:10.0000000' AS DateTime2), 45, CAST(N'2022-09-14T00:00:00.0000000' AS DateTime2), N'8023 W. Augusta St. Waterbury, CT 06705', NULL, 0, NULL, NULL, 25, NULL, NULL)
GO
INSERT [dbo].[WorkRequest] ([Id], [ClientId], [CreateTime], [EmployeeId], [FullfilledDate], [Address], [TaskDescription], [IsAccepted], [BeginWorkTime], [CompleteWorkTime], [WorkTypeId], [WithdrawalsId], [UserAssessment]) VALUES (432, 30, CAST(N'2022-09-14T06:00:04.0000000' AS DateTime2), 50, CAST(N'2022-09-16T00:00:00.0000000' AS DateTime2), N'7 Westport Drive Sugar Land, TX 77478', NULL, 0, NULL, NULL, 10, NULL, NULL)
GO
INSERT [dbo].[WorkRequest] ([Id], [ClientId], [CreateTime], [EmployeeId], [FullfilledDate], [Address], [TaskDescription], [IsAccepted], [BeginWorkTime], [CompleteWorkTime], [WorkTypeId], [WithdrawalsId], [UserAssessment]) VALUES (433, 50, CAST(N'2022-09-14T06:59:01.0000000' AS DateTime2), 26, CAST(N'2022-09-18T00:00:00.0000000' AS DateTime2), N'8469 Arrowhead St. Oconomowoc, WI 53066', NULL, 0, NULL, NULL, 20, NULL, NULL)
GO
INSERT [dbo].[WorkRequest] ([Id], [ClientId], [CreateTime], [EmployeeId], [FullfilledDate], [Address], [TaskDescription], [IsAccepted], [BeginWorkTime], [CompleteWorkTime], [WorkTypeId], [WithdrawalsId], [UserAssessment]) VALUES (434, 52, CAST(N'2022-09-14T10:14:27.0000000' AS DateTime2), 49, CAST(N'2022-09-19T00:00:00.0000000' AS DateTime2), N'9869 Winchester Lane Moses Lake, WA 98837', NULL, 0, NULL, NULL, 12, NULL, NULL)
GO
INSERT [dbo].[WorkRequest] ([Id], [ClientId], [CreateTime], [EmployeeId], [FullfilledDate], [Address], [TaskDescription], [IsAccepted], [BeginWorkTime], [CompleteWorkTime], [WorkTypeId], [WithdrawalsId], [UserAssessment]) VALUES (435, 27, CAST(N'2022-09-14T17:03:49.0000000' AS DateTime2), 35, CAST(N'2022-09-17T00:00:00.0000000' AS DateTime2), N'8602 Dogwood Street Kernersville, NC 27284', NULL, 0, NULL, NULL, 26, NULL, NULL)
GO
INSERT [dbo].[WorkRequest] ([Id], [ClientId], [CreateTime], [EmployeeId], [FullfilledDate], [Address], [TaskDescription], [IsAccepted], [BeginWorkTime], [CompleteWorkTime], [WorkTypeId], [WithdrawalsId], [UserAssessment]) VALUES (436, 3, CAST(N'2022-09-14T19:00:44.0000000' AS DateTime2), 30, CAST(N'2022-09-19T00:00:00.0000000' AS DateTime2), N'8503 Gregory Avenue Saginaw, MI 48601', NULL, 0, NULL, NULL, 20, NULL, NULL)
GO
INSERT [dbo].[WorkRequest] ([Id], [ClientId], [CreateTime], [EmployeeId], [FullfilledDate], [Address], [TaskDescription], [IsAccepted], [BeginWorkTime], [CompleteWorkTime], [WorkTypeId], [WithdrawalsId], [UserAssessment]) VALUES (437, 4, CAST(N'2022-09-15T12:37:41.0000000' AS DateTime2), 14, CAST(N'2022-09-21T00:00:00.0000000' AS DateTime2), N'9948 Magnolia Ave. New Albany, IN 47150', NULL, 0, NULL, NULL, 28, NULL, NULL)
GO
INSERT [dbo].[WorkRequest] ([Id], [ClientId], [CreateTime], [EmployeeId], [FullfilledDate], [Address], [TaskDescription], [IsAccepted], [BeginWorkTime], [CompleteWorkTime], [WorkTypeId], [WithdrawalsId], [UserAssessment]) VALUES (438, 20, CAST(N'2022-09-15T13:52:12.0000000' AS DateTime2), 28, CAST(N'2022-09-20T00:00:00.0000000' AS DateTime2), N'741 Wagon St. Ashtabula, OH 44004', NULL, 0, NULL, NULL, 17, NULL, NULL)
GO
INSERT [dbo].[WorkRequest] ([Id], [ClientId], [CreateTime], [EmployeeId], [FullfilledDate], [Address], [TaskDescription], [IsAccepted], [BeginWorkTime], [CompleteWorkTime], [WorkTypeId], [WithdrawalsId], [UserAssessment]) VALUES (439, 27, CAST(N'2022-09-15T15:33:05.0000000' AS DateTime2), 30, CAST(N'2022-09-21T00:00:00.0000000' AS DateTime2), N'34 Ketch Harbour Street Omaha, NE 68107', NULL, 0, NULL, NULL, 23, NULL, NULL)
GO
INSERT [dbo].[WorkRequest] ([Id], [ClientId], [CreateTime], [EmployeeId], [FullfilledDate], [Address], [TaskDescription], [IsAccepted], [BeginWorkTime], [CompleteWorkTime], [WorkTypeId], [WithdrawalsId], [UserAssessment]) VALUES (440, 29, CAST(N'2022-09-15T19:31:57.0000000' AS DateTime2), 39, CAST(N'2022-09-17T00:00:00.0000000' AS DateTime2), N'8438 Shub Farm Drive Lewis Center, OH 43035', NULL, 0, NULL, NULL, 15, NULL, NULL)
GO
INSERT [dbo].[WorkRequest] ([Id], [ClientId], [CreateTime], [EmployeeId], [FullfilledDate], [Address], [TaskDescription], [IsAccepted], [BeginWorkTime], [CompleteWorkTime], [WorkTypeId], [WithdrawalsId], [UserAssessment]) VALUES (441, 54, CAST(N'2022-09-16T07:57:36.0000000' AS DateTime2), 26, CAST(N'2022-09-20T00:00:00.0000000' AS DateTime2), N'23 Wilson Street Glendora, CA 91740', NULL, 0, NULL, NULL, 17, NULL, NULL)
GO
INSERT [dbo].[WorkRequest] ([Id], [ClientId], [CreateTime], [EmployeeId], [FullfilledDate], [Address], [TaskDescription], [IsAccepted], [BeginWorkTime], [CompleteWorkTime], [WorkTypeId], [WithdrawalsId], [UserAssessment]) VALUES (442, 4, CAST(N'2022-09-16T10:29:14.0000000' AS DateTime2), 33, CAST(N'2022-09-22T00:00:00.0000000' AS DateTime2), N'9 SE. Kirkland Street Mount Vernon, NY 10550', NULL, 0, NULL, NULL, 24, NULL, NULL)
GO
INSERT [dbo].[WorkRequest] ([Id], [ClientId], [CreateTime], [EmployeeId], [FullfilledDate], [Address], [TaskDescription], [IsAccepted], [BeginWorkTime], [CompleteWorkTime], [WorkTypeId], [WithdrawalsId], [UserAssessment]) VALUES (443, 15, CAST(N'2022-09-16T14:52:57.0000000' AS DateTime2), 28, CAST(N'2022-09-18T00:00:00.0000000' AS DateTime2), N'17 Applegate Lane New Bedford, MA 02740', NULL, 0, NULL, NULL, 16, NULL, NULL)
GO
INSERT [dbo].[WorkRequest] ([Id], [ClientId], [CreateTime], [EmployeeId], [FullfilledDate], [Address], [TaskDescription], [IsAccepted], [BeginWorkTime], [CompleteWorkTime], [WorkTypeId], [WithdrawalsId], [UserAssessment]) VALUES (444, 27, CAST(N'2022-09-17T12:20:09.0000000' AS DateTime2), 49, CAST(N'2022-09-21T00:00:00.0000000' AS DateTime2), N'741 South Prairie St. Waterford, MI 48329', NULL, 0, NULL, NULL, 29, NULL, NULL)
GO
INSERT [dbo].[WorkRequest] ([Id], [ClientId], [CreateTime], [EmployeeId], [FullfilledDate], [Address], [TaskDescription], [IsAccepted], [BeginWorkTime], [CompleteWorkTime], [WorkTypeId], [WithdrawalsId], [UserAssessment]) VALUES (445, 40, CAST(N'2022-09-17T12:54:33.0000000' AS DateTime2), 49, CAST(N'2022-09-18T00:00:00.0000000' AS DateTime2), N'7052 Oxford Rd. Pleasanton, CA 94566', NULL, 0, NULL, NULL, 6, NULL, NULL)
GO
INSERT [dbo].[WorkRequest] ([Id], [ClientId], [CreateTime], [EmployeeId], [FullfilledDate], [Address], [TaskDescription], [IsAccepted], [BeginWorkTime], [CompleteWorkTime], [WorkTypeId], [WithdrawalsId], [UserAssessment]) VALUES (446, 41, CAST(N'2022-09-17T17:37:36.0000000' AS DateTime2), 2, CAST(N'2022-09-19T00:00:00.0000000' AS DateTime2), N'994 Olive St. Bloomington, IN 47401', NULL, 0, NULL, NULL, 22, NULL, NULL)
GO
INSERT [dbo].[WorkRequest] ([Id], [ClientId], [CreateTime], [EmployeeId], [FullfilledDate], [Address], [TaskDescription], [IsAccepted], [BeginWorkTime], [CompleteWorkTime], [WorkTypeId], [WithdrawalsId], [UserAssessment]) VALUES (447, 8, CAST(N'2022-09-17T18:58:39.0000000' AS DateTime2), 16, CAST(N'2022-09-20T00:00:00.0000000' AS DateTime2), N'708 York Rd. Medina, OH 44256', NULL, 0, NULL, NULL, 25, NULL, NULL)
GO
INSERT [dbo].[WorkRequest] ([Id], [ClientId], [CreateTime], [EmployeeId], [FullfilledDate], [Address], [TaskDescription], [IsAccepted], [BeginWorkTime], [CompleteWorkTime], [WorkTypeId], [WithdrawalsId], [UserAssessment]) VALUES (448, 43, CAST(N'2022-09-18T08:32:50.0000000' AS DateTime2), 25, CAST(N'2022-09-20T00:00:00.0000000' AS DateTime2), N'9 High Noon Ave. Pataskala, OH 43062', NULL, 0, NULL, NULL, 31, NULL, NULL)
GO
INSERT [dbo].[WorkRequest] ([Id], [ClientId], [CreateTime], [EmployeeId], [FullfilledDate], [Address], [TaskDescription], [IsAccepted], [BeginWorkTime], [CompleteWorkTime], [WorkTypeId], [WithdrawalsId], [UserAssessment]) VALUES (449, 46, CAST(N'2022-09-18T12:50:20.0000000' AS DateTime2), 38, CAST(N'2022-09-25T00:00:00.0000000' AS DateTime2), N'458 Cleveland Rd. Simpsonville, SC 29680', NULL, 0, NULL, NULL, 32, NULL, NULL)
GO
INSERT [dbo].[WorkRequest] ([Id], [ClientId], [CreateTime], [EmployeeId], [FullfilledDate], [Address], [TaskDescription], [IsAccepted], [BeginWorkTime], [CompleteWorkTime], [WorkTypeId], [WithdrawalsId], [UserAssessment]) VALUES (450, 39, CAST(N'2022-09-19T06:06:33.0000000' AS DateTime2), 10, CAST(N'2022-09-20T00:00:00.0000000' AS DateTime2), N'865 Garfield St. Antioch, TN 37013', NULL, 0, NULL, NULL, 19, NULL, NULL)
GO
INSERT [dbo].[WorkRequest] ([Id], [ClientId], [CreateTime], [EmployeeId], [FullfilledDate], [Address], [TaskDescription], [IsAccepted], [BeginWorkTime], [CompleteWorkTime], [WorkTypeId], [WithdrawalsId], [UserAssessment]) VALUES (451, 18, CAST(N'2022-09-19T07:14:44.0000000' AS DateTime2), 30, CAST(N'2022-09-20T00:00:00.0000000' AS DateTime2), N'956 Laurel Ave. Wilkes Barre, PA 18702', NULL, 0, NULL, NULL, 13, NULL, NULL)
GO
INSERT [dbo].[WorkRequest] ([Id], [ClientId], [CreateTime], [EmployeeId], [FullfilledDate], [Address], [TaskDescription], [IsAccepted], [BeginWorkTime], [CompleteWorkTime], [WorkTypeId], [WithdrawalsId], [UserAssessment]) VALUES (452, 56, CAST(N'2022-09-19T09:43:12.0000000' AS DateTime2), 26, CAST(N'2022-09-23T00:00:00.0000000' AS DateTime2), N'946 St Paul Court Lithonia, GA 30038', NULL, 0, NULL, NULL, 32, NULL, NULL)
GO
INSERT [dbo].[WorkRequest] ([Id], [ClientId], [CreateTime], [EmployeeId], [FullfilledDate], [Address], [TaskDescription], [IsAccepted], [BeginWorkTime], [CompleteWorkTime], [WorkTypeId], [WithdrawalsId], [UserAssessment]) VALUES (453, 43, CAST(N'2022-09-19T15:38:09.0000000' AS DateTime2), 45, CAST(N'2022-09-23T00:00:00.0000000' AS DateTime2), N'25 East Glenwood St. Beltsville, MD 20705', NULL, 0, NULL, NULL, 28, NULL, NULL)
GO
INSERT [dbo].[WorkRequest] ([Id], [ClientId], [CreateTime], [EmployeeId], [FullfilledDate], [Address], [TaskDescription], [IsAccepted], [BeginWorkTime], [CompleteWorkTime], [WorkTypeId], [WithdrawalsId], [UserAssessment]) VALUES (454, 49, CAST(N'2022-09-19T16:20:47.0000000' AS DateTime2), 3, CAST(N'2022-09-24T00:00:00.0000000' AS DateTime2), N'675 Lawrence Ave. Ontario, CA 91762', NULL, 0, NULL, NULL, 32, NULL, NULL)
GO
INSERT [dbo].[WorkRequest] ([Id], [ClientId], [CreateTime], [EmployeeId], [FullfilledDate], [Address], [TaskDescription], [IsAccepted], [BeginWorkTime], [CompleteWorkTime], [WorkTypeId], [WithdrawalsId], [UserAssessment]) VALUES (455, 5, CAST(N'2022-09-19T18:10:37.0000000' AS DateTime2), 40, CAST(N'2022-09-23T00:00:00.0000000' AS DateTime2), N'95 Olive Dr. Southampton, PA 18966', NULL, 0, NULL, NULL, 26, NULL, NULL)
GO
INSERT [dbo].[WorkRequest] ([Id], [ClientId], [CreateTime], [EmployeeId], [FullfilledDate], [Address], [TaskDescription], [IsAccepted], [BeginWorkTime], [CompleteWorkTime], [WorkTypeId], [WithdrawalsId], [UserAssessment]) VALUES (456, 56, CAST(N'2022-09-19T20:49:07.0000000' AS DateTime2), 49, CAST(N'2022-09-26T00:00:00.0000000' AS DateTime2), N'77 S. Summit St. Columbia, MD 21044', NULL, 0, NULL, NULL, 25, NULL, NULL)
GO
INSERT [dbo].[WorkRequest] ([Id], [ClientId], [CreateTime], [EmployeeId], [FullfilledDate], [Address], [TaskDescription], [IsAccepted], [BeginWorkTime], [CompleteWorkTime], [WorkTypeId], [WithdrawalsId], [UserAssessment]) VALUES (457, 38, CAST(N'2022-09-20T11:37:20.0000000' AS DateTime2), 31, CAST(N'2022-09-22T00:00:00.0000000' AS DateTime2), N'7454 East Tarkiln Hill Street Grayslake, IL 60030', NULL, 0, NULL, NULL, 7, NULL, NULL)
GO
INSERT [dbo].[WorkRequest] ([Id], [ClientId], [CreateTime], [EmployeeId], [FullfilledDate], [Address], [TaskDescription], [IsAccepted], [BeginWorkTime], [CompleteWorkTime], [WorkTypeId], [WithdrawalsId], [UserAssessment]) VALUES (458, 10, CAST(N'2022-09-20T14:52:38.0000000' AS DateTime2), 3, CAST(N'2022-09-22T00:00:00.0000000' AS DateTime2), N'9650 Peninsula St. Barberton, OH 44203', NULL, 0, NULL, NULL, 17, NULL, NULL)
GO
INSERT [dbo].[WorkRequest] ([Id], [ClientId], [CreateTime], [EmployeeId], [FullfilledDate], [Address], [TaskDescription], [IsAccepted], [BeginWorkTime], [CompleteWorkTime], [WorkTypeId], [WithdrawalsId], [UserAssessment]) VALUES (459, 43, CAST(N'2022-09-21T12:18:06.0000000' AS DateTime2), 22, CAST(N'2022-09-27T00:00:00.0000000' AS DateTime2), N'218 College St. Powell, TN 37849', NULL, 0, NULL, NULL, 31, NULL, NULL)
GO
INSERT [dbo].[WorkRequest] ([Id], [ClientId], [CreateTime], [EmployeeId], [FullfilledDate], [Address], [TaskDescription], [IsAccepted], [BeginWorkTime], [CompleteWorkTime], [WorkTypeId], [WithdrawalsId], [UserAssessment]) VALUES (460, 22, CAST(N'2022-09-21T13:11:40.0000000' AS DateTime2), 35, CAST(N'2022-09-25T00:00:00.0000000' AS DateTime2), N'896 Crescent Ave. Orange Park, FL 32065', NULL, 0, NULL, NULL, 11, NULL, NULL)
GO
INSERT [dbo].[WorkRequest] ([Id], [ClientId], [CreateTime], [EmployeeId], [FullfilledDate], [Address], [TaskDescription], [IsAccepted], [BeginWorkTime], [CompleteWorkTime], [WorkTypeId], [WithdrawalsId], [UserAssessment]) VALUES (461, 50, CAST(N'2022-09-21T16:22:28.0000000' AS DateTime2), 29, CAST(N'2022-09-26T00:00:00.0000000' AS DateTime2), N'33 Saxon St. Roy, UT 84067', NULL, 0, NULL, NULL, 16, NULL, NULL)
GO
INSERT [dbo].[WorkRequest] ([Id], [ClientId], [CreateTime], [EmployeeId], [FullfilledDate], [Address], [TaskDescription], [IsAccepted], [BeginWorkTime], [CompleteWorkTime], [WorkTypeId], [WithdrawalsId], [UserAssessment]) VALUES (462, 5, CAST(N'2022-09-21T17:23:08.0000000' AS DateTime2), 10, CAST(N'2022-09-24T00:00:00.0000000' AS DateTime2), N'8540 Marvon St. Hope Mills, NC 28348', NULL, 0, NULL, NULL, 6, NULL, NULL)
GO
INSERT [dbo].[WorkRequest] ([Id], [ClientId], [CreateTime], [EmployeeId], [FullfilledDate], [Address], [TaskDescription], [IsAccepted], [BeginWorkTime], [CompleteWorkTime], [WorkTypeId], [WithdrawalsId], [UserAssessment]) VALUES (463, 43, CAST(N'2022-09-21T17:28:49.0000000' AS DateTime2), 36, CAST(N'2022-09-22T00:00:00.0000000' AS DateTime2), N'98 Garfield Road New York, NY 10002', NULL, 0, NULL, NULL, 18, NULL, NULL)
GO
INSERT [dbo].[WorkRequest] ([Id], [ClientId], [CreateTime], [EmployeeId], [FullfilledDate], [Address], [TaskDescription], [IsAccepted], [BeginWorkTime], [CompleteWorkTime], [WorkTypeId], [WithdrawalsId], [UserAssessment]) VALUES (464, 21, CAST(N'2022-09-21T19:52:55.0000000' AS DateTime2), 50, CAST(N'2022-09-24T00:00:00.0000000' AS DateTime2), N'425 Shirley Court Hightstown, NJ 08520', NULL, 0, NULL, NULL, 9, NULL, NULL)
GO
INSERT [dbo].[WorkRequest] ([Id], [ClientId], [CreateTime], [EmployeeId], [FullfilledDate], [Address], [TaskDescription], [IsAccepted], [BeginWorkTime], [CompleteWorkTime], [WorkTypeId], [WithdrawalsId], [UserAssessment]) VALUES (465, 57, CAST(N'2022-09-21T20:49:08.0000000' AS DateTime2), 17, CAST(N'2022-09-22T00:00:00.0000000' AS DateTime2), N'8642 Joy Ridge Road Lapeer, MI 48446', NULL, 0, NULL, NULL, 30, NULL, NULL)
GO
INSERT [dbo].[WorkRequest] ([Id], [ClientId], [CreateTime], [EmployeeId], [FullfilledDate], [Address], [TaskDescription], [IsAccepted], [BeginWorkTime], [CompleteWorkTime], [WorkTypeId], [WithdrawalsId], [UserAssessment]) VALUES (466, 11, CAST(N'2022-09-22T09:34:35.0000000' AS DateTime2), 29, CAST(N'2022-09-24T00:00:00.0000000' AS DateTime2), N'187 SW. Cherry Hill Lane Orlando, FL 32806', NULL, 0, NULL, NULL, 29, NULL, NULL)
GO
INSERT [dbo].[WorkRequest] ([Id], [ClientId], [CreateTime], [EmployeeId], [FullfilledDate], [Address], [TaskDescription], [IsAccepted], [BeginWorkTime], [CompleteWorkTime], [WorkTypeId], [WithdrawalsId], [UserAssessment]) VALUES (467, 57, CAST(N'2022-09-22T10:51:43.0000000' AS DateTime2), 37, CAST(N'2022-09-29T00:00:00.0000000' AS DateTime2), N'544 Edgewater Drive Lumberton, NC 28358', NULL, 0, NULL, NULL, 32, NULL, NULL)
GO
INSERT [dbo].[WorkRequest] ([Id], [ClientId], [CreateTime], [EmployeeId], [FullfilledDate], [Address], [TaskDescription], [IsAccepted], [BeginWorkTime], [CompleteWorkTime], [WorkTypeId], [WithdrawalsId], [UserAssessment]) VALUES (468, 39, CAST(N'2022-09-22T11:09:50.0000000' AS DateTime2), 8, CAST(N'2022-09-24T00:00:00.0000000' AS DateTime2), N'8082 Poor House St. Atlantic City, NJ 08401', NULL, 0, NULL, NULL, 32, NULL, NULL)
GO
INSERT [dbo].[WorkRequest] ([Id], [ClientId], [CreateTime], [EmployeeId], [FullfilledDate], [Address], [TaskDescription], [IsAccepted], [BeginWorkTime], [CompleteWorkTime], [WorkTypeId], [WithdrawalsId], [UserAssessment]) VALUES (469, 34, CAST(N'2022-09-22T12:20:59.0000000' AS DateTime2), 28, CAST(N'2022-09-28T00:00:00.0000000' AS DateTime2), N'375 Princess Drive Buford, GA 30518', NULL, 0, NULL, NULL, 31, NULL, NULL)
GO
INSERT [dbo].[WorkRequest] ([Id], [ClientId], [CreateTime], [EmployeeId], [FullfilledDate], [Address], [TaskDescription], [IsAccepted], [BeginWorkTime], [CompleteWorkTime], [WorkTypeId], [WithdrawalsId], [UserAssessment]) VALUES (470, 52, CAST(N'2022-09-22T18:25:06.0000000' AS DateTime2), 1, CAST(N'2022-09-24T00:00:00.0000000' AS DateTime2), N'8783 Selby Dr. Wyandotte, MI 48192', NULL, 0, NULL, NULL, 24, NULL, NULL)
GO
INSERT [dbo].[WorkRequest] ([Id], [ClientId], [CreateTime], [EmployeeId], [FullfilledDate], [Address], [TaskDescription], [IsAccepted], [BeginWorkTime], [CompleteWorkTime], [WorkTypeId], [WithdrawalsId], [UserAssessment]) VALUES (471, 30, CAST(N'2022-09-23T10:15:26.0000000' AS DateTime2), 5, CAST(N'2022-09-26T00:00:00.0000000' AS DateTime2), N'9328 Green Hill Ave. Dundalk, MD 21222', NULL, 0, NULL, NULL, 13, NULL, NULL)
GO
INSERT [dbo].[WorkRequest] ([Id], [ClientId], [CreateTime], [EmployeeId], [FullfilledDate], [Address], [TaskDescription], [IsAccepted], [BeginWorkTime], [CompleteWorkTime], [WorkTypeId], [WithdrawalsId], [UserAssessment]) VALUES (472, 3, CAST(N'2022-09-23T15:56:08.0000000' AS DateTime2), 13, CAST(N'2022-09-24T00:00:00.0000000' AS DateTime2), N'42 Queen Drive Montgomery, AL 36109', NULL, 0, NULL, NULL, 20, NULL, NULL)
GO
INSERT [dbo].[WorkRequest] ([Id], [ClientId], [CreateTime], [EmployeeId], [FullfilledDate], [Address], [TaskDescription], [IsAccepted], [BeginWorkTime], [CompleteWorkTime], [WorkTypeId], [WithdrawalsId], [UserAssessment]) VALUES (473, 58, CAST(N'2022-09-23T17:44:46.0000000' AS DateTime2), 49, CAST(N'2022-09-24T00:00:00.0000000' AS DateTime2), N'8696 Mill Pond Ave. Waynesboro, PA 17268', NULL, 0, NULL, NULL, 7, NULL, NULL)
GO
INSERT [dbo].[WorkRequest] ([Id], [ClientId], [CreateTime], [EmployeeId], [FullfilledDate], [Address], [TaskDescription], [IsAccepted], [BeginWorkTime], [CompleteWorkTime], [WorkTypeId], [WithdrawalsId], [UserAssessment]) VALUES (474, 18, CAST(N'2022-09-24T06:46:37.0000000' AS DateTime2), 45, CAST(N'2022-09-28T00:00:00.0000000' AS DateTime2), N'500 Virginia Street Youngstown, OH 44512', NULL, 0, NULL, NULL, 7, NULL, NULL)
GO
INSERT [dbo].[WorkRequest] ([Id], [ClientId], [CreateTime], [EmployeeId], [FullfilledDate], [Address], [TaskDescription], [IsAccepted], [BeginWorkTime], [CompleteWorkTime], [WorkTypeId], [WithdrawalsId], [UserAssessment]) VALUES (475, 6, CAST(N'2022-09-24T07:48:58.0000000' AS DateTime2), 32, CAST(N'2022-09-30T00:00:00.0000000' AS DateTime2), N'772 W. Lake View Court Mount Juliet, TN 37122', NULL, 0, NULL, NULL, 26, NULL, NULL)
GO
INSERT [dbo].[WorkRequest] ([Id], [ClientId], [CreateTime], [EmployeeId], [FullfilledDate], [Address], [TaskDescription], [IsAccepted], [BeginWorkTime], [CompleteWorkTime], [WorkTypeId], [WithdrawalsId], [UserAssessment]) VALUES (476, 39, CAST(N'2022-09-24T07:52:10.0000000' AS DateTime2), 3, CAST(N'2022-09-25T00:00:00.0000000' AS DateTime2), N'919 Saxton Ave. Olive Branch, MS 38654', NULL, 0, NULL, NULL, 31, NULL, NULL)
GO
INSERT [dbo].[WorkRequest] ([Id], [ClientId], [CreateTime], [EmployeeId], [FullfilledDate], [Address], [TaskDescription], [IsAccepted], [BeginWorkTime], [CompleteWorkTime], [WorkTypeId], [WithdrawalsId], [UserAssessment]) VALUES (477, 12, CAST(N'2022-09-24T11:45:18.0000000' AS DateTime2), 43, CAST(N'2022-09-25T00:00:00.0000000' AS DateTime2), N'235 Bohemia Drive Bonita Springs, FL 34135', NULL, 0, NULL, NULL, 21, NULL, NULL)
GO
INSERT [dbo].[WorkRequest] ([Id], [ClientId], [CreateTime], [EmployeeId], [FullfilledDate], [Address], [TaskDescription], [IsAccepted], [BeginWorkTime], [CompleteWorkTime], [WorkTypeId], [WithdrawalsId], [UserAssessment]) VALUES (478, 6, CAST(N'2022-09-24T14:56:28.0000000' AS DateTime2), 9, CAST(N'2022-10-01T00:00:00.0000000' AS DateTime2), N'146 Kirkland Drive Des Moines, IA 50310', NULL, 0, NULL, NULL, 16, NULL, NULL)
GO
INSERT [dbo].[WorkRequest] ([Id], [ClientId], [CreateTime], [EmployeeId], [FullfilledDate], [Address], [TaskDescription], [IsAccepted], [BeginWorkTime], [CompleteWorkTime], [WorkTypeId], [WithdrawalsId], [UserAssessment]) VALUES (479, 27, CAST(N'2022-09-24T21:09:31.0000000' AS DateTime2), 22, CAST(N'2022-09-30T00:00:00.0000000' AS DateTime2), N'29 Newbridge Drive Lady Lake, FL 32159', NULL, 0, NULL, NULL, 25, NULL, NULL)
GO
INSERT [dbo].[WorkRequest] ([Id], [ClientId], [CreateTime], [EmployeeId], [FullfilledDate], [Address], [TaskDescription], [IsAccepted], [BeginWorkTime], [CompleteWorkTime], [WorkTypeId], [WithdrawalsId], [UserAssessment]) VALUES (480, 26, CAST(N'2022-09-25T06:00:57.0000000' AS DateTime2), 27, CAST(N'2022-09-29T00:00:00.0000000' AS DateTime2), N'61 Lafayette Court Lafayette, IN 47905', NULL, 0, NULL, NULL, 27, NULL, NULL)
GO
INSERT [dbo].[WorkRequest] ([Id], [ClientId], [CreateTime], [EmployeeId], [FullfilledDate], [Address], [TaskDescription], [IsAccepted], [BeginWorkTime], [CompleteWorkTime], [WorkTypeId], [WithdrawalsId], [UserAssessment]) VALUES (481, 52, CAST(N'2022-09-25T06:20:45.0000000' AS DateTime2), 43, CAST(N'2022-10-01T00:00:00.0000000' AS DateTime2), N'9175 Cherry Hill Ave. Warwick, RI 02886', NULL, 0, NULL, NULL, 15, NULL, NULL)
GO
INSERT [dbo].[WorkRequest] ([Id], [ClientId], [CreateTime], [EmployeeId], [FullfilledDate], [Address], [TaskDescription], [IsAccepted], [BeginWorkTime], [CompleteWorkTime], [WorkTypeId], [WithdrawalsId], [UserAssessment]) VALUES (482, 39, CAST(N'2022-09-25T10:09:39.0000000' AS DateTime2), 45, CAST(N'2022-09-28T00:00:00.0000000' AS DateTime2), N'124 Oak St. Manchester, NH 03102', NULL, 0, NULL, NULL, 31, NULL, NULL)
GO
INSERT [dbo].[WorkRequest] ([Id], [ClientId], [CreateTime], [EmployeeId], [FullfilledDate], [Address], [TaskDescription], [IsAccepted], [BeginWorkTime], [CompleteWorkTime], [WorkTypeId], [WithdrawalsId], [UserAssessment]) VALUES (483, 50, CAST(N'2022-09-25T16:25:46.0000000' AS DateTime2), 7, CAST(N'2022-09-27T00:00:00.0000000' AS DateTime2), N'5 Brickell Circle Beaver Falls, PA 15010', NULL, 0, NULL, NULL, 22, NULL, NULL)
GO
INSERT [dbo].[WorkRequest] ([Id], [ClientId], [CreateTime], [EmployeeId], [FullfilledDate], [Address], [TaskDescription], [IsAccepted], [BeginWorkTime], [CompleteWorkTime], [WorkTypeId], [WithdrawalsId], [UserAssessment]) VALUES (484, 44, CAST(N'2022-09-25T18:14:30.0000000' AS DateTime2), 34, CAST(N'2022-09-30T00:00:00.0000000' AS DateTime2), N'856 Marshall Rd. Mechanicsville, VA 23111', NULL, 0, NULL, NULL, 7, NULL, NULL)
GO
INSERT [dbo].[WorkRequest] ([Id], [ClientId], [CreateTime], [EmployeeId], [FullfilledDate], [Address], [TaskDescription], [IsAccepted], [BeginWorkTime], [CompleteWorkTime], [WorkTypeId], [WithdrawalsId], [UserAssessment]) VALUES (485, 22, CAST(N'2022-09-25T18:33:03.0000000' AS DateTime2), 18, CAST(N'2022-09-30T00:00:00.0000000' AS DateTime2), N'616 Water St. Pembroke Pines, FL 33028', NULL, 0, NULL, NULL, 11, NULL, NULL)
GO
INSERT [dbo].[WorkRequest] ([Id], [ClientId], [CreateTime], [EmployeeId], [FullfilledDate], [Address], [TaskDescription], [IsAccepted], [BeginWorkTime], [CompleteWorkTime], [WorkTypeId], [WithdrawalsId], [UserAssessment]) VALUES (486, 45, CAST(N'2022-09-26T07:31:18.0000000' AS DateTime2), 1, CAST(N'2022-09-27T00:00:00.0000000' AS DateTime2), N'747 Foxrun St. Hoboken, NJ 07030', NULL, 0, NULL, NULL, 30, NULL, NULL)
GO
INSERT [dbo].[WorkRequest] ([Id], [ClientId], [CreateTime], [EmployeeId], [FullfilledDate], [Address], [TaskDescription], [IsAccepted], [BeginWorkTime], [CompleteWorkTime], [WorkTypeId], [WithdrawalsId], [UserAssessment]) VALUES (487, 53, CAST(N'2022-09-26T08:12:18.0000000' AS DateTime2), 6, CAST(N'2022-10-03T00:00:00.0000000' AS DateTime2), N'820 Garfield Road Hagerstown, MD 21740', NULL, 0, NULL, NULL, 7, NULL, NULL)
GO
INSERT [dbo].[WorkRequest] ([Id], [ClientId], [CreateTime], [EmployeeId], [FullfilledDate], [Address], [TaskDescription], [IsAccepted], [BeginWorkTime], [CompleteWorkTime], [WorkTypeId], [WithdrawalsId], [UserAssessment]) VALUES (488, 8, CAST(N'2022-09-26T14:01:55.0000000' AS DateTime2), 27, CAST(N'2022-10-01T00:00:00.0000000' AS DateTime2), N'864 Proctor St. Alpharetta, GA 30004', NULL, 0, NULL, NULL, 20, NULL, NULL)
GO
INSERT [dbo].[WorkRequest] ([Id], [ClientId], [CreateTime], [EmployeeId], [FullfilledDate], [Address], [TaskDescription], [IsAccepted], [BeginWorkTime], [CompleteWorkTime], [WorkTypeId], [WithdrawalsId], [UserAssessment]) VALUES (489, 56, CAST(N'2022-09-26T14:45:31.0000000' AS DateTime2), 1, CAST(N'2022-10-03T00:00:00.0000000' AS DateTime2), N'512 Lees Creek Drive San Lorenzo, CA 94580', NULL, 0, NULL, NULL, 14, NULL, NULL)
GO
INSERT [dbo].[WorkRequest] ([Id], [ClientId], [CreateTime], [EmployeeId], [FullfilledDate], [Address], [TaskDescription], [IsAccepted], [BeginWorkTime], [CompleteWorkTime], [WorkTypeId], [WithdrawalsId], [UserAssessment]) VALUES (490, 34, CAST(N'2022-09-26T17:30:12.0000000' AS DateTime2), 18, CAST(N'2022-10-03T00:00:00.0000000' AS DateTime2), N'58 Ridge Ave. Cheshire, CT 06410', NULL, 0, NULL, NULL, 14, NULL, NULL)
GO
INSERT [dbo].[WorkRequest] ([Id], [ClientId], [CreateTime], [EmployeeId], [FullfilledDate], [Address], [TaskDescription], [IsAccepted], [BeginWorkTime], [CompleteWorkTime], [WorkTypeId], [WithdrawalsId], [UserAssessment]) VALUES (491, 35, CAST(N'2022-09-26T17:46:25.0000000' AS DateTime2), 11, CAST(N'2022-09-29T00:00:00.0000000' AS DateTime2), N'181 Briarwood St. Elizabethtown, PA 17022', NULL, 0, NULL, NULL, 30, NULL, NULL)
GO
INSERT [dbo].[WorkRequest] ([Id], [ClientId], [CreateTime], [EmployeeId], [FullfilledDate], [Address], [TaskDescription], [IsAccepted], [BeginWorkTime], [CompleteWorkTime], [WorkTypeId], [WithdrawalsId], [UserAssessment]) VALUES (492, 7, CAST(N'2022-09-27T20:32:15.0000000' AS DateTime2), 48, CAST(N'2022-10-01T00:00:00.0000000' AS DateTime2), N'13 Ashley Rd. Fairhope, AL 36532', NULL, 0, NULL, NULL, 29, NULL, NULL)
GO
INSERT [dbo].[WorkRequest] ([Id], [ClientId], [CreateTime], [EmployeeId], [FullfilledDate], [Address], [TaskDescription], [IsAccepted], [BeginWorkTime], [CompleteWorkTime], [WorkTypeId], [WithdrawalsId], [UserAssessment]) VALUES (493, 47, CAST(N'2022-09-28T17:11:34.0000000' AS DateTime2), 36, CAST(N'2022-10-02T00:00:00.0000000' AS DateTime2), N'216 Birchwood Drive Titusville, FL 32780', NULL, 0, NULL, NULL, 15, NULL, NULL)
GO
INSERT [dbo].[WorkRequest] ([Id], [ClientId], [CreateTime], [EmployeeId], [FullfilledDate], [Address], [TaskDescription], [IsAccepted], [BeginWorkTime], [CompleteWorkTime], [WorkTypeId], [WithdrawalsId], [UserAssessment]) VALUES (494, 40, CAST(N'2022-09-28T19:05:30.0000000' AS DateTime2), 10, CAST(N'2022-10-02T00:00:00.0000000' AS DateTime2), N'23 Inverness Ave. Suffolk, VA 23434', NULL, 0, NULL, NULL, 10, NULL, NULL)
GO
INSERT [dbo].[WorkRequest] ([Id], [ClientId], [CreateTime], [EmployeeId], [FullfilledDate], [Address], [TaskDescription], [IsAccepted], [BeginWorkTime], [CompleteWorkTime], [WorkTypeId], [WithdrawalsId], [UserAssessment]) VALUES (495, 18, CAST(N'2022-09-28T21:59:56.0000000' AS DateTime2), 33, CAST(N'2022-09-29T00:00:00.0000000' AS DateTime2), N'714 Ryan St. Calhoun, GA 30701', NULL, 0, NULL, NULL, 24, NULL, NULL)
GO
INSERT [dbo].[WorkRequest] ([Id], [ClientId], [CreateTime], [EmployeeId], [FullfilledDate], [Address], [TaskDescription], [IsAccepted], [BeginWorkTime], [CompleteWorkTime], [WorkTypeId], [WithdrawalsId], [UserAssessment]) VALUES (496, 27, CAST(N'2022-09-29T20:03:40.0000000' AS DateTime2), 25, CAST(N'2022-10-05T00:00:00.0000000' AS DateTime2), N'8023 Beach Court North Augusta, SC 29841', NULL, 0, NULL, NULL, 26, NULL, NULL)
GO
INSERT [dbo].[WorkRequest] ([Id], [ClientId], [CreateTime], [EmployeeId], [FullfilledDate], [Address], [TaskDescription], [IsAccepted], [BeginWorkTime], [CompleteWorkTime], [WorkTypeId], [WithdrawalsId], [UserAssessment]) VALUES (497, 34, CAST(N'2022-09-30T07:33:58.0000000' AS DateTime2), 30, CAST(N'2022-10-05T00:00:00.0000000' AS DateTime2), N'907 Harvard Street Eugene, OR 97402', NULL, 0, NULL, NULL, 31, NULL, NULL)
GO
INSERT [dbo].[WorkRequest] ([Id], [ClientId], [CreateTime], [EmployeeId], [FullfilledDate], [Address], [TaskDescription], [IsAccepted], [BeginWorkTime], [CompleteWorkTime], [WorkTypeId], [WithdrawalsId], [UserAssessment]) VALUES (498, 50, CAST(N'2022-09-30T09:27:41.0000000' AS DateTime2), 42, CAST(N'2022-10-06T00:00:00.0000000' AS DateTime2), N'375 Woodland St. Waldorf, MD 20601', NULL, 0, NULL, NULL, 28, NULL, NULL)
GO
INSERT [dbo].[WorkRequest] ([Id], [ClientId], [CreateTime], [EmployeeId], [FullfilledDate], [Address], [TaskDescription], [IsAccepted], [BeginWorkTime], [CompleteWorkTime], [WorkTypeId], [WithdrawalsId], [UserAssessment]) VALUES (499, 57, CAST(N'2022-09-30T13:44:50.0000000' AS DateTime2), 5, CAST(N'2022-10-03T00:00:00.0000000' AS DateTime2), N'631 Shadow Brook Ave. Culpeper, VA 22701', NULL, 0, NULL, NULL, 13, NULL, NULL)
GO
INSERT [dbo].[WorkRequest] ([Id], [ClientId], [CreateTime], [EmployeeId], [FullfilledDate], [Address], [TaskDescription], [IsAccepted], [BeginWorkTime], [CompleteWorkTime], [WorkTypeId], [WithdrawalsId], [UserAssessment]) VALUES (500, 29, CAST(N'2022-09-30T14:40:30.0000000' AS DateTime2), 9, CAST(N'2022-10-06T00:00:00.0000000' AS DateTime2), N'31 Manhattan Ave. Clinton Township, MI 48035', NULL, 0, NULL, NULL, 22, NULL, NULL)
GO
SET IDENTITY_INSERT [dbo].[WorkRequest] OFF
GO
SET IDENTITY_INSERT [dbo].[WorkType] ON 
GO
INSERT [dbo].[WorkType] ([Id], [Name], [Price], [Description]) VALUES (6, N'Public engineering', 200, N'Construction of public works based on general planning, instruction, and control (incl. repair, improvement, or demolition work)')
GO
INSERT [dbo].[WorkType] ([Id], [Name], [Price], [Description]) VALUES (7, N'Construction engineering', 300, N'Construction of buildings based on general planning, instruction, and control (incl. repair, improvement, or demolition work)')
GO
INSERT [dbo].[WorkType] ([Id], [Name], [Price], [Description]) VALUES (8, N'Carpentry', 200, N'Construction of works by processing or applying wooden materials or application of wooden structures to work')
GO
INSERT [dbo].[WorkType] ([Id], [Name], [Price], [Description]) VALUES (9, N'Plasterwork', 100, N'Applying, spraying, or affixing plaster, mortar, stucco, cement, fibers, etc. to work')
GO
INSERT [dbo].[WorkType] ([Id], [Name], [Price], [Description]) VALUES (10, N'Stone work', 400, N'Processing of stone materials (including quasi-stones such as concrete block and imitation stone) and production of stone works using masonry or by attaching stone to work')
GO
INSERT [dbo].[WorkType] ([Id], [Name], [Price], [Description]) VALUES (11, N'Roof work', 500, N'Roof-cladding with tiles, slate, or metal sheet')
GO
INSERT [dbo].[WorkType] ([Id], [Name], [Price], [Description]) VALUES (12, N'Electrical work', 500, N'Installation of power generation, transformer, power distribution, and interior electrical facilities')
GO
INSERT [dbo].[WorkType] ([Id], [Name], [Price], [Description]) VALUES (13, N'Piping work', 200, N'Work for installation of coolers, air conditioners, water supplies, hygiene facilities, and facilities for transport of water, oil, gas, and steam using metal pipes')
GO
INSERT [dbo].[WorkType] ([Id], [Name], [Price], [Description]) VALUES (14, N'Tile/brick/block work', 200, N'Constructions with bricks or concrete blocks or work to apply or attach bricks, concrete blocks, or tiles to structures')
GO
INSERT [dbo].[WorkType] ([Id], [Name], [Price], [Description]) VALUES (15, N'Steel construction work', 600, N'Processing steel forms or sheets or assembly of derived items from them')
GO
INSERT [dbo].[WorkType] ([Id], [Name], [Price], [Description]) VALUES (16, N'Steel reinforcement work', 500, N'Processing, connecting, and assembly of steel bars and other steel materials')
GO
INSERT [dbo].[WorkType] ([Id], [Name], [Price], [Description]) VALUES (17, N'Paving work', 400, N'Paving streets and other flat surfaces with asphalt, concrete, sand, gravel, or rubble')
GO
INSERT [dbo].[WorkType] ([Id], [Name], [Price], [Description]) VALUES (18, N'Dredging work', 300, N'Dredging the bottoms of rivers and bays')
GO
INSERT [dbo].[WorkType] ([Id], [Name], [Price], [Description]) VALUES (19, N'Sheet metal work', 400, N'Attaching metal sheet to structures or attaching metal sheet fixtures to structures')
GO
INSERT [dbo].[WorkType] ([Id], [Name], [Price], [Description]) VALUES (20, N'Glass work', 500, N'Installation of glass in structures')
GO
INSERT [dbo].[WorkType] ([Id], [Name], [Price], [Description]) VALUES (21, N'Coating work', 300, N'Spraying, coating, or attaching coating materials to structures')
GO
INSERT [dbo].[WorkType] ([Id], [Name], [Price], [Description]) VALUES (22, N'Waterproofing work', 400, N'Waterproofing with asphalt, mortar, or sealing materials')
GO
INSERT [dbo].[WorkType] ([Id], [Name], [Price], [Description]) VALUES (23, N'Interior finishing', 800, N'Interior finishing using wood, plaster board, sound absorbing board, wallpaper, tatami mat, vinyl floor tiles, carpeting, or fusuma sliding doors')
GO
INSERT [dbo].[WorkType] ([Id], [Name], [Price], [Description]) VALUES (24, N'Machinery installation', 600, N'Building of structures through assembly of machinery or attaching machinery to structures')
GO
INSERT [dbo].[WorkType] ([Id], [Name], [Price], [Description]) VALUES (25, N'Thermal insulation work', 300, N'Thermally insulating structures or their facilities')
GO
INSERT [dbo].[WorkType] ([Id], [Name], [Price], [Description]) VALUES (26, N'Telecommunications work', 500, N'Installation of wired telecommunication facilities, wireless telecommunication facilities, broadcasting machinery facilities, or data communication facilities')
GO
INSERT [dbo].[WorkType] ([Id], [Name], [Price], [Description]) VALUES (27, N'Landscape gardening', 700, N'Land forming, tree planting, and construction of gardens, parks, and green areas by placement landscape stones')
GO
INSERT [dbo].[WorkType] ([Id], [Name], [Price], [Description]) VALUES (28, N'Well drilling work', 100, N'Hole and well drilling using well drilling machinery and subsequent water pumping facilities work')
GO
INSERT [dbo].[WorkType] ([Id], [Name], [Price], [Description]) VALUES (29, N'Fittings work', 300, N'Attachment of wooden or metal fittings to structures')
GO
INSERT [dbo].[WorkType] ([Id], [Name], [Price], [Description]) VALUES (30, N'Water facilities work', 500, N'Construction of facilities for water intake, water purification, or water distribution for public water supplies or factories or installation of public sewage or basin sewage handling facilities')
GO
INSERT [dbo].[WorkType] ([Id], [Name], [Price], [Description]) VALUES (31, N'Firefighting facilities work', 900, N'Installation of disaster warning facilities, fire extinguishing facilities, evacuation facilities, or facilities for firefighting or installation of such facilities in structures')
GO
INSERT [dbo].[WorkType] ([Id], [Name], [Price], [Description]) VALUES (32, N'Waste facilities work', 100, N'Installation of human waste management or garbage management facilities')
GO
SET IDENTITY_INSERT [dbo].[WorkType] OFF
GO
INSERT [dbo].[WorkTypeOfEmployee] ([WorkTypeId], [EmployeeId]) VALUES (8, 1)
GO
INSERT [dbo].[WorkTypeOfEmployee] ([WorkTypeId], [EmployeeId]) VALUES (8, 2)
GO
INSERT [dbo].[WorkTypeOfEmployee] ([WorkTypeId], [EmployeeId]) VALUES (8, 3)
GO
INSERT [dbo].[WorkTypeOfEmployee] ([WorkTypeId], [EmployeeId]) VALUES (8, 4)
GO
INSERT [dbo].[WorkTypeOfEmployee] ([WorkTypeId], [EmployeeId]) VALUES (8, 5)
GO
INSERT [dbo].[WorkTypeOfEmployee] ([WorkTypeId], [EmployeeId]) VALUES (8, 7)
GO
INSERT [dbo].[WorkTypeOfEmployee] ([WorkTypeId], [EmployeeId]) VALUES (8, 8)
GO
INSERT [dbo].[WorkTypeOfEmployee] ([WorkTypeId], [EmployeeId]) VALUES (8, 10)
GO
INSERT [dbo].[WorkTypeOfEmployee] ([WorkTypeId], [EmployeeId]) VALUES (8, 11)
GO
INSERT [dbo].[WorkTypeOfEmployee] ([WorkTypeId], [EmployeeId]) VALUES (8, 12)
GO
INSERT [dbo].[WorkTypeOfEmployee] ([WorkTypeId], [EmployeeId]) VALUES (8, 13)
GO
INSERT [dbo].[WorkTypeOfEmployee] ([WorkTypeId], [EmployeeId]) VALUES (8, 14)
GO
INSERT [dbo].[WorkTypeOfEmployee] ([WorkTypeId], [EmployeeId]) VALUES (8, 15)
GO
INSERT [dbo].[WorkTypeOfEmployee] ([WorkTypeId], [EmployeeId]) VALUES (8, 16)
GO
INSERT [dbo].[WorkTypeOfEmployee] ([WorkTypeId], [EmployeeId]) VALUES (8, 17)
GO
INSERT [dbo].[WorkTypeOfEmployee] ([WorkTypeId], [EmployeeId]) VALUES (8, 18)
GO
INSERT [dbo].[WorkTypeOfEmployee] ([WorkTypeId], [EmployeeId]) VALUES (8, 20)
GO
INSERT [dbo].[WorkTypeOfEmployee] ([WorkTypeId], [EmployeeId]) VALUES (8, 21)
GO
INSERT [dbo].[WorkTypeOfEmployee] ([WorkTypeId], [EmployeeId]) VALUES (8, 23)
GO
INSERT [dbo].[WorkTypeOfEmployee] ([WorkTypeId], [EmployeeId]) VALUES (8, 24)
GO
INSERT [dbo].[WorkTypeOfEmployee] ([WorkTypeId], [EmployeeId]) VALUES (8, 25)
GO
INSERT [dbo].[WorkTypeOfEmployee] ([WorkTypeId], [EmployeeId]) VALUES (8, 27)
GO
INSERT [dbo].[WorkTypeOfEmployee] ([WorkTypeId], [EmployeeId]) VALUES (8, 28)
GO
INSERT [dbo].[WorkTypeOfEmployee] ([WorkTypeId], [EmployeeId]) VALUES (8, 30)
GO
INSERT [dbo].[WorkTypeOfEmployee] ([WorkTypeId], [EmployeeId]) VALUES (8, 31)
GO
INSERT [dbo].[WorkTypeOfEmployee] ([WorkTypeId], [EmployeeId]) VALUES (8, 32)
GO
INSERT [dbo].[WorkTypeOfEmployee] ([WorkTypeId], [EmployeeId]) VALUES (8, 33)
GO
INSERT [dbo].[WorkTypeOfEmployee] ([WorkTypeId], [EmployeeId]) VALUES (8, 35)
GO
INSERT [dbo].[WorkTypeOfEmployee] ([WorkTypeId], [EmployeeId]) VALUES (8, 36)
GO
INSERT [dbo].[WorkTypeOfEmployee] ([WorkTypeId], [EmployeeId]) VALUES (8, 37)
GO
INSERT [dbo].[WorkTypeOfEmployee] ([WorkTypeId], [EmployeeId]) VALUES (8, 38)
GO
INSERT [dbo].[WorkTypeOfEmployee] ([WorkTypeId], [EmployeeId]) VALUES (8, 39)
GO
INSERT [dbo].[WorkTypeOfEmployee] ([WorkTypeId], [EmployeeId]) VALUES (8, 40)
GO
INSERT [dbo].[WorkTypeOfEmployee] ([WorkTypeId], [EmployeeId]) VALUES (8, 41)
GO
INSERT [dbo].[WorkTypeOfEmployee] ([WorkTypeId], [EmployeeId]) VALUES (8, 43)
GO
INSERT [dbo].[WorkTypeOfEmployee] ([WorkTypeId], [EmployeeId]) VALUES (8, 44)
GO
INSERT [dbo].[WorkTypeOfEmployee] ([WorkTypeId], [EmployeeId]) VALUES (8, 45)
GO
INSERT [dbo].[WorkTypeOfEmployee] ([WorkTypeId], [EmployeeId]) VALUES (8, 46)
GO
INSERT [dbo].[WorkTypeOfEmployee] ([WorkTypeId], [EmployeeId]) VALUES (8, 47)
GO
INSERT [dbo].[WorkTypeOfEmployee] ([WorkTypeId], [EmployeeId]) VALUES (8, 48)
GO
INSERT [dbo].[WorkTypeOfEmployee] ([WorkTypeId], [EmployeeId]) VALUES (8, 49)
GO
INSERT [dbo].[WorkTypeOfEmployee] ([WorkTypeId], [EmployeeId]) VALUES (12, 1)
GO
INSERT [dbo].[WorkTypeOfEmployee] ([WorkTypeId], [EmployeeId]) VALUES (12, 3)
GO
INSERT [dbo].[WorkTypeOfEmployee] ([WorkTypeId], [EmployeeId]) VALUES (12, 4)
GO
INSERT [dbo].[WorkTypeOfEmployee] ([WorkTypeId], [EmployeeId]) VALUES (12, 5)
GO
INSERT [dbo].[WorkTypeOfEmployee] ([WorkTypeId], [EmployeeId]) VALUES (12, 6)
GO
INSERT [dbo].[WorkTypeOfEmployee] ([WorkTypeId], [EmployeeId]) VALUES (12, 7)
GO
INSERT [dbo].[WorkTypeOfEmployee] ([WorkTypeId], [EmployeeId]) VALUES (12, 8)
GO
INSERT [dbo].[WorkTypeOfEmployee] ([WorkTypeId], [EmployeeId]) VALUES (12, 9)
GO
INSERT [dbo].[WorkTypeOfEmployee] ([WorkTypeId], [EmployeeId]) VALUES (12, 10)
GO
INSERT [dbo].[WorkTypeOfEmployee] ([WorkTypeId], [EmployeeId]) VALUES (12, 11)
GO
INSERT [dbo].[WorkTypeOfEmployee] ([WorkTypeId], [EmployeeId]) VALUES (12, 12)
GO
INSERT [dbo].[WorkTypeOfEmployee] ([WorkTypeId], [EmployeeId]) VALUES (12, 13)
GO
INSERT [dbo].[WorkTypeOfEmployee] ([WorkTypeId], [EmployeeId]) VALUES (12, 14)
GO
INSERT [dbo].[WorkTypeOfEmployee] ([WorkTypeId], [EmployeeId]) VALUES (12, 15)
GO
INSERT [dbo].[WorkTypeOfEmployee] ([WorkTypeId], [EmployeeId]) VALUES (12, 16)
GO
INSERT [dbo].[WorkTypeOfEmployee] ([WorkTypeId], [EmployeeId]) VALUES (12, 17)
GO
INSERT [dbo].[WorkTypeOfEmployee] ([WorkTypeId], [EmployeeId]) VALUES (12, 19)
GO
INSERT [dbo].[WorkTypeOfEmployee] ([WorkTypeId], [EmployeeId]) VALUES (12, 20)
GO
INSERT [dbo].[WorkTypeOfEmployee] ([WorkTypeId], [EmployeeId]) VALUES (12, 21)
GO
INSERT [dbo].[WorkTypeOfEmployee] ([WorkTypeId], [EmployeeId]) VALUES (12, 22)
GO
INSERT [dbo].[WorkTypeOfEmployee] ([WorkTypeId], [EmployeeId]) VALUES (12, 24)
GO
INSERT [dbo].[WorkTypeOfEmployee] ([WorkTypeId], [EmployeeId]) VALUES (12, 26)
GO
INSERT [dbo].[WorkTypeOfEmployee] ([WorkTypeId], [EmployeeId]) VALUES (12, 27)
GO
INSERT [dbo].[WorkTypeOfEmployee] ([WorkTypeId], [EmployeeId]) VALUES (12, 28)
GO
INSERT [dbo].[WorkTypeOfEmployee] ([WorkTypeId], [EmployeeId]) VALUES (12, 29)
GO
INSERT [dbo].[WorkTypeOfEmployee] ([WorkTypeId], [EmployeeId]) VALUES (12, 30)
GO
INSERT [dbo].[WorkTypeOfEmployee] ([WorkTypeId], [EmployeeId]) VALUES (12, 31)
GO
INSERT [dbo].[WorkTypeOfEmployee] ([WorkTypeId], [EmployeeId]) VALUES (12, 32)
GO
INSERT [dbo].[WorkTypeOfEmployee] ([WorkTypeId], [EmployeeId]) VALUES (12, 33)
GO
INSERT [dbo].[WorkTypeOfEmployee] ([WorkTypeId], [EmployeeId]) VALUES (12, 34)
GO
INSERT [dbo].[WorkTypeOfEmployee] ([WorkTypeId], [EmployeeId]) VALUES (12, 35)
GO
INSERT [dbo].[WorkTypeOfEmployee] ([WorkTypeId], [EmployeeId]) VALUES (12, 36)
GO
INSERT [dbo].[WorkTypeOfEmployee] ([WorkTypeId], [EmployeeId]) VALUES (12, 37)
GO
INSERT [dbo].[WorkTypeOfEmployee] ([WorkTypeId], [EmployeeId]) VALUES (12, 38)
GO
INSERT [dbo].[WorkTypeOfEmployee] ([WorkTypeId], [EmployeeId]) VALUES (12, 39)
GO
INSERT [dbo].[WorkTypeOfEmployee] ([WorkTypeId], [EmployeeId]) VALUES (12, 40)
GO
INSERT [dbo].[WorkTypeOfEmployee] ([WorkTypeId], [EmployeeId]) VALUES (12, 41)
GO
INSERT [dbo].[WorkTypeOfEmployee] ([WorkTypeId], [EmployeeId]) VALUES (12, 42)
GO
INSERT [dbo].[WorkTypeOfEmployee] ([WorkTypeId], [EmployeeId]) VALUES (12, 45)
GO
INSERT [dbo].[WorkTypeOfEmployee] ([WorkTypeId], [EmployeeId]) VALUES (12, 46)
GO
INSERT [dbo].[WorkTypeOfEmployee] ([WorkTypeId], [EmployeeId]) VALUES (12, 47)
GO
INSERT [dbo].[WorkTypeOfEmployee] ([WorkTypeId], [EmployeeId]) VALUES (12, 48)
GO
INSERT [dbo].[WorkTypeOfEmployee] ([WorkTypeId], [EmployeeId]) VALUES (12, 50)
GO
INSERT [dbo].[WorkTypeOfEmployee] ([WorkTypeId], [EmployeeId]) VALUES (20, 5)
GO
INSERT [dbo].[WorkTypeOfEmployee] ([WorkTypeId], [EmployeeId]) VALUES (20, 8)
GO
INSERT [dbo].[WorkTypeOfEmployee] ([WorkTypeId], [EmployeeId]) VALUES (20, 10)
GO
INSERT [dbo].[WorkTypeOfEmployee] ([WorkTypeId], [EmployeeId]) VALUES (20, 11)
GO
INSERT [dbo].[WorkTypeOfEmployee] ([WorkTypeId], [EmployeeId]) VALUES (20, 12)
GO
INSERT [dbo].[WorkTypeOfEmployee] ([WorkTypeId], [EmployeeId]) VALUES (20, 13)
GO
INSERT [dbo].[WorkTypeOfEmployee] ([WorkTypeId], [EmployeeId]) VALUES (20, 14)
GO
INSERT [dbo].[WorkTypeOfEmployee] ([WorkTypeId], [EmployeeId]) VALUES (20, 16)
GO
INSERT [dbo].[WorkTypeOfEmployee] ([WorkTypeId], [EmployeeId]) VALUES (20, 17)
GO
INSERT [dbo].[WorkTypeOfEmployee] ([WorkTypeId], [EmployeeId]) VALUES (20, 18)
GO
INSERT [dbo].[WorkTypeOfEmployee] ([WorkTypeId], [EmployeeId]) VALUES (20, 19)
GO
INSERT [dbo].[WorkTypeOfEmployee] ([WorkTypeId], [EmployeeId]) VALUES (20, 21)
GO
INSERT [dbo].[WorkTypeOfEmployee] ([WorkTypeId], [EmployeeId]) VALUES (20, 22)
GO
INSERT [dbo].[WorkTypeOfEmployee] ([WorkTypeId], [EmployeeId]) VALUES (20, 23)
GO
INSERT [dbo].[WorkTypeOfEmployee] ([WorkTypeId], [EmployeeId]) VALUES (20, 24)
GO
INSERT [dbo].[WorkTypeOfEmployee] ([WorkTypeId], [EmployeeId]) VALUES (20, 26)
GO
INSERT [dbo].[WorkTypeOfEmployee] ([WorkTypeId], [EmployeeId]) VALUES (20, 27)
GO
INSERT [dbo].[WorkTypeOfEmployee] ([WorkTypeId], [EmployeeId]) VALUES (20, 30)
GO
INSERT [dbo].[WorkTypeOfEmployee] ([WorkTypeId], [EmployeeId]) VALUES (20, 32)
GO
INSERT [dbo].[WorkTypeOfEmployee] ([WorkTypeId], [EmployeeId]) VALUES (20, 33)
GO
INSERT [dbo].[WorkTypeOfEmployee] ([WorkTypeId], [EmployeeId]) VALUES (20, 36)
GO
INSERT [dbo].[WorkTypeOfEmployee] ([WorkTypeId], [EmployeeId]) VALUES (20, 42)
GO
INSERT [dbo].[WorkTypeOfEmployee] ([WorkTypeId], [EmployeeId]) VALUES (20, 43)
GO
INSERT [dbo].[WorkTypeOfEmployee] ([WorkTypeId], [EmployeeId]) VALUES (20, 44)
GO
INSERT [dbo].[WorkTypeOfEmployee] ([WorkTypeId], [EmployeeId]) VALUES (20, 46)
GO
INSERT [dbo].[WorkTypeOfEmployee] ([WorkTypeId], [EmployeeId]) VALUES (20, 49)
GO
INSERT [dbo].[WorkTypeOfEmployee] ([WorkTypeId], [EmployeeId]) VALUES (23, 1)
GO
INSERT [dbo].[WorkTypeOfEmployee] ([WorkTypeId], [EmployeeId]) VALUES (23, 2)
GO
INSERT [dbo].[WorkTypeOfEmployee] ([WorkTypeId], [EmployeeId]) VALUES (23, 3)
GO
INSERT [dbo].[WorkTypeOfEmployee] ([WorkTypeId], [EmployeeId]) VALUES (23, 19)
GO
INSERT [dbo].[WorkTypeOfEmployee] ([WorkTypeId], [EmployeeId]) VALUES (23, 23)
GO
INSERT [dbo].[WorkTypeOfEmployee] ([WorkTypeId], [EmployeeId]) VALUES (23, 28)
GO
INSERT [dbo].[WorkTypeOfEmployee] ([WorkTypeId], [EmployeeId]) VALUES (23, 31)
GO
INSERT [dbo].[WorkTypeOfEmployee] ([WorkTypeId], [EmployeeId]) VALUES (23, 41)
GO
INSERT [dbo].[WorkTypeOfEmployee] ([WorkTypeId], [EmployeeId]) VALUES (23, 43)
GO
INSERT [dbo].[WorkTypeOfEmployee] ([WorkTypeId], [EmployeeId]) VALUES (23, 47)
GO
INSERT [dbo].[WorkTypeOfEmployee] ([WorkTypeId], [EmployeeId]) VALUES (23, 49)
GO
INSERT [dbo].[WorkTypeOfEmployee] ([WorkTypeId], [EmployeeId]) VALUES (23, 50)
GO
INSERT [dbo].[WorkTypeOfEmployee] ([WorkTypeId], [EmployeeId]) VALUES (27, 2)
GO
INSERT [dbo].[WorkTypeOfEmployee] ([WorkTypeId], [EmployeeId]) VALUES (27, 3)
GO
INSERT [dbo].[WorkTypeOfEmployee] ([WorkTypeId], [EmployeeId]) VALUES (27, 7)
GO
INSERT [dbo].[WorkTypeOfEmployee] ([WorkTypeId], [EmployeeId]) VALUES (27, 9)
GO
INSERT [dbo].[WorkTypeOfEmployee] ([WorkTypeId], [EmployeeId]) VALUES (27, 11)
GO
INSERT [dbo].[WorkTypeOfEmployee] ([WorkTypeId], [EmployeeId]) VALUES (27, 14)
GO
INSERT [dbo].[WorkTypeOfEmployee] ([WorkTypeId], [EmployeeId]) VALUES (27, 18)
GO
INSERT [dbo].[WorkTypeOfEmployee] ([WorkTypeId], [EmployeeId]) VALUES (27, 23)
GO
INSERT [dbo].[WorkTypeOfEmployee] ([WorkTypeId], [EmployeeId]) VALUES (27, 24)
GO
INSERT [dbo].[WorkTypeOfEmployee] ([WorkTypeId], [EmployeeId]) VALUES (27, 26)
GO
INSERT [dbo].[WorkTypeOfEmployee] ([WorkTypeId], [EmployeeId]) VALUES (27, 29)
GO
INSERT [dbo].[WorkTypeOfEmployee] ([WorkTypeId], [EmployeeId]) VALUES (27, 30)
GO
INSERT [dbo].[WorkTypeOfEmployee] ([WorkTypeId], [EmployeeId]) VALUES (27, 31)
GO
INSERT [dbo].[WorkTypeOfEmployee] ([WorkTypeId], [EmployeeId]) VALUES (27, 32)
GO
INSERT [dbo].[WorkTypeOfEmployee] ([WorkTypeId], [EmployeeId]) VALUES (27, 34)
GO
INSERT [dbo].[WorkTypeOfEmployee] ([WorkTypeId], [EmployeeId]) VALUES (27, 35)
GO
INSERT [dbo].[WorkTypeOfEmployee] ([WorkTypeId], [EmployeeId]) VALUES (27, 37)
GO
INSERT [dbo].[WorkTypeOfEmployee] ([WorkTypeId], [EmployeeId]) VALUES (27, 38)
GO
INSERT [dbo].[WorkTypeOfEmployee] ([WorkTypeId], [EmployeeId]) VALUES (27, 40)
GO
INSERT [dbo].[WorkTypeOfEmployee] ([WorkTypeId], [EmployeeId]) VALUES (27, 42)
GO
INSERT [dbo].[WorkTypeOfEmployee] ([WorkTypeId], [EmployeeId]) VALUES (27, 46)
GO
INSERT [dbo].[WorkTypeOfEmployee] ([WorkTypeId], [EmployeeId]) VALUES (27, 48)
GO
INSERT [dbo].[WorkTypeOfEmployee] ([WorkTypeId], [EmployeeId]) VALUES (27, 49)
GO
INSERT [dbo].[WorkTypeOfEmployee] ([WorkTypeId], [EmployeeId]) VALUES (30, 2)
GO
INSERT [dbo].[WorkTypeOfEmployee] ([WorkTypeId], [EmployeeId]) VALUES (30, 4)
GO
INSERT [dbo].[WorkTypeOfEmployee] ([WorkTypeId], [EmployeeId]) VALUES (30, 6)
GO
INSERT [dbo].[WorkTypeOfEmployee] ([WorkTypeId], [EmployeeId]) VALUES (30, 8)
GO
INSERT [dbo].[WorkTypeOfEmployee] ([WorkTypeId], [EmployeeId]) VALUES (30, 9)
GO
INSERT [dbo].[WorkTypeOfEmployee] ([WorkTypeId], [EmployeeId]) VALUES (30, 12)
GO
INSERT [dbo].[WorkTypeOfEmployee] ([WorkTypeId], [EmployeeId]) VALUES (30, 13)
GO
INSERT [dbo].[WorkTypeOfEmployee] ([WorkTypeId], [EmployeeId]) VALUES (30, 16)
GO
INSERT [dbo].[WorkTypeOfEmployee] ([WorkTypeId], [EmployeeId]) VALUES (30, 20)
GO
INSERT [dbo].[WorkTypeOfEmployee] ([WorkTypeId], [EmployeeId]) VALUES (30, 22)
GO
INSERT [dbo].[WorkTypeOfEmployee] ([WorkTypeId], [EmployeeId]) VALUES (30, 26)
GO
INSERT [dbo].[WorkTypeOfEmployee] ([WorkTypeId], [EmployeeId]) VALUES (30, 35)
GO
INSERT [dbo].[WorkTypeOfEmployee] ([WorkTypeId], [EmployeeId]) VALUES (30, 37)
GO
INSERT [dbo].[WorkTypeOfEmployee] ([WorkTypeId], [EmployeeId]) VALUES (30, 40)
GO
INSERT [dbo].[WorkTypeOfEmployee] ([WorkTypeId], [EmployeeId]) VALUES (30, 41)
GO
INSERT [dbo].[WorkTypeOfEmployee] ([WorkTypeId], [EmployeeId]) VALUES (30, 45)
GO
INSERT [dbo].[WorkTypeOfEmployee] ([WorkTypeId], [EmployeeId]) VALUES (30, 48)
GO
INSERT [dbo].[WorkTypeOfProfession] ([WorkTypeId], [ProfessionId]) VALUES (6, 1)
GO
INSERT [dbo].[WorkTypeOfProfession] ([WorkTypeId], [ProfessionId]) VALUES (6, 5)
GO
INSERT [dbo].[WorkTypeOfProfession] ([WorkTypeId], [ProfessionId]) VALUES (6, 6)
GO
INSERT [dbo].[WorkTypeOfProfession] ([WorkTypeId], [ProfessionId]) VALUES (6, 8)
GO
INSERT [dbo].[WorkTypeOfProfession] ([WorkTypeId], [ProfessionId]) VALUES (7, 5)
GO
INSERT [dbo].[WorkTypeOfProfession] ([WorkTypeId], [ProfessionId]) VALUES (8, 7)
GO
INSERT [dbo].[WorkTypeOfProfession] ([WorkTypeId], [ProfessionId]) VALUES (9, 2)
GO
INSERT [dbo].[WorkTypeOfProfession] ([WorkTypeId], [ProfessionId]) VALUES (9, 4)
GO
INSERT [dbo].[WorkTypeOfProfession] ([WorkTypeId], [ProfessionId]) VALUES (9, 8)
GO
INSERT [dbo].[WorkTypeOfProfession] ([WorkTypeId], [ProfessionId]) VALUES (10, 2)
GO
INSERT [dbo].[WorkTypeOfProfession] ([WorkTypeId], [ProfessionId]) VALUES (10, 3)
GO
INSERT [dbo].[WorkTypeOfProfession] ([WorkTypeId], [ProfessionId]) VALUES (11, 2)
GO
INSERT [dbo].[WorkTypeOfProfession] ([WorkTypeId], [ProfessionId]) VALUES (13, 4)
GO
INSERT [dbo].[WorkTypeOfProfession] ([WorkTypeId], [ProfessionId]) VALUES (15, 8)
GO
INSERT [dbo].[WorkTypeOfProfession] ([WorkTypeId], [ProfessionId]) VALUES (16, 7)
GO
INSERT [dbo].[WorkTypeOfProfession] ([WorkTypeId], [ProfessionId]) VALUES (18, 4)
GO
INSERT [dbo].[WorkTypeOfProfession] ([WorkTypeId], [ProfessionId]) VALUES (19, 5)
GO
INSERT [dbo].[WorkTypeOfProfession] ([WorkTypeId], [ProfessionId]) VALUES (19, 6)
GO
INSERT [dbo].[WorkTypeOfProfession] ([WorkTypeId], [ProfessionId]) VALUES (20, 3)
GO
INSERT [dbo].[WorkTypeOfProfession] ([WorkTypeId], [ProfessionId]) VALUES (21, 6)
GO
INSERT [dbo].[WorkTypeOfProfession] ([WorkTypeId], [ProfessionId]) VALUES (22, 5)
GO
INSERT [dbo].[WorkTypeOfProfession] ([WorkTypeId], [ProfessionId]) VALUES (23, 1)
GO
INSERT [dbo].[WorkTypeOfProfession] ([WorkTypeId], [ProfessionId]) VALUES (23, 4)
GO
INSERT [dbo].[WorkTypeOfProfession] ([WorkTypeId], [ProfessionId]) VALUES (24, 3)
GO
INSERT [dbo].[WorkTypeOfProfession] ([WorkTypeId], [ProfessionId]) VALUES (25, 7)
GO
INSERT [dbo].[WorkTypeOfProfession] ([WorkTypeId], [ProfessionId]) VALUES (26, 1)
GO
INSERT [dbo].[WorkTypeOfProfession] ([WorkTypeId], [ProfessionId]) VALUES (26, 5)
GO
INSERT [dbo].[WorkTypeOfProfession] ([WorkTypeId], [ProfessionId]) VALUES (28, 2)
GO
INSERT [dbo].[WorkTypeOfProfession] ([WorkTypeId], [ProfessionId]) VALUES (29, 1)
GO
INSERT [dbo].[WorkTypeOfProfession] ([WorkTypeId], [ProfessionId]) VALUES (29, 6)
GO
INSERT [dbo].[WorkTypeOfProfession] ([WorkTypeId], [ProfessionId]) VALUES (29, 8)
GO
INSERT [dbo].[WorkTypeOfProfession] ([WorkTypeId], [ProfessionId]) VALUES (30, 6)
GO
INSERT [dbo].[WorkTypeOfProfession] ([WorkTypeId], [ProfessionId]) VALUES (30, 7)
GO
INSERT [dbo].[WorkTypeOfProfession] ([WorkTypeId], [ProfessionId]) VALUES (32, 1)
GO
INSERT [dbo].[WorkTypeOfProfession] ([WorkTypeId], [ProfessionId]) VALUES (32, 3)
GO
INSERT [dbo].[WorkTypeOfProfession] ([WorkTypeId], [ProfessionId]) VALUES (32, 4)
GO
ALTER TABLE [dbo].[Company] ADD  DEFAULT ((5)) FOR [CompanyCommissionRate]
GO
ALTER TABLE [dbo].[Company] ADD  DEFAULT ((2.5)) FOR [SystemCommissionRate]
GO
ALTER TABLE [dbo].[Employee]  WITH CHECK ADD  CONSTRAINT [fk_Employee_Company1] FOREIGN KEY([CompanyId])
REFERENCES [dbo].[Company] ([Id])
GO
ALTER TABLE [dbo].[Employee] CHECK CONSTRAINT [fk_Employee_Company1]
GO
ALTER TABLE [dbo].[HolidayDays]  WITH CHECK ADD  CONSTRAINT [fk_HolidayDays_Company1] FOREIGN KEY([CompanyId])
REFERENCES [dbo].[Company] ([Id])
GO
ALTER TABLE [dbo].[HolidayDays] CHECK CONSTRAINT [fk_HolidayDays_Company1]
GO
ALTER TABLE [dbo].[ProfessionOfEmployee]  WITH CHECK ADD  CONSTRAINT [fk_Employee_has_Profession_Employee1] FOREIGN KEY([EmployeeId])
REFERENCES [dbo].[Employee] ([Id])
GO
ALTER TABLE [dbo].[ProfessionOfEmployee] CHECK CONSTRAINT [fk_Employee_has_Profession_Employee1]
GO
ALTER TABLE [dbo].[ProfessionOfEmployee]  WITH CHECK ADD  CONSTRAINT [fk_Employee_has_Profession_Profession1] FOREIGN KEY([ProfessionId])
REFERENCES [dbo].[Profession] ([Id])
GO
ALTER TABLE [dbo].[ProfessionOfEmployee] CHECK CONSTRAINT [fk_Employee_has_Profession_Profession1]
GO
ALTER TABLE [dbo].[Schedule]  WITH CHECK ADD  CONSTRAINT [fk_Schedule_Employee1] FOREIGN KEY([EmployeeId])
REFERENCES [dbo].[Employee] ([Id])
GO
ALTER TABLE [dbo].[Schedule] CHECK CONSTRAINT [fk_Schedule_Employee1]
GO
ALTER TABLE [dbo].[VacationDays]  WITH CHECK ADD  CONSTRAINT [fk_VacationDays_Employee1] FOREIGN KEY([EmployeeId])
REFERENCES [dbo].[Employee] ([Id])
GO
ALTER TABLE [dbo].[VacationDays] CHECK CONSTRAINT [fk_VacationDays_Employee1]
GO
ALTER TABLE [dbo].[Withdrawals]  WITH CHECK ADD  CONSTRAINT [fk_Withdrawals_Employee1] FOREIGN KEY([EmployeeId])
REFERENCES [dbo].[Employee] ([Id])
GO
ALTER TABLE [dbo].[Withdrawals] CHECK CONSTRAINT [fk_Withdrawals_Employee1]
GO
ALTER TABLE [dbo].[WorkRequest]  WITH CHECK ADD  CONSTRAINT [fk_BuildingRequest_Client1] FOREIGN KEY([ClientId])
REFERENCES [dbo].[Client] ([Id])
GO
ALTER TABLE [dbo].[WorkRequest] CHECK CONSTRAINT [fk_BuildingRequest_Client1]
GO
ALTER TABLE [dbo].[WorkRequest]  WITH CHECK ADD  CONSTRAINT [fk_BuildingRequest_Employee1] FOREIGN KEY([EmployeeId])
REFERENCES [dbo].[Employee] ([Id])
GO
ALTER TABLE [dbo].[WorkRequest] CHECK CONSTRAINT [fk_BuildingRequest_Employee1]
GO
ALTER TABLE [dbo].[WorkRequest]  WITH CHECK ADD  CONSTRAINT [fk_BuildingRequest_WorkType1] FOREIGN KEY([WorkTypeId])
REFERENCES [dbo].[WorkType] ([Id])
GO
ALTER TABLE [dbo].[WorkRequest] CHECK CONSTRAINT [fk_BuildingRequest_WorkType1]
GO
ALTER TABLE [dbo].[WorkRequest]  WITH CHECK ADD  CONSTRAINT [fk_WorkRequest_Withdrawals1] FOREIGN KEY([WithdrawalsId])
REFERENCES [dbo].[Withdrawals] ([Id])
GO
ALTER TABLE [dbo].[WorkRequest] CHECK CONSTRAINT [fk_WorkRequest_Withdrawals1]
GO
ALTER TABLE [dbo].[WorkTypeOfEmployee]  WITH CHECK ADD  CONSTRAINT [fk_Employee_has_WorkType_Employee] FOREIGN KEY([EmployeeId])
REFERENCES [dbo].[Employee] ([Id])
GO
ALTER TABLE [dbo].[WorkTypeOfEmployee] CHECK CONSTRAINT [fk_Employee_has_WorkType_Employee]
GO
ALTER TABLE [dbo].[WorkTypeOfEmployee]  WITH CHECK ADD  CONSTRAINT [fk_Employee_has_WorkType_WorkType1] FOREIGN KEY([WorkTypeId])
REFERENCES [dbo].[WorkType] ([Id])
GO
ALTER TABLE [dbo].[WorkTypeOfEmployee] CHECK CONSTRAINT [fk_Employee_has_WorkType_WorkType1]
GO
ALTER TABLE [dbo].[WorkTypeOfProfession]  WITH CHECK ADD  CONSTRAINT [fk_WorkType_has_Profession_Profession1] FOREIGN KEY([ProfessionId])
REFERENCES [dbo].[Profession] ([Id])
GO
ALTER TABLE [dbo].[WorkTypeOfProfession] CHECK CONSTRAINT [fk_WorkType_has_Profession_Profession1]
GO
ALTER TABLE [dbo].[WorkTypeOfProfession]  WITH CHECK ADD  CONSTRAINT [fk_WorkType_has_Profession_WorkType1] FOREIGN KEY([WorkTypeId])
REFERENCES [dbo].[WorkType] ([Id])
GO
ALTER TABLE [dbo].[WorkTypeOfProfession] CHECK CONSTRAINT [fk_WorkType_has_Profession_WorkType1]
GO
USE [master]
GO
ALTER DATABASE [WorksTokV2] SET  READ_WRITE 
GO
