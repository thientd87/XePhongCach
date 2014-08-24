<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="Footer.ascx.cs" Inherits="XPC.Web.GUI.Footer" %>
     <div id="bottom-menu" class="bottom-menu">
        <ul>
        <li class="active">
            <a href="./Xe và phong cách - Trang chủ_files/Xe và phong cách - Trang chủ.htm">Trang chủ</a></li>
         <asp:Repeater runat="server" ID="rptNewsCat">
                        <ItemTemplate>
                             <li id="li<%#Eval("Cat_ID") %>">
                                <a href="<%#Eval("Cat_URL") %>"><%#Eval("Cat_Name") %></a>
                            </li>
                        </ItemTemplate>
                    </asp:Repeater>
        <li><a href="http://xevaphongcach.net/#">Liên hệ</a></li>
    </ul>
</div><!--end of #bottom-menu-->        
        <div id="footer">
            <div class="col1">
                Liên hệ quảng cáo:  <br/>
                094.80.81.748 (Ms.Thùy)<br/>
                Email:  quangcao@Buzzcom.vn<br/>
                Tel: 04.37322866<br/>
                Website: www.Buzzcom.vn
            </div>
            <div class="col2">
                Giấy phép hoạt động trên Internet số …..<br/>
                Trụ sở: Số 85, TT Dược Phẩm TW1, Tôn Đức Thắng, Q.Đống Đa, Hà Nội<br/>
                Điện thoại: 04.373 22866<br/>
                Email: info@xevaphongcach.vn. Website: www.xevaphongcach.vn  <br/>
            </div>
            <div class="col3">
                <img src="/Images/logoBUzzCom.png"/> <br/>
                Copyright 2013 - Công Ty Cổ Phần Tích Hợp <br/>
                Dịch Vụ Buzzcom
            </div>
    </div>