<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="VoteItem.ascx.cs" Inherits="DFISYS.GUI.EditoralOffice.MainOffce.Votes.VoteItem" %>
<%@ Register Assembly="System.Web.Extensions, Version=1.0.61025.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35"
    Namespace="System.Web.UI" TagPrefix="asp" %>
<table cellpadding="0" cellspacing="0" border="0" width="100%">
    <tr>
        <td>
            <table cellpadding="0" cellspacing="5" width="100%">
                <tr>
                    <td colspan="2">
                        <asp:GridView Width="100%" ID="grdThreadList" runat="server" HeaderStyle-CssClass="grdHeader" RowStyle-CssClass="grdItem"  ShowFooter="true"
                                AlternatingRowStyle-CssClass="grdAlterItem" AutoGenerateColumns="false" AllowPaging="true" DataSourceID="objVoteItemSource" PageSize="12" OnRowDataBound="grdThreadList_RowDataBound" OnRowCommand="grdThreadList_RowCommand" OnRowCancelingEdit="grdThreadList_RowCancelingEdit" OnRowEditing="grdThreadList_RowEditing" OnRowUpdating="grdThreadList_RowUpdating" OnRowDeleting="grdThreadList_RowDeleting"> 
                            <Columns>
                                    <asp:TemplateField>
                                        <HeaderTemplate>
                                            <input type="checkbox" id="chkAll" onclick="CheckAll();"/>
                                        </HeaderTemplate>
                                        <ItemTemplate>
                                            <asp:CheckBox ID="chkSelect" runat="server"/>
                                        </ItemTemplate>
                                        <FooterTemplate>
                                            &nbsp;
                                        </FooterTemplate>
                                        <HeaderStyle Width="2%" />
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Nội dung câu hỏi">
                                        <ItemTemplate>
                                            <asp:Label ID="lblThreadTitle" runat="server" Text='<%# DataBinder.Eval(Container.DataItem,"VoteIt_Content") %>'></asp:Label>
                                        </ItemTemplate>
                                        <EditItemTemplate>
                                            <center>
                                                <asp:TextBox ID="txtEditVoteItem" runat="server" Width="98%" Text='<%# DataBinder.Eval(Container.DataItem,"VoteIt_Content") %>'></asp:TextBox>
                                            </center>
                                        </EditItemTemplate>
                                        <FooterTemplate>
                                            <center>
                                                <asp:TextBox ID="txtVoteItem" runat="server" Width="98%"></asp:TextBox>
                                            </center>
                                        </FooterTemplate>   
                                        <HeaderStyle Width="40%" />
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Số bình chọn">
                                        <ItemTemplate>
                                            <asp:Label ID="lblVoteRank" runat="server" Text='<%# DataBinder.Eval(Container.DataItem,"VoteIt_Rate") %>'></asp:Label>
                                        </ItemTemplate>
                                        <EditItemTemplate>
                                            <center>
                                                <asp:TextBox ID="txtEditVoteRank" runat="server" Width="98%" Text='<%# DataBinder.Eval(Container.DataItem,"VoteIt_Rate") %>'></asp:TextBox>
                                            </center>
                                        </EditItemTemplate>
                                        <FooterTemplate>
                                            <center>
                                                <asp:TextBox ID="txtVoteRank" runat="server" Width="98%"></asp:TextBox>
                                            </center>
                                        </FooterTemplate>   
                                        <HeaderStyle Width="40%" />
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Tuỳ chọn">
							            <ItemTemplate>
								            <asp:ImageButton id="imgEdit" runat="server" ImageUrl="~/Images/icons/edit.gif" AlternateText="Sửa nội dung" CausesValidation="False" CommandName="Edit" CommandArgument='<%#DataBinder.Eval(Container.DataItem,"VoteIt_ID")%>'></asp:ImageButton>
								            <asp:ImageButton id="imgDel" runat="server" ImageUrl="~/Images/icons/cancel.gif" OnClientClick="return confirm('Ban co muon xoa khong')" AlternateText="Xóa nội dung này" CommandName="Delete" CausesValidation="False" CommandArgument='<%#DataBinder.Eval(Container.DataItem,"VoteIt_ID")%>'></asp:ImageButton>
							            </ItemTemplate>
							            <EditItemTemplate>
								            <asp:ImageButton id="imgSave" runat="server" ImageUrl="~/Images/icons/save.gif" AlternateText="Ghi lại" CommandName="Update" CausesValidation="False" CommandArgument='<%#DataBinder.Eval(Container.DataItem,"VoteIt_ID")%>'></asp:ImageButton>
								            &nbsp;
								            <asp:ImageButton id="imgCancel" runat="server" ImageUrl="~/Images/icons/stop.gif" AlternateText="Tạm dừng thay đổi" CommandName="Cancel" CausesValidation="False"></asp:ImageButton>
								            &nbsp;
								            <asp:ImageButton id="imgDel" runat="server" ImageUrl="~/Images/icons/cancel.gif" AlternateText="Xóa nội dung này" CommandName="Delete" CausesValidation="False"></asp:ImageButton>
							            </EditItemTemplate>
							            <FooterTemplate>
							                <center>
							                    <asp:ImageButton id="btnNewThread" runat="server" CausesValidation="False" ImageUrl="~/Images/icons/new.gif" CommandName="NewVoteItem"></asp:ImageButton>
						                    </center>
							            </FooterTemplate>
                                        <ItemStyle HorizontalAlign="Center" />
							          </asp:TemplateField>
                                </Columns>
                                <RowStyle CssClass="grdItem" />
                                <HeaderStyle CssClass="grdHeader" />
                                <AlternatingRowStyle CssClass="grdAlterItem" />
                                <PagerSettings Visible="False"/>     
                        </asp:GridView>
                    </td>
                </tr>
            </table>
        </td>
    </tr>   
</table>

<asp:ObjectDataSource ID="objVoteItemSource" TypeName="DFISYS.BO.Editoral.Vote.VoteItemHelper" DeleteMethod="DelItem" SelectMethod="getVoteItem" InsertMethod="CreateVoteItem" UpdateMethod="UpdateVoteItem" runat="server">
    <SelectParameters>
        <asp:QueryStringParameter Name="_vote_id" QueryStringField="vote" Type="int32" />
    </SelectParameters>
    <InsertParameters>
        <asp:QueryStringParameter QueryStringField="vote"  Name="_vote_id" Type="int32" />
        <asp:Parameter Name="_vote_item" Type="String" />
        <asp:Parameter Name ="_VotNum" Type="int32" />
    </InsertParameters>
    <UpdateParameters>
        <asp:Parameter Name="_item_id" Type="int32" />
        <asp:Parameter Name="_vote_item" Type="string" />
        <asp:Parameter Name ="_VotNum" Type="int32" />
    </UpdateParameters>
    <DeleteParameters>
        <asp:Parameter Name="_item_id" Type="int32" />
    </DeleteParameters>
</asp:ObjectDataSource>