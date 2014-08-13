<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="HomeBonBaiNoiBat.ascx.cs" Inherits="XPC.Web.GUI.HomeBonBaiNoiBat" %>
<div id="flash">
                    <div id="bigPic">
                        <asp:Repeater runat="server" ID="rptBigPic">
                            <ItemTemplate>
                                 <div class="pic">
                                <a href="<%#Eval("URL") %>">
                                    <img src="<%#Eval("OriginImage") %>">
                                </a>
                                <div class="tieude-bar">
                                    <h1><a href="<%#Eval("URL") %>" title="Xe hơi-bồn tắm"><%#Eval("News_Title") %></a>
                                    </h1>
                                    <p><%#Eval("News_Initcontent") %></p>
                                    <a class="link" href="<%#Eval("URL") %>">
                                        <img src="/images/next_ico.png" alt=""></a>
                                </div>
                            </div>
                            </ItemTemplate>
                        </asp:Repeater>
                    </div>
                    <div id="scroll">
                        <ul id="thumbs">
                            <asp:Repeater runat="server" ID="rptThumbs">
                                <ItemTemplate>
                                    <li rel="<%#Convert.ToInt32(Eval("ItemIndex"))+1 %>">
                                        <a href="<%#Eval("URL") %>" title="<%#HttpUtility.HtmlEncode(Eval("News_Title")) %>">
                                            <%#Eval("Image") %>
                                            <h5><%#Eval("News_Title") %></h5>
                                        </a>
                                    </li>
                                </ItemTemplate>
                            </asp:Repeater>
                        </ul>
                    </div>
                </div>