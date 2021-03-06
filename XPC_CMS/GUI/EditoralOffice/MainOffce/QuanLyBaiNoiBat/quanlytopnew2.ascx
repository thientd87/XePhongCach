<%@ Control Language="C#" AutoEventWireup="true" Codebehind="quanlytopnew2.ascx.cs"
	Inherits="QuanLyBaiNoiBat.quanlytopnew2" %>
<link rel="stylesheet" type="text/css" href="/Styles/Newsedit.css" />
    <div class="container-fluid">
		<!-- BEGIN PAGE HEADER-->   
		<div class="row-fluid">
			<div class="span12">
				<h3 class="page-title">
					News Manager <small><asp:Label ID="Label1" runat="server" Text="QUẢN LÝ BÀI NỔI BẬT"></asp:Label></small>
				</h3>
			</div>
		</div>
		<!-- END PAGE HEADER-->
        <!-- BEGIN PAGE CONTENT-->
        <div class="row-fluid">
            <div class="span12">
                <table style="width: 100%" cellpadding="0" cellspacing="0">
				<tr>
					<td valign="top" id="td_bainoibattrangchu">
						<asp:GridView ID="grdTopClick" runat="server" AllowPaging="True" CssClass="gtable sortable"
							AutoGenerateColumns="False" EmptyDataText="Không có bản ghi nào"  
							PagerSettings-Mode="Numeric" DataKeyNames="News_ID" PagerStyle-HorizontalAlign="Center" PageSize="50" 
							RowStyle-CssClass="grdItem" Width="100%" OnPageIndexChanging="grdTopClick_PageIndexChanging" OnRowDataBound="grdTopClick_RowDataBound">
							<PagerSettings Mode="NumericFirstLast" />
							<Columns>
								<asp:TemplateField HeaderText="B&#224;i viết">
									<HeaderStyle Width="60%" />
									<ItemTemplate>
										<a style="font-weight: bold; font-size: 14px; color: #606060; text-decoration: underline;" href="/office/add,publishedlist/<%#Eval("News_Id")%>.aspx">
											<%#HttpUtility.HtmlEncode(Convert.ToString(Eval("News_Title")))%>
										</a>
										<p style="color: #606060; font-family: Verdana; font-size: 11px;">
											<asp:Literal ID="ltrInfo" runat="server"></asp:Literal>
											, <b>
												<%# (int)Eval("WordCount") == 0 ? "0" : ((int)Eval("WordCount")).ToString("#,###")%>
											</b>từ</em>
										</p>
									</ItemTemplate>
								</asp:TemplateField>
								
								<asp:TemplateField HeaderText="Ng&#224;y">
									<ItemStyle HorizontalAlign="Center" CssClass="vertical-align"  />
									<HeaderStyle Width="15%" />
									<ItemTemplate>
                                        <%#Eval("News_PublishDate", "{0:dd/MM/yyyy hh:mm:ss}")%>
									</ItemTemplate>
								</asp:TemplateField>
                                <asp:TemplateField HeaderText="Lượt xem">
									<ItemStyle HorizontalAlign="Center" />
									<HeaderStyle Width="8%" />
									<ItemTemplate>
                                        <%#Eval("ViewCount")%>
									</ItemTemplate>
								</asp:TemplateField>
								<asp:TemplateField HeaderText="Chọn nổi bật">
									<ItemStyle  CssClass="vertical-align"  HorizontalAlign="Center" />
									<HeaderStyle Width="10%" />
									<ItemTemplate>
										<asp:CheckBox ID="chk" Checked='<%# Eval("ThuTu") != DBNull.Value %>' runat="server" />
									</ItemTemplate>
								</asp:TemplateField>
								<asp:TemplateField HeaderText="Số thứ tự">
									<ItemStyle HorizontalAlign="Center" CssClass="vertical-align"  />
									<HeaderStyle Width="10%" />
									<ItemTemplate>
										<asp:TextBox ID="txtThuTu" Width="20" runat="server"></asp:TextBox>
									</ItemTemplate>
								</asp:TemplateField>
							</Columns>
							<RowStyle CssClass="grdItem" />
							<PagerStyle HorizontalAlign="Center" />
							<HeaderStyle CssClass="grdHeader" />
							<AlternatingRowStyle CssClass="grdAlterItem" />
						</asp:GridView>
					</td>
				</tr>
				<tr>
					<td style="padding-top: 5px">
						<asp:Button ID="btnUpdate" CssClass="btnUpdate" OnClientClick="return SoBaiNoiBatTrangChu_validate()"
							runat="server" Text="Cập nhật" OnClick="btnUpdate_Click" /> <asp:Label runat="server" ForeColor="red" ID="lblMessage"></asp:Label>
					</td>
				</tr>
			</table>
            </div>
        </div>
    </div>

<script type="text/javascript">
var SoBaiNoiBatTrangChu = <%= ConfigurationManager.AppSettings["SoBaiNoiBatTrangChu"] %>;



function SoBaiNoiBatTrangChu_validate()
{
	var chk, chks = document.getElementById('td_bainoibattrangchu').getElementsByTagName('input');
	var sobaichon = 0;
	for (var i=0; i<chks.length; i++)
	{
		chk = chks[i];
		if (chk.type == 'checkbox' && chk.checked)
		{
			sobaichon++;
  
		}
	}
 
	return true;
}

</script>

