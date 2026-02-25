<%@ Page Language="C#" MasterPageFile="~/Forms/PageMaster.master" AutoEventWireup="true"
    CodeFile="frmCustomerShifting.aspx.cs" Inherits="Forms_frmCustomerShifting" Title="SAMS: Customer Shifting" %>

<asp:Content ID="Content1" ContentPlaceHolderID="cphPage" runat="Server">
    <script language="javascript" type="text/javascript">

        function UnCheckRouteAll() {
            var chkBox = document.getElementById('<%= ChbSelectAll.ClientID %>');
            var chkBoxList = document.getElementById('<%= ChbAreaList.ClientID %>');
            var chkBoxCount = chkBoxList.getElementsByTagName("input");
            var count = 0;
            for (var i = 0; i < chkBoxCount.length; i++) {
                if (chkBoxCount[i].checked == false) {
                    count += 1;
                }
            }
            if (count > 0) {
                chkBox.checked = false;
            }
            else {
                chkBox.checked = true;
            }
        }

        function CheckBoxListSelect() {
            var chkBoxList = document.getElementById('<%= ChbAreaList.ClientID %>');
            var chkBox = document.getElementById('<%= ChbSelectAll.ClientID %>');
            if (chkBox.checked == true) {
                var chkBoxCount = chkBoxList.getElementsByTagName("input");

                for (var i = 0; i < chkBoxCount.length; i++) {
                    chkBoxCount[i].checked = true;
                }
            }
            else {
                var chkBoxCount = chkBoxList.getElementsByTagName("input");

                for (var i = 0; i < chkBoxCount.length; i++) {
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
                                        <td style="height: 25px" align="left">
                                            <strong>
                                                <asp:Label ID="Label1" runat="server" Width="82px" Text="From Locaton"></asp:Label></strong>
                                        </td>
                                        <td style="height: 10px">
                                            <asp:DropDownList ID="drpfromDistributor" runat="server" Width="200px"
                                                AutoPostBack="True" OnSelectedIndexChanged="drpfromDistributor_SelectedIndexChanged">
                                            </asp:DropDownList>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td style="height: 25px" align="left">
                                            <strong>
                                                <asp:Label ID="Label11" runat="server" Width="88px" Text="From Area"></asp:Label></strong>
                                        </td>
                                        <td style="height: 25px">
                                            <asp:DropDownList ID="DrpfromRoute" runat="server" Width="200px"
                                                AutoPostBack="True" OnSelectedIndexChanged="DrpfromRoute_SelectedIndexChanged">
                                            </asp:DropDownList>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td style="height: 25px" align="left">
                                            <strong>
                                                <asp:Label ID="lblMarketFrom" runat="server" Width="88px" Text="From Sub Area"
                                                    __designer:wfdid="w1"></asp:Label></strong>
                                        </td>
                                        <td style="height: 25px">
                                            <asp:DropDownList ID="DrpFromMarket" runat="server" Width="200px"
                                                AutoPostBack="True" OnSelectedIndexChanged="DrpFromMarket_SelectedIndexChanged"
                                                __designer:wfdid="w2">
                                            </asp:DropDownList>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td style="height: 25px" align="left">
                                            <strong>
                                                <asp:Label ID="Label2" runat="server" Width="80px" Text="To Location"></asp:Label></strong>
                                        </td>
                                        <td style="height: 25px">
                                            <asp:DropDownList ID="DrptoDistributor" runat="server" Width="200px"
                                                AutoPostBack="True" OnSelectedIndexChanged="DrptoDistributor_SelectedIndexChanged">
                                            </asp:DropDownList>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td style="height: 25px" align="left">
                                            <strong>
                                                <asp:Label ID="Label3" runat="server" Width="62px" Text="To Area"></asp:Label></strong>
                                        </td>
                                        <td style="height: 25px">
                                            <asp:DropDownList ID="drptoRoute" runat="server" Width="200px"
                                                AutoPostBack="True" OnSelectedIndexChanged="drptoRoute_SelectedIndexChanged">
                                            </asp:DropDownList>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td style="height: 25px" align="left">
                                            <strong>
                                                <asp:Label ID="lblMarketTo" runat="server" Width="62px" Text="To Sub Area"
                                                    __designer:wfdid="w3"></asp:Label></strong>
                                        </td>
                                        <td style="height: 25px">
                                            <asp:DropDownList ID="DrpToMarket" runat="server" Width="200px"
                                                __designer:wfdid="w4">
                                            </asp:DropDownList>
                                        </td>
                                    </tr>
                                </tbody>
                            </table>
                        </ContentTemplate>
                    </asp:UpdatePanel>
                    <asp:UpdatePanel ID="UpdatePanel2" runat="server">
                        <ContentTemplate>
                            <table>
                                <tr>
                                    <td align="left" rowspan="1">
                                        &nbsp;<asp:CheckBox ID="ChbSelectAll" runat="server" Text="Select All" onclick="CheckBoxListSelect()" />
                                    </td>
                                </tr>
                                <tr>
                                    <td align="left" rowspan="3">
                                        <asp:Panel ID="Panel1" runat="server" BackColor="White" BorderColor="Silver" BorderStyle="Groove"
                                            BorderWidth="1px" Height="200px" ScrollBars="Vertical" Width="300px">
                                            <asp:CheckBoxList ID="ChbAreaList" onclick="UnCheckRouteAll()" runat="server">
                                            </asp:CheckBoxList>
                                        </asp:Panel>
                                    </td>
                                </tr>
                                <tr>
                                </tr>
                            </table>
                            <asp:Button ID="btnSave" runat="server" Font-Size="8pt" OnClick="btnSave_Click" Text="Shift"
                                ValidationGroup="vg" Width="82px" CssClass="Button" />
                        </ContentTemplate>
                    </asp:UpdatePanel>
                </td>
            </tr>
        </table>
    </div>
</asp:Content>
