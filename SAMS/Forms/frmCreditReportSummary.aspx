<%@ Page Language="C#" MasterPageFile="~/Forms/PageMaster.master" AutoEventWireup="true" CodeFile="frmCreditReportSummary.aspx.cs" Inherits="Forms_frmCreditReportSummary" Title="SAMS: Credit Report" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<asp:Content ID="Content1" runat="server" ContentPlaceHolderID="cphPage">
        <script type="text/javascript">
        
        jQuery(document).ready(function() {

        var CheckrbReport = $('#<%=rbCreditReport.ClientID %>');
	    if(CheckrbReport.attr("checked") != "undefined" && CheckrbReport.attr("checked") == "checked")
	    {
	        jQuery(".container2").show();
	    }
	    else
	    {
	       jQuery(".container2").hide();
	    }
          //toggle the componenet with class msg_body
         $('#<%=rbCreditReport.ClientID %>').click(function()
          {
            jQuery(".container2").show(800);
          });
           $('#<%=rbCreditLimit.ClientID %>').click(function()
          {
            jQuery(".container2").hide(800);
          });
        });
    </script>
<div id="right_data">
        <table>
            <tr>
                <td >
                    <asp:RadioButton id="rbCreditReport" runat="server" Text="Credit Report" 
                        Checked="True" GroupName="ReportType"></asp:RadioButton> 
                    <asp:RadioButton id="rbCreditLimit" runat="server" Text="Credit Limit" 
                        GroupName="ReportType"></asp:RadioButton>
                </td>
            </tr>
            <tr>
                <td>
                    <div id="divUpdatePanel">
                        <asp:UpdatePanel id="UpdatePanel1" runat="server">
                        <ContentTemplate>
<TABLE><TBODY><TR><TD align=left>
<strong><asp:Label id="lbltoLocation" runat="server" Width="94px" Text="Location"></asp:Label></strong> </TD><TD style="HEIGHT: 25px" align=left><asp:DropDownList id="drpDistributor" runat="server" Width="240px" AutoPostBack="True" OnSelectedIndexChanged="drpDistributor_SelectedIndexChanged"></asp:DropDownList> </TD></TR>
<TR>
    <TD align=left>
        <strong><asp:Label id="lblPrincipal" runat="server" Width="78px" Text="Principal"></asp:Label></strong> 
    </TD>
    <TD style="HEIGHT: 25px" align=left>
        <asp:DropDownList id="DrpPrincipal" runat="server" Width="240px" AutoPostBack="true" OnSelectedIndexChanged="DrpPrincipal_SelectedIndexChanged"></asp:DropDownList> 
    </TD>
</TR>
<TR>
    <TD align=left>
        <strong><asp:Label id="Label2" runat="server" Width="78px" Text="Category"></asp:Label></strong> 
    </TD>
    <TD style="HEIGHT: 25px" align=left>
        <asp:DropDownList id="ddlCategory" runat="server" Width="240px"></asp:DropDownList> 
    </TD>
</TR>
<TR>
<TD align=left>
<strong><asp:Label id="lblfromLocation" runat="server" Width="94px" Text="Customer Area"></asp:Label></strong> </TD><TD style="HEIGHT: 25px" align=left><asp:DropDownList id="DrpRoute" runat="server" Width="240px" AutoPostBack="True" OnSelectedIndexChanged="DrpRoute_SelectedIndexChanged"></asp:DropDownList> </TD></TR

<TR><TD align=left>
<strong><asp:Label id="lblOrderBooker" runat="server" Width="79px" Text="Order Booker"></asp:Label></strong> </TD><TD style="HEIGHT: 25px" align=left><asp:DropDownList id="DrpOrderBooker" runat="server" Width="240px"></asp:DropDownList> </TD>
</TR>
<TR><TD align=left>
<strong><asp:Label id="lblSaleForce" runat="server" Width="79px" Text="Sale Force"></asp:Label></strong> </TD><TD style="HEIGHT: 25px" align=left>
<asp:DropDownList id="ddlSaleForce" runat="server" Width="240px"></asp:DropDownList> </TD>
</TR>




<TR><TD align=left>
<strong><asp:Label id="lblNickName" runat="server" Width="79px" Text="Channel Type"></asp:Label></strong> </TD><TD style="HEIGHT: 25px" align=left><asp:DropDownList id="drpChannelType" runat="server" Width="240px"></asp:DropDownList> </TD></TR><TR><TD align=left>
<strong><asp:Label id="lblCustomer" runat="server" Width="79px" Text="Customer"></asp:Label></strong> </TD><TD style="HEIGHT: 25px" align=left><asp:DropDownList id="DrpCustomer" runat="server" Width="240px"></asp:DropDownList> </TD></TR>

<TR><TD align=left>
<strong><asp:Label id="lblTag" runat="server" Width="79px" Text="Credit Type"></asp:Label></strong></TD><TD style="HEIGHT: 25px" align=left>

<asp:DropDownList id="ddlCreditType" runat="server" Width="240px">
<asp:ListItem Value="0">All</asp:ListItem>
<asp:ListItem Value="1">Bill</asp:ListItem>
<asp:ListItem Value="2">Cheque</asp:ListItem>
</asp:DropDownList>

</TD></TR>

<TR><TD align=left>
<strong><asp:Label id="Label1" runat="server" Width="79px" Text="Tag Type"></asp:Label></strong></TD><TD style="HEIGHT: 25px" align=left>

