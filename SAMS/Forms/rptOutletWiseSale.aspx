<%@ Page Language="C#" MasterPageFile="~/Forms/PageMaster.master" AutoEventWireup="true" CodeFile="rptOutletWiseSale.aspx.cs" Inherits="Forms_rptOutletWiseSale" Title="SAMS: Catagory Wise Customer Report" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>

<asp:Content ID="ID" runat="server" ContentPlaceHolderID="cphPage">
    <div id="right_data">
        <table width="100%">
            <tr>
                <td>
                    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                        <ContentTemplate>
                            <table>
                                <tbody>
                                    <tr>
                                        <td align="left" colspan="4">
                                            <asp:Label ID="lblErrorMsg" runat="server" ForeColor="Red" Font-Bold="True"></asp:Label>
                                        </td>
                                        <td style="width: 1px" align="left" colspan="1"></td>
                                    </tr>
                                    <tr>
                                        <td align="left"></td>
                                        <td style="width: 90px" align="left">
                                            <strong>
                                                <asp:Label ID="Label2" runat="server" Width="48px" Text="Location"></asp:Label></strong></td>
                                        <td style="width: 1px" align="left"></td>
                                        <td style="width: 204px; height: 25px" align="left">
                                            <asp:DropDownList ID="DrpLocation" runat="server" Width="200px" AutoPostBack="True"></asp:DropDownList></td>
                                        <td style="width: 1px; height: 25px" align="left"></td>
                                    </tr>
                                    <tr>
                                        <td align="left"></td>
                                        <td style="width: 90px" align="left">
                                            <strong>
                                                <asp:Label ID="Label4" runat="server" Width="48px" Text="Principal"></asp:Label></strong></td>
                                        <td style="width: 1px" align="left"></td>
                                        <td style="width: 204px; height: 25px" align="left">
                                            <asp:DropDownList ID="drpPrincipal" runat="server" Width="200px" OnSelectedIndexChanged="drpPrincipal_SelectedIndexChanged" AutoPostBack="True"></asp:DropDownList></td>
                                        <td style="width: 1px; height: 25px" align="left"></td>
                                    </tr>
                                    <tr>
                                        <td style="height: 2px" align="left"></td>
                                        <td style="width: 90px; height: 2px" align="left">
                                            <strong>
                                                <asp:Label ID="Label5" runat="server" Width="48px" Text="Catagory"></asp:Label></strong></td>
                                        <td style="width: 1px; height: 2px" align="left"></td>
                                        <td style="width: 204px; height: 2px" align="left">
                                            <asp:CheckBox ID="ChbAllCatagories" runat="server" Text="All Catagories" AutoPostBack="True" OnCheckedChanged="ChbAllLocationType_CheckedChanged"></asp:CheckBox></td>
                                        <td style="width: 1px; height: 2px" align="left"></td>
                                    </tr>
                                    <tr>
                                        <td style="height: 2px" align="left"></td>
                                        <td></td>
                                        <td></td>
                                        <td style="height: 2px" align="left">
                                            <asp:Panel ID="Panel1" runat="server" Width="200px" Height="150px" ScrollBars="Vertical" BorderStyle="Groove" BorderWidth="1px">
                                                <asp:CheckBoxList ID="ListCatagory" runat="server" AutoPostBack="True"></asp:CheckBoxList>
                                            </asp:Panel>
                                        </td>

                                    </tr>
                                    <tr>
                                        <td align="left"></td>
                                        <td style="width: 90px" align="left">
                                            <strong>
                                                <asp:Label ID="Label1" runat="server" Width="100%" Height="9px" Text="From Date"></asp:Label></strong></td>
                                        <td style="width: 1px" align="left"></td>
                                        <td style="width: 204px; height: 25px" align="left">
                                            <asp:TextBox ID="txtFromDate" runat="server" Width="150px" CssClass="txtBox" MaxLength="10"></asp:TextBox>
                                            <asp:ImageButton ID="ImgBntFromDate" runat="server" ImageUrl="~/App_Themes/Granite/Images/date.gif"></asp:ImageButton></td>
                                        <td style="width: 1px; height: 25px" align="left"></td>
                                    </tr>
                                    <tr>
                                        <td align="left"></td>
                                        <td style="width: 90px" align="left">
                                            <strong>
                                                <asp:Label ID="Label3" runat="server" Width="55px" Text="To Date"></asp:Label></strong></td>
                                        <td style="width: 1px" align="left"></td>
                                        <td style="width: 204px; height: 25px" align="left">
                                            <asp:TextBox ID="txtToDate" runat="server" Width="150px" CssClass="txtBox" MaxLength="10"></asp:TextBox>
                                            <asp:ImageButton ID="ImgBntToDate" runat="server" ImageUrl="~/App_Themes/Granite/Images/date.gif"></asp:ImageButton></td>
                                        <td style="width: 1px; height: 25px" align="left"></td>
                                    </tr>
                                </tbody>
                            </table>
                            <cc1:CalendarExtender ID="CalendarExtender1" runat="server" Format="dd-MMM-yyyy" EnableViewState="False" PopupButtonID="ImgBntFromDate" TargetControlID="txtFromDate"></cc1:CalendarExtender>
                            <cc1:CalendarExtender ID="CalendarExtender2" runat="server" Format="dd-MMM-yyyy" EnableViewState="False" PopupButtonID="ImgBntToDate" TargetControlID="txtToDate"></cc1:CalendarExtender>
                            &nbsp; 
                        </ContentTemplate>
                    </asp:UpdatePanel>
                    <asp:Button ID="btnViewPDF" runat="server" CssClass="Button"
                        Text="View PDF" Width="90" OnClick="btnViewPDF_Click" />
                    <asp:Button ID="btnViewExcel" runat="server" CssClass="Button" Text="View Excel"
                        Width="90" OnClick="btnViewExcel_Click" /></td>
            </tr>
        </table>

    </div>
</asp:Content>
