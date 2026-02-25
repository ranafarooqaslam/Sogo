<%@ Page Language="C#" AutoEventWireup="true" CodeFile="rptLoadPass.aspx.cs" Inherits="Forms_rptLoadPass" MasterPageFile ="~/Forms/PageMaster.master" Title="SAMS: Order Booker Reports" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>

<asp:Content ID = "content1" runat = "server" ContentPlaceHolderID ="cphPage">
    
<div id="right_data">
        <table width="100%">
            <tr>
                <td >
                    <asp:UpdatePanel id="UpdatePanel1" runat="server">
                        <contenttemplate>
<TABLE><TBODY><TR><TD align=left colSpan=4><asp:Label id="lblErrorMsg" runat="server" ForeColor="Red" Font-Bold="True"></asp:Label> </TD><TD style="WIDTH: 1px" align=left colSpan=1></TD></TR>
    <tr>
        <td align="left" style="width: 1px; height: 1px">
        </td>
        <td align="left" style="width: 29px; height: 1px">
            <strong><asp:Label ID="Label4" runat="server" Text="Report Type" Width="85px"></asp:Label></strong></td>
        <td align="left" style="width: 1px; height: 1px">
        </td>
        <td align="left" style="width: 203px; height: 1px">
            <asp:RadioButtonList ID="RbReportType" runat="server" AutoPostBack="True" OnSelectedIndexChanged="RbReportType_SelectedIndexChanged"
                Width="141px">
                <asp:ListItem Selected="True">Load Pass  Summary</asp:ListItem>
                <asp:ListItem>Order Booker Sheet</asp:ListItem>
            </asp:RadioButtonList></td>
        <td align="left" style="width: 1px; height: 1px">
        </td>
    </tr>
    <TR><TD style="HEIGHT: 25px" align=left></TD><TD style="HEIGHT: 25px" align=left>
    <strong><asp:Label id="Label2" runat="server" Width="48px" Text="Location"></asp:Label></strong></TD><TD style="HEIGHT: 25px" align=left></TD><TD style="HEIGHT: 25px" align=left><asp:DropDownList id="DrpLocation" runat="server" Width="210px" AutoPostBack="True" OnSelectedIndexChanged="DrpLocation_SelectedIndexChanged"></asp:DropDownList></TD><TD style="HEIGHT: 25px" align=left></TD></TR><TR><TD style="WIDTH: 1px" align=left></TD><TD style="height: 25px;" align=left>
            <strong><asp:Label ID="Label6" runat="server" Text="Order Booker" Width="94px"></asp:Label></strong></TD><TD style="WIDTH: 1px" align=left></TD><TD style="WIDTH: 203px; HEIGHT: 25px" align=left>
            <asp:DropDownList ID="DrpOrderBooker" runat="server" Width="209px">
            </asp:DropDownList></TD><TD style="WIDTH: 1px; HEIGHT: 25px" align=left></TD></TR>
    <tr>
        <td align="left" style="width: 1px; height: 25px">
        </td>
        <td align="left" style="height: 25px">
    <strong><asp:Label ID="lbltoLocation" runat="server" Text="Principal" Width="61px"></asp:Label></strong></td>
        <td align="left" style="width: 1px; height: 25px">
        </td>
        <td align="left" style="width: 203px; height: 25px">
            <asp:DropDownList id="drpPrincipal" runat="server" Width="210px">
</asp:DropDownList></td>
        <td align="left" style="width: 1px; height: 25px">
        </td>
    </tr>
    <TR><TD style="WIDTH: 1px; HEIGHT: 25px" align=left></TD><TD style="HEIGHT: 25px" align=left>
    <strong><asp:Label id="Label1" runat="server" Width="59px" Text="From Date"></asp:Label></strong></TD><TD style="WIDTH: 1px; HEIGHT: 25px" align=left></TD><TD style="WIDTH: 203px; HEIGHT: 25px" align=left><asp:TextBox id="txtFromDate" runat="server" Width="153px" CssClass="txtBox" MaxLength="10"></asp:TextBox> <asp:ImageButton id="ImgBntFromCalc" runat="server" ImageUrl="~/App_Themes/Granite/Images/date.gif"></asp:ImageButton></TD><TD style="WIDTH: 1px; HEIGHT: 25px" align=left></TD></TR><TR><TD style="WIDTH: 1px; HEIGHT: 25px" align=left></TD><TD style="HEIGHT: 25px" align=left>
    <strong><asp:Label id="Label3" runat="server" Width="57px" Text="To  Date"></asp:Label></strong></TD><TD style="WIDTH: 1px; HEIGHT: 25px" align=left></TD><TD style="WIDTH: 203px; HEIGHT: 25px" align=left><asp:TextBox id="txtToDate" runat="server" Width="153px" CssClass="txtBox" MaxLength="10"></asp:TextBox> <asp:ImageButton id="ImgToDate" runat="server" ImageUrl="~/App_Themes/Granite/Images/date.gif"></asp:ImageButton></TD><TD style="WIDTH: 1px; HEIGHT: 25px" align=left></TD></TR></TBODY></TABLE>  
                            <cc1:CalendarExtender ID="CalendarExtender1" runat="server" EnableViewState="False"
                                Format="dd-MMM-yyyy" PopupButtonID="ImgBntFromCalc" TargetControlID="txtFromDate">
                            </cc1:CalendarExtender>
                            <cc1:CalendarExtender ID="CalendarExtender2" runat="server" EnableViewState="False"
                                Format="dd-MMM-yyyy" PopupButtonID="ImgToDate" TargetControlID="txtToDate">
                            </cc1:CalendarExtender>
</contenttemplate>
                    </asp:UpdatePanel>                 
                    <br />
<asp:Button ID="btnViewPDF" runat="server" CssClass="Button" Width="90" Text="View PDF"  OnClick="btnViewPDF_Click" />
<asp:Button ID="btnViewExcel" runat="server" Text="View Excel" CssClass="Button" Width="90" OnClick="btnViewExcel_Click" /></td>
            </tr>
        </table>
        
           </div>
</asp:Content>
