<%@ Page Language="C#" AutoEventWireup="true" Codebehind="SetupLayout.aspx.cs" Inherits="Portal.GUI.Administrator.CategoryManager.SetupLayout" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
	<title>ijCMS - Layout setting</title>
	<link rel="stylesheet" type="text/css" href="StyleSheet.css" />

	<script type="text/javascript" src="library.js"></script>

	<script type="text/javascript" src="yahoo.js"></script>

	<script type="text/javascript" src="ajax.js"></script>

	<script type="text/javascript" src="gui.js"></script>

	<script type="text/javascript" src="dragdrop.js"></script>

</head>
<body>
	<form id="form1" runat="server">
		<asp:ScriptManager ID="ScriptManager1" EnablePageMethods="true" EnablePartialRendering="true"
			runat="server">
		</asp:ScriptManager>
		<div style="background-color: #FFF7E5;">
			<div style="float: left;">
				<img src="/images/ijCms.jpg" alt="ijCMS" />
				<br style="clear: both;" />
			</div>
			<asp:LinkButton CssClass="signmeout" ID="btnSignmeout" runat="server" OnClick="btnSignmeout_Click">Sign me out</asp:LinkButton>
			<br style="clear: both;" />
		</div>
		<br style="clear: both;" />
		<div class="headerControl">
			<center>
				<table class="headerControl">
					<tr>
						<%--<td align="right">
							Tab</td>
						<td align="left">
							<asp:DropDownList AutoPostBack="true" OnSelectedIndexChanged="cboTabs_SelectedIndexChanged"
								ID="cboTabs" runat="server">
							</asp:DropDownList>
						</td>--%>
						<td align="center">
							<a href="#" style="margin-left: 15px;" class="addAction" onclick="addTable(); return false;">
								Table</a>
						</td>
						<td>
							<asp:DropDownList AutoPostBack="true" OnSelectedIndexChanged="cboModuleFolder_SelectedIndexChanged"
								ID="cboModuleFolder" runat="server">
							</asp:DropDownList>
						</td>
						<td>
							<asp:UpdatePanel ID="UpdatePanel1" UpdateMode="Conditional" runat="server">
								<ContentTemplate>
									<asp:DropDownList ID="DropDownList2" runat="server">
									</asp:DropDownList></ContentTemplate>
								<Triggers>
									<asp:AsyncPostBackTrigger ControlID="cboModuleFolder" EventName="SelectedIndexChanged" />
								</Triggers>
							</asp:UpdatePanel>
						</td>
						<td>
							<a href="#" class="addAction" onclick="addModule(); return false;">Module</a></td>
						<td>
							<asp:LinkButton ID="LinkButton1" CssClass="actionSave" OnClientClick="document.getElementById('HiddenField1').value = document.getElementById('workarea').innerHTML"
								runat="server" OnClick="btnSaveLayout_Click">Save layout</asp:LinkButton>
							<asp:HiddenField EnableViewState="false" ID="HiddenField1" runat="server" />
						</td>
						<td>
							<a href="/office/channelmanager.aspx">Quay trở lại</a></td>
					</tr>
				</table>
			</center>
		</div>
		<div id="workarea" runat="server" enableviewstate="true">
		</div>
		<div id="bgoverlay">
		</div>
		<div id="overlay">
			<table style="background-color: #d0d0d0; border: solid 1px #303030; width: 100%;">
				<tr align="left" valign="top">
					<td style="height: 15px">
						Tham chieu
					</td>
					<td style="height: 15px">
						<span id="columnRef"></span>
					</td>
				</tr>
				<tr align="left" valign="top">
					<td>
						Tên cột
					</td>
					<td>
						<input id="txtColumnName" onkeypress="return doClick('Button1', event);" type="text" />
					</td>
				</tr>
				<tr align="left" valign="top">
					<td>
						Cho phép kéo thả
					</td>
					<td>
						<input id="chkIsDragable" name="chkIsDragable" type="checkbox" />
						<label for="chkIsDragable">
							cho phép</label>
					</td>
				</tr>
				<tr align="left" valign="top">
					<td>
						Độ rộng
					</td>
					<td>
						<input id="txtWidth" onkeypress="return doClick('Button1', event);" type="text" />
					</td>
				</tr>
				<tr align="left" valign="top">
					<td>
						Style
					</td>
					<td>
						<input id="txtStyle" onkeypress="return doClick('Button1', event);" type="text" />
					</td>
				</tr>
				<tr align="left" valign="top">
					<td>
					</td>
					<td>
						<input id="Button1" type="button" onclick="SaveColumn(); return false;" value="OK" />
						<input id="Button2" type="button" onclick="hideEditColumnForm(); return false;" value="Cancel" />
					</td>
				</tr>
			</table>
		</div>
		<div id="overlay_Editmodule">
			<asp:UpdatePanel ID="upEditModuleForm" UpdateMode="conditional" runat="server">
				<ContentTemplate>
					<table width="100%">
						<tr valign="top">
							<td>
								<table style="background-color: #d0d0d0; border: solid 1px #303030; width: 100%;
									height: 100%;" cellpadding="5">
									<tr align="left" valign="top">
										<td>
											Type</td>
										<td>
											<asp:Label ID="lblModuleType" runat="server" Text="Label"></asp:Label>
										</td>
									</tr>
									<tr align="left" valign="top">
										<td>
											Tên module
										</td>
										<td>
											<asp:TextBox ID="txtTitle" onkeypress="return doClick('Button3', event);" runat="server"
												Width="100%"></asp:TextBox></td>
									</tr>
									<tr align="left" valign="top">
										<td>
											Tham chiếu
										</td>
										<td>
											<asp:TextBox ID="txtReference" ReadOnly="true" runat="server" Width="100%"></asp:TextBox></td>
									</tr>
									<tr align="left" valign="top">
										<td>
											Cache
										</td>
										<td>
											<asp:TextBox ID="txtCacheTime" onkeypress="return doClick('Button3', event);" runat="server"
												Width="100%"></asp:TextBox></td>
									</tr>
									<asp:Repeater ID="rptRuntimeProperties" OnItemDataBound="rptRuntimeProperties_ItemDataBound"
										runat="server">
										<HeaderTemplate>
											<tr align="left" valign="top">
												<td class="RuntimeHeader" colspan="2">
													Các tham số khác
												</td>
											</tr>
										</HeaderTemplate>
										<ItemTemplate>
											<tr align="left" valign="top">
												<td>
													<%# Eval("Caption")%>
												</td>
												<td>
													<asp:TextBox ID="txtPropertyValue" onkeypress="return doClick('Button3', event);"
														Text='<%# Eval("Value") %>' runat="server" MaxLength="255">
													</asp:TextBox>
													<input type="hidden" id="lblPropertyName" runat="server" value='<%# Eval("Name") %>'
														name="lblPropertyName" />
													<asp:DropDownList ID="drdAvaiableValues" DataTextField="AvaiableKey" DataValueField="AvaiableValue"
														runat="server">
													</asp:DropDownList>
												</td>
											</tr>
										</ItemTemplate>
									</asp:Repeater>
									<tr align="left" valign="top">
										<td>
										</td>
										<td>
											<input id="Button3" type="button" onclick="SaveModule(); return false;" value="OK" />
											<input id="Button4" type="button" onclick="hideEditModuleForm(); return false;" value="Cancel" />
										</td>
									</tr>
								</table>
							</td>
							<td>
								<table style="background-color: white; border: solid 1px #303030; width: 100%; height: 100%;"
									cellpadding="5">
									<tr>
										<td class="tintieudiem">
											<a href="#" id="titleLinkLayout" class="title" onclick="return false;">Chứng khoán nhăm
												nhe ngưỡng 'đốt sàn'</a> <a href="#" onclick="return false;">
													<img id="imageLinkLayout" class="image" src="images/photo2.jpg" /></a>
											<br />
											Phiên giao dịch sáng nay, màu đỏ tiếp tục ngự trị trên bảng điện tử. Vn-Index đã
											không thể đi lên khi khối lượng bán vẫn áp đảo bên mua, mất tiếp 24,43 điểm so với
											hôm qua để chốt ở 496,64 điểm. Thị trường đe dọa trở lại thời kỳ cuối năm 2005 khi
											chứng khoán dưới mốc 400.
											<br style="clear: both;" />
											<p style="padding: 5px;">
												<a href="#" class="other" onclick="return false;">Vn-Index về gần mốc 500 điểm </a>
												<br />
												<a href="#" class="other" onclick="return false;">Gần 100 điểm VnIndex tiêu tan trong
													tuần</a>
												<br />
												<a href="#" class="other" onclick="return false;">Vn-Index rơi dưới ngưỡng 550 điểm</a></p>
										</td>
									</tr>
								</table>
							</td>
						</tr>
					</table>
				</ContentTemplate>
				<Triggers>
					<asp:AsyncPostBackTrigger ControlID="btnBindModuleEditForm" EventName="click" />
					<asp:AsyncPostBackTrigger ControlID="btnSaveModule" EventName="click" />
				</Triggers>
			</asp:UpdatePanel>
			<asp:Button ID="btnBindModuleEditForm" Style="display: none;" OnClick="btnBindModuleEditForm_Click"
				runat="server" Text="btnBindModuleEditForm" />
			<asp:Button ID="btnSaveModule" Style="display: none;" OnClick="btnSaveModule_Click"
				runat="server" Text="btnSaveModule" />
			<input id="pageArg" name="pageArg" type="hidden" />
		</div>

		<script type="text/javascript">
