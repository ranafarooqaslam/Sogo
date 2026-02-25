<%@ Page Language="C#" MasterPageFile="~/Forms/PageMaster.master" AutoEventWireup="true"
    CodeFile="frmDisToDisAssignment.aspx.cs" Inherits="Forms_frmDisToDisAssignment"
    Title="SAMS:: Distributors Assignment" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="cphPage" runat="Server">
    <div id="right_data">
        <div style="z-index: 101; left: 612px; width: 100px; position: absolute; top: 129px;
                            height: 100px">
                            <asp:Panel ID="Panel201" runat="server">
                                <asp:UpdateProgress ID="UpdateProgress1" runat="server" AssociatedUpdatePanelID="UpdatePanel2">
                                    <ProgressTemplate>
                                        <asp:ImageButton ID="ImageButton10" runat="server" Height="28px" ImageUrl="~/App_Themes/Granite/Images/image003.gif"
                                            Width="31px" />
                                        Wait Update
                                    </ProgressTemplate>
                                </asp:UpdateProgress>
                            </asp:Panel>
                        </div>
        <div>
            <table width="100%">
                <tr>
                    <td align="left">
                        <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                            <ContentTemplate>
                                <table>
                                    <tbody>
                                    
                                        <tr>
                                            <td style="width: 45px; height: 28px" align="left">
                                                <strong>
                                                    <asp:Label ID="Label1" runat="server" Text="Location" Width="58px"></asp:Label></strong>
                                            </td>
                                            <td style="height: 16px; width: 2px;" align="left">
                                                <asp:DropDownList ID="DrpDistributor" runat="server" Width="200px" 
                                                   AutoPostBack="true" CssClass="DropList" OnSelectedIndexChanged="DrpDistributor_SelectedIndexChanged1">
                                                </asp:DropDownList>
                                            </td>
                                        </tr>


                                         <tr>
                                        <td style="height: 13px">
                                            <strong>
                                                <asp:Label ID="Label2" runat="server" Width="112px" Text="Location Type" CssClass="lblbox"></asp:Label></strong>
                                        </td>
                                        <td style="width: 216px; height: 13px">
                                            <asp:DropDownList ID="ddDistributorType" runat="server" Width="200px" CssClass="DropList"
                                                OnSelectedIndexChanged="ddDistributorType_SelectedIndexChanged" AutoPostBack="True">
                                            </asp:DropDownList>
                                        </td>
                                    </tr>
                                    </tbody>
                                </table>
                            </ContentTemplate>
                        </asp:UpdatePanel>
                    </td>
                </tr>
            </table>
        </div>
        <div>
         <asp:UpdatePanel ID="UpdatePanel2" runat="server">
                        <ContentTemplate>
            <table>
                                                <tbody>
                                                    <tr>
                                                        <td align="center">
                                                            <strong>Unassigned</strong>
                                                        </td>
                                                        <td align="center">
                                                        </td>
                                                        <td align="center">
                                                            <strong>Assigned</strong>
                                                        </td>
                                                    </tr>

                                                    <tr>
                                                        <td style="width: 100px" rowspan="4" align="center">
                                                            <asp:ListBox ID="lstUnAssignDistributor" runat="server" Width="300px" Height="200px"
                                                                CssClass="DropList"></asp:ListBox>
                                                        </td>
                                                        <td align="center">
                                                        </td>
                                                        <td style="width: 102px" rowspan="4" align="center">
                                                            <asp:ListBox ID="lstAssignDistributor" runat="server" Width="300px" Height="200px"
                                                                CssClass="DropList"></asp:ListBox>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td align="center">
                                                            <asp:Button ID="BtnAssign" OnClick="BtnAssign_Click" runat="server" Width="30px" CssClass="Button"
                                                                Text=">"></asp:Button>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td align="center">
                                                            <asp:Button ID="BtnUnAssign" OnClick="BtnUnAssign_Click" runat="server" Width="30px" CssClass="Button"
                                                                Text="<"></asp:Button>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td align="center">
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td rowspan="1">
                                                        </td>
                                                        <td style="width: 75px; height: 24px">
                                                        </td>
                                                        <td rowspan="1">
                                                        </td>
                                                    </tr>
                                                </tbody>
                                            </table>
                                            </ContentTemplate>
                                            </asp:UpdatePanel>
        </div>
    </div>
</asp:Content>
