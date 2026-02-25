<%@ Page Language="C#" MasterPageFile="~/Forms/PageMaster.master" AutoEventWireup="true"
    CodeFile="frmOrderEntryOld.aspx.cs" Inherits="Forms_frmOrderEntryOld" Title="SAMS: Order/Invoice Step 2" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajaxToolkit" %>

<asp:Content ID="Content1" runat="server" ContentPlaceHolderID="cphPage">
<style>
element.style {
    left: 120px;
    position: absolute;
    top: 190px;
    z-index: 999;
}
    .auto-style2 {
        height: 23px;
        width: 183px;
    }
    .auto-style3 {
        width: 188px;
    }
    .auto-style4 {
        width: 183px;
    }
</style>
    <script language="JavaScript" type="text/javascript">

        Sys.WebForms.PageRequestManager.getInstance().add_beginRequest(startRequest);
        Sys.WebForms.PageRequestManager.getInstance().add_endRequest(endRequest);

        function startRequest(sender, e) {
            document.getElementById('<%=btnSave.ClientID%>').disabled = true;
            document.getElementById('<%=btnCalculate.ClientID%>').disabled = true;
        }

        function endRequest(sender, e) {
            document.getElementById('<%=btnSave.ClientID%>').disabled = false;
            document.getElementById('<%=btnCalculate.ClientID%>').disabled = false;
        }

        function ValidateForm() {
            var str;
            str = document.getElementById('<%=txtQuantity.ClientID%>').value;
            var str2 = document.getElementById('<%=txtCtn.ClientID%>').value;
            if ((str == null || str.length == 0) && (str2 == null || str2.length == 0)) {
                alert('Must Enter Quantity');
                return false;
            }
            return true;
        }

        function SearchList() {
            var l = document.getElementById('<%= ListCustomer.ClientID %>');
            var tb = document.getElementById('<%= txtOutletCode.ClientID %>');


            if (tb.value == "") {
                ClearSelection(l);
            }
            else {
                for (var i = 0; i < l.options.length; i++) {
                    if (l.options[i].value.toLowerCase().match(tb.value.toLowerCase())) {
                        l.options[i].selected = true;
                        return false;
                    }
                    else {
                        ClearSelection(l);
                    }
                }
            }
        }
        function SearchedCode() {
            var str
            var stroption
            str = document.getElementById("<%= ListCustomer.ClientID %>").value;
            stroption = document.getElementById("<%= txtOutletCode.ClientID %>").value;

            if (str.length > 0) {
                document.getElementById("<%= txtOutletCode.ClientID %>").value = 'OT' + str.substring(str.indexOf('| ') + 2);
                document.getElementById("<%= txtOutletName.ClientID %>").value = str.substring(0, str.indexOf('|'));
                document.getElementById("<%= Panel1.ClientID %>").className = "HidePanel";

            }
            else if (stroption.length == 0) {
                document.getElementById("<%= Panel1.ClientID %>").className = "ShowPanel";
                document.getElementById("<%= ListCustomer.ClientID %>").focus();
            }
            ClearSelection(document.getElementById('<%= ListCustomer.ClientID %>'));

        }
        
        function SelectCode(e) {
            var key = e.charCode ? e.charCode : e.keyCode ? e.keyCode : 0;
            if (key == 13) {
                e.preventDefault();
                var str = document.getElementById("<%= ListCustomer.ClientID %>").value;
                document.getElementById("<%= txtOutletCode.ClientID %>").value = "OT" + str.substring(str.indexOf('|') + 2);
                document.getElementById("<%= txtOutletName.ClientID %>").value = str.substring(0, str.indexOf('|'));
                document.getElementById("<%= Panel1.ClientID %>").className = "HidePanel";
                document.getElementById("<%= ddlSKU.ClientID %>").focus();
            }
        }
        function ClearSelection(lb) {
            lb.selectedIndex = -1;
        }

        function ddlSKUChanged(ddl) {            
            var strText = ddl.options[ddl.selectedIndex].text;
            document.getElementById("<%= txtUnitRate.ClientID %>").value = strText.substring(strText.indexOf(':') + 1, strText.lastIndexOf(':'));
            document.getElementById("<%= txtStock.ClientID %>").value = strText.substring(strText.lastIndexOf(':') + 1);
            document.getElementById("<%= txtCtn.ClientID %>").focus();
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
            <span class="heading">Order/Invoice Step 2</span>
        </div>
        <div>
            <table width="100%">
                <tr>
                    <td align="left">
                        <div style="left: 120px; position: absolute; top: 190px; z-index:999;">
                            <asp:Panel ID="Panel1" runat="server" Width="327px" Height="237px" BorderWidth="1px"
                                BorderStyle="Inset" BorderColor="White" BackColor="Silver" CssClass="HidePanel">
                                <table style="border-right: #ffffff thin groove; border-top: #ffffff thin groove;
                                    border-left: #ffffff thin groove; width: 99%; border-bottom: #ffffff thin groove">
                                    <tbody>
                                        <tr>
                                            <td style="border-bottom: black thin solid" align="left" colspan="2">
                                                &nbsp;<strong>Select Customer from List Press Enter</strong>
                                            </td>
                                            <td style="border-bottom: black thin solid" valign="top" align="right">
                                                <asp:Button AccessKey="S" ID="Button4" runat="server" Width="21px" Height="16px"
                                                    Font-Size="8pt" Text="X" BorderWidth="1px" BorderStyle="Groove" CssClass="Button" />
                                            </td>
                                        </tr>
                                    </tbody>
                                </table>
                                <asp:ListBox ID="ListCustomer" onkeydown="SelectCode(event)" runat="server" Width="95%"
                                    Height="87%"></asp:ListBox>
                            </asp:Panel>
                        </div>
                        <asp:UpdatePanel ID="upSKU" runat="server" >
                        <ContentTemplate>                        
                        </ContentTemplate>
                        </asp:UpdatePanel>
                        <div style="z-index: 101; left: 500px; width: 100px; position: absolute; top: 369px;
                            height: 100px">
                            &nbsp;<asp:Panel ID="Panel21" runat="server">
                                <asp:UpdateProgress ID="UpdateProgress1" runat="server" AssociatedUpdatePanelID="UpdatePanel3">
                                    <ProgressTemplate>
                                        <asp:ImageButton ID="ImageButton1" runat="server" Height="28px" ImageUrl="~/App_Themes/Granite/Images/image003.gif"
                                            Width="31px" />
                                        Wait Update
                                    </ProgressTemplate>
                                </asp:UpdateProgress>
                            </asp:Panel>
                        </div>
                        <asp:UpdatePanel ID="UpdatePanel4" runat="server">
                            <ContentTemplate>
                                <table>
                                    <tbody>
                                        <tr>
                                            <td valign="top" align="left">
                                                <strong>
                                                    <asp:Label ID="lblDocumentNo" runat="server" Width="74px" Text="Invoice #"></asp:Label></strong>
                                            </td>
                                            <td valign="top" align="left" colspan="3">
                                                <asp:DropDownList ID="drpDocumentNo" runat="server" Width="231px"
                                                    OnSelectedIndexChanged="drpDocumentNo_SelectedIndexChanged" AutoPostBack="True">
                                                </asp:DropDownList>
                                                <strong>
                                                    <asp:Label ID="lblBillBook" TabIndex="1" runat="server" Text="Bill Book No:" Visible="false"></asp:Label></strong>
                                                <asp:TextBox ID="txtBillBookNo" runat="server" CssClass="uppercase" MaxLength="10" Visible="false"></asp:TextBox>
                                                <asp:CheckBox ID="ChbDiscount" runat="server" Visible="False" Width="90px" Text="Promotion"
                                                    AutoPostBack="True" Checked="True"></asp:CheckBox>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td valign="middle" align="left">
                                                <strong>
                                                    <asp:Label ID="Label11" runat="server" Width="77px" Text="Invoice Type"></asp:Label></strong>
                                            </td>
                                            <td valign="top" align="left" colspan="2">
                                                <asp:RadioButtonList id="RblPayMode" runat="server" Width="228px" Height="1px" RepeatDirection="Horizontal">
                                                    <asp:ListItem Value="214">Cash</asp:ListItem>
                                                    <asp:ListItem Selected="True" Value="215">Credit</asp:ListItem>
                                                    <asp:ListItem Value="216">Advance</asp:ListItem>
                                                </asp:RadioButtonList> 
                                            </td>
                                            <td valign="top" align="left" colspan="1" class="auto-style4">
                                                <asp:CheckBox ID="ChbBatchNo" runat="server" Width="94px" Text="Batch No" AutoPostBack="True"
                                                     Visible="false"></asp:CheckBox>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td valign="middle" align="left">
                                                <strong>
                                                    <asp:Label ID="Label12" runat="server" Width="101px" Text="Area/Saleman"></asp:Label></strong>
                                            </td>
                                            <td valign="top" align="left" colspan="2">
                                                <asp:TextBox ID="txtprincipal" onkeydown="SearchList()" runat="server" Width="277px"
                                                    CssClass="txtBox " ReadOnly="True"></asp:TextBox>
                                            </td>
                                            <td valign="top" align="left" colspan="1" class="auto-style4">
                                                <asp:TextBox ID="txtDeliveryMan" onkeydown="SearchList()" runat="server" Width="180px"
                                                    CssClass="txtBox " ReadOnly="True"></asp:TextBox>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td style="height: 23px" align="left">
                                                <strong>
                                                    <asp:Label ID="Label1" runat="server" Width="74px" Text="Customer"></asp:Label></strong>
                                            </td>
                                            <td style="height: 23px" align="left">
                                                <asp:TextBox ID="txtOutletCode" onkeydown="SearchList()" runat="server" Width="76px"
                                                    CssClass="txtBox "></asp:TextBox>
                                            </td>
                                            <td style="height: 23px" align="left">
                                                <asp:TextBox ID="txtOutletName" onfocus="SearchedCode()" runat="server" Width="192px"
                                                    CssClass="txtBox "></asp:TextBox>
                                            </td>
                                            <td align="left" class="auto-style2">
                                                <asp:TextBox ID="txtDiscountType" onkeydown="SearchList()" runat="server" Width="180px"
                                                    CssClass="txtBox " ReadOnly="True"></asp:TextBox>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td valign="middle" align="left">
                                                <strong>
                                                    <asp:Label ID="lblRemarks" runat="server" Width="77px" Text="Remarks"></asp:Label></strong>
                                            </td>
                                            <td valign="top" align="left" colspan="3">
                                                <asp:TextBox ID="txtRemarks" runat="server" Width="100%"></asp:TextBox>
                                            </td>                                           
                                        </tr>
                                        <tr>
                                            <td colspan="4">
                                                &nbsp;
                                            </td>
                                        </tr>
                                        <tr>
                                            <td align="left">
                                            </td>
                                            <td valign="top" align="right" colspan="2">
                                            <strong>Available Stock:</strong>
                                            <asp:TextBox ID="txtStock" runat="server" Text="0-0" Enabled="false" Width="100px"></asp:TextBox>                                            
                                            </td>
                                            <td   colspan="2" class="auto-style4"  align="right" >
                                                
                                                 <asp:RadioButtonList ID="rbDistype" Width="200px"
                                                     runat="server" RepeatDirection="Horizontal" >
                                                    <asp:ListItem Value="0" Selected="True" Text="%"></asp:ListItem>
                                                    <asp:ListItem Value="1" Text="Value"></asp:ListItem>
                                                      <asp:ListItem Value="2" Text="Per Unit Value"></asp:ListItem>
                                                </asp:RadioButtonList>
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
                <tr>
                    <td align="left">
                        <asp:Panel ID="Panel5" runat="server" DefaultButton="btnSave">
                            <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                                <ContentTemplate>
                                    <table width="100%">
                                        <tr>                                            
                                            <td style="width:36%">
                                                <asp:Label ID="lblskuname" runat="server" Width="100%" Height="16px" ForeColor="White"
                                                    Font-Bold="True" Text="SKU Name" BackColor="#006699"></asp:Label>
                                            </td>
                                            <td style="width:8%">
                                                <asp:Label ID="Label6" runat="server" BackColor="#006699" Font-Bold="True"
                                                    ForeColor="White" Height="16px" Text="Ctn" Width="100%"></asp:Label>
                                            </td>
                                            <td style="width:8%">
                                                <asp:Label ID="Label3" runat="server" BackColor="#006699" Font-Bold="True"
                                                    ForeColor="White" Height="16px" Text="Unit" Width="100%"></asp:Label>
                                            </td>
                                            <td style="width:8%">
                                                <asp:Label ID="lblquantity" runat="server" Width="100%" Height="16px" ForeColor="White"
                                                    Font-Bold="True" Text="Unit Price" BackColor="#006699"></asp:Label>
                                            </td>
                                            <td style="width:8%">
                                                 <asp:Label ID="Label2" runat="server" BackColor="#006699" Font-Bold="True"
                                                    ForeColor="White" Height="16px" Text="Amount" Width="100%"></asp:Label>
                                            </td>
                                            <td style="width:8%">
                                                <asp:Label ID="Label7" runat="server" BackColor="#006699" Font-Bold="True"
                                                    ForeColor="White" Height="16px" Text="Ext Dis." Width="100%"></asp:Label>
                                            </td>
                                            <td style="width:8%">
                                                <asp:Label ID="Label13" runat="server" BackColor="#006699" Font-Bold="True"
                                                    ForeColor="White" Height="16px" Text="Disc. Value" Width="100%"></asp:Label>
                                            </td>
                                            <td style="width:8%">
                                                <asp:Label ID="Label14" runat="server" BackColor="#006699" Font-Bold="True"
                                                    ForeColor="White" Height="16px" Text="Net Value" Width="100%"></asp:Label>
                                            </td>
                                            <td style="width:8%" colspan="2">
                                                <asp:Label ID="Label4" runat="server" BackColor="#006699" Font-Bold="True"
                                                    ForeColor="White" Height="16px" Text="Add SKU" Width="100%"></asp:Label>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>
                                                <asp:DropDownList ID="ddlSKU" runat="server" Width="100%" onchange="ddlSKUChanged(this)"></asp:DropDownList>                                                
                                            </td>
                                             <td>
                                                <asp:TextBox ID="txtCtn" runat="server" Width="100%"></asp:TextBox>
                                            </td>
                                            <td>
                                                <asp:TextBox ID="txtQuantity" runat="server" Width="100%"></asp:TextBox>
                                            </td>                                            
                                            <td>
                                                <asp:TextBox ID="txtUnitRate" runat="server" Width="100%" Enabled="False"></asp:TextBox>
                                            </td>                                           
                                            <td>
                                                <asp:TextBox ID="txtAmount" runat="server" Enabled="False" Width="100%"></asp:TextBox>
                                            </td>
                                             <td>
                                                <asp:TextBox ID="txtExtDiscount" runat="server" Width="100%"></asp:TextBox>
                                            </td>
                                            <td>
                                                <asp:TextBox ID="txtExtDiscountValue" runat="server" Width="100%" Enabled="false"></asp:TextBox>
                                            </td>
                                            <td>
                                                <asp:TextBox ID="txtNetValue" runat="server" Width="100%" Enabled="false"></asp:TextBox>
                                            </td>
                                            <td colspan="2">
                                                <asp:Button ID="btnSave" runat="server" Font-Size="8pt" OnClick="btnSave_Click" Text="Add Sku"
                                                    ValidationGroup="vg" Width="100%" AccessKey="A" CssClass="Button" />
                                            </td>
                                        </tr>                                       
                                    </table> 
                                    <asp:Panel ID="Panel2" runat="server" Height="130px" ScrollBars="Vertical" Width="102%"
                                                    BorderColor="Silver" BorderStyle="Groove" BorderWidth="1px">
                                                    <asp:GridView ID="GrdPurchase" runat="server" ForeColor="SteelBlue"
                                                        BackColor="White" HorizontalAlign="Center" AutoGenerateColumns="False" BorderColor="White"
                                                        ShowHeader="False" OnRowDeleting="GrdPurchase_RowDeleting" OnRowEditing="GrdPurchase_RowEditing" Width="100%">
                                                        <PagerSettings FirstPageText="" LastPageText="" Mode="NextPrevious" NextPageText="Next"
                                                            PreviousPageText="Previous"></PagerSettings>
                                                        <Columns>
                                                            <asp:BoundField DataField="SKU_ID" HeaderText="SKU_ID">
                                                                <HeaderStyle CssClass="HidePanel"></HeaderStyle>
                                                                <ItemStyle CssClass="HidePanel"></ItemStyle>
                                                            </asp:BoundField>
                                                            <asp:BoundField DataField="SKU_CODE" HeaderText="SKU Code">
                                                                <ItemStyle HorizontalAlign="Left" BorderColor="Silver" BorderWidth="2px" BorderStyle="Solid" Width="10%"></ItemStyle>
                                                            </asp:BoundField>
                                                            <asp:BoundField DataField="SKU_NAME" HeaderText="SKU Name">
                                                                <ItemStyle HorizontalAlign="Left" BorderColor="Silver" BorderWidth="2px" BorderStyle="Solid" Width="26%"></ItemStyle>
                                                            </asp:BoundField>
                                                            <asp:BoundField DataField="QUANTITY_CTN" HeaderText="Ctn">
                                                                <ItemStyle HorizontalAlign="Right" BorderColor="Silver" BorderWidth="2px" BorderStyle="Solid" Width="8%"></ItemStyle>
                                                            </asp:BoundField>
                                                            <asp:BoundField DataField="QUANTITY_UNIT" HeaderText="Quantity">
                                                                <ItemStyle HorizontalAlign="Right" BorderColor="Silver" BorderWidth="2px" BorderStyle="Solid" Width="8%"></ItemStyle>
                                                            </asp:BoundField>
                                                            <asp:BoundField DataField="UNIT_PRICE" HeaderText="PRICE" DataFormatString="{0:F2}">
                                                                <ItemStyle HorizontalAlign="Right" BorderColor="Silver" BorderWidth="2px" BorderStyle="Solid" Width="8%"></ItemStyle>
                                                            </asp:BoundField>                                                            
                                                            <asp:BoundField DataField="Amount" HeaderText="Amount" DataFormatString="{0:F2}">
                                                                <ItemStyle BorderColor="Silver" BorderStyle="Solid" BorderWidth="1px" HorizontalAlign="Right" Width="8%"/>
                                                            </asp:BoundField>
                                                            <asp:BoundField DataField="EXTRA_DISCOUNT_PER" HeaderText="Ext. Discount" DataFormatString="{0:F2}">
                                                                <ItemStyle HorizontalAlign="Right" BorderColor="Silver" BorderWidth="2px" BorderStyle="Solid" Width="8%"></ItemStyle>
                                                            </asp:BoundField>
                                                            <asp:BoundField DataField="EXTRA_DISCOUNT" HeaderText="Ext. Dis Value" DataFormatString="{0:F2}">
                                                                <ItemStyle HorizontalAlign="Right" BorderColor="Silver" BorderWidth="2px" BorderStyle="Solid" Width="8%"></ItemStyle>
                                                            </asp:BoundField>
                                                            <asp:BoundField DataField="NET_AMOUNT" HeaderText="Net Value" DataFormatString="{0:F2}">
                                                                <ItemStyle HorizontalAlign="Right" BorderColor="Silver" BorderWidth="2px" BorderStyle="Solid" Width="8%"></ItemStyle>
                                                            </asp:BoundField>
                                                            <asp:BoundField DataField="QUANTITY_CTN2" HeaderText="QUANTITY_CTN2">
                                                                <HeaderStyle CssClass="HidePanel" />
                                                                <ItemStyle CssClass="HidePanel" />
                                                            </asp:BoundField>
                                                            <asp:BoundField DataField="QUANTITY_UNIT2" HeaderText="QUANTITY_UNIT2">
                                                                <HeaderStyle CssClass="HidePanel" />
                                                                <ItemStyle CssClass="HidePanel" />
                                                            </asp:BoundField>
                                                            <asp:BoundField DataField="Stock" HeaderText="Stock">
                                                                <HeaderStyle CssClass="HidePanel" />
                                                                <ItemStyle CssClass="HidePanel" />
                                                            </asp:BoundField>
                                                            <asp:BoundField DataField="UNITS_IN_CASE" HeaderText="UNITS_IN_CASE">
                                                                <HeaderStyle CssClass="HidePanel" />
                                                                <ItemStyle CssClass="HidePanel" />
                                                            </asp:BoundField>
                                                            <asp:CommandField ShowEditButton="True" HeaderText="Edit">
                                                                <ItemStyle BorderColor="Silver" BorderWidth="1px" Width="40px"></ItemStyle>
                                                            </asp:CommandField>
                                                            <asp:TemplateField HeaderText="Delete">
                                                                <ItemTemplate>
                                                                    <asp:LinkButton ID="btnDelete" runat="server" Text="Delete" OnClientClick="javascript:return confirm('Are you sure you want to Delete?');return false;"
                                                                        CommandName="Delete"></asp:LinkButton>
                                                                </ItemTemplate>
                                                                <ItemStyle BorderColor="Silver" BorderWidth="2px" BorderStyle="Solid">
                                                                </ItemStyle>
                                                            </asp:TemplateField>                                                                                                                     
                                                        </Columns>
                                                    </asp:GridView>
                                                </asp:Panel>     
                                    <table width="100%">
                                        <tr>
                                            <td style="width:10%">
                                                
                                            </td>
                                            <td style="width:26%" align="right">
                                                Total
                                            </td>
                                            <td style="width:8%" align="right">
                                                <asp:Label ID="lblCtn" runat="server" Width="100%" Text="0"></asp:Label>
                                            </td>
                                            <td style="width:8%" align="right">
                                                <asp:Label ID="lblUnit" runat="server" Width="100%" Text="0"></asp:Label>
                                            </td>
                                            <td style="width:8%">
                                                
                                            </td>
                                            <td style="width:8%" align="right">
                                                 <asp:Label ID="lblAmount" runat="server" Width="100%" Text="0"></asp:Label>
                                            </td>
                                            <td style="width:8%">
                                                
                                            </td>
                                            <td style="width:8%" align="right">
                                                <asp:Label ID="lblExtraDiscount" runat="server" Width="100%" Text="0"></asp:Label>
                                            </td>
                                            <td style="width:8%" align="right">
                                                <asp:Label ID="lblNetValue" runat="server" Width="100%" Text="0"></asp:Label>
                                            </td>
                                            <td style="width:8%" colspan="2">                                                
                                            </td>
                                        </tr>
                                    </table>                              
                                </ContentTemplate>
                            </asp:UpdatePanel>
                        </asp:Panel>
                    </td>
                    <td style="width: 100px">
                        <asp:HiddenField ID="hfBillBookNo" runat="server" />
                    </td>
                </tr>
            </table>
        </div>
        <div>
            <table width="100%">
                <tr>
                    <td align="left">
                        <asp:UpdatePanel ID="UpdatePanel3" runat="server">
                            <ContentTemplate>
                                <table>
                                    <tbody>
                                        <tr>
                                            <td valign="top" align="left" colspan="2" rowspan="7">
                                                <strong>
                                                    <asp:Label ID="Label10" runat="server" Width="60px" Text="Free SKU"></asp:Label></strong>
                                                    <asp:Panel ID="Panel4" runat="server" Width="350px" Height="130px" BorderColor="Silver" BorderStyle="Groove"
                                                        ScrollBars="Vertical" BorderWidth="1px">
                                                        <asp:GridView ID="GrdFreeSKU" runat="server" Width="100%" ForeColor="Silver" CssClass="gridRow2"
                                                            BorderColor="White" BackColor="White" AutoGenerateColumns="False" HorizontalAlign="Center">
                                                            <PagerSettings FirstPageText="" LastPageText="" Mode="NextPrevious" NextPageText="Next"
                                                                PreviousPageText="Previous"></PagerSettings>
                                                            <RowStyle BorderColor="Silver" BorderWidth="1px" BorderStyle="Solid" ForeColor="Black">
                                                            </RowStyle>
                                                            <Columns>
                                                                <asp:TemplateField>
                                                                    <ItemTemplate>
                                                                        <asp:CheckBox ID="cbSelect" runat="server" Checked="true" />
                                                                    </ItemTemplate>
                                                                    <ItemStyle BorderColor="Silver" BorderStyle="Solid" BorderWidth="1px" HorizontalAlign="Center" />
                                                                </asp:TemplateField>
                                                                <asp:BoundField DataField="SKU_ID" HeaderText="SKU_ID">
                                                                    <HeaderStyle CssClass="HidePanel"></HeaderStyle>
                                                                    <ItemStyle CssClass="HidePanel"></ItemStyle>
                                                                </asp:BoundField>
                                                                <asp:BoundField DataField="SKU_Code" HeaderText="SKU Code">
                                                                    <ItemStyle Width="80px" BorderColor="Silver" BorderStyle="Solid" BorderWidth="1px">
                                                                    </ItemStyle>
                                                                </asp:BoundField>
                                                                <asp:BoundField DataField="SKU_Name" HeaderText="SKU Name">
                                                                    <ItemStyle Width="200px" BorderColor="Silver" BorderStyle="Solid" BorderWidth="1px">
                                                                    </ItemStyle>
                                                                </asp:BoundField>
                                                                <asp:BoundField DataField="Quantity" HeaderText="Qty">
                                                                    <ItemStyle Width="50px" BorderColor="Silver" BorderStyle="Solid" BorderWidth="1px">
                                                                    </ItemStyle>
                                                                </asp:BoundField>
                                                            </Columns>
                                                            <HeaderStyle CssClass="tblhead"></HeaderStyle>
                                                        </asp:GridView>
                                                    </asp:Panel>
                                            </td>
                                            <td style="height: 20px" align="left">
                                            </td>
                                            <td style="height: 20px" align="left">
                                                <strong>
                                                    <asp:Label ID="lblDocumentNo1" runat="server" Width="94px" Text="Gross Sale"></asp:Label></strong>
                                            </td>
                                            <td style="width: 7px; height: 20px">
                                                <asp:TextBox ID="txtGrossAmount" runat="server" Width="150px" ForeColor="Black" Font-Bold="True"
                                                    CssClass="txtBoxnNum" ReadOnly="True"></asp:TextBox>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td align="left">
                                            </td>
                                            <td align="left">
                                                <strong>
                                                    <asp:Label ID="lblfromLocation1" runat="server" Width="94px" Text="Extra Discount"></asp:Label></strong>
                                            </td>
                                            <td style="width: 7px">
                                                <asp:TextBox ID="numtxtTotalExtraDiscnt" runat="server" Width="150px" ForeColor="Black" ReadOnly="true"
                                                    Font-Bold="True"></asp:TextBox>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td style="height: 18px" align="left">
                                            </td>
                                            <td style="height: 18px" align="left">
                                                <strong>
                                                    <asp:Label ID="Label51" runat="server" Width="110px" Text="Standard Discount"></asp:Label></strong>
                                            </td>
                                            <td style="width: 7px; height: 18px">
                                                <asp:TextBox ID="numTxtTotalStndrdDiscnt" runat="server" Width="150px" ForeColor="Black"
                                                    Font-Bold="True" CssClass="txtBoxnNum" ReadOnly="True"></asp:TextBox>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td style="width: 1px; height: 20px" valign="top">
                                            </td>
                                            <td style="width: 1px; height: 20px" align="left">
                                                <strong>
                                                    <asp:Label ID="Label8" runat="server" Width="116px" Text="Claimable  Discount"></asp:Label></strong>
                                            </td>
                                            <td style="width: 7px; height: 20px" align="right">
                                                <asp:TextBox ID="numtxtUnClaimabledist" runat="server" Width="150px" ForeColor="Black"
                                                    Font-Bold="True" CssClass="txtBoxnNum" ReadOnly="True"></asp:TextBox>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td style="width: 1px; height: 20px" valign="top">
                                            </td>
                                            <td style="width: 1px; height: 20px" align="left">
                                                <strong>
                                                    <asp:Label ID="Label81" runat="server" Width="93px" Text="GST Amount"></asp:Label></strong>
                                            </td>
                                            <td style="width: 7px; height: 20px" align="right">
                                                <asp:TextBox ID="numTxtTotalGST" runat="server" Width="150px" ForeColor="Black" Font-Bold="True"
                                                    CssClass="txtBoxnNum" ReadOnly="True"></asp:TextBox>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td style="width: 1px; height: 20px" valign="top">
                                            </td>
                                            <td style="width: 1px; height: 20px" align="left">
                                                <strong>
                                                    <asp:Label ID="Label9" runat="server" Width="93px" Text="TST Amount"></asp:Label></strong>
                                            </td>
                                            <td style="width: 7px; height: 20px" align="right">
                                                <asp:TextBox ID="numTxtTotalTST" runat="server" Width="150px" ForeColor="Black" Font-Bold="True"
                                                    CssClass="txtBoxnNum" ReadOnly="True"></asp:TextBox>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td style="width: 1px; height: 20px" valign="top">
                                            </td>
                                            <td style="width: 1px; height: 20px" align="left">
                                                <strong>
                                                    <asp:Label ID="Label91" runat="server" Width="105px" Text="Net Amount"></asp:Label></strong>
                                            </td>
                                            <td style="width: 7px; height: 20px" align="right">
                                                <asp:TextBox ID="numTxtTotlAmnt" runat="server" Width="150px" ForeColor="Black" Font-Bold="True"
                                                    CssClass="txtBoxnNum" ReadOnly="True"></asp:TextBox>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td align="left" colspan="2">
                                                <table>
                                                    <tbody>
                                                        <tr>
                                                            <td style="width: 100px">
                                                                <asp:Button AccessKey="C" ID="btnCalculate" TabIndex="100" OnClick="btnCalculate_Click"
                                                                    runat="server" Width="100px" Font-Size="8pt" Text="Calculate" Enabled="False"
                                                                    CssClass="Button" />
                                                            </td>
                                                            <td style="width: 100px">
                                                                <asp:Button AccessKey="S" ID="btnSaveOrder" TabIndex="101" OnClick="btnSaveOrder_Click"
                                                                    runat="server" Width="110px" Font-Size="8pt" Text="Save Order" CssClass="Button" />
                                                            </td>
                                                            <td style="width: 100px">
                                                                <asp:Button AccessKey="H" ID="btnCancel" TabIndex="102" runat="server" Width="110px"
                                                                    Font-Size="8pt" Text="Home" OnClick="btnCancel_Click" CssClass="Button" />
                                                            </td>
                                                        </tr>
                                                    </tbody>
                                                </table>
                                            </td>
                                            <td style="width: 1px" valign="top" align="left">
                                                &nbsp; &nbsp; &nbsp;&nbsp;
                                            </td>
                                            <td style="width: 1px" align="left">
                                                <strong>
                                                    <asp:Label ID="Label5" runat="server" Width="105px" Text="Cash Received" Visible="false"></asp:Label></strong>
                                            </td>
                                            <td style="width: 7px" align="right">
                                                <asp:TextBox ID="txtCashReceived" runat="server" Width="150px" ForeColor="Black"
                                                    Font-Bold="True" CssClass="txtBoxnNum" Visible="False"></asp:TextBox>
                                            </td>
                                        </tr>
                                    </tbody>
                                </table>
                            </ContentTemplate>
                        </asp:UpdatePanel>
                        &nbsp;&nbsp;
                        <asp:TextBox ID="numTxtTotalSED" runat="server" CssClass="txtBox " Font-Bold="False"
                            ForeColor="Black" Width="139px" ReadOnly="True" Visible="False"></asp:TextBox>&nbsp;&nbsp;
                    </td>
                </tr>
            </table>
        </div>
    </div>
</asp:Content>
