<%@ Page Language="C#" AutoEventWireup="true" CodeFile="frmHHPosting.aspx.cs" Inherits="Forms_frmHHPosting"
    MasterPageFile="~/Forms/PageMaster.master" Title="SAMS: HHT Order Posting" %>

<asp:Content ID="Content1" ContentPlaceHolderID="cphPage" runat="Server">
    <script type="text/javascript" src="../AjaxLibrary/jquery.searchabledropdown-1.0.8.min.js"></script>
    <script language="JavaScript" type="text/javascript">
        function pageLoad() {
            $("select").searchable();
        }
    </script>
    <div id="right_data">
        <asp:UpdatePanel ID="UpdatePanel3" runat="server">
            <ContentTemplate>
                <div class="container">
                    <h2>
                        &nbsp;HHT Order Posting&nbsp;
                    </h2>
                    <div class="container">
                        <table style="width: 404px; height: 76px">
                            <tbody>
                                <tr>
                                    <td style="width: 32px">
                                    </td>
                                    <td style="width: 327px">
                                    </td>
                                    <td style="width: 327px">
                                        <strong>
                                            <asp:Label ID="Label1" runat="server" Width="262px" ForeColor="Transparent"></asp:Label></strong>
                                    </td>
                                </tr>
                                <tr>
                                    <td style="width: 32px; height: 32px">
                                        <strong>
                                            <asp:Label ID="lblSalesForce" runat="server" Width="81px" Height="18px" Text="Sales Force"
                                               ></asp:Label></strong>
                                    </td>
                                    <td style="width: 327px; height: 32px" align="left">
                                        <asp:DropDownList ID="ddSalesForce" runat="server" Width="200px">
                                        </asp:DropDownList>
                                    </td>
                                    <td style="width: 327px; height: 32px" align="left">
                                        &nbsp;
                                        <asp:Button ID="btnGetOrders" OnClick="btnGetOrders_Click1" runat="server" Text="Get Orders"
                                            CssClass="Button" />
                                    </td>
                                    <td style="height: 32px" align="left">
                                    </td>
                                </tr>
                            </tbody>
                        </table>
                    </div>
                    <div id="DivGrid" class="container" runat="server" visible="false">
                        <table>
                            <tbody>
                                <tr>
                                    <td style="width: 101px" align="left">
                                        <asp:CheckBox ID="chkSelectAll" runat="server" Visible="False" Width="99px" Text="Select All"
                                            AutoPostBack="True" OnCheckedChanged="chkSelectAll_CheckedChanged"></asp:CheckBox>
                                    </td>
                                </tr>
                                <tr>
                                    <td align="left">
                                    </td>
                                </tr>
                            </tbody>
                        </table>
                        <asp:Panel ID="Panel2" runat="server" Width="100%" Height="250px" ScrollBars="Vertical">
                            <asp:GridView ID="GridSalesOrder" runat="server" Width="735px" Height="1px" ForeColor="SteelBlue"
                                CssClass="gridRow2" BorderStyle="Solid" AutoGenerateColumns="False" BackColor="White"
                                BorderColor="Gray" HorizontalAlign="Center">
                                <PagerSettings PreviousPageText="Previous" Mode="NextPrevious" LastPageText="" FirstPageText=""
                                    NextPageText="Next"></PagerSettings>
                                <FooterStyle BackColor="White"></FooterStyle>
                                <Columns>
                                    <asp:TemplateField HeaderText="SaleOrder">
                                        <ItemStyle BorderStyle="Solid" BorderWidth="1px" BorderColor="Silver" HorizontalAlign="Center">
                                        </ItemStyle>
                                        <ItemTemplate>
                                            <asp:CheckBox ID="ChbSelect" runat="server" />
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:BoundField DataField="DocumentDate" HeaderText="Order Date" HtmlEncode="False"
                                        DataFormatString="{0:dd-MM-yyyy}">
                                        <ItemStyle BorderStyle="Solid" BorderWidth="1px" BorderColor="Silver"></ItemStyle>
                                    </asp:BoundField>
                                    <asp:BoundField DataField="HHSaleOrderId" HeaderText="Order No">
                                        <ItemStyle BorderStyle="Solid" BorderWidth="1px" BorderColor="Silver"></ItemStyle>
                                    </asp:BoundField>
                                    <asp:BoundField DataField="CustomerId" HeaderText="CustomerId">
                                        <ItemStyle CssClass="HidePanel "></ItemStyle>
                                        <HeaderStyle CssClass="HidePanel"></HeaderStyle>
                                    </asp:BoundField>
                                    <asp:BoundField DataField="DISTRIBUTOR_ID" HeaderText="DISTRIBUTOR_ID">
                                        <ItemStyle CssClass="HidePanel "></ItemStyle>
                                        <HeaderStyle CssClass="HidePanel"></HeaderStyle>
                                    </asp:BoundField>
                                    <asp:BoundField DataField="CUSTOMER_NAME" HeaderText="Customer Name">
                                        <ItemStyle BorderStyle="Solid" BorderWidth="1px" BorderColor="Silver"></ItemStyle>
                                    </asp:BoundField>
                                    <asp:BoundField HtmlEncode="False" DataFormatString="{0:F2}" DataField="TotalAmount"
                                        HeaderText="Gross Amount">
                                        <ItemStyle BorderStyle="Solid" BorderWidth="1px" BorderColor="Silver"></ItemStyle>
                                    </asp:BoundField>
                                    <asp:BoundField HtmlEncode="False" DataFormatString="{0:F2}" DataField="SchDiscountAmount"
                                        HeaderText="Scheme Amount">
                                        <ItemStyle BorderStyle="Solid" BorderWidth="1px" BorderColor="Silver"></ItemStyle>
                                    </asp:BoundField>
                                    <asp:BoundField HtmlEncode="False" DataFormatString="{0:F2}" DataField="StdDiscountAmount"
                                        HeaderText="Discount Amount">
                                        <ItemStyle BorderStyle="Solid" BorderWidth="1px" BorderColor="Silver"></ItemStyle>
                                    </asp:BoundField>
                                    <asp:BoundField HtmlEncode="False" DataFormatString="{0:F2}" DataField="GSTAmount"
                                        HeaderText="GST Amount">
                                        <ItemStyle BorderStyle="Solid" BorderWidth="1px" BorderColor="Silver"></ItemStyle>
                                    </asp:BoundField>
                                    <asp:BoundField HtmlEncode="False" DataFormatString="{0:F2}" DataField="TotalNetAmount"
                                        HeaderText="Net Amount">
                                        <ItemStyle BorderStyle="Solid" BorderWidth="1px" BorderColor="Silver"></ItemStyle>
                                    </asp:BoundField>
                                </Columns>
                                <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" CssClass="tblhead">
                                </HeaderStyle>
                            </asp:GridView>
                        </asp:Panel>
                    </div>
                    <div class="container">
                        <table style="width: 404px">
                            <tbody>
                                <tr>
                                    <td style="width: 32px; height: 19px">
                                        <strong>
                                            <asp:Label ID="Label2" runat="server" Width="81px" Height="18px" Text="Order Type"
                                               ></asp:Label></strong>
                                    </td>
                                    <td style="width: 327px; height: 19px">
                                        <asp:DropDownList ID="DrpOrderType" runat="server" Width="200px">
                                            <asp:ListItem Value="214">Cash</asp:ListItem>
                                            <asp:ListItem Value="215">Credit</asp:ListItem>
                                            <asp:ListItem Value="216">Advance</asp:ListItem>
                                        </asp:DropDownList>
                                    </td>
                                    <td style="width: 327px; height: 19px">
                                        <strong>
                                            <asp:Label ID="Label3" runat="server" Width="262px" ForeColor="Transparent"></asp:Label></strong>
                                    </td>
                                </tr>
                                <tr>
                                    <td style="width: 32px; height: 27px">
                                        <strong>
                                            <asp:Label ID="Label4" runat="server" Width="81px" Height="18px" Text="Delivery Man"
                                               ></asp:Label></strong>
                                    </td>
                                    <td style="width: 327px; height: 27px" align="left">
                                        <asp:DropDownList ID="ddDilverMan" runat="server" Width="200px"
                                            Enabled="False">
                                        </asp:DropDownList>
                                    </td>
                                    <td style="width: 327px; height: 27px" align="left">
                                        &nbsp;
                                        <asp:Button ID="btnSave" OnClick="btnSave_Click" runat="server" Text="Save" Enabled="False"
                                            CssClass="Button" />
                                    </td>
                                    <td style="height: 27px" align="left">
                                    </td>
                                </tr>
                            </tbody>
                        </table>
                    </div>
                </div>
                &nbsp;
            </ContentTemplate>
        </asp:UpdatePanel>
    </div>
</asp:Content>
