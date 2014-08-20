<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="ListNews.aspx.cs" Inherits="XPC.Web.Pages.ListNews" %>

<%@ Register Src="~/GUI/HomeAnhDep.ascx" TagPrefix="uc1" TagName="HomeAnhDep" %>
<%@ Register Src="~/GUI/ListTinDocNhieu.ascx" TagPrefix="uc1" TagName="ListTinDocNhieu" %>


<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container">
    <div class="colLeft">
        <div id="category" class="category">
            <div id="news-top" class="news-block">
                <asp:Literal runat="server" ID="ltrBigPic"></asp:Literal>
                
                <div class="title">
                    <h2 class="bigTitle">
                        <asp:Literal runat="server" ID="ltrBigTitle"></asp:Literal>
                    </h2>                    
                    <p class="datetime">
                        <asp:Literal runat="server" ID="ltrDateTime"></asp:Literal>
                    </p>
                    <p class="sum">
                        <asp:Literal runat="server" ID="ltrBigInitContent"></asp:Literal>
                    </p>
                </div>
            </div>
            <asp:Repeater runat="server" ID="rptData">
                <ItemTemplate>
                    <div class="news-block"><!--7 bai-->
                       <%#Eval("Image") %>
                        <div class="title">
                            <h2><a href="<%#Eval("URL") %>"><%#Eval("News_Title") %></a></h2>                    
                            <p class="datetime"><%#Eval("PublishDate") %></p>
                            <p class="sum"><%#Eval("News_InitContent") %></p>
                        </div>
                    </div>
                </ItemTemplate>
            </asp:Repeater>

    <!------>
    <ul class="pagination"><li class="active"><a>1</a></li><li><a href="http://xevaphongcach.net/news/index/2/8">2</a></li><li><a href="http://xevaphongcach.net/news/index/2/16">3</a></li><li><a href="http://xevaphongcach.net/news/index/2/8">Sau</a></li><li><a href="http://xevaphongcach.net/news/index/2/616">Cuối</a></li></ul>    
</div>
    </div>
    <div class="colRight">
        <uc1:HomeAnhDep runat="server" ID="HomeAnhDep" />
        <uc1:ListTinDocNhieu runat="server" id="ListTinDocNhieu" />
    </div>
        <div class="clearfix"></div>
 </div>
</asp:Content>
