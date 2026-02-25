<%@ Page Title="SAMS :: Daily Collection" Language="C#" MasterPageFile="~/Forms/PageMaster.master"
    AutoEventWireup="true" CodeFile="rptDailyCollection.aspx.cs" Inherits="Forms_rptDailyCollection" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<asp:Content ID="Content1" runat="server" ContentPlaceHolderID="cphPage">
    <script type="text/javascript" src="../AjaxLibrary/jquery.searchabledropdown-1.0.8.min.js"></script>
    <script language="JavaScript" type="text/javascript">
        function pageLoad() {
            $("select").searchable();
        }
    </script>
    <div id="right_data">
        <table width="100%">
            <tr>
                <td>
                    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                        <ContentTemplate>
                            <table>
                                <tr>
                                    <td align="left" colspan="4">
                                        <div runat="server" id="dvMsg" visible="false" style='padding: 10px; margin: 5px;
                                            background-color: #fbefef; border: Solid 1px #bb0000; color: #bb0000; font-size: 12px;
                                            font-family: Verdana; width: 100%'>
                                            <p style="text-align:center;">
                                                Record not found Please Try again!</p>
                                        </div>
                                    </td>
                                </tr>
                                <tr>
                                    <td align="left">
                                    </td>
                                    <td style="width: 100px;" align="left">
                                        <strong>Transaction Type</strong>
                                    </td>
                                    <td align="left">
                                    </td>
                                    <td align="center" style="height: 25px">
                                        <asp:RadioButtonList ID="rdbReportType" runat="server" Width="180px" RepeatDirection="Horizontal"
                                            OnSelectedIndexChanged="rdbReportType_SelectedIndexChanged" AutoPostBack="true">
                                            <asp:ListItem Text="Summary" Value="0" Selected="True"></asp:ListItem>
                                            <asp:ListItem Text="Detail" Value="1"></asp:ListItem>
                                           
                                        </asp:RadioButtonList>
                                    </td>
                                </tr>
                                <tr runat="server" id="reportType" visible="false">
                                    <td align="left">
                                    </td>
                                    <td style="width: 90px;" align="left">
                                        <strong>Report Type</strong>
                                    </td>
                                    <td align="left">
                                    </td>
                                    <td align="left" style="height: 25px">
                                        <asp:DropDownList ID="drpReportType" runat="server" Width="200px" CssClass="DropList">
                                            <asp:ListItem Text="All" Value="0" Selected="True"></asp:ListItem>
                                            <asp:ListItem Text="Cash" Value="1"></asp:ListItem>
                                            <asp:ListItem Text="Online" Value="2"></asp:ListItem>
                                            <asp:ListItem Text="Advance" Value="3"></asp:ListItem>
                                            <asp:ListItem Text="Received Cheques" Value="527"></asp:ListItem>
                                            <asp:ListItem Text="Deposited Cheques" Value="528"></asp:ListItem>
                                            <asp:ListItem Text="Cleared Cheques" Value="529"></asp:ListItem>
                                            <asp:ListItem Text="Bounce Cheques" Value="530"></asp:ListItem>
                                            <asp:ListItem Text="Cancel Cheques" Value="560"></asp:ListItem>
                                        </asp:DropDownList>
                                    </td>
                                </tr>
                                <tr>
                                    <td align="left">
                                    </td>
                                    <td align="left">
                                        <strong>Location</strong>
                                    </td>
                                    <td align="left">
                                    </td>
                                    <td align="left" style="height: 25px">
                                        <asp:DropDownList ID="drpDistributor" runat="server" Width="200px" CssClass="DropList"
                                            AutoPostBack="True" OnSelectedIndexChanged="drpDistributor_SelectedIndexChanged">
                                        </asp:DropDownList>
                                    </td>
                                </tr>
                                 <tr>
                                    <td align="left">
                                    </td>
                                    <td align="left">
                                        <strong>City</strong>
                                    </td>
                                    <td align="left">
                                    </td>
                                    <td align="left" style="height: 25px">
                                        <asp:DropDownList ID="ddlCity" runat="server" Width="200px" CssClass="DropList"
                                            AutoPostBack="True" OnSelectedIndexChanged="ddlCity_SelectedIndexChanged">
                                        </asp:DropDownList>
                                    </td>
                                </tr>
                                 <tr>
                                    <td align="left">
                                    </td>
                                    <td align="left">
                                        <strong>Area</strong>
                                    </td>
                                    <td align="left">
                                    </td>
                                    <td align="left" style="height: 25px">
                                        <asp:DropDownList ID="ddlArea" runat="server" Width="200px" CssClass="DropList"
                                            AutoPostBack="True" OnSelectedIndexChanged="ddlArea_SelectedIndexChanged">
                                        </asp:DropDownList>
                                    </td>
                                </tr>
                               <tr>
                                    <td align="left">
                                    </td>
                                    <td align="left">
                                        <strong>Channel Type</strong>
                                    </td>
                                    <td align="left">
                                    </td>
                                    <td align="left" style="height: 25px">
                                        <asp:DropDownList ID="ddlChannelType" runat="server" CssClass="DropList" Width="200px">
                                        </asp:DropDownList>
                                    </td>
                                </tr>
                                <tr>
                                    <td align="left">
                                    </td>
                                    <td align="left">
                                        <strong>Customer</strong>
                                    </td>
                                    <td align="left">
                                    </td>
                                    <td align="left" style="height: 25px">
                                        <asp:DropDownList ID="DrpCustomer" runat="server" CssClass="DropList" Width="200px"
                                            >
                                        </asp:DropDownList>
                                    </td>
                                </tr>
                                <tr>
                                    <td align="left">
                                    </td>
                                    <td align="left">
                                        <strong>From Date</strong>
                                    </td>
                                    <td align="left">
                                    </td>
                                    <td align="left" style="height: 25px">
                                        <asp:TextBox ID="txtStartDate" runat="server" CssClass="txtBox" MaxLength="10" onkeyup="BlockStartDateKeyPress()"
                                            Width="170px"></asp:TextBox>
                                        <asp:ImageButton ID="ibtnStartDate" runat="server" ImageUrl="~/App_Themes/Granite/Images/date.gif"
                                            Width="16px" />
                                    </td>
                                </tr>
                                <tr>
                                    <td align="left">
                                    </td>
                                    <td align="left">
                                        <strong>To Date</strong>
                                    </td>
                                    <td align="left">
                                    </td>
                                    <td align="left" style="height: 25px">
                                        <asp:TextBox ID="txtEndDate" runat="server" CssClass="txtBox " MaxLength="10" Width="170px"></asp:TextBox>
                                        <asp:ImageButton ID="ibnEndDate" runat="server" ImageUrl="~/App_Themes/Granite/Images/date.gif"
                                            Width="16px" />
                                    </td>
                                </tr>
                                <tr>
                                    <td align="left">
                                    </td>
                                    <td align="left">
                                    </td>
                                    <td align="left">
                                    </td>
                                    <td align="left" style="height: 25px">
                                        <%@ register assembly="AjaxControlToolkit" namespace="AjaxControlToolkit" tagprefix="cc1" %>
                                        <cc1:CalendarExtender ID="CEStartDate" runat="server" Format="dd-MMM-yyyy" PopupButtonID="ibtnStartDate"
                                            TargetControlID="txtStartDate">
                                        </cc1:CalendarExtender>
                                        <cc1:CalendarExtender ID="CEEndDate" runat="server" Format="dd-MMM-yyyy" PopupButtonID="ibnEndDate"
                                            TargetControlID="txtEndDate">
                                        </cc1:CalendarExtender>
                                    </td>
                                </tr>
                            </table>
                        </ContentTemplate>
                    </asp:UpdatePanel>
                    &nbsp;&nbsp;  <asp:Button ID="btnViewPDF" runat="server" CssClass="Button" Text="View PDF" Width="90"
                        OnClick="btnViewPDF_Click" />
                    <asp:Button ID="btnViewExcel" runat="server" CssClass="Button" Text="View Excel"
                        Width="90" OnClick="btnViewExcel_Click" />
                </td>
            </tr>
        </table>
    </div>
</asp:Content>
