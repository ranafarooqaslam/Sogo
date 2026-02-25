<%@ Page Language="C#" MasterPageFile="~/Forms/PageMaster.master" AutoEventWireup="true"
    CodeFile="frmPurchaseEntry.aspx.cs" Inherits="Forms_frmPurchaseEntry" Title="SAMS: Stock Register" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajaxToolkit" %>
<asp:Content ID="Content1" runat="server" ContentPlaceHolderID="cphPage">
    <script language="JavaScript" type="text/javascript">
        function ValidateEnterKey(evt) {
            if (evt.keyCode == 13) //detect Enter key
            {
                return false;
            }
            else {
                return true;
            }
        }

        function ddlSKU_IndexChanged() {
            document.getElementById('<%=txtCtn.ClientID%>').focus();
        }
        function ValidateForm() {
            var  str = document.getElementById('<%=txtQuantity.ClientID%>').value;
            var str2 = document.getElementById('<%=txtCtn.ClientID%>').value;
            if ((str == null || str.length == 0) && (str2 == null || str2.length == 0)) {
                alert('Must Enter Quantity');
                return false;
            }
            str = document.getElementById('<%=txtDocumentNo.ClientID%>').value;
            if (str == null || str.length == 0) {
                alert('Must Enter Invoice/DC No');
                return false;
            }
            return true;
        }
        function ClearSelection(lb) {
            lb.selectedIndex = -1;
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
                        <asp:UpdatePanel ID="UpdatePanel2" runat="server">
                            <ContentTemplate>
                                <table>
                                    <tbody>
                                        <tr>
                                            <td style="height: 24px" align="left">
                                                <strong>
                                                    <asp:Label ID="Label2" runat="server" Height="14px" Text="Transaction Type"
                                                        Width="120px"></asp:Label></strong>
                                            </td>
                                            <td style="height: 24px">
                                                <asp:DropDownList ID="DrpDocumentType" runat="server" AutoPostBack="True"
                                                    OnSelectedIndexChanged="DrpDocumentType_SelectedIndexChanged" Width="200px">
                                                    <asp:ListItem Value="2">Purchase</asp:ListItem>
                                                    <asp:ListItem Value="5">Transfer Out</asp:ListItem>
                                                    <asp:ListItem Value="3">Purchase Return</asp:ListItem>
                                                    <asp:ListItem Value="4">Transfer In</asp:ListItem>
                                                    <asp:ListItem Value="6">Damage</asp:ListItem>
                                                </asp:DropDownList>
                                            </td>
                                            <td style="height: 24px">
                                                <strong>
                                                    <asp:Label ID="Label5" runat="server" Width="5px"></asp:Label></strong>
                                            </td>
                                            <td>
                                                
                                            </td>
                                        </tr>
                                        <tr>
                                            <td align="left" style="height: 25px">
                                                <strong>
                                                    <asp:Label ID="lblDocumentNo" runat="server" Text="Document No" Width="94px"></asp:Label></strong>
                                            </td>
                                            <td style="height: 25px">
                                                <asp:DropDownList ID="drpDocumentNo" runat="server" AutoPostBack="True"
                                                    OnSelectedIndexChanged="drpDocumentNo_SelectedIndexChanged" Width="200px">
                                                </asp:DropDownList>
                                            </td>
                                            <td style="height: 25px">
                                            </td>
                                        </tr>
                                        <tr>
                                            <td align="left" style="height: 25px">
                                                <strong>
                                                    <asp:Label ID="lbltoLocation" runat="server" Text="Principal" Width="94px"></asp:Label></strong>
                                            </td>
                                            <td style="height: 25px">
                                                <asp:DropDownList ID="drpPrincipal" runat="server" AutoPostBack="True"
                                                    OnSelectedIndexChanged="drpPrincipal_SelectedIndexChanged" Width="200px">
                                                </asp:DropDownList>
                                            </td>
                                            <td style="height: 25px">
                                            </td>
                                        </tr>
                                        <tr>
                                            <td align="left" style="height: 25px">
                                                <strong>
                                                    <asp:Label ID="lblfromLocation" runat="server" Text="Purchase For"
                                                        Width="94px"></asp:Label></strong>
                                            </td>
                                            <td style="height: 25px">
                                                <asp:DropDownList ID="drpDistributor" runat="server" AutoPostBack="True"
                                                   OnSelectedIndexChanged="drpDistributor_SelectedIndexChanged" Width="200px">
                                                </asp:DropDownList>
                                            </td>
                                            <td style="height: 25px">
                                            </td>
                                        </tr>
                                        <tr>
                                            <td style="height: 25px" align="left">
                                                <strong>
                                                    <asp:Label ID="Label4" runat="server" Text="Transfer To" Visible="False"
                                                        Width="82px"></asp:Label></strong>
                                            </td>
                                            <td style="height: 25px">
                                                <asp:DropDownList ID="DrpTransferFor" runat="server" Visible="False"
                                                    Width="200px">
                                                </asp:DropDownList>
                                            </td>
                                            <td style="height: 25px">
                                            </td>
                                        </tr>
                                        <tr>
                                            <td style="height: 25px;" align="left">
                                                <strong>
                                                    <asp:Label ID="Label1" runat="server" Text="INV/DC  No" Width="94px"></asp:Label></strong>
                                            </td>
                                            <td>
                                                <asp:TextBox ID="txtDocumentNo" runat="server" CssClass="txtBox" Width="195px"></asp:TextBox>
                                            </td>
                                            <td style="width: 1px" valign="top">
                                            </td>
                                        </tr>
                                        <tr>
                                            <td style="height: 25px;" align="left">
                                                <strong>
                                                    <asp:Label ID="Label3" runat="server" Text="Remarks" Width="94px"></asp:Label></strong>
                                            </td>
                                            <td>
                                                <asp:TextBox ID="txtBuiltyNo" runat="server" CssClass="txtBox" Width="195px"></asp:TextBox>
                                            </td>
                                            <td style="width: 1px" valign="top">
                                            </td>
                                        </tr>
                                        <tr>
                                            <td style="height: 25px" valign="top" align="left">
                                                
                                            </td>
                                            <td style="height: 25px; width: 1px;" valign="top">
                                                <asp:CheckBox ID="ChbFreeSKU" runat="server" Width="121px" Text="Apply Free SKU"
                                                    AutoPostBack="True" OnCheckedChanged="ChbFreeSKU_CheckedChanged"></asp:CheckBox>
                                            </td>
                                            <td style="width: 1px; height: 25px" valign="top">
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
        <div>
            <table width="100%">
                <tr>
                    <td>
                        <asp:UpdatePanel ID="UpdatePanel3" runat="server">
                            <ContentTemplate>
                                <table>
                                    <tbody>
                                        <tr>
                                            <td style="height: 16px">
                                                <asp:Label ID="lblskuname" runat="server" Width="376px" Height="16px" ForeColor="White"
                                                    Font-Bold="True" Text="   SKU Name" BackColor="#006699"></asp:Label>
                                            </td>
                                             <td>
                                                <asp:Label ID="Label8" runat="server" Width="73px" Height="16px" ForeColor="White"
                                                    Font-Bold="True" Text="Ctn" BackColor="#006699"></asp:Label>
                                            </td>
                                            <td>
                                                <asp:Label ID="lblquantity" runat="server" Width="73px" Height="16px" ForeColor="White"
                                                    Font-Bold="True" Text="Unit" BackColor="#006699"></asp:Label>
                                            </td>
                                            <td>
                                                <asp:Label ID="lblFreeSKU" runat="server" Width="75px" Height="16px" ForeColor="White"
                                                    Font-Bold="True" Text="Free SKU" BackColor="#006699"></asp:Label>
                                            </td>
                                            <td>
                                                <asp:Label ID="Label6" runat="server" Width="75px" Height="16px" ForeColor="White"
                                                    Font-Bold="True" Text="Amount" BackColor="#006699"></asp:Label>
                                            </td>
                                            <td>
                                                <asp:Label ID="Label41" runat="server" Width="100%" Height="16px" ForeColor="White"
                                                    Font-Bold="True" Text="Add SKU" BackColor="#006699"></asp:Label>
                                            </td>
                                        </tr>
                                        <tr>                                            
                                            <td>
                                                <asp:DropDownList ID="ddlSKU" runat="server" Width="353px" onchange="ddlSKU_IndexChanged();" onkeypress="return ValidateEnterKey(event);"></asp:DropDownList>
                                            </td>
                                             <td>
                                                <asp:TextBox ID="txtCtn" onfocus="SearchedCode()" runat="server" Width="70px"></asp:TextBox>
                                            </td>
                                            <td>
                                                <asp:TextBox ID="txtQuantity" runat="server" Width="70px"></asp:TextBox>
                                            </td>
                                            <td>
                                                <asp:TextBox ID="txtFreeSKU" runat="server" Width="70px" CssClass="txtBox" Enabled="False">0</asp:TextBox>
                                            </td>
                                            <td>
                                                <asp:TextBox ID="txtAmount" runat="server" Width="70px" Enabled="False"></asp:TextBox>
                                            </td>                                           
                                            <td>
                                                <asp:Button AccessKey="A" ID="btnSave" OnClick="btnSave_Click" runat="server" Width="100px"
                                                    Font-Size="8pt" Text="Add Sku" CssClass="Button"/>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td align="left" colspan="7">
                                                <asp:Panel ID="Panel2" runat="server" Width="800px" Height="130px" ScrollBars="Vertical"
                                                    BorderWidth="1px" BorderStyle="Groove" BorderColor="Silver">
                                                    <asp:GridView ID="GrdPurchase" runat="server" AutoGenerateColumns="False" BackColor="White"
                                                        BorderColor="White" CssClass="gridRow2" ForeColor="SteelBlue" HorizontalAlign="Center"
                                                        OnRowDeleting="GrdPurchase_RowDeleting" OnRowCommand="GrdPurchase_RowCommand"
                                                        ShowHeader="False" Width="780px">
                                                        <PagerSettings FirstPageText="" LastPageText="" Mode="NextPrevious" NextPageText="Next"
                                                            PreviousPageText="Previous" />
                                                        <RowStyle ForeColor="Black" />
                                                        <Columns>
                                                            <asp:BoundField DataField="SKU_ID" HeaderText="SKU_ID">
                                                                <HeaderStyle CssClass="HidePanel" />
                                                                <ItemStyle CssClass="HidePanel" />
                                                            </asp:BoundField>
                                                            <asp:BoundField DataField="SKU_CODE" HeaderText="SKU Code">
                                                                <ItemStyle BorderColor="Silver" BorderStyle="Solid" BorderWidth="2px" HorizontalAlign="Left"
                                                                    Width="85px" />
                                                            </asp:BoundField>
                                                            <asp:BoundField DataField="SKU_NAME" HeaderText="SKU Name">
                                                                <ItemStyle BorderColor="Silver" BorderStyle="Solid" BorderWidth="2px" HorizontalAlign="Left"
                                                                    Width="275px" />
                                                            </asp:BoundField>
                                                             <asp:BoundField DataField="QuantityCtn" HeaderText="Ctn">
                                                                <ItemStyle BorderColor="Silver" BorderStyle="Solid" BorderWidth="2px" HorizontalAlign="Right"
                                                                    Width="75px" />
                                                            </asp:BoundField>
                                                            <asp:BoundField DataField="Quantity" HeaderText="Quantity">
                                                                <ItemStyle BorderColor="Silver" BorderStyle="Solid" BorderWidth="2px" HorizontalAlign="Right"
                                                                    Width="75px" />
                                                            </asp:BoundField>
                                                            <asp:BoundField DataField="FREE_SKU" HeaderText="Free SKU">
                                                                <ItemStyle BorderColor="Silver" BorderStyle="Solid" BorderWidth="2px" HorizontalAlign="Right"
                                                                    Width="75px" />
                                                            </asp:BoundField>
                                                            <asp:BoundField DataField="AMOUNT" HeaderText="Amount">
                                                                <ItemStyle BorderColor="Silver" BorderStyle="Solid" BorderWidth="2px" HorizontalAlign="Right"
                                                                    Width="75px" />
                                                            </asp:BoundField>                                                           
                                                            <asp:TemplateField HeaderText="Edit">
                                                                <ItemTemplate>
                                                                    <asp:LinkButton ID="btnEdit" runat="server" Text="Edit" CommandName="Edt"></asp:LinkButton>
                                                                </ItemTemplate>
                                                                <ItemStyle BorderColor="Silver" BorderWidth="1px" BorderStyle="Solid"></ItemStyle>
                                                            </asp:TemplateField>
                                                            <asp:TemplateField HeaderText="Delete">
                                                                <ItemTemplate>
                                                                    <asp:LinkButton ID="btnDelete" runat="server" CommandName="Delete" OnClientClick="javascript:return confirm('Are you sure you want to Delete?');return false;"
                                                                        Text="Delete"></asp:LinkButton>
                                                                </ItemTemplate>
                                                                <ItemStyle BorderColor="Silver" BorderStyle="Solid" BorderWidth="2px" Width="45px" />
                                                            </asp:TemplateField>
                                                        </Columns>
                                                        <FooterStyle BackColor="White" />
                                                        <PagerStyle BackColor="Transparent" />
                                                        <HeaderStyle BackColor="#007395" Font-Bold="True" ForeColor="White" HorizontalAlign="Center"
                                                            VerticalAlign="Middle" />
                                                        <AlternatingRowStyle BackColor="#F2F2F2" CssClass="GridAlternateRowStyle" ForeColor="#333333" />
                                                    </asp:GridView>
                                                </asp:Panel>
                                            </td>
                                        </tr>

                                        <tr>                                            
                                            <td colspan="2">
                                            <asp:Button AccessKey="S" ID="btnSaveDocument" runat="server" Width="119px" Font-Size="8pt"
                                    Text="Save Document" UseSubmitBehavior="False" OnClick="btnSaveDocument_Click"
                                    CssClass="Button" />
                                <asp:Button AccessKey="C" ID="btnCancel" runat="server" Width="120px" Font-Size="8pt"
                                    Text="Cancel" UseSubmitBehavior="False" OnClick="btnCancel_Click" CssClass="Button" />
                                                <strong>
                                    <asp:Label ID="Label7" runat="server" Width="103px" Height="16px" Text="Total Quantity"></asp:Label></strong>
                                            </td>
                                             <td>
                                                 <asp:TextBox ID="txtTotalCtn" runat="server" Width="88px"
                                                    ReadOnly="True"></asp:TextBox>
                                            </td>
                                            <td>
                                                 <asp:TextBox ID="txtTotalQuantity" runat="server" Width="88px"
                                                    ReadOnly="True"></asp:TextBox>
                                            </td>
                                            <td>
                                                <asp:TextBox ID="txtTotalAmount" runat="server" Width="88px"
                                                    ReadOnly="True"></asp:TextBox>
                                            </td>
                                           
                                            <td>
                                                
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