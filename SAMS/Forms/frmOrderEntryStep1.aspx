<%@ Page Language="C#" MasterPageFile="~/Forms/PageMaster.master" AutoEventWireup="true"
    CodeFile="frmOrderEntryStep1.aspx.cs" Inherits="Forms_frmOrderEntryStep1" Title="SAMS: Order/Invoice Step 1" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<asp:Content ID="Content1" runat="server" ContentPlaceHolderID="cphPage">
    <script type="text/javascript" src="../AjaxLibrary/jquery.searchabledropdown-1.0.8.min.js"></script>
    <script language="JavaScript" type="text/javascript">
        function pageLoad() {
            $("select").searchable();
        }
    </script>
    <div id="right_data">
        <div>
            <span class="heading">Order/Invoice Step 1</span>
        </div>
        <div>
            <table width="100%">
                <tr>
                    <td align="left">
                        <div style="z-index: 101; left: 597px; width: 100px; position: absolute; top: 309px;
                            height: 100px">
                            <asp:Panel ID="Panel2" runat="server">
                                <asp:UpdateProgress ID="UpdateProgress1" runat="server" AssociatedUpdatePanelID="UpdatePanel2">
                                    <ProgressTemplate>
                                        <asp:ImageButton ID="ImageButton1" runat="server" Height="26px" ImageUrl="~/App_Themes/Granite/Images/image003.gif"
                                            Width="27px" />
                                        Wait Update.......
                                    </ProgressTemplate>
                                </asp:UpdateProgress>
                            </asp:Panel>
                        </div>
                    </td>
                    <td align="left">
                        <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                            <ContentTemplate>
                                <table>
                                    <tbody>
                                        <tr>
                                            <td align="left">
                                                <strong>
                                                    <asp:Label ID="Label2" runat="server" Width="104px" Text="Transaction Type"></asp:Label></strong>
                                            </td>
                                            <td style="width: 238px; height: 25px" align="left">
                                                <asp:DropDownList ID="DrpDocumentType" runat="server" Width="200px">                                                    
                                                    <asp:ListItem Value="1">Sales Invoice</asp:ListItem>
                                                    <asp:ListItem Value="2">Sale Return</asp:ListItem>
                                                </asp:DropDownList>
                                               
                                            </td>
                                        </tr>
                                        <tr>
                                            <td align="left">
                                                <strong>
                                                    <asp:Label ID="lbltoLocation" runat="server" Width="94px" Text="Location"></asp:Label></strong>
                                            </td>
                                            <td style="width: 238px; height: 25px" align="left">
                                                <asp:DropDownList ID="drpDistributor" runat="server" Width="200px"
                                                    AutoPostBack="True" OnSelectedIndexChanged="drpDistributor_SelectedIndexChanged">
                                                </asp:DropDownList>
                                            </td>
                                        </tr>                                        
                                        <tr>
                                            <td align="left">
                                                <strong>
                                                    <asp:Label ID="lblfromLocation" runat="server" Width="94px" Text="Customer Area"
                                                       ></asp:Label></strong>
                                            </td>
                                            <td style="width: 238px; height: 25px" align="left">
                                                <asp:DropDownList ID="DrpRoute" runat="server" Width="200px"
                                                    AutoPostBack="True" OnSelectedIndexChanged="DrpRoute_SelectedIndexChanged">
                                                </asp:DropDownList>
                                            </td>
                                        </tr>
                                        <tr style="display:none;">
                                            <td align="left">
                                                <strong>
                                                    <asp:Label ID="Label6" runat="server" Width="94px" Text="Order Booker"></asp:Label></strong>
                                            </td>
                                            <td style="width: 238px; height: 25px" align="left">
                                                <asp:DropDownList ID="DrpOrderBooker" runat="server" Width="200px">
                                                </asp:DropDownList>
                                            </td>
                                        </tr>
                                        <tr style="display:none;">
                                            <td align="left">
                                                <strong>
                                                    <asp:Label ID="Label5" runat="server" Width="94px" Text="Sale Force"></asp:Label></strong>
                                            </td>
                                            <td style="width: 238px; height: 25px" align="left">
                                                <asp:DropDownList ID="DrpDeliveryMan" runat="server" Width="200px">
                                                </asp:DropDownList>
                                            </td>
                                        </tr>                                        
                                        <tr>
                                            <td align="left">
                                                
                                            </td>
                                            <td style="width: 238px; height: 25px" align="left">
                                                
                                            </td>
                                        </tr>
                                        <tr>
                                            <td align="right">
                                                <asp:Button ID="btnGetOrder" OnClick="btnGetOrder_Click" runat="server" Width="100px"
                                                    Font-Size="8pt" Text="Get Order" CssClass="Button" Visible="False" />
                                            </td>
                                            <td style="width: 238px; height: 25px" align="left">
                                                <asp:Button ID="btnNext" OnClick="btnNext_Click" runat="server" Width="100px" Font-Size="8pt"
                                                    Text="Next" CssClass="Button" />
                                            </td>
                                        </tr>
                                        <tr>
                                            <td align="right" colspan="2">
                                                <asp:GridView ID="GrdFreeSKU" runat="server" Visible="False" Width="100%" Height="57px"
                                                    ForeColor="Red" CssClass="gridRow2" AutoGenerateColumns="False" BackColor="White"
                                                    BorderColor="White" HorizontalAlign="Center">
                                                    <PagerSettings FirstPageText="" LastPageText="" Mode="NextPrevious" NextPageText="Next"
                                                        PreviousPageText="Previous" />
                                                    <RowStyle BorderColor="Silver" BorderStyle="Solid" BorderWidth="1px" ForeColor="Black" />
                                                    <Columns>
                                                        <asp:BoundField DataField="SALE_ORDER_ID" HeaderText="Order Id">
                                                            <HeaderStyle HorizontalAlign="Left" />
                                                            <ItemStyle BorderColor="Silver" BorderStyle="Solid" BorderWidth="1px" HorizontalAlign="Left" />
                                                        </asp:BoundField>
                                                        <asp:BoundField DataField="SKU_Code" HeaderText="SKU Code">
                                                            <HeaderStyle HorizontalAlign="Left" />
                                                            <ItemStyle BorderColor="Silver" BorderStyle="Solid" BorderWidth="1px" HorizontalAlign="Left"
                                                                Width="80px" />
                                                        </asp:BoundField>
                                                        <asp:BoundField DataField="QUANTITY_UNIT" HeaderText="Order Qty">
                                                            <HeaderStyle HorizontalAlign="Center" />
                                                            <ItemStyle BorderColor="Silver" BorderStyle="Solid" BorderWidth="1px" HorizontalAlign="Center" />
                                                        </asp:BoundField>
                                                        <asp:BoundField DataField="BALANCE" HeaderText="Stock">
                                                            <HeaderStyle HorizontalAlign="Center" />
                                                            <ItemStyle BorderColor="Silver" BorderStyle="Solid" BorderWidth="1px" HorizontalAlign="Center"
                                                                Width="50px" />
                                                        </asp:BoundField>
                                                    </Columns>
                                                    <FooterStyle BackColor="White" />
                                                    <PagerStyle BackColor="Transparent" />
                                                    <HeaderStyle BackColor="Red" BorderColor="Black" BorderStyle="Solid" BorderWidth="1px"
                                                        ForeColor="Black" />
                                                </asp:GridView>
                                                <asp:GridView ID="gvRateDifference" runat="server" Visible="False" Width="100%" Height="57px"
                                                    ForeColor="Red" CssClass="gridRow2" AutoGenerateColumns="False" BackColor="White"
                                                    BorderColor="White" HorizontalAlign="Center">
                                                    <PagerSettings PreviousPageText="Previous" Mode="NextPrevious" LastPageText="" FirstPageText=""
                                                        NextPageText="Next"></PagerSettings>
                                                    <FooterStyle BackColor="White"></FooterStyle>
                                                    <Columns>
                                                        <asp:BoundField DataField="SALE_ORDER_ID" HeaderText="Order Id">
                                                            <ItemStyle BorderStyle="Solid" BorderWidth="1px" BorderColor="Silver" HorizontalAlign="Left">
                                                            </ItemStyle>
                                                            <HeaderStyle HorizontalAlign="Left"></HeaderStyle>
                                                        </asp:BoundField>
                                                        <asp:BoundField DataField="SKU_Code" HeaderText="SKU Code">
                                                            <ItemStyle BorderStyle="Solid" Width="80px" BorderWidth="1px" BorderColor="Silver"
                                                                HorizontalAlign="Left"></ItemStyle>
                                                            <HeaderStyle HorizontalAlign="Left"></HeaderStyle>
                                                        </asp:BoundField>
                                                        <asp:BoundField DataField="Order_Rate" HeaderText="Order Rate">
                                                            <ItemStyle BorderStyle="Solid" BorderWidth="1px" BorderColor="Silver" HorizontalAlign="Center">
                                                            </ItemStyle>
                                                            <HeaderStyle HorizontalAlign="Center"></HeaderStyle>
                                                        </asp:BoundField>
                                                        <asp:BoundField DataField="SSR_Rate" HeaderText="SSR Rate">
                                                            <ItemStyle BorderStyle="Solid" Width="50px" BorderWidth="1px" BorderColor="Silver"
                                                                HorizontalAlign="Center"></ItemStyle>
                                                            <HeaderStyle HorizontalAlign="Center"></HeaderStyle>
                                                        </asp:BoundField>
                                                    </Columns>
                                                    <RowStyle BorderStyle="Solid" ForeColor="Black" BorderWidth="1px" BorderColor="Silver">
                                                    </RowStyle>
                                                    <PagerStyle BackColor="Transparent"></PagerStyle>
                                                    <HeaderStyle BackColor="Red" BorderStyle="Solid" ForeColor="Black" BorderWidth="1px"
                                                        BorderColor="Black"></HeaderStyle>
                                                </asp:GridView>
                                            </td>
                                        </tr>
                                    </tbody>
                                </table>
                            </ContentTemplate>
                        </asp:UpdatePanel>
                    </td>
                    <td>
                    </td>
                </tr>
            </table>
        </div>
        <div>
            <table width="100%">
                <tr>
                    <td style="width: 100px; height: 173px;" align="left" valign="top">
                        <asp:UpdatePanel ID="UpdatePanel2" runat="server">
                            <ContentTemplate>
                                <table style="width: 700px;">
                                    <tbody>
                                        <tr>
                                            <td>
                                                <strong>
                                                    <asp:CheckBox ID="cbAll" runat="server" Width="103px" Text="Select All" AutoPostBack="True"
                                                        OnCheckedChanged="cbAll_CheckedChanged" Visible="False"></asp:CheckBox>
                                                </strong>
                                            </td>
                                            <td>
                                                <strong>
                                                    <asp:Label ID="Label3" runat="server" Width="100px" Text="Payment Mode" 
                                                    Visible="False"></asp:Label></strong>
                                            </td>
                                            <td>
                                                <asp:DropDownList ID="ddSearchType" runat="server" Width="176px" 
                                                    Visible="False">
                                                    <asp:ListItem Value="214">Cash</asp:ListItem>
                                                    <asp:ListItem Value="215">Credit</asp:ListItem>
                                                    <asp:ListItem Value="216">Advance</asp:ListItem>
                                                </asp:DropDownList>
                                            </td>
                                            <td>
                                                <asp:Button ID="btnPost" OnClick="btnPost_Click" runat="server" Width="128px" Font-Size="8pt"
                                                    Text="Convert to Invoice" CssClass="Button" Visible="False" />
                                            </td>
                                            <td>
                                                <asp:Button ID="btnPrint" runat="server" Width="104px" Font-Size="8pt" Text="Print Invoice"
                                                    CssClass="Button" Visible="False" />
                                            </td>
                                        </tr>
                                        <tr>
                                            <td style="width: 500px; height: 21px" colspan="5">
                                                <asp:Panel ID="Panel1" runat="server" Width="730px" Height="180px" ScrollBars="Vertical" Visible="false">
                                                    <asp:GridView ID="GrdOrder" runat="server" AutoGenerateColumns="False" BackColor="White"
                                                        BorderColor="White" CssClass="gridRow2" ForeColor="SteelBlue" HorizontalAlign="Center"
                                                        Width="700px">
                                                        <PagerSettings FirstPageText="" LastPageText="" Mode="NextPrevious" NextPageText="Next"
                                                            PreviousPageText="Previous" />
                                                        <Columns>
                                                            <asp:BoundField DataField="CUSTOMER_ID" HeaderText="Customer Id">
                                                                <HeaderStyle CssClass="HidePanel" />
                                                                <ItemStyle CssClass="HidePanel" />
                                                            </asp:BoundField>
                                                            <asp:TemplateField HeaderText="Select">
                                                                <ItemTemplate>
                                                                    <asp:CheckBox ID="ChbInvoice" runat="server" />
                                                                </ItemTemplate>
                                                                <ItemStyle BorderColor="Silver" BorderStyle="Solid" BorderWidth="1px" />
                                                            </asp:TemplateField>
                                                            <asp:BoundField DataField="CUSTOMER_CODE" HeaderText="Code">
                                                                <ItemStyle BorderColor="Silver" BorderStyle="Solid" BorderWidth="1px" HorizontalAlign="Left" />
                                                            </asp:BoundField>
                                                            <asp:BoundField DataField="CUSTOMER_NAME" HeaderText="Name">
                                                                <ItemStyle BorderColor="Silver" BorderStyle="Solid" BorderWidth="1px" HorizontalAlign="Left" />
                                                            </asp:BoundField>
                                                            <asp:BoundField DataField="SALE_ORDER_ID" HeaderText="Sale Order Id">
                                                                <ItemStyle BorderColor="Silver" BorderStyle="Solid" BorderWidth="1px" HorizontalAlign="Center" />
                                                            </asp:BoundField>
                                                            <asp:BoundField DataField="DOCUMENT_DATE" HeaderText="Order Date">
                                                                <ItemStyle BorderColor="Silver" BorderStyle="Solid" BorderWidth="1px" HorizontalAlign="Center" />
                                                            </asp:BoundField>
                                                            <asp:BoundField DataField="TOTAL_AMOUNT" DataFormatString="{0:F2}" HeaderText="Gross Amount">
                                                                <ItemStyle BorderColor="Silver" BorderStyle="Solid" BorderWidth="1px" HorizontalAlign="Center" />
                                                            </asp:BoundField>
                                                            <asp:BoundField DataField="DISCOUNT_AMOUNT" DataFormatString="{0:F2}" HeaderText="Discount">
                                                                <ItemStyle BorderColor="Silver" BorderStyle="Solid" BorderWidth="1px" HorizontalAlign="Center" />
                                                            </asp:BoundField>
                                                            <asp:BoundField DataField="SCHEME_AMOUNT" DataFormatString="{0:F2}" HeaderText="Scheme">
                                                                <ItemStyle BorderColor="Silver" BorderStyle="Solid" BorderWidth="1px" HorizontalAlign="Center" />
                                                            </asp:BoundField>
                                                            <asp:BoundField DataField="GST_AMOUNT" DataFormatString="{0:F2}" HeaderText="GST Amount">
                                                                <ItemStyle BorderColor="Silver" BorderStyle="Solid" BorderWidth="1px" HorizontalAlign="Center" />
                                                            </asp:BoundField>
                                                            <asp:BoundField DataField="TOTAL_NET_AMOUNT" DataFormatString="{0:F2}" HeaderText="Net Amount">
                                                                <ItemStyle BorderColor="Silver" BorderStyle="Solid" BorderWidth="1px" HorizontalAlign="Center" />
                                                            </asp:BoundField>
                                                            <asp:BoundField DataField="DELIVERYMAN_ID" HeaderText="DELIVERYMAN_ID">
                                                                <HeaderStyle CssClass="HidePanel" />
                                                                <ItemStyle CssClass="HidePanel" />
                                                            </asp:BoundField>
                                                            <asp:BoundField DataField="MANUAL_ORDER_ID" HeaderText="Bill Book No">
                                                                <HeaderStyle CssClass="HidePanel" />
                                                                <ItemStyle CssClass="HidePanel" />
                                                            </asp:BoundField>
                                                        </Columns>
                                                        <HeaderStyle CssClass="tblhead" HorizontalAlign="Center" VerticalAlign="Middle" />
                                                    </asp:GridView>
                                                </asp:Panel>
                                            </td>
                                        </tr>
                                    </tbody>
                                </table>
                            </ContentTemplate>
                        </asp:UpdatePanel>
                    </td>
                </tr>
            </table>
        </div>
    </div>
</asp:Content>
