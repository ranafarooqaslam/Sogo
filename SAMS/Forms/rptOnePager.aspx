<%@ Page Language="C#" MasterPageFile="~/Forms/PageMaster.master" AutoEventWireup="true"
    CodeFile="rptOnePager.aspx.cs" Inherits="Forms_rptOnePager" Title="SAMS: One Pager Report" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<asp:Content ID="Content1" runat="server" ContentPlaceHolderID="cphPage">
    <script language="JavaScript" type="text/javascript">

        $(document).ready(function () {
            $('#<%=cbSelectAll.ClientID %>').click(function () {
                $("INPUT[type='checkbox']").attr('checked', $('#<%=cbSelectAll.ClientID %>').is(':checked'));
            });

            $('#<%=cblReportFilter.ClientID %> input:checkbox').click(function () {
                CheckSelectAll();
            });

            function CheckSelectAll() {
                var i = 0, j = 0, k = 0;
                $('#<%=cblReportFilter.ClientID %> input:checkbox').each(function () {
                    i = i + 1;
                    if (this.checked == false) {
                        j = j + 1;
                    }
                    else {
                        k = k + 1;
                    }
                });
                if (j < i && j > 0) {
                    $('#<%= cbSelectAll.ClientID %>').attr('checked', false);
                }
                else if (k == i) {
                    $('#<%= cbSelectAll.ClientID %>').attr('checked', true);
                }
            }


        });

        function CheckReportType() {
            var i = 0;

            $('#<%=cblReportFilter.ClientID %> input:checkbox').each(function () {
                if (this.checked == true) {
                    i = i + 1;
                }
            });
            if (i <= 0) {
                alert('Please select atleast one report option');
                return false;
            }
            else {
                return true;
            }
        }


        function ValidateForm() {

            return true;
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
                                        <td style="width: 95px" align="left">
                                            <strong>
                                                <asp:Label ID="Label7" runat="server" Text="Location Type" Width="101px"></asp:Label>
                                            </strong>
                                        </td>
                                        <td style="width: 1px" align="left">
                                        </td>
                                        <td style="height: 25px" align="left">
                                            <asp:DropDownList ID="ddDistributorType" runat="server" Width="200px" 
                                            OnSelectedIndexChanged="ddDistributorType_SelectedIndexChanged" AutoPostBack="True">
                                        </asp:DropDownList>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td align="left">
                                        </td>
                                        <td style="width: 95px" align="left">
                                            <strong>
                                                <asp:Label ID="lbltoLocation" runat="server" Width="94px" Text="Location"></asp:Label></strong>
                                        </td>
                                        <td style="width: 1px" align="left">
                                        </td>
                                        <td style="height: 25px" align="left">
                                            <asp:DropDownList ID="drpDistributor" runat="server" Width="200px">
                                            </asp:DropDownList>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td align="left">
                                        </td>
                                        <td style="width: 95px" align="left">
                                            <strong>
                                                <asp:Label ID="Label3" runat="server" Width="76px" Height="13px" Text="Date"></asp:Label></strong>
                                        </td>
                                        <td style="width: 1px" align="left">
                                        </td>
                                        <td style="height: 25px" align="left">
                                            &nbsp;<asp:TextBox ID="txtDate" onkeyup="BlockStartDateKeyPress()" runat="server"
                                                Width="150px" MaxLength="10"></asp:TextBox>
                                            <asp:ImageButton ID="ibtnStartDate" runat="server" Width="16px" ImageUrl="~/App_Themes/Granite/Images/date.gif">
                                            </asp:ImageButton>
                                            <cc1:CalendarExtender ID="CEStartDate" runat="server" TargetControlID="txtDate"
                                                PopupButtonID="ibtnStartDate" Format="dd-MMM-yyyy">
                                            </cc1:CalendarExtender>
                                        </td>
                                    </tr>                                   
                                    <tr>
                                        <td align="left">
                                        </td>
                                        <td style="width: 95px" align="left">
                                            <asp:CheckBox ID="cbSelectAll" runat="server" Width="86px" Text="Select All" Checked="True" Visible="false">
                                            </asp:CheckBox>
                                        </td>
                                        <td style="width: 1px" align="left">
                                        </td>
                                        <td style="height: 25px" align="left">
                                        </td>
                                    </tr>
                                    <tr>
                                        <td align="left" colspan="4">
                                            <div id="divFilter" class="containeRadioButtons">
                                                <table width="100%">
                                                    <tbody>
                                                        <tr>
                                                            <td align="left">
                                                                <asp:CheckBoxList ID="cblReportFilter" runat="server" Width="350px" RepeatDirection="Horizontal" Visible="false">
                                                                    <asp:ListItem Selected="True" Value="0">A-Inventory</asp:ListItem>
                                                                    <asp:ListItem Selected="True" Value="1">B-Sales</asp:ListItem>
                                                                    <asp:ListItem Selected="True" Value="2">C-Cash</asp:ListItem>
                                                                    <asp:ListItem Selected="True" Value="3">D-Credit</asp:ListItem>
                                                                </asp:CheckBoxList>
                                                            </td>
                                                        </tr>
                                                    </tbody>
                                                </table>
                                            </div>
                                        </td>
                                    </tr>                                    
                                </tbody>
                            </table>
                        </ContentTemplate>
                    </asp:UpdatePanel>
                    &nbsp; &nbsp;
                    <asp:Button ID="btnViewPDF" runat="server" CssClass="Button" Width="90" Text="View PDF"
                        OnClick="btnViewPDF_Click"/>
                    <asp:Button ID="btnViewExcel" runat="server" CssClass="Button" Width="90" Text="View Excel"
                        OnClick="btnViewExcel_Click"/>
                </td>
            </tr>
        </table>
        &nbsp;
    </div>
</asp:Content>