<asp:DropDownList id="ddlTagType" runat="server" Width="240px">
<asp:ListItem Value="0">All</asp:ListItem>
<asp:ListItem Value="600">Normal Credit</asp:ListItem>
<asp:ListItem Value="601">Income Tax Challan</asp:ListItem>
<asp:ListItem Value="602">Shelf Rent</asp:ListItem>
<asp:ListItem Value="645">Disputed Credit</asp:ListItem>
</asp:DropDownList>

</TD></TR>


<TR><TD align=left>
<strong><asp:Label id="lblFromDate" runat="server" Width="76px" Height="13px" Text="From Date"></asp:Label></strong> </TD><TD style="HEIGHT: 25px" align=left>&nbsp; <asp:TextBox id="txtStartDate" onkeyup="BlockStartDateKeyPress()" runat="server" Width="150px" CssClass="txtBox" MaxLength="10"></asp:TextBox> <asp:ImageButton id="ibtnStartDate" runat="server" Width="16px" ImageUrl="~/App_Themes/Granite/Images/date.gif"></asp:ImageButton> <DIV style="Z-INDEX: 101; LEFT: 284px; WIDTH: 100px; POSITION: absolute; TOP: 245px; HEIGHT: 100px"><asp:Panel id="Panel1" runat="server"><asp:UpdateProgress id="UpdateProgress1" runat="server" AssociatedUpdatePanelID="UpdatePanel1"><ProgressTemplate>
&nbsp;<asp:ImageButton id="ImageButton1" runat="server" Width="31px" Height="33px" ImageUrl="~/App_Themes/Granite/Images/image003.gif"></asp:ImageButton> 
</ProgressTemplate>
</asp:UpdateProgress> </asp:Panel> </DIV></TD></TR><TR><TD align=left>
<strong><asp:Label id="lblDateTo" runat="server" Width="80px" Height="13px" Text="To Date"></asp:Label></strong> </TD><TD style="HEIGHT: 25px" align=left>&nbsp; <asp:TextBox id="txtEndDate" onkeyup="BlockEndDateKeyPress()" runat="server" Width="150px" CssClass="txtBox " MaxLength="10"></asp:TextBox> <asp:ImageButton id="ibnEndDate" runat="server" Width="16px" ImageUrl="~/App_Themes/Granite/Images/date.gif"></asp:ImageButton> </TD></TR><TR><TD style="HEIGHT: 25px" align=left><%@ register assembly="AjaxControlToolkit" namespace="AjaxControlToolkit" tagprefix="cc1" %><cc1:CalendarExtender id="CEStartDate" runat="server" TargetControlID="txtStartDate" PopupButtonID="ibtnStartDate" Format="dd-MMM-yyyy"> </cc1:CalendarExtender> <cc1:CalendarExtender id="CEEndDate" runat="server" TargetControlID="txtEndDate" PopupButtonID="ibnEndDate" Format="dd-MMM-yyyy"> </cc1:CalendarExtender> </TD><TD>&nbsp; </TD></TR></TBODY></TABLE>
</ContentTemplate>
                    </asp:UpdatePanel>
                    </div>
                </td>
            </tr>
            <tr>         
                <td>
                    <div id="divFilter" class="container2">
                        <table width="100%">
                            <tbody>
                                <tr>
                                    <td colspan="4">&nbsp;</td>
                                </tr>
                                <tr>
                                    <td></td>
                                    <td>
                                    <strong><asp:Label id="lblSort" runat="server" Width="78px" Text="Sort By"></asp:Label></strong> </td>
                                    <td></td>
                                    <td align="right">
                                        <asp:DropDownList id="DrpSort" runat="server" Width="240px">
                                            <asp:ListItem Value="0">Customer</asp:ListItem>
                                            <asp:ListItem Value="1">Bill Date</asp:ListItem>
                                            <%--<asp:ListItem Value="2">Closing Credit</asp:ListItem>--%>
                                            <%--<asp:ListItem Value="3">Allow Days</asp:ListItem>--%>
                                            <%--<asp:ListItem Value="4">Credit Days</asp:ListItem>--%>
                                            <%--<asp:ListItem Value="5">Over Age</asp:ListItem>--%>
                                           <%-- <asp:ListItem Value="6">Sale Force</asp:ListItem>--%>
                                        </asp:DropDownList> 
                                    </td>
                                </tr>
                                <tr>
                                    <td></td>
                                    <td>
                                    <strong><asp:Label id="lblSortOrder" runat="server" Width="78px" Text="Sort Order"></asp:Label></strong> </td>
                                    <td></td>
                                    <td>
                                        <asp:RadioButtonList id="rbtSortOrder" runat="server" Width="192px" RepeatDirection="Horizontal"> 
                                            <asp:ListItem Selected="True" Text = "Ascending"></asp:ListItem>
                                            <asp:ListItem Text = "Descending"></asp:ListItem>
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
            <tr> 
                <td >
                    <asp:Button ID="btnPDF" runat="server" CssClass="Button" Text="View PDF" Width="90" OnClick="btnPDF_Click" />
                    <asp:Button ID="btnExcel" runat="server" CssClass="Button" Text="View Excel" Width="90" OnClick="btnExcel_Click" />
                </td>
            </tr>
        </table>
    </div> 
</asp:Content>