var dragcontainerIdFormat = 'DragAndDropContainer_'; // + index of container => DragAndDropContainer_0
var dragmoduleIdFormat = 'DragableModule_'; // + index of module => DragAndDropContainer_0
var defaultCookieForLayout = ''; // used when user reset layout
var numberOfColumn = 0;
var numberOfTable = 0;
var numberOfTextbox = 0;
var vitualSpaceHTML = '<li class="virtualElement"><div>Ban co the keo module chuc nang vao day</div></li>';
var workarea = document.getElementById('workarea');
var cboModuleFolder = document.getElementById('cboModuleFolder');
var overlay = document.getElementById('overlay');
var bgoverlay = document.getElementById('bgoverlay');
var pageArg = document.getElementById('pageArg');
var overlay_Editmodule = document.getElementById('overlay_Editmodule');
//
var columnRef = document.getElementById('columnRef');
var chkIsDragable = document.getElementById('chkIsDragable');
var chkEditableColumnWidth = document.getElementById('chkEditableColumnWidth');
var txtColumnName = document.getElementById('txtColumnName');
var txtWidth = document.getElementById('txtWidth');
var txtStyle = document.getElementById('txtStyle');
//
var currentColumn, currentModule; 
//
var title_unableEditColumnWidth = 'Bảng này không cho phép sửa độ rộng cột, bấm vào để thay đổi';
var title_EditableColumnWidth = 'Bảng này cho phép sửa độ rộng cột, bấm vào để thay đổi';
var title_AddColumn = 'Thêm cột vào trong bảng';
var title_AddTable = 'Thêm bảng vào trong cột';
var title_EditTableName = 'Sửa tên bảng';
var title_DeleteTable = 'Xóa bảng';
var title_MoveTableLeft = 'Chuyển bảng sang cột trái';
var title_MoveTableRight = 'Chuyển bảng sang cột phải';
var title_MoveTableUp = 'Chuyển bảng lên trên';
var title_MoveTableDown = 'Chuyển bảng xuống dưới';
var title_MoveColumnLeft = 'Chuyển cột sang trái';
var title_MoveColumnRight = 'Chuyển cột sang phải';
var title_EditColumn = 'Sửa thông tin cột';
var title_DeleteColumn = 'Xóa cột';
var confirm_delete = 'Thao tác này không "Undo" được, bạn có chắc chắn muốn thực hiện không?';
var alert_missTable = 'Bạn chưa tạo bảng cho giao diện\nPhải có ít nhất một bảng trước khi thêm module chức năng\nBấm vào nút "+ Table" để tạo bảng!';
var alert_missModule = 'Bạn chưa chọn module chức năng';
var mess_NewTable = 'Bảng mới';
var mess_NewColumn = 'Cột mới';

var alert_InvalidWidth = 'Chiều rộng không phải là số';
var alert_InvalidHeight = 'Chiều cao không phải là số';
var alert_InvalidCache = 'Bạn nhập thông số cho cache không đúng';
//
Event.onDOMReady(YAHOO.example.DDApp.init, YAHOO.example.DDApp, true);

</script>

	</form>
</body>
</html>
