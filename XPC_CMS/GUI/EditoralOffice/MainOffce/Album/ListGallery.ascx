<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="ListGallery.ascx.cs"
    Inherits="DFISYS.GUI.EditoralOffice.MainOffce.Tool.ListGallery" %>
<asp:HiddenField ID="hdArgs" runat="server" />
<asp:HiddenField ID="hdNewsID" runat="server" />
<style>
    .commentUser
    {
        font-size: 12px;
        color: darkgrey;
    }
    .commentLabel
    {
        font-size: 11px;
        color: lightgrey;
        margin: 0 !important;
        padding: 0;
    }
</style>
<h1 style="text-align: center">
    Quản lý Gallery</h1>
<table id="tblSearch" runat="server" cellpadding="5" cellspacing="5" style="width: 100%;">
    <tr>
        <td style="vertical-align: middle;">
            <table cellpadding="5" cellspacing="5">
                <tr>
                    <td width="120" style="vertical-align: middle; padding: 10px 0">
                        Từ khóa
                    </td>
                    <td style="vertical-align: middle; padding: 10px 0">
                        <asp:TextBox AutoCompleteType="None" ID="txtKeyword" Width="350" runat="server"></asp:TextBox>
                        <asp:Button ID="btnSearch" CssClass="btnUpdate" OnClientClick="endRequest = 'window.scrollTo(0,0)'"
                            runat="server" Text="Tìm kiếm" OnClick="btnSearch_Click" />
                    </td>
                </tr>
            </table>
        </td>
        <td>
            <br />
        </td>
    </tr>
</table>
<div style="float: left; width: 100%;">
    <asp:UpdatePanel ID="panel" UpdateMode="conditional" runat="server">
        <ContentTemplate>
            <div style="margin-top: 10px; margin-bottom: 10px;">
                <a class="btnUpdate"  href="/office/addgallery.aspx">Thêm
                    mới</a></div>
            <asp:GridView Width="100%" ID="grdListSupport" runat="server" CssClass="gtable sortable"
                EmptyDataText="<span style='color:Red'><b>Không có bài !</b></span>" AutoGenerateColumns="False"
                AllowPaging="false" 
                >
                <Columns>
                    <asp:TemplateField HeaderText="Tên Gallery">
                        <ItemTemplate>
                            <div id="name_<%#Eval("Name")%>">
                                <a href="/office/addgallery.aspx?id=<%#Eval("Id")%>"><%#Eval("Name")%></a></div>
                        </ItemTemplate>
                        <ItemStyle CssClass="vertical-align-top tieudelist" VerticalAlign="Top"></ItemStyle>
                    </asp:TemplateField>

                </Columns>
            </asp:GridView>
            <div style="margin-top: 10px; margin-bottom: 10px;">
                <a class="btnUpdate"  href="/office/addgallery.aspx" target="_top">Thêm
                    mới</a></div>
        </ContentTemplate>
        <Triggers>
            <asp:AsyncPostBackTrigger ControlID="btnSearch" EventName="Click" />
        </Triggers>
    </asp:UpdatePanel>
</div>
<script type="text/javascript" src="/scripts/calendar.js"></script>
<script language="JavaScript" type="text/javascript" src="/scripts/newslist2.js"></script>
<script language="javascript" type="text/javascript">
    function GetControlByName(id) {
        return document.getElementById("<% = ClientID %>_" + id);
    }
</script>
<script type="text/javascript">
    $(document).ready(function ($) {
        $('a[rel*=colorbox]').facebox({ width: 900, height: 500 });
    });

    var prm = Sys.WebForms.PageRequestManager.getInstance();
    prm.add_endRequest(EndRequest);
    function EndRequest(sender, args) {
        $('#bgFilter').hide();
        $('#imgloading').hide();
        $('a[rel*=colorbox]').facebox({ width: 900, height: 500 });
        $('*[rel*=editbox]').facebox({ iframe: true, width: 900, height: 500 });
    }

    function Delete(id) {
        if (!confirm('Bạn có muốn xóa ?')) return;

        $.post("/Ajax/Tool/EditSupportOnline.aspx?action=delete&Id=" + id, {}, function (data) {
            $.facebox.close();
            $("#name_" + id).parent().parent().remove();
        });
    }

    function Save(id, status) {
        if ($("#txtName").val() == "") {
            alert("Chưa nhập Nội dung");
            $("#txtName").focus();
            return false;
        }

        if ($("#txtURL").val() == "") {
            alert("Chưa nhập Email");
            $("#txtURL").focus();
            return false;
        }
        $.post("/Ajax/Tool/EditSupportOnline.aspx?post=true&status=" + status + "&Id=" + id, $('#saveWeblink *').serialize(), function (data) {
            $("#name_" + id).html($("#txtName").val().replace(/\n/gim, '</br>'));
            $("#yahoo_" + id).html($("#txtYahoo").val());
            $("#skype_" + id).html($("#txtSkype").val());
            $("#mobile_" + id).html($("#txtMobile").val());
            $("#groupname_" + id).html($("#txtGroupName").val());
            $("#stt_" + id).html($("#txtSTT").val());
            
            $("#url_" + id).attr("href", $("#txtURL").val());
            $.facebox.close();
            if (status == true)
                $("#content_" + id).parent().parent().remove();
        });
        return false;
    }
     
</script>
