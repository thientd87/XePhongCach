<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Album.aspx.cs" Inherits="XPC.Web.Pages.Album" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container">
        <div id="ds-album" class="list-anh" style="margin-top: 20px;float: left;">
            <asp:Repeater runat="server" ID="rptAlbums">
                <ItemTemplate>
                    <%#Eval("Image") %>
                </ItemTemplate>
            </asp:Repeater>
     
        </div>
             <div class="clearfix"></div>
    </div>
</asp:Content>
