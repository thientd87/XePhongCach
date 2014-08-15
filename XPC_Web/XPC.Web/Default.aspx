<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="XPC.Web.Default" %>
<%@ Register Src="~/GUI/HomeTinDocNhieu.ascx" TagPrefix="uc1" TagName="TinDocNhieu" %>
<%@ Register Src="~/GUI/HomeBonBaiNoiBat.ascx" TagPrefix="uc1" TagName="HomeBonBaiNoiBat" %>
<%@ Register Src="~/GUI/HomeNoiBatHorizal.ascx" TagPrefix="uc1" TagName="HomeNoiBatHorizal" %>
<%@ Register Src="~/GUI/HomeVideo.ascx" TagPrefix="uc1" TagName="HomeVideo" %>
<%@ Register Src="~/GUI/HomeNoiBatVertical.ascx" TagPrefix="uc1" TagName="HomeNoiBatVertical" %>
<%@ Register Src="~/GUI/HomeAnhDep.ascx" TagPrefix="uc1" TagName="HomeAnhDep" %>
<%@ Register Src="~/GUI/HomeVote.ascx" TagPrefix="uc1" TagName="HomeVote" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
     <div class="top-news-cate container">
                <uc1:HomeBonBaiNoiBat runat="server" id="HomeBonBaiNoiBat" />
                <uc1:TinDocNhieu runat="server" id="TinDocNhieu" />

            </div>
            <!--end of #top-news-cate-->
            <div class="clearfix"></div>
            <uc1:HomeVideo runat="server" id="HomeVideo" CatId="117" Top="10" />
            <div class="clearfix"></div>
            <div class="container margin-top15">
                <uc1:HomeNoiBatHorizal runat="server" id="HomeNoiBatHorizal" CatId="116" Top="3" />    
                <uc1:HomeAnhDep runat="server" id="HomeAnhDep" />
            <!--end of .anhdep-->                
            </div>   
            <div class="clearfix"></div>
            <div class="container margin-top15">
                <uc1:HomeNoiBatHorizal runat="server" id="HomeNoiBatHorizal1" CatId="118" Top="3" /> 
                <uc1:HomeAnhDep runat="server" id="HomeAnhDep1" />
            </div>
            <div class="clearfix"></div>
            <div class="container margin-top15">
                <uc1:HomeNoiBatVertical runat="server" id="HomeNoiBatVertical" CatId="119"  Top="4" />
                <uc1:HomeNoiBatVertical runat="server" id="HomeNoiBatVertical1" CatId="120"  Top="4" />
                <!--end of #top-nhanvat-->        
                <uc1:HomeVote runat="server" id="HomeVote" />
            </div>
            <div class="clearfix"></div>
            <div class="container margin-top15">
                <uc1:HomeNoiBatHorizal runat="server" id="HomeNoiBatHorizal2" CatId="121" Top="3" /> 
            </div>
            <div class="clearfix"></div>
            <div class="container margin-top15">
                <uc1:HomeNoiBatHorizal runat="server" id="HomeNoiBatHorizal3" CatId="122" Top="3" /> 
            </div>
            <div class="clearfix"></div>
</asp:Content>
