<%@ Page Language="C#" MasterPageFile="~/Forms/PageMaster.master" AutoEventWireup="true"
    CodeFile="frmDistributorCustomer.aspx.cs" Inherits="Forms_frmDistributorCustomer"
    Title="SAMS: New Customer" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<asp:Content ID="Content1" runat="server" ContentPlaceHolderID="cphPage">
     <script src="../AjaxLibrary/jquery.searchabledropdown-1.0.8.min.js" type="text/javascript"></script>
    <script language="JavaScript" type="text/javascript">

        function NameValidation(event) {
            // Allow: backspace, delete, tab and escape
            if (event.keyCode == 46 || event.keyCode == 8 || event.keyCode == 9 || event.keyCode == 27 || event.keyCode == 32 ||
            // Allow: Ctrl+A
            (event.keyCode == 65 && event.ctrlKey === true) ||
            // Allow: home, end, left, right
            (event.keyCode >= 35 && event.keyCode <= 39) ||
            // Allow: Dash, Underscoor
            (event.keyCode == 189) ||
            //Allow Comma,Period
            ((event.keyCode == 190 || event.keyCode == 188) && event.shiftKey === false) ||
            //Allow a-z
            (event.keyCode >= 65 && event.keyCode <= 90)) {
                // let it happen, don't do anything
                return;
            }
            else {
                // Ensure that it is a number and stop the keypress
                event.preventDefault();
            }
        }

        function AddressValidation(event) {
            // Allow: backspace, delete, tab , escape and space bar
            if (event.keyCode == 46 || event.keyCode == 8 || event.keyCode == 9 || event.keyCode == 27 || event.keyCode == 32 ||
            // Allow: Ctrl+A
            (event.keyCode == 65 && event.ctrlKey === true) ||
            // Allow: home, end, left, right
            (event.keyCode >= 35 && event.keyCode <= 39) ||
            // Allow: Dash, Underscoor
            (event.keyCode == 189) ||
            // Allow: Open bracket, Close bracket
            ((event.keyCode == 57 || event.keyCode == 48) && event.shiftKey === true) ||
            //Allow Comma,Period
            ((event.keyCode == 190 || event.keyCode == 188) && event.shiftKey === false) ||
            //Allow 0-9
            ((event.keyCode >= 48 && event.keyCode <= 57) && event.shiftKey === false) || //Standard Numbers
            (event.keyCode >= 96 && event.keyCode <= 105) || //Keypad numbers
            //Allow a-z
            (event.keyCode >= 65 && event.keyCode <= 90)) {
                // let it happen, don't do anything
                return;
            }
            else {
                // Ensure that it is a number and stop the keypress
                event.preventDefault();
            }
        }

        function PhoneValidation(event) {
            // Allow: backspace, delete, tab , escape
            if (event.keyCode == 46 || event.keyCode == 8 || event.keyCode == 9 || event.keyCode == 27 ||
            // Allow: Ctrl+A
            (event.keyCode == 65 && event.ctrlKey === true) ||
            // Allow: home, end, left, right
            (event.keyCode >= 35 && event.keyCode <= 39) ||
            // Allow: Dash
            (event.keyCode == 189 && event.shiftKey === false) ||
            //Allow 0-9
            ((event.keyCode >= 48 && event.keyCode <= 57) && event.shiftKey === false) || //Standard Numbers
            //Keypad numbers
            (event.keyCode >= 96 && event.keyCode <= 105)) {
                // let it happen, don't do anything
                return;
            }
            else {
                // Ensure that it is a number and stop the keypress
                event.preventDefault();
            }
        }

        function pageLoad() {
            $('#<%=txtIsRegister.ClientID %>').mask("99-99-9999-999-99");
            $("select").searchable();
            $('#<%=Grid_users.ClientID %>').tablesorter(
	     {
	         headers: {
	             25: {
	                 sorter: false
	             }
	         }
	     }
	     );

        }
        Sys.WebForms.PageRequestManager.getInstance().add_beginRequest(startRequest);

        Sys.WebForms.PageRequestManager.getInstance().add_endRequest(endRequest);

        function startRequest(sender, e) {
            document.getElementById('<%=btnSave.ClientID%>').disabled = true;
            document.getElementById('<%=btnSearch.ClientID%>').disabled = true;
            document.getElementById('<%=btnCancel.ClientID%>').disabled = true;

        }

        function endRequest(sender, e) {

            document.getElementById('<%=btnSave.ClientID%>').disabled = false;
            document.getElementById('<%=btnSearch.ClientID%>').disabled = false;
            document.getElementById('<%=btnCancel.ClientID%>').disabled = false;
        }


        function ValidateForm() {
            var str;
            str = document.getElementById('<%=txtCustomerName.ClientID%>').value;
            if (str == null || str.length == 0) {
                alert('Must enter Customer Name');
                return false;
            }
            str = document.getElementById('<%=txtContactPerson.ClientID%>').value;
            if (str == null || str.length == 0) {
                alert('Must enter Contact Person Name');
                return false;
            }
            str = document.getElementById('<%=txtAddress.ClientID%>').value;
            if (str == null || str.length == 0) {
                alert('Must enter Address');
                return false;
            }

            str = document.getElementById('<%=txtPhoneNo.ClientID%>').value;
            if (str == null || str.length == 0) {
                alert('Must enter Mobile #');
                return false;
            }
            str = document.getElementById('<%=txtRegdate.ClientID%>').value;
            if (str == null || str.length == 0) {
                alert('Must enter Register Date');
                return false;
            }

            if ($('#<%= ChbIsRegister.ClientID %>').is(':checked')) {
                str = document.getElementById('<%=txtIsRegister.ClientID%>').value;
                if (str == null || str.length == 0) {
                    alert('Must enter STRN #');
                    return false;
                }
            }

            return true;
        }
        function SearchRecord() {
            var str;
            str = document.getElementById('<%=txtSeach.ClientID%>').value;
            if (str == null || str.length == 0) {
                alert('Must enter Key Word for Searching');
                return false;
            }
            return true;
        }
    
    </script>
    <div id="right_data">
        <div>
            <asp:UpdatePanel ID="UpdatePanel2" runat="server">
                <ContentTemplate>
                    <table width="100%" cellpadding="2" cellspacing="2">
                        <tr>
                            <td style="width:10%">
                                <strong>
                                    <asp:Label ID="lblLocation" runat="server" Text="Location"></asp:Label>
                                </strong>
                            </td>
                            <td style="width:30%">
                                <asp:DropDownList ID="DrpDistributor" runat="server" Width="205px" OnSelectedIndexChanged="DrpDistributor_SelectedIndexChanged"
                                    AutoPostBack="True">
                                </asp:DropDownList>
                            </td>
                            <td style="width:10%">
                                <strong>
                                    <asp:Label ID="lblCity" runat="server" Text="City"></asp:Label>
                                </strong>
                            </td>
                            <td style="width:50%">
                                <asp:DropDownList ID="DrpTown" runat="server" Width="205px" OnSelectedIndexChanged="DrpTown_SelectedIndexChanged"
                                    AutoPostBack="True">
                                </asp:DropDownList>
                            </td>
                        </tr>
                        <tr>
                            <td style="width:10%">
                                <strong>
                                    <asp:Label ID="lblArea" runat="server" Text="Area"></asp:Label>
                                </strong>
                            </td>
                            <td style="width:30%">
                                <asp:DropDownList ID="DrpRoute" runat="server" Width="205px" OnSelectedIndexChanged="DrpRoute_SelectedIndexChanged"
                                    AutoPostBack="True">
                                </asp:DropDownList>
                            </td>
                            <td style="width:10%">
                                <strong>
                                    <asp:Label ID="lblSubArea" runat="server" Text="Sub Area"></asp:Label>
                                </strong>
                            </td>
                            <td style="width:50%">
                                <asp:DropDownList ID="DrpMarket" runat="server" Width="206px">
                                </asp:DropDownList>
                            </td>
                        </tr>
                        <tr>
                            <td style="width:10%">
                                <strong>
                                    <asp:Label ID="lblChannelType" runat="server" Text="Channel Type"></asp:Label>
                                </strong>
                            </td>
                            <td style="width:30%">
                                <asp:DropDownList ID="drpChannelType" runat="server" Width="205px">
                                </asp:DropDownList>
                            </td>
                            <td style="width:10%">
                                <strong>
                                    <asp:Label ID="lblBusinessType" runat="server" Text="Business Type"></asp:Label>
                                </strong>
                            </td>
                            <td style="width:50%">
                                <asp:DropDownList ID="DrpBusinessType" runat="server" Width="206px">
                                </asp:DropDownList>
                            </td>
                        </tr>
                        <tr>
                            <td style="width:10%">
                                <strong>
                                    <asp:Label ID="lblPromotionClass" runat="server" Width="105px" Text="Promotion Class"></asp:Label>
                                </strong>
                            </td>
                            <td style="width:30%">
                                <asp:DropDownList ID="DrpVolumeClass" runat="server" Width="205px">
                                </asp:DropDownList>
                            </td>
                            <td style="width:10%">
                                <strong>
                                    <asp:Label ID="lblContactPerson" runat="server" Text="Contact Person"></asp:Label>
                                </strong>
                            </td>
                            <td style="width:50%">
                                <asp:TextBox ID="txtContactPerson" runat="server" Width="205px" MaxLength="50"></asp:TextBox>
                            </td>
                        </tr>
                        <tr>
                            <td style="width:10%">
                                <strong>
                                    <asp:Label ID="lblName" runat="server" Width="105px" Text="Name"></asp:Label>
                                </strong>
                            </td>
                            <td style="width:30%">
                                <asp:TextBox ID="txtCustomerName" runat="server" Width="205px" MaxLength="100"></asp:TextBox>
                            </td>
                            <td style="width:10%">
                                <strong>
                                    <asp:Label ID="lblAddress" runat="server" Text="Address"></asp:Label>
                                </strong>
                            </td>
                            <td style="width:50%">
                                <asp:TextBox ID="txtAddress" runat="server" Width="205px" MaxLength="250"></asp:TextBox>
                            </td>
                        </tr>
                        <tr>
                            <td style="width:10%">
                                <strong>
                                    <asp:Label ID="lblMobile" runat="server" Text="Mobile #"></asp:Label>
                                </strong>
                            </td>
                            <td style="width:30%">
                                <asp:TextBox ID="txtPhoneNo" runat="server" Width="205px" MaxLength="15"></asp:TextBox>
                            </td>
                            <td style="width:10%">
                                <strong>
                                    <asp:Label ID="lblTel" runat="server" Text="Tel #"></asp:Label>
                                </strong>
                            </td>
                            <td style="width:50%">
                                <asp:TextBox ID="txtTelNo" runat="server" Width="205px" MaxLength="50"></asp:TextBox>
                            </td>
                        </tr>
                        <tr>
                            <td style="width:10%">
                                <strong>
                                    <asp:Label ID="lblEmail" runat="server" Text="Email"></asp:Label>
                                </strong>
                            </td>
                            <td style="width:30%">
                                <asp:TextBox ID="txtEmail" runat="server" Width="205px" MaxLength="50"></asp:TextBox>
                            </td>
                            <td style="width:10%">
                                <strong>
                                    <asp:Label ID="lblTransporter" runat="server" Text="Transporter"></asp:Label>
                                </strong>
                            </td>
                            <td style="width:50%">
                                <asp:TextBox ID="txtTransporter" runat="server" Width="205px" MaxLength="100"></asp:TextBox>
                            </td>
                        </tr>
                        <tr>
                            <td style="width:10%">
                                <strong>
                                    <asp:Label ID="lblReference" runat="server" Text="Reference"></asp:Label>
                                </strong>
                            </td>
                            <td style="width:30%">
                                <asp:TextBox ID="txtReference" runat="server" Width="205px" MaxLength="100"></asp:TextBox>
                            </td>
                            <td style="width:10%">
                                <strong>
                                    <asp:Label ID="lblRegisterDate" runat="server" Text="Register Date"></asp:Label>
                                </strong>
                            </td>
                            <td style="width:50%">
                                <asp:TextBox ID="txtRegdate" runat="server" Width="205px" ReadOnly="true"></asp:TextBox>
                            </td>
                        </tr>
                        <tr>
                            <td style="width:10%">
                                <strong>
                                    <asp:CheckBox ID="ChbIsRegister" runat="server" Text="Is Register" AutoPostBack="True"
                                        OnCheckedChanged="ChbIsRegister_CheckedChanged"></asp:CheckBox>
                                </strong>
                            </td>
                            <td style="width:30%">
                                <asp:TextBox ID="txtIsRegister" runat="server" Width="205px" Enabled="false"></asp:TextBox>
                            </td>
                            <td style="width:11%">
                                <strong>
                                    <asp:Label ID="Label1" runat="server" Text="Customer Policy"></asp:Label>
                                </strong>
                            </td>
                            <td style="width:50%">
                                <asp:TextBox ID="txtCustomerPolicy" runat="server" Width="205px" ></asp:TextBox>
                            </td>
 
                        </tr>
                    </table>
                    <table>
                        <tbody>
                            <tr>
                                <td align="left" colspan="5">
                                    <asp:Panel ID="pnlCredit" runat="server" Width="100%" Height="100%" BorderColor="Silver"
                                        BorderWidth="1">
                                        <table width="100%">
                                            <tr>
                                                <td style="width: 15%;">
                                                    <strong>
                                                        <asp:Label ID="lblCreditAmount" runat="server" Text="Crdit Amount"></asp:Label></strong>
                                                </td>
                                                <td style="width: 20%;">
                                                    <asp:TextBox ID="txtCreditAmount" runat="server" Width="100%"></asp:TextBox>
                                                    <cc1:FilteredTextBoxExtender ID="FilteredTextBoxExtender1" runat="server" FilterType="Custom"
                                                        ValidChars="0123456789." TargetControlID="txtCreditAmount">
                                                    </cc1:FilteredTextBoxExtender>
                                                </td>
                                                <td style="width: 1%;">
                                                </td>
                                                <td style="width: 15%;">
                                                    <strong>
                                                        <asp:Label ID="lblCreditDays" runat="server" Text="Crdit Days"></asp:Label></strong>
                                                </td>
                                                <td style="width: 15%;">
                                                    <asp:TextBox ID="txtCreditDays" runat="server" Width="100%"></asp:TextBox>
                                                    <cc1:FilteredTextBoxExtender ID="FilteredTextBoxExtender2" runat="server" FilterType="Custom"
                                                        ValidChars="0123456789" TargetControlID="txtCreditDays">
                                                    </cc1:FilteredTextBoxExtender>
                                                </td>
                                                <td style="width: 1%;">
                                                </td>
                                                <td style="width: 15%;">
                                                    <strong>
                                                        <asp:Label ID="lblInvoiceCount" runat="server" Text="No of Invoices"></asp:Label></strong>
                                                </td>
                                                <td style="width: 15%;">
                                                    <asp:TextBox ID="txtInvoiceCount" runat="server" Width="100%"></asp:TextBox>
                                                    <cc1:FilteredTextBoxExtender ID="FilteredTextBoxExtender3" runat="server" FilterType="Custom"
                                                        ValidChars="0123456789" TargetControlID="txtInvoiceCount">
                                                    </cc1:FilteredTextBoxExtender>
                                                </td>
                                                <td style="width: 2%;">
                                                </td>
                                            </tr>
                                        </table>
                                    </asp:Panel>
                                </td>
                            </tr>
                            <tr>
                                <td colspan="5">
                                    &nbsp;
                                </td>
                            </tr>
                            <tr>
                                <td style="width: 143px" align="left">
                                </td>
                                <td style="width: 175px">
                                    <asp:Button ID="btnSave" OnClick="btnSave_Click" runat="server" Width="80px" Font-Size="8pt"
                                        Text="Save" ValidationGroup="vg" CssClass="Button" />
                                    &nbsp;
                                    <asp:Button ID="btnCancel" OnClick="btnCancel_Click" runat="server" Width="80px"
                                        Font-Size="8pt" Text="Cancel" CssClass="Button" />
                                </td>
                                <td style="width: 1px">
                                </td>
                                <td>
                                    <asp:CheckBox ID="chkIsActive" runat="server" Width="93px" Text="IsActive" Checked="True">
                                    </asp:CheckBox>
                                </td>
                                <td style="width: 219px">
                                </td>
                            </tr>
                        </tbody>
                    </table>
                </ContentTemplate>
            </asp:UpdatePanel>
            <div style="z-index: 101; left: 640px; width: 100px; position: absolute; top: 244px;
                height: 100px">
                &nbsp;<asp:Panel ID="Panel21" runat="server">
                    <asp:UpdateProgress ID="UpdateProgress1" runat="server" AssociatedUpdatePanelID="UpdatePanel2">
                        <ProgressTemplate>
                            <asp:ImageButton ID="ImageButton1" runat="server" Height="26px" ImageUrl="~/App_Themes/Granite/Images/image003.gif"
                                Width="23px" />
                            Wait Update
                        </ProgressTemplate>
                    </asp:UpdateProgress>
                </asp:Panel>
            </div>
        </div>
        <div>
            <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                <ContentTemplate>
                    <table style="border-right: silver thin inset; border-top: silver thin inset; border-left: silver thin inset;
                        width: 100%; border-bottom: silver thin inset; background-color: silver">
                        <tbody>
                            <tr>
                                <td style="height: 21px" align="left">
                                    <asp:Label ID="Label10" runat="server" Width="153px" Text="Select Searching Type"></asp:Label>
                                </td>
                                <td style="width: 170px; height: 21px" align="left">
                                    <asp:DropDownList ID="ddSearchType" runat="server" Width="200px">
                                        <asp:ListItem Value="CUSTOMER_CODE">Customer Code</asp:ListItem>
                                        <asp:ListItem Value="CUSTOMER_NAME">Customer Name</asp:ListItem>
                                        <asp:ListItem Value="CONTACT_PERSON">Contact Person</asp:ListItem>
                                        <asp:ListItem Value="CONTACT_NUMBER">Contact Number</asp:ListItem>
                                        <asp:ListItem Value="ADDRESS">Address</asp:ListItem>
                                        <asp:ListItem Value="PROMOTION_CLASS2">Promotion Class</asp:ListItem>
                                        <asp:ListItem Value="GEO_NAME">City Name</asp:ListItem>
                                        <asp:ListItem Value="AREA_NAME">Area Name</asp:ListItem>
                                        <asp:ListItem Value="ROUTE_NAME">Sub Area Name</asp:ListItem>
                                        <asp:ListItem Value="ChannelType">Channel Type</asp:ListItem>
                                        <asp:ListItem Value="GST_NUMBER">STRN</asp:ListItem>
                                    </asp:DropDownList>
                                </td>
                                <td style="width: 224px; height: 21px" align="left">
                                    <asp:TextBox ID="txtSeach" runat="server" Width="200px" CssClass="txtBox "></asp:TextBox>
                                </td>
                                <td style="height: 21px" align="left" width="250">
                                    <asp:Button ID="btnSearch" runat="server" Width="85px" Font-Size="8pt" Text="Filter"
                                        OnClick="btnSearch_Click"></asp:Button>
                                </td>
                            </tr>
                        </tbody>
                    </table>
                    <asp:Panel ID="Panel2" runat="server" Width="100%" Height="200px" ScrollBars="Vertical">
                        <asp:GridView ID="Grid_users" runat="server" Width="100%" ForeColor="SteelBlue" CssClass="tablesorter"
                            HorizontalAlign="Center" AutoGenerateColumns="False" BackColor="White" BorderColor="White"
                            OnRowCommand="Grid_users_RowCommand">
                            <PagerSettings FirstPageText="" LastPageText="" Mode="NextPrevious" NextPageText="Next"
                                PreviousPageText="Previous"></PagerSettings>
                            <RowStyle ForeColor="Black"></RowStyle>
                            <Columns>
                                <asp:BoundField DataField="CUSTOMER_ID" HeaderText="Customer Id" ReadOnly="true">
                                    <HeaderStyle CssClass="HidePanel"></HeaderStyle>
                                    <ItemStyle CssClass="HidePanel"></ItemStyle>
                                </asp:BoundField>
                                <asp:BoundField DataField="DISTRIBUTOR_ID" HeaderText="DISTRIBUTOR_ID" ReadOnly="true">
                                    <HeaderStyle CssClass="HidePanel"></HeaderStyle>
                                    <ItemStyle BorderColor="Silver" BorderWidth="1px" BorderStyle="Solid" CssClass="HidePanel">
                                    </ItemStyle>
                                </asp:BoundField>
                                <asp:BoundField DataField="BUSINESS_TYPE_ID" HeaderText="BUSINESS_TYPE_ID" ReadOnly="true">
                                    <HeaderStyle CssClass="HidePanel"></HeaderStyle>
                                    <ItemStyle CssClass="HidePanel"></ItemStyle>
                                </asp:BoundField>
                                <asp:BoundField DataField="PROMOTION_CLASS" HeaderText="PROMOTION_CLASS" ReadOnly="true">
                                    <HeaderStyle CssClass="HidePanel"></HeaderStyle>
                                    <ItemStyle CssClass="HidePanel"></ItemStyle>
                                </asp:BoundField>
                                <asp:BoundField DataField="CHANNEL_TYPE_ID" HeaderText="CHANNEL_TYPE_ID" ReadOnly="true">
                                    <HeaderStyle CssClass="HidePanel"></HeaderStyle>
                                    <ItemStyle CssClass="HidePanel"></ItemStyle>
                                </asp:BoundField>
                                <asp:BoundField DataField="TOWN_ID" HeaderText="TOWN_ID" ReadOnly="true">
                                    <HeaderStyle CssClass="HidePanel"></HeaderStyle>
                                    <ItemStyle BorderColor="Silver" BorderWidth="1px" BorderStyle="Solid" CssClass="HidePanel">
                                    </ItemStyle>
                                </asp:BoundField>
                                <asp:BoundField DataField="AREA_ID" HeaderText="AREA_ID" ReadOnly="true">
                                    <HeaderStyle CssClass="HidePanel"></HeaderStyle>
                                    <ItemStyle BorderColor="Silver" BorderWidth="1px" BorderStyle="Solid" CssClass="HidePanel">
                                    </ItemStyle>
                                </asp:BoundField>
                                <asp:BoundField DataField="ROUTE_ID" HeaderText="ROUTE_ID" ReadOnly="true">
                                    <HeaderStyle CssClass="HidePanel"></HeaderStyle>
                                    <ItemStyle BorderColor="Silver" BorderWidth="1px" BorderStyle="Solid" CssClass="HidePanel">
                                    </ItemStyle>
                                </asp:BoundField>
                                <asp:BoundField DataField="CUSTOMER_CODE" HeaderText="Code" ReadOnly="true">
                                    <ItemStyle BorderColor="Silver" BorderWidth="1px" BorderStyle="Solid"></ItemStyle>
                                </asp:BoundField>
                                <asp:BoundField DataField="CUSTOMER_NAME" HeaderText="Name" ReadOnly="true">
                                    <ItemStyle BorderColor="Silver" BorderWidth="1px" BorderStyle="Solid"></ItemStyle>
                                </asp:BoundField>
                                <asp:BoundField DataField="CONTACT_PERSON" HeaderText="Contact Person" ReadOnly="true">
                                    <HeaderStyle CssClass="HidePanel"></HeaderStyle>
                                    <ItemStyle BorderColor="Silver" BorderWidth="1px" BorderStyle="Solid" CssClass="HidePanel">
                                    </ItemStyle>
                                </asp:BoundField>
                                <asp:BoundField DataField="CONTACT_NUMBER" HeaderText="Contact Number" ReadOnly="true">
                                    <ItemStyle BorderColor="Silver" BorderWidth="1px" BorderStyle="Solid"></ItemStyle>
                                </asp:BoundField>
                                <asp:BoundField DataField="EMAIL_ADDRESS" HeaderText="Email" ReadOnly="true">
                                    <HeaderStyle CssClass="HidePanel"></HeaderStyle>
                                    <ItemStyle BorderColor="Silver" BorderWidth="1px" BorderStyle="Solid" CssClass="HidePanel">
                                    </ItemStyle>
                                </asp:BoundField>
                                <asp:BoundField DataField="ADDRESS" HeaderText="ADDRESS" ReadOnly="true">
                                    <ItemStyle BorderColor="Silver" BorderWidth="1px" BorderStyle="Solid"></ItemStyle>
                                </asp:BoundField>
                                <asp:BoundField DataField="GST_NUMBER" HeaderText="Gst No" ReadOnly="true">
                                    <HeaderStyle CssClass="HidePanel"></HeaderStyle>
                                    <ItemStyle BorderColor="Silver" BorderWidth="1px" BorderStyle="Solid" CssClass="HidePanel">
                                    </ItemStyle>
                                </asp:BoundField>
                                <asp:BoundField DataField="ChannelType" HeaderText="Channel Type" ReadOnly="true">
                                    <ItemStyle BorderColor="Silver" BorderWidth="1px" BorderStyle="Solid"></ItemStyle>
                                </asp:BoundField>
                                <asp:BoundField DataField="GEO_NAME" HeaderText="City" ReadOnly="true">
                                    <ItemStyle BorderColor="Silver" BorderWidth="1px" BorderStyle="Solid"></ItemStyle>
                                </asp:BoundField>
                                <asp:BoundField DataField="AREA_NAME" HeaderText="Area" ReadOnly="true">
                                    <ItemStyle BorderColor="Silver" BorderWidth="1px" BorderStyle="Solid"></ItemStyle>
                                </asp:BoundField>
                                <asp:BoundField DataField="ROUTE_NAME" HeaderText="Sub Area" ReadOnly="true">
                                    <ItemStyle BorderColor="Silver" BorderWidth="1px" BorderStyle="Solid"></ItemStyle>
                                </asp:BoundField>
                                <asp:BoundField DataField="IS_ACTIVE" HeaderText="Status" ReadOnly="true">
                                    <ItemStyle BorderColor="Silver" BorderWidth="1px" BorderStyle="Solid"></ItemStyle>
                                </asp:BoundField>
                                <asp:BoundField DataField="REGDATE" ReadOnly="true">
                                    <HeaderStyle CssClass="HidePanel"></HeaderStyle>
                                    <ItemStyle CssClass="HidePanel"></ItemStyle>
                                </asp:BoundField>
                                <asp:BoundField DataField="IS_STAND" HeaderText="Stand" ReadOnly="true">
                                    <HeaderStyle CssClass="HidePanel"></HeaderStyle>
                                    <ItemStyle CssClass="HidePanel"></ItemStyle>
                                </asp:BoundField>
                                <asp:BoundField DataField="IS_COOLER" HeaderText="Cooler" ReadOnly="true">
                                    <HeaderStyle CssClass="HidePanel"></HeaderStyle>
                                    <ItemStyle CssClass="HidePanel"></ItemStyle>
                                </asp:BoundField>
                                <asp:TemplateField HeaderText="Edit">
                                <ItemTemplate>
                                    <asp:LinkButton ID="btnEdit" runat="server" Text="Edit" CommandName="Edt"></asp:LinkButton>
                                </ItemTemplate>
                                <ItemStyle BorderColor="Silver" BorderWidth="1px" BorderStyle="Solid"></ItemStyle>
                                </asp:TemplateField>
                                <asp:BoundField DataField="INVOICE_COUNT" HeaderText="INVOICE_COUNT" ReadOnly="true">
                                    <HeaderStyle CssClass="HidePanel"></HeaderStyle>
                                    <ItemStyle CssClass="HidePanel"></ItemStyle>
                                </asp:BoundField>
                                <asp:BoundField DataField="CREDITLIMIT_VALUE" HeaderText="CREDITLIMIT_VALUE" ReadOnly="true">
                                    <HeaderStyle CssClass="HidePanel"></HeaderStyle>
                                    <ItemStyle CssClass="HidePanel"></ItemStyle>
                                </asp:BoundField>
                                <asp:BoundField DataField="CREDIT_DAYS" HeaderText="CREDIT_DAYS" ReadOnly="true">
                                    <HeaderStyle CssClass="HidePanel"></HeaderStyle>
                                    <ItemStyle CssClass="HidePanel"></ItemStyle>
                                </asp:BoundField>
                                <asp:BoundField DataField="CNIC" HeaderText="CNIC" ReadOnly="true">
                                    <HeaderStyle CssClass="HidePanel"></HeaderStyle>
                                    <ItemStyle CssClass="HidePanel"></ItemStyle>
                                </asp:BoundField>
                                <asp:BoundField DataField="NTN" HeaderText="NTN" ReadOnly="true">
                                    <HeaderStyle CssClass="HidePanel"></HeaderStyle>
                                    <ItemStyle CssClass="HidePanel"></ItemStyle>
                                </asp:BoundField>
                                <asp:BoundField DataField="REFERENCE" HeaderText="REFERENCE" ReadOnly="true">
                                    <HeaderStyle CssClass="HidePanel"></HeaderStyle>
                                    <ItemStyle CssClass="HidePanel"></ItemStyle>
                                </asp:BoundField>
                                 <asp:BoundField DataField="CUSTOMER_POLICY" HeaderText="CUSTOMER_POLICY" ReadOnly="true">
                                    <HeaderStyle CssClass="HidePanel"></HeaderStyle>
                                    <ItemStyle CssClass="HidePanel"></ItemStyle>
                                </asp:BoundField>
                            </Columns>
                            <FooterStyle BackColor="White"></FooterStyle>
                            <PagerStyle BackColor="Transparent"></PagerStyle>
                            <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" BackColor="#007395"
                                Font-Bold="True" ForeColor="White"></HeaderStyle>
                            <AlternatingRowStyle BackColor="#F2F2F2" CssClass="GridAlternateRowStyle" ForeColor="#333333">
                            </AlternatingRowStyle>
                        </asp:GridView>
                    </asp:Panel>
                </ContentTemplate>
            </asp:UpdatePanel>
        </div>
    </div>
</asp:Content>
