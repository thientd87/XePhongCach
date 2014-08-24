<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="HomeThongTinDoanhNghiep.ascx.cs" Inherits="XPC.Web.GUI.HomeThongTinDoanhNghiep" %>
<div id="thong-tin-doanh-nghiep" class="container margin-top15">
    <h2>
        <asp:Literal runat="server" ID="ltrCatName"></asp:Literal>
       <%-- <span>
            <button id="left">&nbsp;</button>
            <button id="right">&nbsp;</button>
        </span>--%>
    </h2>
    <div class="list-doanh-nghiep">
        
            <asp:Repeater runat="server" ID="rptNewNoiBatMuc">
                <ItemTemplate>
                    <div class="doanh-nghiep">
                        <%#Eval("Image") %>
                        <div class="title">
                            <h3><a href="<%#Eval("URL") %>" title="<%#HttpUtility.HtmlEncode(Eval("News_Title")) %>">
                                    <%#Eval("News_Title") %></a></h3>
                           
                        </div>                       
                    </div>
                </ItemTemplate>
                <FooterTemplate>
                    <div class="clearfix"></div>
                </FooterTemplate>
            </asp:Repeater>
        
    </div><!--end of #list-video-->
</div><!--end of #top-video-->