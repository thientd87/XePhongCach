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
            <uc1:HomeVideo runat="server" id="HomeVideo" />
            <div class="clearfix"></div>
            <div class="container margin-top15">
            <uc1:HomeNoiBatHorizal runat="server" id="HomeNoiBatHorizal" CatId="31" Top="3" />    
            <uc1:HomeAnhDep runat="server" id="HomeAnhDep" />
            <!--end of .anhdep-->
                
            </div>   
            <div class="clearfix"></div>
            <div class="container margin-top15">
                <uc1:HomeNoiBatHorizal runat="server" id="HomeNoiBatHorizal1" CatId="31" Top="3" />    
                <div id="anh-dep" class="anhdep">
                    <h2>
                        <a class="tab-anh" href="http://xevaphongcach.net/slideshows" target="_blank">Ảnh đẹp</a>
                    </h2>
                    <div class="list-anh">
                
                        <a href="http://xevaphongcach.net/public/data/albums/xe-dep/xe-dep-2.jpg" target="_blank" rel="slideshow">
                                <img src="./Xe và phong cách - Trang chủ_files/xe-dep-2.jpg" width="89" height="62" alt=""></a>
                
                        <a href="http://xevaphongcach.net/public/data/albums/xe-dep/xe-dep-16.jpg" target="_blank" rel="slideshow">
                                <img src="./Xe và phong cách - Trang chủ_files/xe-dep-16.jpg" width="89" height="62" alt=""></a>
                
                        <a href="http://xevaphongcach.net/public/data/albums/xe-dep/xe-dep-20.jpg" target="_blank" rel="slideshow">
                                <img src="./Xe và phong cách - Trang chủ_files/xe-dep-20.jpg" width="89" height="62" alt=""></a>
                
                        <a href="http://xevaphongcach.net/public/data/albums/xe-dep/xe-dep-18.jpg" target="_blank" rel="slideshow">
                                <img src="./Xe và phong cách - Trang chủ_files/xe-dep-18.jpg" width="89" height="62" alt=""></a>
                
                        <a href="http://xevaphongcach.net/public/data/albums/xe-dep/xe-dep-25.JPG" target="_blank" rel="slideshow">
                                <img src="./Xe và phong cách - Trang chủ_files/xe-dep-25.JPG" width="89" height="62" alt=""></a>
                
                        <a href="http://xevaphongcach.net/public/data/albums/xe-dep/xe-dep-1.jpg" target="_blank" rel="slideshow">
                                <img src="./Xe và phong cách - Trang chủ_files/xe-dep-1.jpg" width="89" height="62" alt=""></a>
                
                        <a href="http://xevaphongcach.net/public/data/albums/xe-dep/xe-dep-12.jpg" target="_blank" rel="slideshow">
                                <img src="./Xe và phong cách - Trang chủ_files/xe-dep-12.jpg" width="89" height="62" alt=""></a>
                
                        <a href="http://xevaphongcach.net/public/data/albums/xe-dep/xe-dep-9.jpg" target="_blank" rel="slideshow">
                                <img src="./Xe và phong cách - Trang chủ_files/xe-dep-9.jpg" width="89" height="62" alt=""></a>
                
                        <a href="http://xevaphongcach.net/public/data/albums/xe-dep/xe-dep-10.jpg" target="_blank" rel="slideshow">
                                <img src="./Xe và phong cách - Trang chủ_files/xe-dep-10.jpg" width="89" height="62" alt=""></a>
                            </div>
                </div>
                <!--end of .anhdep-->
                
            </div>
            <div class="clearfix"></div>
            <div class="container margin-top15">
                <uc1:HomeNoiBatVertical runat="server" id="HomeNoiBatVertical" CatId="31"  Top="4" />
                <uc1:HomeNoiBatVertical runat="server" id="HomeNoiBatVertical1" CatId="31"  Top="4" />
                <!--end of #top-nhanvat-->        
                <uc1:HomeVote runat="server" id="HomeVote" />
            </div>
            <div class="clearfix"></div>
</asp:Content>
