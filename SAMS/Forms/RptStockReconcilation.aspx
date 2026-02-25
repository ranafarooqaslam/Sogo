<%@ Page Language="C#" MasterPageFile="~/Forms/PageMaster.master" AutoEventWireup="true"
    CodeFile="RptStockReconcilation.aspx.cs" Inherits="Forms_RptStockReconcilation"
    Title="SAMS: Stock Reconciliation" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<asp:Content ID="Content1" runat="server" ContentPlaceHolderID="cphPage">
    <script language="JavaScript" type="text/javascript">
        function ValidateForm() {

            return true;
        }

        function HeaderClick(CheckBox) {
            //Get target base & child control.
            var TargetBaseControl = document.getElementById('<%= this.cblPrincipal.ClientID %>');
            var TargetChildControl = "cbAll";


            //Get all the control of the type INPUT in the base control.
            var Inputs = TargetBaseControl.getElementsByTagName("input");

            //Checked/Unchecked all the checkBoxes in side the GridView.
            for (var n = 0; n < Inputs.length; ++n)

                if (Inputs[n].type == 'checkbox')

                    if (!Inputs[n].disabled) {
                        Inputs[n].checked = CheckBox.checked;
                    }
        }


        function CheckBoxListSelect(cbControl) {
            var chkBoxCount = cbControl.getElementsByTagName("input");
            var cbAll = document.getElementById('<%= this.cbAll.ClientID %>');

            var ListCount = 0;
            
            for (var i = 0; i < chkBoxCount.length; i++) {
                if (chkBoxCount[i].checked) {
                    ListCount++;
                }
            }

            if (ListCount > 0 && ListCount < chkBoxCount.length) {
                cbAll.checked = false;                
            }
            else {
                cbAll.checked = true;
            }
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
                                    <td align="left" colspan="3">
                                        <asp:Label ID="lblErrorMsg" runat="server" ForeColor="Red" Font-Bold="True"></asp:Label>
                                    </td>
                                </tr>
                                <tr>
                                    <td align="left">
                                        <strong>
                                            <asp:Label ID="Label2" runat="server" Text="Rate Impelement" Width="94px"></asp:Label></strong>
                                    </td>
                                    <td align="left">
                                    </td>
                                    <td style="height: 25px" align="left">
                                        <asp:RadioButtonList ID="rblRate" runat="server" RepeatDirection="Horizontal" Width="200px">
                                            <asp:ListItem Selected="True" Text="Trade Price" Value="0"></asp:ListItem>
                                            <asp:ListItem Text="Purchase Price" Value="1"></asp:ListItem>
                                        </asp:RadioButtonList>
                                    </td>
                                </tr>
                                <tr>
                                    <td align="left">
                                        <strong>
                                            <asp:Label ID="lbltoLocation" runat="server" Text="Location" Width="94px"></asp:Label></strong>
                                    </td>
                                    <td align="left">
                                    </td>
                                    <td style="height: 25px" align="left">
                                        <asp:DropDownList ID="drpDistributor" runat="server" Width="200px">
                                        </asp:DropDownList>
                                    </td>
                                </tr>
                                <tr>
                                    <td align="left">
                                        <strong>
                                            <asp:Label ID="Label6" runat="server" Text="Principal" Width="78px"></asp:Label></strong>
                                    </td>
                                    <td align="left">
                                    </td>
                                    <td align="left" style="height: 25px">
                                        <asp:CheckBox ID="cbAll" runat="server" Text="Select All" BorderColor="Silver" BorderWidth="1"  Checked="true" onclick="javascript:HeaderClick(this);"/>
                                        <asp:CheckBoxList ID="cblPrincipal" runat="server" BorderWidth="1" BorderColor="Silver">                                        
                                        </asp:CheckBoxList>
                                    </td>
                                </tr>
                                <tr>
                                    <td align="left">
                                        <strong>
                                            <asp:Label ID="Label1" runat="server" Text="Report Type" Width="78px"></asp:Label></strong>
                                    </td>
                                    <td align="left">
                                    </td>
                                    <td align="left" style="height: 25px">
                                        <asp:DropDownList ID="ddlType" runat="server" Width="200px">
                                            <asp:ListItem Value="0" Text="Units"></asp:ListItem>
                                            <asp:ListItem Value="1" Text="Carton"></asp:ListItem>
                                        </asp:DropDownList>
                                    </td>
                                </tr>
                                <tr>
                                    <td align="left">
                                        
                                    </td>
                                    <td align="left">
                                    </td>
                                    <td align="left" style="height: 25px">
                                        <strong><asp:CheckBox ID="cbZero" runat="server" Text="Zero Elimination" /></strong> 
                                    </td>
                                </tr>
                                <tr>
                                    <td align="left">
                                        <strong>
                                            <asp:Label ID="Label3" runat="server" Height="13px" Text="From Date" Width="76px"></asp:Label></strong>
                                    </td>
                                    <td align="left">
                                    </td>
                                    <td align="left" style="height: 25px">
                                        &nbsp;<asp:TextBox ID="txtStartDate" runat="server" CssClass="txtBox" MaxLength="10"
                                            onkeyup="BlockStartDateKeyPress()" Width="150px"></asp:TextBox>
                                        <asp:ImageButton ID="ibtnStartDate" runat="server" ImageUrl="~/App_Themes/Granite/Images/date.gif"
                                            Width="16px" />
                                    </td>
                                </tr>
                                <tr>
                                    <td align="left">
                                        <strong>
                                            <asp:Label ID="Label4" runat="server" Height="13px" Text="To Date" Width="80px"></asp:Label></strong>
                                    </td>
                                    <td align="left">
                                    </td>
                                    <td align="left" style="height: 25px">
                                        &nbsp;<asp:TextBox ID="txtEndDate" runat="server" CssClass="txtBox " MaxLength="10"
                                            onkeyup="BlockEndDateKeyPress()" Width="150px"></asp:TextBox>
                                        <asp:ImageButton ID="ibnEndDate" runat="server" ImageUrl="~/App_Themes/Granite/Images/date.gif"
                                            Width="16px" />
                                    </td>
                                </tr>
                                <tr>
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
                    <asp:Button ID="btnViewPDF" runat="server" CssClass="Button" Width="90" Text="View PDF"
                        OnClick="btnViewPDF_Click" />
                    <asp:Button ID="btnViewExcel" runat="server" CssClass="Button" Width="90" Text="View Excel"
                        OnClick="btnViewExcel_Click" />
                </td>
            </tr>
        </table>
        &nbsp;
    </div>
</asp:Content>
