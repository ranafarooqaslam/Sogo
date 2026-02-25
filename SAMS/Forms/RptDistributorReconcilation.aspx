<%@ Page Language="C#" MasterPageFile="~/Forms/PageMaster.master" AutoEventWireup="true"
    CodeFile="RptDistributorReconcilation.aspx.cs" Inherits="Forms_RptDistributorReconcilation"
    Title="SAMS: SKU Wise Branch Sales" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<asp:Content ID="Content1" runat="server" ContentPlaceHolderID="cphPage">
    <script language="JavaScript" type="text/javascript">
        function ValidateForm() {

            return true;
        }

        function SelectAllCategory() {
            var chkBoxList = document.getElementById('<%= cblCategory.ClientID %>');
            var chkBox = document.getElementById('<%=cbCategory.ClientID %>');
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
                            <table width="100%">
                                <tr>
                                    <td style="width:40%;">
                                        <table width="100%">
                                            <tr>
                                                <td style="width:30%;">
                                                    <strong>
                                                        <asp:Label ID="Label7" runat="server" Text="Location Type" Width="101px"></asp:Label>
                                                    </strong>
                                                </td>
                                                <td style="width:70%;">
                                                    <asp:DropDownList ID="ddDistributorType" runat="server" Width="200px"
                                                        OnSelectedIndexChanged="ddDistributorType_SelectedIndexChanged" AutoPostBack="True">
                                                    </asp:DropDownList>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td style="width:30%;">
                                                    <strong>
                                                        <asp:Label ID="lbltoLocation" runat="server" Text="Location" Width="66px"></asp:Label>
                                                    </strong>
                                                </td>
                                                <td style="width:70%;">
                                                    <asp:DropDownList ID="drpDistributor" runat="server" Width="200px" AutoPostBack="true" OnSelectedIndexChanged="drpDistributor_SelectedIndexChanged">
                                                    </asp:DropDownList>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td style="width:30%;">
                                                    <strong>
                                                        <asp:Label ID="Label11" runat="server" Text="Channel" Width="66px"></asp:Label>
                                                    </strong>
                                                </td>
                                                <td style="width:70%;">
                                                    <asp:DropDownList ID="ddlChannel" runat="server" Width="200px">
                                                    </asp:DropDownList>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td style="width:30%;">
                                                    <strong>
                                                        <asp:Label ID="Label2" runat="server" Text="City" Width="66px"></asp:Label>
                                                    </strong>
                                                </td>
                                                <td style="width:70%;">
                                                    <asp:DropDownList ID="ddlCity" runat="server" Width="200px">
                                                    </asp:DropDownList>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td style="width:30%;">
                                                    <strong>
                                                        <asp:Label ID="Label1" runat="server" Text="Area" Width="66px"></asp:Label>
                                                    </strong>
                                                </td>
                                                <td style="width:70%;">
                                                    <asp:DropDownList ID="ddlArea" runat="server" Width="200px" AutoPostBack="true" OnSelectedIndexChanged="ddlArea_SelectedIndexChanged">
                                                    </asp:DropDownList>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td style="width:30%;">
                                                    <strong>
                                                        <asp:Label ID="Label5" runat="server" Text="Customer" Width="66px"></asp:Label>
                                                    </strong>
                                                </td>
                                                <td style="width:70%;">
                                                    <asp:DropDownList ID="ddlCustomer" runat="server" Width="200px">
                                                    </asp:DropDownList>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td style="width:30%;">
                                                    <strong>
                                                        <asp:Label ID="Label8" runat="server" Text="Principal" Width="66px"></asp:Label>
                                                    </strong>
                                                </td>
                                                <td style="width:70%;">
                                                    <asp:DropDownList ID="DrpPrincipal" runat="server" Width="200px" AutoPostBack="true" OnSelectedIndexChanged="DrpPrincipal_SelectedIndexChanged" >
                                                    </asp:DropDownList>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td style="width:30%;">
                                                    <strong>
                                                        <asp:Label ID="Label6" runat="server" Text="SKU" Width="66px"></asp:Label>
                                                    </strong>
                                                </td>
                                                <td style="width:70%;">
                                                    <asp:DropDownList ID="ddlSKU" runat="server" Width="200px">
                                                    </asp:DropDownList>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td style="width:30%;">
                                                    <strong>
                                                        <asp:Label ID="Label10" runat="server" Text="From Date" Width="66px"></asp:Label>
                                                    </strong>
                                                </td>
                                                <td style="width:70%;">
                                                    <asp:TextBox ID="txtStartDate" runat="server" CssClass="txtBox" MaxLength="10"
                                                        onkeyup="BlockStartDateKeyPress()" Width="150px"></asp:TextBox>
                                                    <asp:ImageButton ID="ibtnStartDate" runat="server" ImageUrl="~/App_Themes/Granite/Images/date.gif"
                                                        Width="16px" />
                                                </td>
                                            </tr>
                                            <tr>
                                                <td style="width:30%;">
                                                    <strong>
                                                        <asp:Label ID="Label3" runat="server" Text="To Date" Width="66px"></asp:Label>
                                                    </strong>
                                                </td>
                                                <td style="width:70%;">
                                                    <asp:TextBox ID="txtEndDate" runat="server" CssClass="txtBox " MaxLength="10"
                                                        onkeyup="BlockEndDateKeyPress()" Width="150px"></asp:TextBox>
                                                    <asp:ImageButton ID="ibnEndDate" runat="server" ImageUrl="~/App_Themes/Granite/Images/date.gif"
                                                        Width="16px" />
                                                </td>
                                            </tr>
                                        </table>
                                    </td>
                                    <td style="width:60%;" valign="top">
                                        <table width="100%">                                            
                                            <tr>
                                                <td>
                                                    <asp:Panel ID="pnlcatgory"  runat="server"  Width="354" Height="275px">
                                                    <asp:CheckBox ID="cbCategory" runat="server" Text="SKU Category" onclick="SelectAllCategory()" Checked="true" AutoPostBack="true"
                                                        OnCheckedChanged="cbCategory_CheckedChanged"/>
                                                    <br />
                                                    <asp:Panel ID="pnlSubCategory" runat="server" ScrollBars="Vertical" BorderWidth="1px" Width="400px" Height="360px">
                                                        <asp:CheckBoxList ID="cblCategory" runat="server" AutoPostBack="true" Width="380"
                                                            OnSelectedIndexChanged="cblCategory_SelectedIndexChanged"></asp:CheckBoxList>
                                                    </asp:Panel>
                                                        </asp:Panel>
                                                </td>
                                            </tr>
                                        </table>
                                    </td>
                                </tr>
                            </table>
                            <table>
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
                    &nbsp; &nbsp;
                    <asp:Button ID="btnViewPDF" runat="server" CssClass="Button" Width="90" Text="View PDF"
                        OnClick="btnViewPDF_Click" />
                    <asp:Button ID="btnViewExce" runat="server" CssClass="Button" Width="90" Text="View Excel"
                        OnClick="btnViewExce_Click" />
                </td>
            </tr>
        </table>
        &nbsp;
    </div>
</asp:Content>
