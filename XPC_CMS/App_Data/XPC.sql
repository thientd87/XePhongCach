

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

/****** Object:  StoredProcedure [dbo].[CMS_Gallery_Delete]    Script Date: 07/22/2014 00:14:36 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[CMS_Gallery_Delete]
(
   @ID int
)
AS
SET NOCOUNT ON;
DELETE            Gallery
WHERE        ([ID] = @ID)

GO

/****** Object:  StoredProcedure [dbo].[CMS_Gallery_Insert]    Script Date: 07/22/2014 00:14:36 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[CMS_Gallery_Insert]
(
   	@Name  nvarchar(50) 
)
AS
SET NOCOUNT OFF;
INSERT INTO        Gallery
            ([Name])
VALUES        ( @Name);
SELECT [ID], [Name] FROM Gallery WHERE (ID = SCOPE_IDENTITY())

GO

/****** Object:  StoredProcedure [dbo].[CMS_Gallery_Search]    Script Date: 07/22/2014 00:14:36 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[CMS_Gallery_Search]
    @pageIndex int,
    @pageSize int,
    @keyword nvarchar(500)
AS
SET NOCOUNT ON;
BEGIN
    if (len(@keyword) = 0) 
        set @keyword = '*'
    SELECT *
    FROM 
    ( 
        SELECT [ID], [Name],ROW_NUMBER() OVER (ORDER BY [ID] DESC ) Row   
        FROM Gallery
        WHERE (@keyword = '*' or Contains(*,@keyword)) 
    )a 
    WHERE   ROW Between (@PageIndex -1)*@PageSize + 1 AND @PageSize*@PageIndex
END

GO

/****** Object:  StoredProcedure [dbo].[CMS_Gallery_SelectAllLike]    Script Date: 07/22/2014 00:14:36 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[CMS_Gallery_SelectAllLike]
     @keyword nvarchar(500)
AS
SET NOCOUNT ON;
BEGIN
    if (len(@keyword) = 0)
        set @keyword = '%%'
     SELECT        [ID], [Name]
     FROM            Gallery
     WHERE [Name] LIKE @keyword
END

GO

/****** Object:  StoredProcedure [dbo].[CMS_Gallery_SelectOne]    Script Date: 07/22/2014 00:14:36 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[CMS_Gallery_SelectOne]
(
   @ID int
)
AS
SET NOCOUNT ON;
SELECT        [ID], [Name]
FROM            Gallery
WHERE        ([ID] = @ID)

GO

/****** Object:  StoredProcedure [dbo].[CMS_Gallery_Update]    Script Date: 07/22/2014 00:14:36 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[CMS_Gallery_Update]
(
   	@Name  nvarchar(50),
	@ID  int 
)
AS
SET NOCOUNT OFF;
UPDATE        Gallery
SET         [Name]=@Name
WHERE ([ID] = @ID)

GO

/****** Object:  StoredProcedure [dbo].[CMS_MediaObject_GetAllItem_By_GalleryId]    Script Date: 07/22/2014 00:14:36 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

create Proc [dbo].[CMS_MediaObject_GetAllItem_By_GalleryId] 
@GalleryId int
as
begin
select t1.*,t2.Name from [MediaObject] t1 
inner join [Gallery] t2 on t1.[GalleryID]=t2.[ID] where t1.GalleryID=@GalleryId order by t1.Object_Type,t1.STT
end

GO

ALTER PROCEDURE [dbo].[Web_NewsPublished_GetFocus]
	@iTop int	
AS
BEGIN

	 
		SELECT Top(@iTop)	N.[News_ID],N.[Cat_ID],N.[News_SubTitle],N.[News_Title],N.[News_InitContent],N.[News_PublishDate],N.[News_image],C.[Cat_ParentID],N.Extension3,N.Extension4, N.Icon
		FROM NewsPublished AS N INNER JOIN Category AS C ON N.[Cat_ID] = C.[Cat_ID]
		WHERE	(N.[News_PublishDate] <=(SELECT GETDATE() AS [CurrentDateTime])) and News_isFocus = 1 order by 	News_PublishDate desc						
	 		


END


GO


ALTER procedure [dbo].[Web_BonBanNoiBat] 
(
	@Top int,
	@EditionType int	
)
AS
SELECT     TOP (@Top) n.News_ID, n.News_Title, n.News_PublishDate, n.News_Image, c.Cat_ID, c.Cat_ParentID,C.Channel_ID,  N.Icon,N.News_Initcontent
FROM         NewsPublished AS n INNER JOIN
                      Category AS c ON c.Cat_ID = n.Cat_ID INNER JOIN
                      BonBaiNoiBat AS b ON b.News_ID = n.News_ID INNER JOIN
                      News ON n.News_ID = News.News_ID
WHERE     (n.News_PublishDate <= GETDATE()) and c.Cat_ishidden<> 1
And c.EditionType_ID = @EditionType
ORDER BY b.ThuTu


GO


ALTER PROCEDURE [dbo].[Web_DanhSachTin] 
	@Cat_ID int,
	@pageIndex int,
	@pageSize int
AS
BEGIN
	declare @NewsNoibat bigint = 0
	create table #temp(cat_id int)
	
	Insert Into #temp Select @Cat_ID
	Insert Into #temp Select Cat_Id From category 
	Where Cat_ParentId in (select Cat_Id from category where Cat_ParentId=@Cat_ID) or Cat_ParentId=@Cat_ID
	
	create table #tmpNews(News_ID bigint)
	

	
	insert into #tmpNews SELECT News.[News_ID]
	FROM
	( 
		SELECT	N.[News_ID],ROW_NUMBER() OVER (ORDER BY N.[News_PublishDate] DESC ) Row									
		FROM NewsPublished AS N INNER JOIN Category AS C ON N.[Cat_ID] = C.[Cat_ID]
		WHERE	(N.[News_PublishDate] <=(SELECT GETDATE() AS [CurrentDateTime])) 
				and  (N.[Cat_ID] in (Select cat_id From #temp) 
				or C.[Cat_ParentID]= @Cat_ID OR (PATINDEX('%'+convert(nvarchar,@Cat_ID)+'%', N.News_OtherCat) > 0))				
			
	) News
	WHERE   ROW Between (@PageIndex -1)*@PageSize + 1 AND @PageSize*@PageIndex			



	 
		SELECT	C.Cat_Name, N.[News_ID],N.[Cat_ID],N.[News_SubTitle],N.[News_Title],N.[News_InitContent],N.[News_PublishDate],N.[News_image],N.isComment,C.[Cat_ParentID], 0 extension4, N.Icon,N.isUserRate as Updated,(select dbo.cms_f_GetAttachmentTypesByNews(N.News_ID))IconFile,N.News_Mode,N.News_Content
		FROM NewsPublished AS N INNER JOIN #tmpNews AS T ON N.News_ID = T.News_ID
		INNER JOIN Category AS C ON N.[Cat_ID] = C.[Cat_ID]
		--left join MediaObject as M on M.News_ID = N.News_ID
	


drop table #temp
drop table #tmpNews

END


GO