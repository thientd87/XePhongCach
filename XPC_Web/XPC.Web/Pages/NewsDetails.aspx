<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="NewsDetails.aspx.cs" Inherits="XPC.Web.Pages.NewsDetails" %>
<%@ Import Namespace="BO" %>
<%@ Register Src="~/GUI/HomeAnhDep.ascx" TagPrefix="uc1" TagName="HomeAnhDep" %>
<%@ Register Src="~/GUI/ListTinDocNhieu.ascx" TagPrefix="uc1" TagName="ListTinDocNhieu" %>
<%@ Register Src="~/GUI/Adv.ascx" TagPrefix="uc1" TagName="Adv" %>



<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
        <div class="container">
            <div class="colLeft">
                <div id="detail" class="category">
                    <div id="news-top" class="news-block">                    
                        <div class="title">
                            <h2><asp:Literal runat="server" ID="ltrTitle"></asp:Literal></h2>                    
                            <p class="datetime"><asp:Literal runat="server" ID="ltrPublishDate"></asp:Literal></p>
                            <div class="fb-like fb_iframe_widget" data-href="<%=Request.Url%>" data-layout="button" data-action="like" data-show-faces="true" data-share="true" fb-xfbml-state="rendered" fb-iframe-plugin-query="action=like&amp;app_id=&amp;href=<%=Request.Url.DnsSafeHost + Request.RawUrl %>&amp;layout=button&amp;locale=en_US&amp;sdk=joey&amp;share=true&amp;show_faces=true">
                                <span style="vertical-align: bottom; width: 96px; height: 20px;"><iframe name="f282a499b4" width="1000px" height="1000px" frameborder="0" allowtransparency="true" scrolling="no" title="fb:like Facebook Social Plugin" src="./Xe và phong cách - Gía mềm cho mẫu Bajaj Discover 150_files/like.htm" style="border: none; visibility: visible; width: 96px; height: 20px;" class=""></iframe></span>
                            </div>
                            <p></p>
                        </div>
                        <div class="content">
                            <span style="font-size:12px"><strong>[xevaphongcach.net]&nbsp;<asp:Literal runat="server" ID="ltrSapo"></asp:Literal></strong></span><br/>
                            <br/>
                            <asp:Literal runat="server" ID="ltrContent"></asp:Literal>    
                        </div>

                        <div class="micropost">
                             <fb:comments href="<% = Request.Url.DnsSafeHost+ Request.RawUrl%>" num_posts="100" width="500" ></fb:comments>
                        </div>
        
                        

                        <fieldset>
                            <legend>Các tin đã đăng</legend>
                            <ul>
                                <asp:Repeater runat="server" ID="rptTinKhac">
                                    <ItemTemplate>
                                         <li><a href="<%#Eval("URL") %>"><%#Eval("News_Title") %></a> <span class="time"><%#Eval("PublishDate") %></span></li>
                                    </ItemTemplate>
                                </asp:Repeater>
                                            
                                
                            </ul>
                        </fieldset>                    
                    </div>
                </div>
            </div>
            <div class="colRight">
                <uc1:Adv runat="server" id="Adv" AdvID="13" ClassName="banner8"  />
                <uc1:HomeAnhDep runat="server" ID="HomeAnhDep" />
                <uc1:ListTinDocNhieu runat="server" id="ListTinDocNhieu" />
            </div>
        </div>
</asp:Content>
