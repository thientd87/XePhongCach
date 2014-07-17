

/****** Object:  Table [dbo].[Vote]    Script Date: 07/17/2014 23:14:26 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[Vote](
	[Vote_ID] [int] IDENTITY(1,1) NOT FOR REPLICATION NOT NULL,
	[UserID] [nvarchar](200) NULL,
	[Vote_Title] [nvarchar](200) NOT NULL,
	[Vote_StartDate] [datetime] NULL,
	[Vote_EndDate] [datetime] NULL,
	[Vote_Parent] [int] NULL,
	[Vote_Parent_Image] [nvarchar](50) NULL,
	[Vote_InitContent] [ntext] NULL,
	[Cat_ID] [int] NOT NULL,
 CONSTRAINT [PK_Vote] PRIMARY KEY CLUSTERED 
(
	[Vote_ID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO

/****** Object:  Table [dbo].[VoteItem]    Script Date: 07/17/2014 23:14:26 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[VoteItem](
	[VoteIt_ID] [int] IDENTITY(1,1) NOT FOR REPLICATION NOT NULL,
	[VoteIt_Content] [ntext] NULL,
	[Vote_ID] [int] NULL,
	[VoteIt_Rate] [decimal](18, 0) NULL,
	[isShow] [bit] NULL,
 CONSTRAINT [PK_VoteItem] PRIMARY KEY CLUSTERED 
(
	[VoteIt_ID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO

ALTER TABLE [dbo].[Vote] ADD  CONSTRAINT [DF_Vote_Cat_ID]  DEFAULT ((0)) FOR [Cat_ID]
GO

ALTER TABLE [dbo].[VoteItem] ADD  CONSTRAINT [DF_VoteItem_isShow]  DEFAULT ((1)) FOR [isShow]
GO

USE [HoangGia_NEW]
GO

/****** Object:  StoredProcedure [dbo].[vc_Vote_SelectList]    Script Date: 07/17/2014 23:36:13 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[vc_Vote_SelectList]
	-- Add the parameters for the stored procedure here
	@sWhere nvarchar(1000),
	@iStartIndex int,
	@iPageSize int
	
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
DECLARE @sql nvarchar(4000)


SET @sql = 'SELECT * FROM ('

SET @sql = @sql + 'SELECT Vote_ID,Vote_Title,Vote_StartDate,Vote_EndDate,Vote_Parent,'
SET @sql = @sql + 'Vote_Parent_Image,Vote_InitContent, '
SET @sql = @sql + 'ROW_NUMBER() OVER (ORDER BY Vote_EndDate) Row '
SET @sql = @sql + 'FROM Vote '

if(@sWhere is not null AND @sWhere <> '')
	SET @sql = @sql + ' WHERE ' +@sWhere

SET @sql = @sql + ') Vote '
SET @sql = @sql + 'WHERE Row > ' + Convert(nvarchar,@iStartIndex)+' '
SET @sql = @sql + ' AND Row <= ' + Convert(nvarchar,(@iStartIndex + @iPageSize))

print (@sql)
exec (@sql)
END

GO

/****** Object:  StoredProcedure [dbo].[vc_Vote_SelectList_Count]    Script Date: 07/17/2014 23:36:13 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[vc_Vote_SelectList_Count]
	-- Add the parameters for the stored procedure here
	@sWhere nvarchar(1000)
	
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
DECLARE @sql nvarchar(4000)


SET @sql = 'SELECT COUNT(Vote_ID) DEM FROM VOTE '

if(@sWhere is not null AND @sWhere <> '')
	SET @sql = @sql + ' WHERE ' +@sWhere



print (@sql)
exec (@sql)
END

GO

/****** Object:  StoredProcedure [dbo].[vc_Vote_SelectList_Where]    Script Date: 07/17/2014 23:36:13 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[vc_Vote_SelectList_Where]
	-- Add the parameters for the stored procedure here
	@sWhere nvarchar(1000)
	
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
DECLARE @sql nvarchar(4000)


SET @sql = 'SELECT * FROM VOTE '

if(@sWhere is not null AND @sWhere <> '')
	SET @sql = @sql + ' WHERE ' +@sWhere

print (@sql)
exec (@sql)
END

GO

