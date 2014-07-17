<%@ Control Language="C#" AutoEventWireup="true" Codebehind="VoteEdit.ascx.cs" Inherits="DFISYS.GUI.EditoralOffice.MainOffce.Votes.VoteEdit" %>

<script src="/scripts/popcalendar.js" type="text/javascript" language="javascript"></script>

<table width="100%">
    <tr>
        <td class="Edit_Head_Cell">Quản lý bình chọn</td>
    </tr>    
</table>

<table cellpadding="0" cellspacing="5" border="0" width="100%">
    <tr>
        <td width="10%" class="ms-input">
            Câu bình chọn
        </td>
        <td>
            <asp:TextBox CssClass="ms-long" ID="txtVote" runat="server" Width="52%"></asp:TextBox>
            <asp:Label ID="lblMessage" runat="server" CssClass="ms-input" Font-Bold="True" ForeColor="Red"
                Text="Bạn chưa nhập câu bình chọn" Visible="False"></asp:Label></td>
    </tr>
    <tr>
        <td valign="middle" class="ms-input">
            Ngày bắt đầu
        </td>
        <td>
            <asp:TextBox CssClass="ms-long" ID="txtStartDate" runat="server" Width="100"></asp:TextBox>
            <a onclick="if(self.gfPop)gfPop.fPopCalendar(document.RenderTable.<% = ClientID %>_txtStartDate);return false;"
                href="javascript:void(0)">
                <img class="PopcalTrigger" height="21" src="/Scripts/DatePicker/datepicker.gif" width="34"
                    align="absMiddle" border="0">
            </a>
        </td>
    </tr>
    <tr>
        <td valign="middle" class="ms-input">
            Ngày kết thúc
        </td>
        <td>
            <asp:TextBox CssClass="ms-long" ID="txtEndDate" runat="server" Width="100"></asp:TextBox>
            <a onclick="if(self.gfPop)gfPop.fPopCalendar(document.RenderTable.<% = ClientID %>_txtEndDate);return false;"
                href="javascript:void(0)">
                <img class="PopcalTrigger" height="21" src="/Scripts/DatePicker/datepicker.gif" width="34"
                    align="absMiddle" border="0">
            </a>
        </td>
    </tr>
    <tr>
        <td valign="middle" class="ms-input">
            Thuộc chuyên mục
        </td>
        <td>
            <asp:DropDownList ID="cboCategory" runat="server" CssClass="ms-long">
            </asp:DropDownList>
        </td>
    </tr>
    <tr runat="server" visible="false">
        <td class="ms-input">
            Thuộc vote
        </td>
        <td>
            <asp:DropDownList CssClass="ms-long" ID="cboParent" runat="Server" DataSourceID="objParentSource"
                DataTextField="Vote_Title" DataValueField="Vote_ID">
            </asp:DropDownList>
        </td>
    </tr>
    <tr>
        <td class="ms-input">
            Ảnh đại diện
        </td>
        <td>
            <asp:TextBox CssClass="ms-long" ID="txtAvatar" runat="Server" />
            <img alt="" src="/images/icons/folder.gif" onclick="chooseFile('avatar', '<%=txtAvatar.ClientID %>')"
                style="cursor: pointer;" />
        </td>
    </tr>
    <tr>
        <td valign="top" class="ms-input">
            Lời dẫn
        </td>
        <td>
            <asp:TextBox ID="txtNote" CssClass="ms-long" runat="server" Width="75%" TextMode="multiLine"
                Height="160"></asp:TextBox>
        </td>
    </tr>
    <tr>
        <td colspan="2" class="Edit_Foot_Cell" align="center">
            <asp:Button ID="txtSave" CssClass="ms-input" runat="server" Text="Cập nhật" OnClick="txtSave_Click" />
            <input type="reset" class="ms-input" value="Nhập lại" />
            <asp:Button ID="txtCancel" CssClass="ms-input" runat="server" Text="Quay lại" OnClick="txtCancel_Click" />
        </td>
    </tr>
</table>
<iframe width="174" height="189" name="gToday:normal:agenda.js" id="gToday:normal:agenda.js"
    src="/Scripts/DatePicker/ipopeng.htm" scrolling="no" frameborder="0" style="visibility: visible;
    z-index: 999; position: absolute; top: -500px; left: -500px;"></iframe>
<asp:ObjectDataSource ID="objVoteSource" runat="server" InsertMethod="CreateVote"
    UpdateMethod="UpdateVote" TypeName="DFISYS.BO.Editoral.Vote.VoteHelper">
    <InsertParameters>
        <asp:ControlParameter ControlID="txtVote" Name="_vote" Type="String" PropertyName="Text" />
        <asp:ControlParameter ControlID="txtStartDate" Name="_start_date" Type="String" PropertyName="Text" />
        <asp:ControlParameter ControlID="txtEndDate" Name="_end_date" Type="String" PropertyName="Text" />
        <asp:ControlParameter ControlID="cboParent" Name="_parent" Type="int32" PropertyName="SelectedValue" />
        <asp:ControlParameter ControlID="txtAvatar" Name="_avatar" Type="String" PropertyName="Text" />
        <asp:ControlParameter ControlID="txtNote" Name="_note" Type="String" PropertyName="Text" />
        <asp:Parameter Name="_user" Type="String" />
        <asp:ControlParameter ControlID="cboCategory" Name="_cat_id" Type="int32" PropertyName="SelectedValue" />
    </InsertParameters>
    <UpdateParameters>
        <asp:Parameter Name="_vote_id" Type="int32" />
        <asp:ControlParameter ControlID="txtVote" Name="_vote_title" Type="String" PropertyName="Text" />
        <asp:ControlParameter ControlID="txtStartDate" Name="_vote_start" Type="String" PropertyName="Text" />
        <asp:ControlParameter ControlID="txtEndDate" Name="_vote_end" Type="String" PropertyName="Text" />
        <asp:ControlParameter ControlID="cboParent" Name="_parent" Type="int32" PropertyName="SelectedValue" />
        <asp:ControlParameter ControlID="txtAvatar" Name="_img" Type="String" PropertyName="Text" />
        <asp:ControlParameter ControlID="txtNote" Name="_note" Type="String" PropertyName="Text" />
        <asp:ControlParameter ControlID="cboCategory" Name="_cat_id" Type="int32" PropertyName="SelectedValue" />
    </UpdateParameters>
</asp:ObjectDataSource>
<asp:ObjectDataSource ID="objParentSource" runat="server" TypeName="DFISYS.BO.Editoral.Vote.VoteHelper"
    SelectMethod="getVoteParent">
    <SelectParameters>
        <asp:QueryStringParameter Name="Vote_ID" QueryStringField="NewsRef" Type="String" />
    </SelectParameters>
</asp:ObjectDataSource>
<script language="javascript" type="text/javascript">
function chooseFile(type, txtID)
{
	txtID = document.getElementById(txtID).value;
	openpreview('/GUI/EditoralOffice/MainOffce/FileManager/default.aspx?function=' + type + '_loadValue&mode=single&share=share&i=' + encodeURIComponent(txtID), 900, 700);
}
function avatar_loadValue(arrImage)
{
	if (arrImage.length > 0)
	{
		arrImage[0] = arrImage[0].substr(arrImage[0].indexOf('Images/Uploaded/'));
		document.getElementById('<% =txtAvatar.ClientID %>').value = arrImage[0];
	}
}
window.onload = function()
{
    var txtVote = document.getElementById("<% = txtVote.ClientID %>");
    if (txtVote) {txtVote.focus(); txtVote.select();}
}
</script>
