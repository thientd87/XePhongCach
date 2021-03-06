<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="Newslist2.ascx.cs" Inherits="DFISYS.GUI.EditoralOffice.MainOffce.Newslist.Newslist2" %>
<%@ Register Src="contextMenu.ascx" TagName="contextMenu" TagPrefix="uc2" %>
<asp:HiddenField ID="hdArgs" runat="server" />
<asp:HiddenField ID="hdNewsID" runat="server" />
<script type="text/javascript">
    var btnSetLoaiTin = null, hdArgs = null, grdListNewsID = null, hdNewsID = null, btnUpdateStatus = null, btnDeletePermanently = null, btnSearch = '<%=btnSearch.ClientID %>', commandName = null;
    var tr = null;
    var published = '<%=isXuatBan%>';
    hdArgs = document.getElementById('<%=hdArgs.ClientID %>');
    hdNewsID = document.getElementById('<%=hdNewsID.ClientID %>');
    function newslist_init() {
        btnSetLoaiTin = document.getElementById('<%=btnSetLoaiTin.ClientID %>');
        btnSetTieuDiem = document.getElementById('<%=btnSetTieuDiem.ClientID %>');
        btnUpdateStatus = document.getElementById('<%=btnUpdateStatus.ClientID %>');
        btnDeletePermanently = document.getElementById('<%=btnDeletePermanently.ClientID %>');
        grdListNewsID = '<%=grdListNews.ClientID %>';
        Sys.WebForms.PageRequestManager.getInstance().add_endRequest(newslist_removeActiveRow);
    }
    var oc = [];
