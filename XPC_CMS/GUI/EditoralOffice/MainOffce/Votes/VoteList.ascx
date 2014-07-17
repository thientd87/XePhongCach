<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="VoteList.ascx.cs" Inherits="DFISYS.GUI.EditoralOffice.MainOffce.Votes.VoteList" %>

<table width="100%">
    <tr>
        <td class="Edit_Head_Cell">
            Quản lý bình chọn</td>
    </tr>    
</table>
<asp:UpdatePanel ID="panel" runat="server">
<ContentTemplate>
<table cellpadding="0" cellspacing="0" border="0" width="100%">
    <tr>
        <td>
            <table cellpadding="0" cellspacing="5" width="100%">
                <tr>
                    <td colspan="2">
                        <asp:GridView Width="100%" ID="grdVote" runat="server" HeaderStyle-CssClass="grdHeader" RowStyle-CssClass="grdItem"
                                AlternatingRowStyle-CssClass="grdAlterItem" AutoGenerateColumns="False" AllowPaging="True" DataSourceID="objVoteSource" PageSize="12" OnRowCommand="grdVote_RowCommand"> 
                            <Columns>
                                <asp:TemplateField>
                                    <HeaderTemplate>
                                        <input type="checkbox" id="chkAll" onclick="CheckAll();"/>
                                    </HeaderTemplate>
                                    <ItemTemplate>
                                        <asp:CheckBox ID="chkSelect" runat="server"/>
                                    </ItemTemplate>
                                    <HeaderStyle Width="2%" />
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Chủ đề vote">
                                        <ItemTemplate>
                                            <asp:Literal ID="ltrVoteTitle" runat="server" Text='<%# DataBinder.Eval(Container.DataItem,"Vote_Title") %>'></asp:Literal>
                                        </ItemTemplate>
                                    <HeaderStyle Width="40%" />
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Ng&#224;y bắt đầu">
                                        <ItemTemplate>
                                            <asp:Literal ID="ltrStart" runat="server" Text='<%# DataBinder.Eval(Container.DataItem,"Vote_StartDate") %>'></asp:Literal>
                                        </ItemTemplate>
                                    <ItemStyle HorizontalAlign="Center" />
                                    <HeaderStyle Width="20%" />
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Ng&#224;y kết th&#250;c">
                                        <ItemTemplate>
                                            <%# DataBinder.Eval(Container.DataItem,"Vote_EndDate") %>
                                        </ItemTemplate>
                                    <ItemStyle HorizontalAlign="Center" />
                                    <HeaderStyle Width="20%" />
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Sửa">
                                    <ItemTemplate>
                                        <center>
						                    <span onclick="EditVote(<%#Eval("Vote_Id")%>)"; style="cursor:pointer"><img id="ImgEdit"  alt="Sửa bài viết" runat="server" title="Sửa bài viết" src="~/Images/Icons/edit.gif"/></span> 
					                    </center>
					                </ItemTemplate>
                                    <HeaderStyle HorizontalAlign="Center" Width="6%" />
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="X&#243;a">
                                    <ItemTemplate>
                                        <center>
						                    <asp:ImageButton id="btnDelete" OnClientClick="return confirm('Bạn có muốn xóa bài thuộc luồng này hay không?')" runat="server" CommandName="Delete" CommandArgument='<%#DataBinder.Eval(Container.DataItem,"Vote_ID")%>' CausesValidation="False" ImageUrl="~/Images/icons/delete.gif"></asp:ImageButton>
					                    </center>
					                </ItemTemplate>
                                    <HeaderStyle HorizontalAlign="Center" Width="4%" />
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Thêm c&#226;u hỏi cho Vote">
                                    <ItemTemplate>
                                        <center>
						                    <span onclick="openpreview('/voteitem.aspx?vote=<%#Eval("Vote_Id")%>',600,300)"; style="cursor:pointer"><img id="ImgEdit11"  alt="Thêm câu hỏi cho vote" runat="server" title="Thêm câu hỏi cho vote" src="~/Images/Icons/new.gif"/></span> 
					                    </center>
					                </ItemTemplate>
                                    <HeaderStyle HorizontalAlign="Center" Width="16%" />
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="B&#224;i li&#234;n quan" Visible="False">
                                    <ItemTemplate>
                                        <center>
                                            <span onclick="openpreview('/newsthread.aspx?cpmode=publishedlist&type=vote&voteid=<%#Eval("Vote_Id")%>',800,600);" style="cursor:pointer"><img id="ImgEdit1"  alt="Chọn bài liên quan" runat="server" title="Chọn bài liên quan" src="~/Images/Icons/new.gif"/></span> 
					                    </center>
					                </ItemTemplate>
                                    <HeaderStyle HorizontalAlign="Center" Width="6%" />
                                </asp:TemplateField>
                            </Columns>
                                <RowStyle CssClass="grdItem" />
                                <HeaderStyle CssClass="grdHeader" />
                                <AlternatingRowStyle CssClass="grdAlterItem" />
                                <PagerSettings Visible="False"/>     
                        </asp:GridView>
                    </td>
                </tr>
                <tr>
                    <td valign="top" align="left" colspan="2" style="padding-top:15px">
                        <table cellpadding="0" cellspacing="0" border="0" width="100%">
                            <tr>
                                <td width="30%" class="ms-input" style="height: 36px">
                                    Xem trang&nbsp;<asp:DropDownList ID="cboPage" runat="Server" DataTextField="Text" DataValueField="Value" AutoPostBack="true" DataSourceID="objdspage" CssClass="ms-input" OnSelectedIndexChanged="cboPage_SelectedIndexChanged"></asp:DropDownList>
                                </td>
                                <td align="right" style="height: 36px" class="Menuleft_Item">
                                   <a id="a"></a><a onclick="GoselectAll();" onmouseover="this.style.cursor='hand'" onmouseout="this.style.currsor=''">Chọn tất cả</a>&nbsp;|
                                    <a onclick="GoUnselectAll();" onmouseover="this.style.cursor='hand'" onmouseout="this.style.currsor=''">Bỏ chọn</a><asp:Literal ID="Literal0" Text="&nbsp;|" runat="server"></asp:Literal>
                                      <a href="/office/voteadd.aspx"> Thêm vote</a>&nbsp;|
                                    <asp:LinkButton ID="lnkRealDel" OnClientClick="return confirm('Bạn có muốn xóa những vote đã chọn hay không?')" runat="server"  CssClass="normalLnk" OnClick="lnkRealDel_Click">Xóa vote đã chọn</asp:LinkButton>            
                                </td>
                            </tr>
                        </table>  
                    </td>
                </tr>
            </table>
        </td>
    </tr>
    <tr>
        <td style="padding-top:10px;">
            <table cellpadding="0" cellspacing="0" border="0" style="width:100%; height:80px; border:1px solid #b8c1ca; background-color:#E5E5E5; clear:both">
                <tr>
                    <td class="ms-input">
                        Tìm theo từ khóa:
                        <asp:TextBox ID="txtKeyword" runat="server" CssClass="ms-long" Width="150px"></asp:TextBox>&nbsp;
                        <asp:Button ID="btnSearch" runat="server" Text="Tìm kiếm" CssClass="ms-input"/>
                    </td>
                </tr>
            </table>    
        </td>
    </tr>    
