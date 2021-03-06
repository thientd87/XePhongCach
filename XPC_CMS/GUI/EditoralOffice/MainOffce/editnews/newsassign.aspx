<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="newsassign.aspx.cs" Inherits="DFISYS.GUI.EditoralOffice.MainOffce.editnews.newsassign" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>Danh sách tin</title>
    <script language="javascript" src="/scripts/common.js"></script>
    <script type="text/javascript">        var oc = []; var btnSearch = '<%=btnSearch.ClientID %>';</script>
    <link href="/Styles/theme/style.css" rel="stylesheet" type="text/css" />
</head>
<body>
    <form id="form1" runat="server">
    <section id="main" class="grid_9 push_3" style="width: 96%; margin: 5px">
			<article style="padding: 10px 20px">
    <table cellpadding="0" cellspacing="0" border="0" width="100%">
    <tr><td><h1 style="text-align: center">Chọn tin liên quan</h1></td></tr>
    <tr>
            <td style="padding: 5px 0;">
                <table cellpadding="0"  class="gtable sortable"  cellspacing="0" border="0" style="width: 100%;">
                    <tr>
                        <td class="ms-input" style="width: 100px">
                            Tiêu đề bài viết:
                        </td>
                        <td class="ms-input">
                            <asp:TextBox ID="txtKeyword" runat="server" CssClass="big"></asp:TextBox>&nbsp;
                            <asp:Button ID="btnSearch" runat="server"
                                Text="Tìm kiếm" OnClick="btnSearch_Click" CssClass="btnUpdate" />
                        </td>
                    </tr>                     
                    <tr>
                        <td class="ms-input" style="width: 100px">
                            Chuyên mục
                        </td>
                        <td>
                            <asp:DropDownList ID="cboCategory" AutoPostBack="true" runat="server" 
                                onselectedindexchanged="cboCategory_SelectedIndexChanged">
                            </asp:DropDownList>
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
        <tr>
            <td>
                <table cellpadding="0" cellspacing="5" width="100%">
                    <tr>
                        <td colspan="2" valign="top">
                            <div>
                                <asp:GridView Width="100%" ID="grdListNews" BorderWidth="1px" BorderColor="#DFDFDF"
                                    runat="server" CssClass="gtable sortable" 
                                    AutoGenerateColumns="false" AllowPaging="true" DataSourceID="objListNewsSource"
                                    PageSize="40"  >
                                    <Columns>
                                        <asp:TemplateField>
                                            <HeaderTemplate>
                                                <input type="checkbox" style="vertical-align:middle" id="chkAll" onclick="tonggle('<%=grdListNews.ClientID %>', this.checked, 'chkSelect')" />
                                            </HeaderTemplate>
                                            <ItemTemplate>
                                                <input type="checkbox" style="vertical-align:middle" onclick="setClassTr(this, this.checked)" name="chkSelect"
                                                    id="chkSelect<%#DataBinder.Eval(Container.DataItem,"News_ID")%>" value="<%#DataBinder.Eval(Container.DataItem,"News_ID")%>" />
                                            </ItemTemplate>
                                            <HeaderStyle Width="22px" />
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Tiêu đề bài viết">
                                            <ItemTemplate>
                                                <%#Eval("News_Title")%>
                                                <input type="hidden" name="hidNewsTitle<%#DataBinder.Eval(Container.DataItem,"News_ID")%>"
                                                    value="<%# HttpUtility.HtmlEncode(DataBinder.Eval(Container.DataItem,"News_Title").ToString())%>" id="hidTitle<%#DataBinder.Eval(Container.DataItem,"News_ID")%>" />
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Người đưa" ItemStyle-Width="100px">
                                            <ItemTemplate>
                                                <%# Eval("News_Approver")%>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Ngày đưa" ItemStyle-Width="120px">
                                            <ItemTemplate>
                                                <%# ((DateTime) Eval("ModifiedDate")).ToString("dd/MM/yyyy hh:mm")%>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                         
                                        <asp:TemplateField ItemStyle-Width="0">
                                            <ItemTemplate>
                                                <center>
                                                    <input type="hidden" id="hdVal" value='<%#DataBinder.Eval(Container.DataItem,"News_ID")%>' runat="server" />
                                                </center>
                                            </ItemTemplate>
                                            <HeaderStyle Width="0px" />
                                        </asp:TemplateField>
                                    </Columns>
                                    <RowStyle CssClass="grdItem" />
                                    <HeaderStyle CssClass="grdHeader" />
                                    <AlternatingRowStyle CssClass="grdAlterItem" />
                                    <PagerSettings Visible="false" />
                                </asp:GridView>
                            </div>
                        </td>
                    </tr>
                    
                </table>
            </td>
        </tr>
        
    </table>
   
    <br/>
    <asp:ObjectDataSource ID="objListNewsSource" runat="server" SelectMethod="GetNewslist"
        SelectCountMethod="GetRowsCount" TypeName="DFISYS.BO.Editoral.Newslist.NewslistHelper"
        EnablePaging="true" MaximumRowsParameterName="PageSize" StartRowIndexParameterName="StartRow">
        <SelectParameters>
            <asp:Parameter Name="strWhere" DefaultValue="" Type="string" />
            <asp:Parameter Name="isFistPage" DefaultValue="false" Type="Boolean" />
        </SelectParameters>
    </asp:ObjectDataSource>
 </article>
 </section>
    <div style="position: fixed; bottom: 0; left: 0; width: 100%; background-color: #EFEFEF;">
        <table cellpadding="5" cellspacing="5" border="0" width="95%" style="margin: 5px 10px;">
            <tr>
                <td width="40%" class="ms-input">
                    Xem trang&nbsp;<asp:DropDownList ID="cboPage" ClientIDMode="Static" runat="Server"
                        DataSourceID="objdspage" DataTextField="Text" DataValueField="Value" AutoPostBack="true"
                        OnSelectedIndexChanged="cboPage_SelectedIndexChanged" CssClass="ms-input">
                    </asp:DropDownList>
                    <input type="button" onclick="nextPage()" class="btnUpdate" value="Next" />
                    <asp:ObjectDataSource ID="objdspage" runat="server" SelectMethod="getPage" UpdateMethod="getPage"
                        TypeName="DFISYS.BO.Editoral.Newslist.NewslistHelper" OldValuesParameterFormatString="original_{0}">
                        <SelectParameters>
                            <asp:ControlParameter DefaultValue="0" ControlID="grdListNews" Name="numPage" PropertyName="PageCount"
                                Type="Int32" />
                        </SelectParameters>
                    </asp:ObjectDataSource>
                </td>
                <td align="right" style="height: 19px" class="Menuleft_Item">
                    <a onclick="news_bindvalue(); return false;" href="#a" class="btnUpdate">Thêm vào tin
                        liên quan</a>
                </td>
            </tr>
        </table>
    </div>
        <script type="text/javascript">
        var finished = false;
        function news_bindvalue()
        {
	        finished = true;
	        bind();
	        close();
        }
        function bind()
        {
	        var grdListNews = document.getElementById('<%=grdListNews.ClientID %>');
	        var trs = grdListNews.getElementsByTagName('tr');
	        var i, count = trs.length;
	        var chk, hdd;
	        var arr = new Array();
	        for (i=1; i<count; i++)
	        {
		        chk = trs[i].getElementsByTagName('input')[0];
		        if (chk.checked)
			        arr.push(new Array(chk.value, trs[i].getElementsByTagName('input')[1].value));
	        }		
	        opener.<%=Request.QueryString["function"] %>(arr);
        }
         function nextPage() {
             var cboPage = document.getElementById("cboPage").selectedIndex;
             document.getElementById("cboPage").selectedIndex = cboPage + 1;
             setTimeout('__doPostBack(\'cboPage\',\'\')', 0);
         }
    </script>
    </form>
</body>
</html>
