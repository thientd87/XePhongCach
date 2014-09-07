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
                Hotline: 094.80.81.749 – Phạm Ngọc<br/>
                Email:  Phamngoc@buzzcom.vn<br/>
                Hỗ trợ & CSKH:<br/>
                Tel: 04. 627 673 99<br/>
                Email: Tapchixevaphongcach@gmail.com
            </div>
            <div class="col2">
                Kênh thông tin truyền thông Xe&PhongCach phát sóng trên<br/> VTV9 - Đài THVN<br/>
                Trụ sở tại: Tầng 2, 85A Tôn Đức Thắng, Q. Đống Đa, TP Hà Nội<br/>
                Tel: 04. 627 673 99      Fax: 04. 627 673 99<br/>
                Ghi rõ nguồn "Xe&PhongCach" khi phát hành lại thông tin từ cổng thông tin này.<br/>
            </div>
            <div class="col3">
                <img src="/Images/logoBUzzCom.png"/> <br/>
                Copyright 2013 - Công Ty Cổ Phần Tích Hợp <br/>
                Dịch Vụ Buzzcom
            </div>
    </div>