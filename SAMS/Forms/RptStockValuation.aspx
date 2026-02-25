<%@ Page Language="C#" MasterPageFile="~/Forms/PageMaster.master" AutoEventWireup="true"
    CodeFile="RptStockValuation.aspx.cs" Inherits="Forms_RptStockReconcilation" Title="SAMS: Stock Valuation Report" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<asp:Content ID="Content1" runat="server" ContentPlaceHolderID="cphPage">
    <script language="JavaScript" type="text/javascript">
        function ValidateForm() {

            return true;
        }
         function CheckBoxListSelect() {
            var chkBoxList = document.getElementById('<%= chbCategory.ClientID %>');
            var chkBox = document.getElementById('<%= chbSelectAll.ClientID %>');
            var chkBoxCount;
            var i;
            if (chkBox.checked == true) {
                chkBoxCount = chkBoxList.getElementsByTagName("input");
                for (i = 0; i < chkBoxCount.length; i++) {
                    chkBoxCount[i].checked = true;
                }
            }
            else {
                chkBoxCount = chkBoxList.getElementsByTagName("input");
                for (i = 0; i < chkBoxCount.length; i++) {
                    chkBoxCount[i].checked = false;
                }
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
                                <tbody>
                                    <tr>
                                        <td align="left">
                                        </td>
                                        <td align="left">
                                        </td>
                                        <td style="height: 25px" align="left">
                                            <asp:RadioButtonList ID="rblReportType" runat="server" Width="250px" RepeatDirection="Horizontal">
                                                <asp:ListItem Selected="True" Value="0">Detail</asp:ListItem>
                                                <asp:ListItem Value="1">Summary</asp:ListItem>
                                            </asp:RadioButtonList>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td align="left">
                                            <strong>
                                                <asp:Label ID="Label7" runat="server" Text="Location Type" Width="101px"></asp:Label>
                                            </strong>
                                        </td>
                                        <td align="left">
                                        </td>
                                        <td style="height: 25px" align="left">
                                            <asp:DropDownList ID="ddDistributorType" runat="server" Width="200px" 
                                            OnSelectedIndexChanged="ddDistributorType_SelectedIndexChanged" AutoPostBack="True">
                                        </asp:DropDownList>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td align="left">
                                            <strong>
                                                <asp:Label ID="lbltoLocation" runat="server" Width="94px" Text="Location"></asp:Label></strong>
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
                                                <asp:Label ID="Label6" runat="server" Width="78px" Text="Principal"></asp:Label></strong>
                                        </td>
                                        <td align="left">
                                        </td>
                                        <td style="height: 25px" align="left">
                                            <asp:DropDownList ID="DrpPrincipal" OnSelectedIndexChanged="DrpPrincipal_SelectedIndexChanged" AutoPostBack="true" runat="server" Width="200px">
                                            </asp:DropDownList>
                                        </td>
                                    </tr>
                                     <tr>
                                   
                                     <td></td>
                                     <td></td>
                                     <td><asp:CheckBox ID="chbSelectAll" runat="server" onclick="CheckBoxListSelect()"  Text="Select All" /></td>
                                </tr> 
                                <tr>
                                  
                                    <td align="left">
                                        <strong>
                                            <asp:Label ID="Label2" runat="server" Text="Category" Width="78px"></asp:Label></strong>
                                    </td>
                                    <td align="left">
                                    </td>
                                    <td align="left" style="height: 25px">
                                        <asp:Panel runat="server" Width="200px" ScrollBars="Vertical" Height="150px" BorderWidth="1px" >
                                            <asp:CheckBoxList runat="server" Width="100%" ID="chbCategory"></asp:CheckBoxList>
                                        </asp:Panel>
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
                                                <asp:Label ID="Label4" runat="server" Width="80px" Height="13px" Text="Stock Date"></asp:Label></strong>
                                        </td>
                                        <td align="left">
                                        </td>
                                        <td style="height: 25px" align="left">
                                            &nbsp;<asp:TextBox ID="txtEndDate" onkeyup="BlockEndDateKeyPress()" runat="server"
                                                Width="150px" CssClass="txtBox " MaxLength="10"></asp:TextBox>
                                            <asp:ImageButton ID="ibnEndDate" runat="server" Width="16px" ImageUrl="~/App_Themes/Granite/Images/date.gif">
                                            </asp:ImageButton>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td align="left">
                                        </td>
                                        <td align="left">
                                        </td>
                                        <td style="height: 25px" align="left">
                                            <%@ register assembly="AjaxControlToolkit" namespace="AjaxControlToolkit" tagprefix="cc1" %>
                                            &nbsp;<cc1:CalendarExtender ID="CEEndDate" runat="server" TargetControlID="txtEndDate"
                                                PopupButtonID="ibnEndDate" Format="dd-MMM-yyyy">
                                            </cc1:CalendarExtender>
                                        </td>
                                    </tr>
                                </tbody>
                            </table>
                        </ContentTemplate>
                    </asp:UpdatePanel>
                    <asp:Button ID="btnViewPDF" runat="server" Text="View PDF" Width="90" CssClass="button"
                        OnClick="btnViewPDF_Click" />
                    <asp:Button ID="btnViewExcel" runat="server" Text="View Excel" Width="90" CssClass="button"
                        OnClick="btnViewExcel_Click" />
                </td>
            </tr>
        </table>
        &nbsp;
    </div>
</asp:Content>