</table>
</ContentTemplate>
</asp:UpdatePanel>
<asp:ObjectDataSource ID="objdspage" runat="server" SelectMethod="getPage" TypeName="ThreadManagement.BO.ThreadHelper" OldValuesParameterFormatString="original_{0}">
    <SelectParameters>
        <asp:ControlParameter DefaultValue="0" ControlID="grdVote" Name="numPage" PropertyName="PageCount" Type="Int32" />
    </SelectParameters>
</asp:ObjectDataSource>
<asp:ObjectDataSource ID="objVoteSource" runat="server" SelectMethod="GetVoteList" DeleteMethod="DelVote" SelectCountMethod="GetVoteRowsCount" TypeName="DFISYS.BO.Editoral.Vote.VoteHelper" EnablePaging="true" MaximumRowsParameterName="PageSize" StartRowIndexParameterName="StartRow">
    <SelectParameters>
         <asp:Parameter Name="strWhere" DefaultValue="" Type ="string" />
    </SelectParameters>
    <DeleteParameters>
        <asp:Parameter Name="_selected_id" Type="string" DefaultValue=""/>
    </DeleteParameters>
</asp:ObjectDataSource>


<script language="javascript">
    function EditVote(Vote_Id)
    {
        window.location.href = "/office/voteadd/"+Vote_Id+".aspx";
    }
    function AddVote()
    {
        window.location.href = "/office/voteadd.aspx";
    }
</script>