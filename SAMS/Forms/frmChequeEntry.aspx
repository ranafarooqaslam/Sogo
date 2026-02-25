<%@ Page Language="C#" MasterPageFile="~/Forms/PageMaster.master" AutoEventWireup="true"
    CodeFile="frmChequeEntry.aspx.cs" Inherits="Forms_frmChequeEntry" Title="SAMS: Cheque Entry" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<asp:Content ID="Content1" runat="server" ContentPlaceHolderID="cphPage">
    <script language="JavaScript" type="text/javascript">

        Sys.WebForms.PageRequestManager.getInstance().add_beginRequest(startRequest);

        Sys.WebForms.PageRequestManager.getInstance().add_endRequest(endRequest);

        function startRequest(sender, e) {

            document.getElementById('<%=btnSave.ClientID%>').disabled = true;
            document.getElementById('<%=btnCancel.ClientID%>').disabled = true;

        }

        function endRequest(sender, e) {

            document.getElementById('<%=btnSave.ClientID%>').disabled = false;
            document.getElementById('<%=btnCancel.ClientID%>').disabled = false;

        }

        function ValidateForm() {
            var str;
            str = document.getElementById("<%= txtAmount.ClientID %>").value;
            if (str == null || str.length == 0) {
                alert('Must enter Amount');
                return false;
            }
        } 
    </script>
    <script type="text/javascript" src="../AjaxLibrary/jquery.searchabledropdown-1.0.8.min.js"></script>
    <script language="JavaScript" type="text/javascript">
        function pageLoad() {
            $("select").searchable();
        }
    </script>
    <div id="right_data">
        <div>
            <table width="100%">
                <tr>
                    <td>
                        <asp:UpdatePanel ID="UpdatePanel2" runat="server" RenderMode="Inline">
                            <ContentTemplate>
                                <div style="z-index: 101; left: 350px; width: 100px; position: absolute; top: 150px;
                                    height: 100px">
                                    <asp:Panel ID="Panel21" runat="server">
                                        <asp:UpdateProgress ID="UpdateProgress1" runat="server" AssociatedUpdatePanelID="UpdatePanel2">
                                            <ProgressTemplate>
                                                <asp:ImageButton ID="ImageButton1" runat="server" Height="26px" ImageUrl="~/App_Themes/Granite/Images/image003.gif"
                                                    Width="23px" />
                                                Wait Update
                                            </ProgressTemplate>
                                        </asp:UpdateProgress>
                                    </asp:Panel>
                                </div>
                                <table>
                                    <tbody>
                                        <tr>
                                            <td align="left" colspan="2">
                                                <asp:Label ID="lblErrorMsg" runat="server" ForeColor="Red" Font-Bold="True"></asp:Label>
                                            </td>
                                            <td style="width: 157px" align="left" colspan="1">
                                            </td>
                                            <td align="left" colspan="1" style="width: 108px">
                                            </td>
                                            <td style="width: 201px" align="left" colspan="1">
                                            </td>
                                            <td align="left" colspan="1">
                                            </td>
                                        </tr>
                                        <tr>
                                            <td style="height: 17px" align="left">
                                                <strong>
                                                    <asp:Label ID="Label12" runat="server" Width="84px" Text="Cheque Type"></asp:Label></strong>
                                            </td>
                                            <td style="width: 201px; height: 17px" align="left">
                                                <asp:DropDownList ID="DrpChequeType" runat="server" Width="226px"
                                                    OnSelectedIndexChanged="DrpChequeType_SelectedIndexChanged" AutoPostBack="True">
                                                    <asp:ListItem>Cheque Realized</asp:ListItem>
                                                    <asp:ListItem Selected="True">Cheque Advance</asp:ListItem>
                                                </asp:DropDownList>
                                            </td>
                                            <td style="width: 157px; height: 17px" align="left">
                                            </td>
                                            <td style="height: 17px; width: 108px;" align="left">
                                                <strong>
                                                    <asp:Label ID="Label7" runat="server" Width="66px" Text="Sale Force"></asp:Label></strong>
                                            </td>
                                            <td style="width: 201px; height: 17px" align="left">
                                                <asp:DropDownList ID="DrpDeliveryMan" runat="server" Width="240px"
                                                    OnSelectedIndexChanged="DrpCustomer_SelectedIndexChanged" AutoPostBack="True">
                                                </asp:DropDownList>
                                            </td>
                                            <td style="height: 17px" align="left">
                                            </td>
                                        </tr>
                                        <tr>
                                            <td style="height: 17px" align="left">
                                                <strong>
                                                    <asp:Label ID="lblfromLocation" runat="server" Width="94px" Text="Location"></asp:Label></strong>
                                            </td>
                                            <td style="width: 201px; height: 17px" align="left">
                                                <asp:DropDownList ID="drpDistributor" runat="server" Width="226px"
                                                    OnSelectedIndexChanged="drpDistributor_SelectedIndexChanged" AutoPostBack="True">
                                                </asp:DropDownList>
                                            </td>
                                            <td style="width: 157px; height: 17px" align="left">
                                            </td>
                                            <td style="height: 17px; width: 108px;" align="left">
                                                <strong>
                                                    <asp:Label ID="Label11" runat="server" Width="66px" Text="Area"></asp:Label></strong>
                                            </td>
                                            <td style="width: 201px; height: 17px" align="left">
                                                <asp:DropDownList ID="DrpRoute" runat="server" Width="240px"
                                                    OnSelectedIndexChanged="DrpRoute_SelectedIndexChanged" AutoPostBack="True">
                                                </asp:DropDownList>
                                            </td>
                                            <td style="height: 17px" align="left">
                                            </td>
                                        </tr>
                                        <tr>
                                            <td style="height: 17px" align="left">
                                               <strong>
                                                    <asp:Label ID="Label10" runat="server" Width="86px" Text="Status"></asp:Label></strong>
                                            </td>
                                            <td style="width: 201px; height: 17px" align="left">
                                               <asp:DropDownList ID="DrpStatus" runat="server" Width="226px"
                                                    OnSelectedIndexChanged="DrpStatus_SelectedIndexChanged" AutoPostBack="True">
                                                </asp:DropDownList>
                                            </td>
                                            <td style="width: 157px; height: 17px" align="left">
                                            </td>
                                            <td style="height: 17px; width: 108px;" align="left">
                                                <strong>
                                                    <asp:Label ID="Label4" runat="server" Width="66px" Text="Customer"></asp:Label></strong>
                                            </td>
                                            <td style="width: 201px; height: 17px" align="left">
                                                <asp:DropDownList ID="DrpCustomer" runat="server" Width="240px"
                                                    OnSelectedIndexChanged="DrpCustomer_SelectedIndexChanged" AutoPostBack="True">
                                                </asp:DropDownList>
                                            </td>
                                            <td style="height: 17px" align="left">
                                            </td>
                                        </tr>
                                        <tr>
                                            <td></td>
                                            <td></td>
                                            <td style="width: 157px"></td>
                                            <td style="width: 108px"> <strong>
                                                    <asp:Label ID="Label8" runat="server" Width="135px" Text="Customer Closing" Height="16px"></asp:Label></strong>
                                         </td>
                                            <td> <strong>
                                                    <asp:Label ID="lblCustomerClosing" runat="server" Width="135px" Text="0.00" Height="16px"></asp:Label></strong>
                                    </td>
                                        </tr>
                                        <tr>
                                            <td align="left">
                                                
                                            </td>
                                            <td style="width: 201px" align="left">
                                                
                                            </td>
                                            <td style="width: 157px" align="left">
                                                <strong>
                                                    <asp:Label ID="lblDocumentNo" runat="server" Width="25px" Text="            "></asp:Label></strong>
                                            </td>
                                            <td align="left" colspan="2" rowspan="11">
                                                <asp:Panel ID="Panel1" runat="server" Height="200px" ScrollBars="Vertical" BorderColor="Silver"
                                                    BorderStyle="Groove" BorderWidth="1px" Enabled="False">
                                                    <asp:GridView ID="GrdCredit" runat="server" AutoGenerateColumns="False" BackColor="White"
                                                        BorderColor="White" CssClass="gridRow2" ForeColor="SteelBlue" HorizontalAlign="Center"
                                                        Width="100%" DataKeyNames="SALE_INVOICE_ID">
                                                        <PagerSettings FirstPageText="" LastPageText="" Mode="NextPrevious" NextPageText="Next"
                                                            PreviousPageText="Previous" />
                                                        <Columns>
                                                            <asp:TemplateField HeaderText="Select">
                                                                <ItemTemplate>
                                                                    <asp:CheckBox ID="ChbIsAssigned" runat="server" Width="14px" Checked="true" />
                                                                </ItemTemplate>
                                                                <ItemStyle BorderColor="Silver" BorderStyle="Solid" BorderWidth="1px" />
                                                            </asp:TemplateField>
                                                            <asp:BoundField DataField="MANUAL_INVOICE_ID" HeaderText="Invoice No">
                                                                <ItemStyle BorderColor="Silver" BorderStyle="Solid" BorderWidth="1px" />
                                                            </asp:BoundField>
                                                            <asp:BoundField DataField="DOCUMENT_DATE" HeaderText="Invoice Date">
                                                                <ItemStyle BorderColor="Silver" BorderStyle="Solid" BorderWidth="1px" />
                                                            </asp:BoundField>
                                                            <asp:BoundField DataField="CURRENT_CREDIT_AMOUNT" HeaderText="Credit Amount" DataFormatString="{0:F2}">
                                                                <ItemStyle BorderColor="Silver" BorderStyle="Solid" BorderWidth="1px" HorizontalAlign="Center" />
                                                            </asp:BoundField>
                                                            <asp:BoundField DataField="DELIVERYMAN_ID" HeaderText="DELIVERYMAN_ID">
                                                                <HeaderStyle CssClass="HidePanel" />
                                                                <ItemStyle CssClass="HidePanel" />
                                                            </asp:BoundField>
                                                        </Columns>
                                                        <HeaderStyle CssClass="tblhead" HorizontalAlign="Center" VerticalAlign="Middle" />
                                                    </asp:GridView>
                                                </asp:Panel>
                                            </td>
                                            <td align="left" rowspan="11">
                                            </td>
                                        </tr>
                                        <tr>
                                            <td align="left">
                                                <strong>
                                                    <asp:Label ID="Label14" runat="server" Width="98px" Text="Deposit Account"></asp:Label></strong>
                                            </td>
                                            <td align="left">
                                                <asp:DropDownList ID="DrpBankAccount" runat="server" Width="226px"
                                                    OnSelectedIndexChanged="DrpStatus_SelectedIndexChanged" AutoPostBack="True">
                                                </asp:DropDownList>
                                            </td>
                                            <td style="width: 157px">
                                            </td>
                                        </tr>
                                        <tr>
                                            <td align="left">
                                                <strong>
                                                    <asp:Label ID="Label5" runat="server" Width="94px" Text="Chque No"></asp:Label></strong>
                                            </td>
                                            <td align="left">
                                                <strong>
                                                    <asp:Label ID="Label3" runat="server" Width="94px" Text="Bank Name"></asp:Label></strong>
                                            </td>
                                            <td style="width: 157px">
                                            </td>
                                        </tr>
                                        <tr>
                                            <td align="left">
                                                <asp:TextBox ID="txtChequeNo" runat="server" Width="94px" CssClass="txtBox"></asp:TextBox>
                                            </td>
                                            <td valign="top" align="left">
                                                <asp:TextBox ID="txtBankName" runat="server" Width="192px" CssClass="txtBox"></asp:TextBox>
                                            </td>
                                            <td valign="top" align="left" style="width: 157px">
                                            </td>
                                        </tr>
                                        <tr>
                                            <td valign="top" align="left">
                                                <strong>
                                                    <asp:Label ID="Label13" runat="server" Width="94px" Text="Remarks"></asp:Label></strong>
                                            </td>
                                            <td style="width: 201px" valign="top" align="left">
                                            </td>
                                            <td style="width: 157px" valign="top" align="left">
                                            </td>
                                        </tr>
                                        <tr>
                                            <td valign="top" align="left" colspan="2">
                                                <asp:TextBox ID="txtRemarks" runat="server" Width="298px" CssClass="txtBox"></asp:TextBox>
                                            </td>
                                            <td style="width: 157px" valign="top" align="left">
                                            </td>
                                        </tr>
                                        <tr>
                                            <td valign="top" align="left">
                                                <strong>
                                                    <asp:Label ID="Label6" runat="server" Width="74px" Text="Chq Amount"></asp:Label></strong>
                                            </td>
                                            <td style="width: 201px" valign="top" align="left">
                                                <strong>
                                                    <asp:Label ID="Label9" runat="server" Width="73px" Text="Cheque Date"></asp:Label></strong>
                                            </td>
                                            <td style="width: 157px" valign="top" align="left">
                                                &nbsp;
                                            </td>
                                        </tr>
                                        <tr>
                                            <td valign="top" align="left">
                                                <asp:TextBox ID="txtAmount" runat="server" Width="94px" CssClass="txtBox "></asp:TextBox>
                                            </td>
                                            <td style="width: 201px" valign="top" align="left">
                                                <asp:TextBox ID="txtStartDate" runat="server" Width="132px"></asp:TextBox>
                                                <asp:ImageButton ID="ibtnStartDate" runat="server" ImageUrl="~/App_Themes/Granite/Images/date.gif"
                                                Width="16px" />
                                                 <cc1:CalendarExtender ID="CEStartDate" runat="server" Format="dd-MMM-yyyy" PopupButtonID="ibtnStartDate"
                                                    TargetControlID="txtStartDate">
                                                </cc1:CalendarExtender>
                                            </td>
                                            <td style="width: 157px" valign="top" align="left">
                                            </td>
                                        </tr>
                                        <tr>
                                            <td valign="top" align="left">
                                                <strong>
                                                    <asp:Label ID="Label2" runat="server" Width="96px" Text="Slip No"></asp:Label></strong>
                                            </td>
                                            <td style="width: 201px" valign="top" align="left">
                                                <strong>
                                                    <asp:Label ID="Label1" runat="server" Width="100px" Text="Recevied Date"></asp:Label></strong>
                                            </td>
                                            <td style="width: 157px" valign="top" align="left">
                                            </td>
                                        </tr>
                                        <tr>
                                            <td valign="top" align="left">
                                                <asp:TextBox ID="txtSlipNo" runat="server" Width="94px" CssClass="txtBox "></asp:TextBox>
                                            </td>
                                            <td style="width: 201px" valign="top" align="left">
                                                <asp:TextBox ID="txtReceivedDate" runat="server" Width="128px" CssClass="txtBox "
                                                    ReadOnly="True"></asp:TextBox>
                                            </td>
                                            <td style="width: 157px" valign="top" align="left">
                                            </td>
                                        </tr>                                        
                                    </tbody>
                                </table>
                                <cc1:FilteredTextBoxExtender ID="FilteredTextBoxExtender1" runat="server" FilterType="Custom"
                                    ValidChars="0123456789." TargetControlID="txtAmount">
                                </cc1:FilteredTextBoxExtender>                                
                                <asp:HiddenField ID="HFChqueProcessId" runat="server"></asp:HiddenField>
                            </ContentTemplate>
                        </asp:UpdatePanel>
                    </td>
                    <tr>
                        <td>
                            <table>
                                <tr>
                                            <td valign="top" align="left">
                                                <asp:Button AccessKey="S" ID="btnSave" OnClick="btnSave_Click" runat="server" Width="102px"
                                                    Font-Size="8pt" Text="Save" CssClass="Button" />
                                            </td>
                                            <td style="width: 201px" valign="top" align="left">
                                                <asp:Button AccessKey="C" ID="btnCancel" runat="server" Width="120px" Font-Size="8pt"
                                                    Text="Cancel" OnClick="btnCancel_Click" CssClass="Button" />
                                            </td>
                                            <td style="width: 201px" valign="top" align="left">
                                            </td>
                                        </tr>
                            </table>
                        </td>
                    </tr>
                </tr>
            </table>
        </div>
        <div>
            <table width="100%">
                <tr>
                    <td>
                        <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                            <ContentTemplate>
                                <table style="border-right: silver thin inset; border-top: silver thin inset; border-left: silver thin inset;
                                    width: 89%; border-bottom: silver thin inset">
                                    <tbody>
                                        <tr>
                                            <td style="height: 20px" align="left" colspan="5">
                                                <asp:Panel ID="Panel12" runat="server" Width="100%" Height="200px" ScrollBars="Vertical">
                                                    <table style="border-right: silver thin inset; border-top: silver thin inset; border-left: silver thin inset;
                                                        border-bottom: silver thin inset; background-color: silver" width="100%">
                                                        <tbody>
                                                            <tr>
                                                                <td style="height: 21px" align="left">
                                                                    <strong>
                                                                        <asp:Label ID="Label110" runat="server" Width="154px" Text="Select Searching Type"></asp:Label></strong>
                                                                </td>
                                                                <td style="width: 170px; height: 21px" align="left">
                                                                    <asp:DropDownList ID="ddSearchType" runat="server" Width="200px">
                                                                        <asp:ListItem Value="CHEQUE_NO">All Records</asp:ListItem>
                                                                        <asp:ListItem Value="CUSTOMER_NAME">Customer</asp:ListItem>
                                                                        <asp:ListItem Value="BANK_NAME">Bank Name</asp:ListItem>
                                                                        <asp:ListItem Value="SlipNo">Slip No</asp:ListItem>
                                                                        <asp:ListItem Value="account_name">Deposit Account </asp:ListItem>
                                                                        <asp:ListItem Value="CHEQUE_DATE">Cheque Date</asp:ListItem>
                                                                        <asp:ListItem Value="RECEIVED_DATE">Received Date</asp:ListItem>
                                                                        <asp:ListItem Value="DEPOSIT_DATE">Deposit Date</asp:ListItem>
                                                                    </asp:DropDownList>
                                                                </td>
                                                                <td style="width: 224px; height: 21px" align="left">
                                                                    <asp:TextBox ID="txtSeach" runat="server" Width="200px" CssClass="txtBox "></asp:TextBox>
                                                                </td>
                                                                <td style="width: 250px; height: 21px" align="left">
                                                                    <asp:Button ID="btnFilter" runat="server" Width="85px" Font-Size="8pt" Text="Filter"
                                                                        OnClick="btnFilter_Click"></asp:Button>
                                                                </td>
                                                            </tr>
                                                        </tbody>
                                                    </table>
                                                    <asp:GridView ID="GrdOrder" runat="server" Width="100%" ForeColor="SteelBlue" CssClass="gridRow2"
                                                        BorderColor="White" HorizontalAlign="Center" BackColor="White" AutoGenerateColumns="False"
                                                        OnRowCommand="GrdOrder_RowCommand" OnRowDeleting="GrdOrder_RowDeleting">
                                                        <PagerSettings FirstPageText="" LastPageText="" Mode="NextPrevious" NextPageText="Next"
                                                            PreviousPageText="Previous" />
                                                        <Columns>
                                                            <asp:BoundField DataField="CHEQUE_PROCESS_ID" HeaderText="CHEQUE_PROCESS_ID">
                                                                <HeaderStyle CssClass="HidePanel" />
                                                                <ItemStyle CssClass="HidePanel" />
                                                            </asp:BoundField>
                                                            <asp:BoundField DataField="CUSTOMER_ID" HeaderText="CUSTOMER_ID">
                                                                <HeaderStyle CssClass="HidePanel" />
                                                                <ItemStyle CssClass="HidePanel" />
                                                            </asp:BoundField>
                                                            <asp:BoundField DataField="CUSTOMER_NAME" HeaderText="Customer">
                                                                <ItemStyle BorderColor="Silver" BorderStyle="Solid" BorderWidth="1px" HorizontalAlign="Left" />
                                                            </asp:BoundField>
                                                            <asp:BoundField DataField="CHEQUE_NO" HeaderText="Chq. No">
                                                                <ItemStyle BorderColor="Silver" BorderStyle="Solid" BorderWidth="1px" HorizontalAlign="Left" />
                                                            </asp:BoundField>
                                                            <asp:BoundField DataField="BANK_NAME" HeaderText="Bank Name">
                                                                <ItemStyle BorderColor="Silver" BorderStyle="Solid" BorderWidth="1px" />
                                                            </asp:BoundField>
                                                            <asp:BoundField DataField="CHEQUE_DATE" HeaderText="Chq.Date" DataFormatString="{0:dd-MMM-yyyy}">
                                                                <ItemStyle BorderColor="Silver" BorderStyle="Solid" BorderWidth="1px" HorizontalAlign="Center" />
                                                            </asp:BoundField>
                                                            <asp:BoundField DataField="RECEIVED_DATE" HeaderText="Received Date" DataFormatString="{0:dd-MMM-yyyy}">
                                                                <ItemStyle BorderColor="Silver" BorderStyle="Solid" BorderWidth="1px" HorizontalAlign="Center" />
                                                            </asp:BoundField>
                                                            <asp:BoundField DataField="DEPOSIT_DATE" HeaderText="Deposit Date" DataFormatString="{0:dd-MMM-yyyy}">
                                                                <ItemStyle BorderColor="Silver" BorderStyle="Solid" BorderWidth="1px" HorizontalAlign="Center" />
                                                            </asp:BoundField>
                                                            <asp:BoundField DataField="CHEQUE_AMOUNT" DataFormatString="{0:F2}" HeaderText="Chq.Amount">
                                                                <ItemStyle BorderColor="Silver" BorderStyle="Solid" BorderWidth="1px" HorizontalAlign="Right" />
                                                            </asp:BoundField>
                                                            <asp:BoundField DataField="SlipNo" HeaderText="Slip No">
                                                                <ItemStyle BorderColor="Silver" BorderStyle="Solid" BorderWidth="1px" />
                                                            </asp:BoundField>
                                                            <asp:BoundField DataField="Remarks" HeaderText="Remarks">
                                                                <HeaderStyle CssClass="HidePanel" />
                                                                <ItemStyle CssClass="HidePanel" />
                                                            </asp:BoundField>
                                                            <asp:BoundField DataField="area_id" HeaderText="area_id">
                                                                <HeaderStyle CssClass="HidePanel" />
                                                                <ItemStyle CssClass="HidePanel" />
                                                            </asp:BoundField>
                                                            <asp:BoundField DataField="account_name" HeaderText="Deposit Account">
                                                                <ControlStyle BorderColor="Silver" BorderStyle="Solid" BorderWidth="1px" />
                                                                <ItemStyle BorderColor="Silver" BorderStyle="Solid" BorderWidth="1px" />
                                                            </asp:BoundField>
                                                            <asp:BoundField DataField="account_head_id" HeaderText="account_head_id">
                                                                <HeaderStyle CssClass="HidePanel" />
                                                                <ItemStyle CssClass="HidePanel" />
                                                            </asp:BoundField>
                                                            <asp:BoundField DataField="DeliveryManID" HeaderText="DeliveryManID">
                                                                <HeaderStyle CssClass="HidePanel" />
                                                                <ItemStyle CssClass="HidePanel" />
                                                            </asp:BoundField>
                                                            <asp:TemplateField HeaderText="Edit">
                                                            <ItemTemplate>
                                                                <asp:LinkButton ID="btnEdit" runat="server" Text="Edit" CommandName="Edt"></asp:LinkButton>
                                                            </ItemTemplate>
                                                            <ItemStyle BorderColor="Silver" BorderWidth="1px" BorderStyle="Solid"></ItemStyle>
                                                        </asp:TemplateField>
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
