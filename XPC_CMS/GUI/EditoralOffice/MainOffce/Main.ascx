<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="Main.ascx.cs" Inherits="DFISYS.GUI.EditoralOffice.MainOffce.Main" %>
<%@ Register Src="Menu/menu.ascx" TagName="menu" TagPrefix="uc2" %>
 
 <!-- BEGIN CONTAINER -->            
<div class="page-container row-fluid">
     <!-- BEGIN SIDEBAR -->
      <div class="page-sidebar nav-collapse">
            <uc2:menu ID="Menu1" runat="server" />
      </div>
      <!-- END SIDEBAR -->  
      <!-- BEGIN PAGE -->
      <div class="page-content">
           <asp:PlaceHolder ID="plcMain" runat="server"></asp:PlaceHolder>
      </div>
      <!-- END PAGE --> 
</div>
 <!-- END CONTAINER -->     
            
          
