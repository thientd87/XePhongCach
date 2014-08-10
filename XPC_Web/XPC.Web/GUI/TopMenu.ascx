<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="TopMenu.ascx.cs" Inherits="XPC.Web.GUI.TopMenu" %>
 <!--start of #header-->
            <div class="header">
                <a href="/" class="logo">Xe và phong cách</a>
                <a href="#" style="display: block; float: right;">
                    <img src="/images/banner_1.png"></a>
            </div>
            <!--end of #header-->
            <!--start of #top-menu-->
            <div class="menu top-menu">
                <ul>
                    <li class="active">
                        <a href="/">Trang chủ</a></li>
                     <asp:Repeater runat="server" ID="rptNewsCat">
                        <ItemTemplate>
                             <li>
                                <a href="<%#Eval("Cat_URL") %>"><%#Eval("Cat_Name") %></a>
                            </li>
                        </ItemTemplate>
                    </asp:Repeater>
                    <li><a href="http://xevaphongcach.net/#">Liên hệ</a></li>
                </ul>
            </div>
            <!--end of #top-menu-->
            <!--start of #clock-searchbox-->
            <div class="clock-socialbutton-searchbox container">
                <div class="clock">
                    Thứ 2, 5/5/2014 | 21:31 
                </div>
                <div class="search-box">
                    <input type="text" id="txtSearch" class="txtSearch" />
                    <input type="button" id="btnSearch" class="btnSearch" />
                </div>
                <a href="#btnRSS">
                    <div class="btnRSS"></div>
                </a>
                <a href="#btnFB">
                    <div class="btnFB"></div>
                </a>
            </div>
            <!--end of #clock-searchbox-->

            <!--end of #top-menu-->