</script>
<div class="container-fluid">
    <!-- BEGIN PAGE HEADER-->
    <div class="row-fluid">
        <div class="span12">
            <!-- BEGIN PAGE TITLE & BREADCRUMB-->
            <h3 class="page-title">
                News manager <small><asp:Literal ID="ltrLabel" runat="server"></asp:Literal></small>
            </h3>
            <!-- END PAGE TITLE & BREADCRUMB-->
        </div>
    </div>
    <!-- END PAGE HEADER-->
    <!-- BEGIN PAGE CONTENT-->
    <div class="row-fluid">
        <div class="span12">
            <div style="float: left; width: 100%;">
                <table id="tblSearch" runat="server" cellpadding="5" cellspacing="5" style="width: 100%; ">
                <tr>
                    <td style="vertical-align: middle;">
                        <table cellpadding="5" cellspacing="5">
                            <tr>
                                <td style="vertical-align: middle">
                                    Chọn chuyên mục 
                                </td>
                                <td style="vertical-align: middle">
                                    <asp:DropDownList ID="ddlChuyenmuc" runat="server" AutoPostBack="true" OnSelectedIndexChanged="ddlChuyenmuc_SelectedIndexChanged">
                                    </asp:DropDownList>
                                </td>
                            </tr>
                            <tr>
                                <td width="120" style="vertical-align: middle; padding-top: 10px">
                                    Từ khóa
                                </td>
                                <td style="vertical-align: middle; padding-top: 10px">
                                    <asp:TextBox AutoCompleteType="None" ID="txtKeyword" Width="350" runat="server"></asp:TextBox>
                                    <asp:Button ID="btnSearch" CssClass="btn green" OnClientClick="endRequest = 'window.scrollTo(0,0)'"
                                        runat="server" Text="Tìm kiếm" OnClick="btnSearch_Click" />
                                </td>
                            </tr>
                        </table>
                    </td>
                    <td>
                        <fieldset class="xemtintheongay">
                            <legend>Xem tin theo ngày</legend><span>Từ</span>
                            <asp:TextBox MaxLength="10" ID="txtFromDate" Width="75px" runat="server" CssClass="calendar" />
                            <a onclick="if(self.gfPop)gfPop.fPopCalendar(document.getElementById('<% = txtFromDate.ClientID %>'));return false;"
                                href="javascript:void(0)">
                                <img class="PopcalTrigger" height="21" src="/Scripts/DatePicker/datepicker.gif" width="34"
                                    align="absMiddle" border="0">
                            </a><span>đến</span>
                            <asp:TextBox MaxLength="10" ID="txtToDate" Width="75px" runat="server" CssClass="calendar" />
                            <a onclick="if(self.gfPop)gfPop.fPopCalendar(document.getElementById('<% = txtToDate.ClientID %>'));return false;"
                                href="javascript:void(0)">
                                <img class="PopcalTrigger" height="21" src="/Scripts/DatePicker/datepicker.gif" width="34"
                                    align="absMiddle" border="0">
                            </a>
                            
                            <asp:ImageButton ID="btnFilter" runat="server" OnClick="btnFilter_Click" OnClientClick="return Filter();"
                                Width="22px" Height="21px" ImageUrl="/images/Icons/search.gif" />
                        </fieldset>
                        <br />
                    </td>
                </tr>
            </table>
                <asp:UpdatePanel ID="panel" UpdateMode="conditional" runat="server">
                    <ContentTemplate>
                        <asp:GridView Width="100%" ID="grdListNews" runat="server" CssClass="gtable sortable"
                            EmptyDataText="<span style='color:Red'><b>Không có bài !</b></span>" AutoGenerateColumns="False"
                            AllowPaging="True" AllowSorting="true" DataSourceID="objListNewsSource" PageSize="40"
                            OnSorted="grdListNews_Sorted" OnRowDataBound="grdListNews_RowDataBound">
                            <Columns>
                                <asp:TemplateField>
                                    <HeaderTemplate>
                                        <input type="checkbox" id="chkAll" onclick="tonggle(grdListNewsID, this.checked, 'chkSelect'); " />
                                    </HeaderTemplate>
                                    <ItemTemplate>
                                        <input type="checkbox" value='<%#Eval("News_Id")%>' name="chkSelect" onclick="selectRow(this)"
                                            runat="server" id="chkSelect" />
                                    </ItemTemplate>
                                    <HeaderStyle Width="20px" CssClass="valign-middle" />
                                    <ItemStyle CssClass="valign-middle" Width="20px" />
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Image">
                                    <ItemTemplate>
                                      <img style="max-height: 80px; max-width: 80px" src="<%# Eval("News_Image") %>" />
                                    </ItemTemplate>
                                    <ItemStyle Width="80px" />
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Title" ItemStyle-CssClass="text" SortExpression="News_Title">
                                    <ItemTemplate>
                                        <div class="contexcolumn" onmouseover="this.className = 'contexcolumn_hover'; " onmouseout="this.className = 'contexcolumn'; "
                                           <%-- onclick="newslist_grid_clickitem(event, this, '<%# Eval("News_ID") %>'); return false;"--%>
                                            style="position: relative">
                                            <p style="padding-top: 0;">
                                                <a href="javascript:void(0);" onclick="editnews('<%# Eval("News_ID") %>'); return false;">
                                                    <%#HttpUtility.HtmlEncode(Convert.ToString(Eval("News_Title")))%>
                                                </a>
                                                <br />
                                                <asp:Literal ID="ltrInfo" runat="server"></asp:Literal>, <b>
                                                    <%# (int)Eval("WordCount") == 0 ? "0" : ((int)Eval("WordCount")).ToString("#,###")%>
                                                </b>từ,
                                                <br />
                                                Ngày sửa cuối:
                                                <%#Convert.ToDateTime(Eval("News_ModifiedDate").ToString()).ToString("dd/MM/yyyy HH:mm:ss")%>
                                            </p>
                                            
                                        </div>
                                    </ItemTemplate>
                                    <ItemStyle CssClass="vertical-align-top tieudelist" VerticalAlign="Top"></ItemStyle>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Category">
                                    <ItemStyle CssClass="valign-middle" />
                                    <HeaderStyle CssClass="valign-middle" Width="130" />
                                    <ItemTemplate>
                                        <%#Eval("Cat_Name") %>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="<nobr>Ngày xuất bản</nobr>" SortExpression="News_isFocus"
                                    ItemStyle-HorizontalAlign="center">
                                    <ItemTemplate>
                                         <%#Convert.ToDateTime(Eval("ModifiedDate").ToString()).ToString("dd/MM/yyyy HH:mm:ss")%>
                                    </ItemTemplate>
                                    <HeaderStyle CssClass="valign-middle" Width="120" />
                                    <ItemStyle CssClass="valign-middle"></ItemStyle>
                                </asp:TemplateField>
                                		<asp:TemplateField HeaderText="<nobr>Tin đọc nhiều</nobr>" SortExpression="News_isFocus" ItemStyle-HorizontalAlign="center">
					                        <ItemTemplate>
						                        <asp:CheckBox ID="chkIsFocus" runat="server" onclick="newslist_chkIsFocus_CheckedChanged(this);"
							                        Checked='<%# Eval("News_isFocus") %>' />
					                        </ItemTemplate>
					                        <HeaderStyle Width="60" />
				                        </asp:TemplateField>
                                <asp:TemplateField HeaderText="Loại tin" SortExpression="News_mode">
					                <ItemTemplate>
						                <asp:DropDownList ID="cboIsHot" runat="server" onchange="newslist_cboIsHot_selectedIndexChange(this)"
							                SelectedValue='<%# Eval("News_Mode").ToString() %>' CausesValidation="False">
							                <asp:ListItem Value="0" Text="Thông Thường"></asp:ListItem>
							                <asp:ListItem Value="1" Text="Nổi bật mục"></asp:ListItem>
							                <asp:ListItem Value="2" Text="Nổi bật trang chủ"></asp:ListItem>
						                </asp:DropDownList>
					                </ItemTemplate>
					                <ItemStyle Width="50px" />
				                </asp:TemplateField>
                            </Columns>
                            <PagerStyle CssClass="pagination" HorizontalAlign="left" />
                            <PagerSettings Position="TopAndBottom" Mode="NumericFirstLast" />
                            <HeaderStyle CssClass="grdHeader" />
                            <RowStyle CssClass="grdItem" />
                            <AlternatingRowStyle CssClass="grdAlterItem" />
                        </asp:GridView>
                    </ContentTemplate>
                    <Triggers>
                        <asp:AsyncPostBackTrigger ControlID="btnFilter" EventName="Click" />
                        <asp:AsyncPostBackTrigger ControlID="btnSearch" EventName="Click" />
                        <asp:AsyncPostBackTrigger ControlID="ddlChuyenmuc" EventName="SelectedIndexChanged" />
                    </Triggers>
                </asp:UpdatePanel>
            </div>
            <div style="padding: 5px 0px 10px 0px; float: left">
                <asp:LinkButton ID="LinkDelete" OnClientClick="return checkMultiAction('delete');"
                    runat="server" CssClass="btn black" OnClick="LinkDelete_Click">Xóa tin đã chọn</asp:LinkButton></div>
            <uc2:contextMenu ID="ContextMenu1" runat="server"></uc2:contextMenu>
            
            <br style="clear: both;" />
            <asp:UpdatePanel ID="upCommand" UpdateMode="conditional" runat="server">
                <Triggers>
                    <asp:AsyncPostBackTrigger ControlID="btnSetTieuDiem" EventName="Click" />
                    <asp:AsyncPostBackTrigger ControlID="btnSetLoaiTin" EventName="Click" />
                    <asp:AsyncPostBackTrigger ControlID="btnUpdateStatus" EventName="Click" />
                    <asp:AsyncPostBackTrigger ControlID="btnDeletePermanently" EventName="Click" />
                    <asp:AsyncPostBackTrigger ControlID="LinkDelete" EventName="Click" />
                </Triggers>
            </asp:UpdatePanel>
            <div id="divCommand" style="display: none;">
                <asp:Button ID="btnSetTieuDiem" runat="server" Text="btnSetTieuDiem" OnClick="btnSetTieuDiem_Click" /><asp:Button
                    ID="btnSetLoaiTin" runat="server" Text="btnSetLoaiTin" OnClick="btnSetLoaiTin_Click" />
                <asp:Button ID="btnUpdateStatus" runat="server" Text="btnUpdateStatus" OnClick="btnUpdateStatus_Click" />
                <asp:Button ID="btnDeletePermanently" runat="server" Text="btnDeletePermanently"
                    OnClick="btnDeletePermanently_Click" />
            </div>
            <asp:ObjectDataSource ID="objListNewsSource" runat="server" SelectMethod="GetNewslistOfNewsListControl"
                UpdateMethod="UpdateNewsRow" DeleteMethod="DelNews" SelectCountMethod="GetRowsCountOfNewsListControl"
                TypeName="DFISYS.BO.Editoral.Newslist.NewslistHelper" SortParameterName="SortExpression"
                EnablePaging="true" MaximumRowsParameterName="PageSize" StartRowIndexParameterName="StartRow">
                <SelectParameters>
                    <asp:Parameter Name="strWhere" DefaultValue="" Type="String" />
                    <asp:Parameter Name="News_Approver" DefaultValue="" Type="String" />
                </SelectParameters>
                <UpdateParameters>
                    <asp:Parameter Name="_news_id" Type="Int64" />
                    <asp:Parameter Name="_news_status" Type="Int16" />
                    <asp:Parameter Name="_selected_id" Type="String" DefaultValue="" />
                    <asp:Parameter Name="blnIsFocus" />
                    <asp:Parameter Name="intNewMode" />
                    <asp:Parameter Name="isUpdate" />
                </UpdateParameters>
                <DeleteParameters>
                    <asp:Parameter Name="_selected_id" Type="String" DefaultValue="" />
                </DeleteParameters>
            </asp:ObjectDataSource>
        </div>
    </div>
    <!-- END PAGE CONTENT -->
</div>
<h1 style="text-align: center">
    </h1>

<script type="text/javascript" src="/scripts/calendar.js"></script>
<script language="JavaScript" type="text/javascript" src="/scripts/newslist2.js"></script>
<script language="javascript">
    function GetControlByName(id) {
        return document.getElementById("<% = ClientID %>_" + id);
    }
    function Filter() {
        var txtFromDate = GetControlByName("txtFromDate");
        var txtToDate = GetControlByName("txtToDate");
        if (txtFromDate.value == "" || txtToDate.value == "") {
            alert("Bạn cần phải chọn cả ngày bắt đầu và ngày kết thúc!");
            return false;
        }
        return true;

    }
</script>
<script type="text/javascript">
    $(document).ready(function ($) {
        $('a[rel*=colorbox]').facebox({ width: 900, height: 500 });
    });

    var prm = Sys.WebForms.PageRequestManager.getInstance();
    prm.add_endRequest(EndRequest);
    function EndRequest(sender, args) {
        //$('#bgFilter').hide();
        //$('#imgloading').hide();
        //$('a[rel*=colorbox]').facebox({ iframe: true, width: 900, height: 500 });        
    }
    
</script>
