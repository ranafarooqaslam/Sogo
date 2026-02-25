<%@ Page Language="C#" MasterPageFile="~/Forms/PageMaster.master" AutoEventWireup="true" CodeFile="frmDocumentPrinting.aspx.cs" Inherits="Forms_frmDocumentPrinting" Title="SAMS: Print Sale Document" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<%@ Register Assembly="CrystalDecisions.Web, Version=13.0.2000.0, Culture=neutral, PublicKeyToken=692fbea5521e1304"
    Namespace="CrystalDecisions.Web" TagPrefix="CR" %>
<asp:Content ID="Content1" runat="server" ContentPlaceHolderID="cphPage">
    <script language="JavaScript" type="text/javascript">
        function ValidateForm() {

            return true;
        }

    </script>
    <div id="right_data">
        <table width="100%">
            <tr>
                <td>
                    
                            <table>
                                <tbody>
                                    <tr>
                                        <td align="left" colspan="1"></td>
                                        <td align="left" colspan="4">
                                            <asp:Label ID="lblErrorMsg" runat="server" ForeColor="Red" Font-Bold="True"></asp:Label>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td align="left"></td>
                                        <td align="left"></td>
                                        <td align="left">
                                            <strong>
                                                <asp:Label ID="Label2" runat="server" Width="95px" Text="Document Type"></asp:Label></strong></td>
                                        <td align="left"></td>
                                        <td style="height: 25px" align="left">
                                            <asp:DropDownList ID="DrpLedgerType" runat="server" Width="200px" OnSelectedIndexChanged="DrpLedgerType_SelectedIndexChanged" AutoPostBack="True">
                                            </asp:DropDownList>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td align="left"></td>
                                        <td align="left"></td>
                                        <td align="left">
                                            <strong>
                                                <asp:Label ID="lbltoLocation" runat="server" Width="94px" Text="Location"></asp:Label></strong></td>
                                        <td align="left"></td>
                                        <td style="height: 25px" align="left">
                                            <asp:DropDownList ID="drpDistributor" runat="server" Width="200px" OnSelectedIndexChanged="drpDistributor_SelectedIndexChanged" AutoPostBack="True">
                                            </asp:DropDownList></td>
                                    </tr>
                                     <tr>
                                        <td align="left"></td>
                                        <td align="left"></td>
                                        <td align="left">
                                            <strong>
                                                <asp:Label ID="Label6" runat="server" Width="94px" Text="Order Booker"></asp:Label></strong></td>
                                        <td align="left"></td>
                                        <td style="height: 25px" align="left">
                                          <asp:DropDownList ID="DrpOrderBooker" runat="server" Width="200px">
                                                </asp:DropDownList></td>
                                    </tr>
                                    <tr>
                                        <td align="left"></td>
                                        <td align="left"></td>
                                        <td align="left">
                                            <strong>
                                                <asp:Label ID="Label1" runat="server" Width="78px" Text="Sale Force"></asp:Label></strong></td>
                                        <td align="left"></td>
                                        <td style="height: 25px" align="left">
                                            <asp:DropDownList ID="DrpArea" runat="server" Width="200px">
                                            </asp:DropDownList></td>
                                    </tr>
                                    <tr>
                                        <td align="left"></td>
                                        <td align="left"></td>
                                        <td align="left">
                                            <strong>
                                                <asp:Label ID="Label7" runat="server" Width="78px" Text="City"></asp:Label></strong></td>
                                        <td align="left"></td>
                                        <td style="height: 25px" align="left">
                                             <asp:DropDownList ID="DrpTown" runat="server" Width="205px" OnSelectedIndexChanged="DrpTown_SelectedIndexChanged"
                                    AutoPostBack="True">
                                </asp:DropDownList></td>
                                    </tr>
                                    <tr>
                                        <td align="left"></td>
                                        <td align="left"></td>
                                        <td align="left">
                                            <strong>
                                                <asp:Label ID="Label8" runat="server" Width="78px" Text="Channel Type"></asp:Label></strong></td>
                                        <td align="left"></td>
                                        <td style="height: 25px" align="left">
                                             <asp:DropDownList ID="ddlChannelType" runat="server" Width="205px">
                                </asp:DropDownList></td>
                                    </tr>
                                    <tr>
                                        <td align="left"></td>
                                        <td align="left"></td>
                                        <td align="left">
                                            <strong>
                                                <asp:Label ID="lblfromLocation" runat="server" Width="94px" Text="Customer Area"></asp:Label></strong></td>
                                        <td align="left"></td>
                                        <td style="height: 25px" align="left">
                                            <asp:DropDownList ID="DrpRoute" runat="server" Width="200px" OnSelectedIndexChanged="DrpRoute_SelectedIndexChanged" AutoPostBack="True"></asp:DropDownList></td>
                                    </tr>
                                    <tr>
                                        <td align="left"></td>
                                        <td align="left"></td>
                                        <td align="left">
                                            <strong>
                                                <asp:Label ID="Label5" runat="server" Width="94px" Text="Customer"></asp:Label></strong></td>
                                        <td align="left"></td>
                                        <td style="height: 25px" align="left">
                                            <asp:DropDownList ID="DrpCustomer" runat="server" Width="200px">
                                            </asp:DropDownList></td>
                                    </tr>
                                    <tr>
                                        <td align="left"></td>
                                        <td align="left"></td>
                                        <td align="left">
                                            <strong>
                                                <asp:Label ID="Label3" runat="server" Height="13px" Text="From Date"
                                                    Width="90px"></asp:Label>
                                            </strong>
                                        </td>
                                        <td align="left"></td>
                                        <td align="left" style="height: 25px">&nbsp;<asp:TextBox ID="txtStartDate" runat="server" CssClass="txtBox" MaxLength="10"
                                            onkeyup="BlockStartDateKeyPress()" Width="150px"></asp:TextBox>
                                            <asp:ImageButton ID="ibtnStartDate" runat="server"
                                                ImageUrl="~/App_Themes/Granite/Images/date.gif" Width="16px" />
                                        </td>
                                    </tr>

                                    <tr>
                                        <td align="left"></td>
                                        <td align="left"></td>
                                        <td align="left">
                                            <strong>
                                                <asp:Label ID="Label4" runat="server" Height="13px" Text="To Date" Width="80px"></asp:Label>
                                            </strong>
                                        </td>
                                        <td align="left"></td>
                                        <td align="left" style="height: 25px">&nbsp;<asp:TextBox ID="txtEndDate" runat="server" CssClass="txtBox " MaxLength="10"
                                            onkeyup="BlockEndDateKeyPress()" Width="150px"></asp:TextBox>
                                            <asp:ImageButton ID="ibnEndDate" runat="server"
                                                ImageUrl="~/App_Themes/Granite/Images/date.gif" Width="16px" />
                                        </td>
                                    </tr>

                                    <tr>
                                        <td>
                                            <cc1:CalendarExtender ID="CEStartDate" runat="server" Format="dd-MMM-yyyy"
                                                PopupButtonID="ibtnStartDate" TargetControlID="txtStartDate">
                                            </cc1:CalendarExtender>
                                            <cc1:CalendarExtender ID="CEEndDate" runat="server" Format="dd-MMM-yyyy" PopupButtonID="ibnEndDate"
                                                TargetControlID="txtEndDate">
                                            </cc1:CalendarExtender>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td align="left" colspan="5">
                                            <div id="divSort" class="container2">
                                                <table width="100%">
                                                    <tbody>
                                                        <tr>
                                                            <td></td>
                                                            <td>
                                                                <strong>
                                                                    <asp:Label ID="lblSort" runat="server" Text="Sort By" Width="78px" Visible="false"></asp:Label>
                                                                </strong>
                                                            </td>
                                                            <td></td>
                                                            <td align="right">
                                                                <asp:DropDownList ID="DrpSort" runat="server" Width="240px" Visible="false">
                                                                    <asp:ListItem Value="0">Document No</asp:ListItem>
                                                                    <asp:ListItem Value="1">Customer Code</asp:ListItem>
                                                                </asp:DropDownList>
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td></td>
                                                            <td>
                                                                <strong>
                                                                    <asp:Label ID="lblSortOrder" runat="server" Text="Sort Order"
                                                                        Width="78px"></asp:Label>
                                                                </strong>
                                                            </td>
                                                            <td></td>
                                                            <td>
                                                                <asp:RadioButtonList ID="rbtSortOrder" runat="server"
                                                                    RepeatDirection="Horizontal" Width="192px">
                                                                    <asp:ListItem Selected="True" Text="Ascending"></asp:ListItem>
                                                                    <asp:ListItem Text="Descending"></asp:ListItem>
                                                                </asp:RadioButtonList>
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td colspan="4">&nbsp;</td>
                                                        </tr>
                                                    </tbody>
                                                </table>
                                            </div>
                                        </td>
                                    </tr>
                                </tbody>
                            </table>
                       
                   
                    <asp:Button ID="btnViewPDF" runat="server" Width="90" Text="View PDF" OnClick="btnViewPDF_Click" CssClass="Button" />
                    <asp:Button ID="btnViewExcel" runat="server" Width="90" Text="View Excel" OnClick="btnViewExcel_Click" CssClass="Button" />
                    <asp:Button ID="btnViewPdfWithLedgerBal" runat="server" Width="145" Text="View Invoice with LB" OnClick="btnViewPdfWithLedgerBal_Click" CssClass="Button" />
               
                     </td>
            </tr>
        </table>
    </div>
</asp:Content>
