<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="SearchResult.aspx.cs" Inherits="XPC.Web.Pages.SearchResult" %>
<%@ Register Src="~/GUI/HomeAnhDep.ascx" TagPrefix="uc1" TagName="HomeAnhDep" %>
<%@ Register Src="~/GUI/ListTinDocNhieu.ascx" TagPrefix="uc1" TagName="ListTinDocNhieu" %>



<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container">
        <div class="colLeft">
        </div>
        <div class="colRight">
            <uc1:HomeAnhDep runat="server" id="HomeAnhDep" />
            <uc1:ListTinDocNhieu runat="server" id="ListTinDocNhieu" />
        </div>
        <div class="clearfix"></div>
    </div>
</asp:Content>
