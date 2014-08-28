insert into NewsPublished(News_ID,Cat_ID,News_Title,News_Image,News_InitContent,News_Content,News_Status,News_PublishDate,News_Mode,News_ModifedDate,Extension4,News_isFocus)
select [id],31,title,'/Images/Uploaded/'+thumb,summary,content,3,dateadd(S, publish_date, '1970-01-01'),0,dateadd(S, update_at, '1970-01-01'),0,0 from news_videos
where category_id = 3 and [type] = 0

insert into News(News_ID,Cat_ID,News_Title,News_Image,News_InitialContent,News_Content,News_Status,News_PublishDate,News_Mode,News_ModifiedDate,Extension4,News_Author,News_Approver,News_isFocus)
select [id],31,title,'/Images/Uploaded/'+thumb,summary,content,3,dateadd(S, publish_date, '1970-01-01'),0,dateadd(S, update_at, '1970-01-01'),0,'admin','admin',0 from news_videos
where category_id = 3 and [type] = 0

insert into [Action](News_ID,Sender_ID,Comment_Title,CreateDate,ActionType,Reciver_ID)
select [id] ,'admin',N'admin xuất bản bài',dateadd(S, publish_date, '1970-01-01'),3,'admin' from news_videos
where category_id = 3 and [type] = 0

update News set News_ModifiedDate = News_PublishDate where News_ModifiedDate is null
update News set News_isFocus = 0 where News_isFocus is null
