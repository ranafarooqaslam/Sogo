<%@ Page Language="C#" MasterPageFile="~/Forms/PageMaster.master" AutoEventWireup="true" CodeFile="frmSKUHierarchyData.aspx.cs" Inherits="frmSKUHierarchyData" Title="SAMS: SKU Hierarchy" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="cphPage" runat="Server">
    <script src="../AjaxLibrary/jquery.searchabledropdown-1.0.8.min.js" type="text/javascript"></script>
    <script language="JavaScript" type="text/javascript">
        function pageLoad() {
            $('#<%=txtNTN.ClientID %>').mask("9999999-9");
            $('#<%=txtSTRN.ClientID %>').mask("99-99-9999-999-99");
            $("select").searchable();
        }

    </script>
    <div id="right_data">
        <table width="100%">
            <tr>
                <td>
                    <cc1:TabContainer ID="TabContainer1" runat="server" Height="400px"
                        Width="650px" ActiveTabIndex="0">
                        <cc1:TabPanel ID="TabPanel1" runat="server">
                            <HeaderTemplate>
                                Principal
                             
                            </HeaderTemplate>
                            <ContentTemplate>
                                <table width="100%">
                                    <tr>
                                        <td style="width: 100px"></td>
                                        <td style="width: 100px">
                                            <asp:UpdatePanel ID="UpdatePanel6" runat="server">
                                                <ContentTemplate>
                                                    <table width="100%">
                                                        <tbody>
                                                            <tr>
                                                                <td style="width: 100px"></td>
                                                                <td colspan="2">
                                                                    <asp:Label ID="lblErrorMsg" runat="server" ForeColor="Red" Font-Bold="True"></asp:Label><br />
                                                                </td>
                                                                <td style="width: 100px"></td>
                                                            </tr>
                                                            <tr>
                                                                <td style="width: 100px; height: 28px"></td>
                                                                <td style="width: 49px; height: 28px">
                                                                    <strong>
                                                                        <asp:Label ID="Label1" runat="server" Width="90px" Text="Principal Code"></asp:Label></strong> </td>
                                                                <td style="width: 100px; height: 28px">
                                                                    <asp:TextBox ID="txtPrincipalCode" runat="server" Width="200px" Enabled="False" CssClass="txtBox "></asp:TextBox>
                                                                </td>
                                                                <td style="width: 100px; height: 28px"></td>
                                                            </tr>
                                                            <tr>
                                                                <td style="width: 100px; height: 29px"></td>
                                                                <td style="width: 49px; height: 29px">
                                                                    <strong>
                                                                        <asp:Label ID="Label2" runat="server" Width="96px" Text="Principal Name"></asp:Label></strong> </td>
                                                                <td style="width: 100px; height: 29px">
                                                                    <asp:TextBox ID="txtPrincipalName" runat="server" Width="200px" Enabled="False" CssClass="txtBox "></asp:TextBox>
                                                                </td>
                                                                <td style="width: 100px; height: 29px"></td>
                                                            </tr>
                                                            <tr>
                                                                <td style="width: 100px; height: 29px"></td>
                                                                <td style="width: 49px; height: 29px">
                                                                    <strong>
                                                                        <asp:Label ID="Label11" runat="server" Width="96px" Text="Address" ></asp:Label></strong></td>
                                                                <td style="width: 100px; height: 29px">
                                                                    <asp:TextBox ID="txtAddress" runat="server" Width="200px" Enabled="False" CssClass="txtBox "></asp:TextBox></td>
                                                                <td style="width: 100px; height: 29px"></td>
                                                            </tr>
                                                            <tr>
                                                                <td style="width: 100px; height: 29px"></td>
                                                                <td style="width: 49px; height: 29px">
                                                                    <strong>
                                                                        <asp:Label ID="Label13" runat="server" Width="96px" Text="NTN" ></asp:Label></strong></td>
                                                                <td style="width: 100px; height: 29px">
                                                                    <asp:TextBox ID="txtNTN" runat="server" Width="200px" Enabled="False" CssClass="txtBox "></asp:TextBox></td>
                                                                <td style="width: 100px; height: 29px"></td>
                                                            </tr>
                                                            <tr>
                                                                <td style="width: 100px; height: 29px"></td>
                                                                <td style="width: 49px; height: 29px">
                                                                    <strong>
                                                                        <asp:Label ID="Label14" runat="server" Width="96px" Text="STRN"></asp:Label></strong></td>
                                                                <td style="width: 100px; height: 29px">
                                                                    <asp:TextBox ID="txtSTRN" runat="server" Width="200px" Enabled="False" CssClass="txtBox "></asp:TextBox></td>
                                                                <td style="width: 100px; height: 29px"></td>
                                                            </tr>
                                                            <tr>
                                                                <td style="width: 100px; height: 37px"></td>
                                                                <td style="width: 49px; height: 37px" align="left"></td>
                                                                <td style="width: 100px; height: 37px">
                                                                    <asp:CheckBox ID="ChIsMunalDiscount" runat="server" Width="190px" Text="Is Manual Dicount"></asp:CheckBox>
                                                                </td>
                                                                <td style="width: 100px; height: 37px"></td>
                                                            </tr>
                                                            <tr>
                                                                <td style="width: 100px"></td>
                                                                <td style="width: 49px" align="right">&nbsp;</td>
                                                                <td style="width: 100px">
                                                                    <asp:Button ID="btnSavePrincipal" OnClick="btnSavePrincipal_Click" runat="server" Width="85px" Font-Size="8pt" Text="New" CssClass="Button" />
                                                                </td>
                                                                <td style="width: 100px"></td>
                                                            </tr>
                                                        </tbody>
                                                    </table>
                                                </ContentTemplate>
                                            </asp:UpdatePanel>
                                            <asp:UpdateProgress ID="UpdateProgress1" runat="server" AssociatedUpdatePanelID="UpdatePanel6">
                                                <ProgressTemplate>
                                                    <asp:ImageButton ID="ImageButton1" runat="server" Width="33px" Height="31px" ImageUrl="~/App_Themes/Granite/Images/image003.gif"></asp:ImageButton>
                                                </ProgressTemplate>
                                            </asp:UpdateProgress>
                                        </td>
                                        <td style="width: 100px"></td>
                                    </tr>
                                    <tr>
                                        <td align="center" colspan="3">
                                            <asp:Panel ID="Panel1" runat="server" Height="150px" ScrollBars="Vertical" Width="100%">
                                                <asp:UpdatePanel ID="UpdatePanel5" runat="server">
                                                    <ContentTemplate>
                                                        <asp:GridView ID="GrdPrincipal" runat="server" Width="90%" ForeColor="SteelBlue" Font-Size="9pt" CssClass="gridRow2" BorderColor="White" BackColor="White" HorizontalAlign="Center" AutoGenerateColumns="False" OnRowDeleting="GrdPrincipal_RowDeleting" OnRowCommand="GrdPrincipal_RowCommand" OnPageIndexChanging="GrdPrincipal_PageIndexChanging">
                                                            <PagerSettings PreviousPageText="Previous" Mode="NextPrevious" LastPageText="" FirstPageText="" NextPageText="Next"></PagerSettings>
                                                            <Columns>
                                                                <asp:BoundField DataField="SKU_HIE_ID" Visible="False" HeaderText="ID">
                                                                    <ItemStyle BorderStyle="Solid" BorderWidth="1px" BorderColor="Silver" HorizontalAlign="Left"></ItemStyle>
                                                                </asp:BoundField>
                                                                <asp:BoundField DataField="SKU_HIE_CODE" HeaderText="Code">
                                                                    <ItemStyle BorderStyle="Solid" BorderWidth="1px" BorderColor="Silver" HorizontalAlign="Left"></ItemStyle>

                                                                    <HeaderStyle BorderStyle="Solid" BorderWidth="1px" BorderColor="Silver" HorizontalAlign="Left"></HeaderStyle>
                                                                </asp:BoundField>
                                                                <asp:BoundField DataField="SKU_HIE_NAME" HeaderText="Name">
                                                                    <ItemStyle BorderStyle="Solid" BorderWidth="1px" BorderColor="Silver" HorizontalAlign="Left"></ItemStyle>

                                                                    <HeaderStyle HorizontalAlign="Left"></HeaderStyle>
                                                                </asp:BoundField>
                                                                <asp:BoundField DataField="IS_MANUALDISCOUNT" HeaderText="Manual Discount"></asp:BoundField>
                                                                <asp:BoundField DataField="ADDRESS" Visible="False" HeaderText="ADDRESS"></asp:BoundField>
                                                                <asp:BoundField DataField="NTN" Visible="False" HeaderText="NTN"></asp:BoundField>
                                                                <asp:BoundField DataField="STRN" Visible="False" HeaderText="STRN"></asp:BoundField>
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
                                                                </asp:TemplateField>
                                                            </Columns>
                                                            <HeaderStyle CssClass="tblhead"></HeaderStyle>

                                                            <AlternatingRowStyle CssClass="GridAlternateRowStyle"></AlternatingRowStyle>
                                                        </asp:GridView>
                                                    </ContentTemplate>
                                                </asp:UpdatePanel>
                                            </asp:Panel>
                                        </td>
                                    </tr>
                                </table>

                            </ContentTemplate>
                        </cc1:TabPanel>
                        <cc1:TabPanel ID="TabPanel2" runat="server">
                            <HeaderTemplate>
                                Division
                             
                            </HeaderTemplate>
                            <ContentTemplate>
                                <table width="100%">
                                    <tr>
                                        <td style="width: 100px;"></td>
                                        <td align="center">
                                            <asp:UpdatePanel ID="UpdatePanel2" runat="server">
                                                <ContentTemplate>
                                                    <table width="100%">
                                                        <tbody>
                                                            <tr>
                                                                <td style="width: 100px; height: 8px"></td>
                                                                <td style="height: 8px" align="left" colspan="2">
                                                                    <asp:Label ID="lblErrorMsgDivsion" runat="server" ForeColor="Red" Font-Bold="True"></asp:Label><br />
                                                                </td>
                                                                <td style="width: 100px; height: 8px"></td>
                                                            </tr>
                                                            <tr>
                                                                <td style="width: 100px; height: 8px"></td>
                                                                <td style="width: 159px; height: 8px"></td>
                                                                <td style="width: 100px; height: 8px"></td>
                                                                <td style="width: 100px; height: 8px"></td>
                                                            </tr>
                                                            <tr>
                                                                <td style="width: 100px; height: 23px"></td>
                                                                <td style="width: 159px" align="left">
                                                                    <strong>
                                                                        <asp:Label ID="Label3" runat="server" Width="80px" Text="Principal" ></asp:Label></strong> &nbsp;</td>
                                                                <td style="width: 100px; height: 28px">
                                                                    <asp:DropDownList ID="dddivisonPrincipal" runat="server" Width="200px" AutoPostBack="True" Height="25px" OnSelectedIndexChanged="dddivisonPrincipal_SelectedIndexChanged">
                                                                    </asp:DropDownList>
                                                                </td>
                                                                <td style="width: 100px; height: 23px"></td>
                                                            </tr>
                                                            <tr>
                                                                <td style="width: 100px; height: 28px"></td>
                                                                <td style="width: 159px; height: 28px" align="left">
                                                                    <strong>
                                                                        <asp:Label ID="Label12" runat="server" Width="80px" Text="Division Code"></asp:Label></strong> </td>
                                                                <td style="width: 100px; height: 28px">
                                                                    <asp:TextBox ID="txtDivisionCode" runat="server" Width="194px" Enabled="False" CssClass="txtBox "></asp:TextBox>
                                                                </td>
                                                                <td style="width: 100px; height: 28px"></td>
                                                            </tr>
                                                            <tr>
                                                                <td style="width: 100px; height: 29px"></td>
                                                                <td style="width: 159px; height: 29px" align="left">
                                                                    <strong>
                                                                        <asp:Label ID="Label21" runat="server" Width="85px" Text="Division Name" ></asp:Label></strong> </td>
                                                                <td style="width: 100px; height: 29px">
                                                                    <asp:TextBox ID="txtDivisionName" runat="server" Width="194px" Enabled="False" CssClass="txtBox "></asp:TextBox>
                                                                </td>
                                                                <td style="width: 100px; height: 29px"></td>
                                                            </tr>
                                                            <tr>
                                                                <td style="width: 100px; height: 37px"></td>
                                                                <td style="width: 159px; height: 37px" align="right">&nbsp;</td>
                                                                <td style="width: 100px; height: 37px" align="left">
                                                                    <asp:Button ID="btnSaveDivison" OnClick="btnSaveDivison_Click" runat="server" Width="85px" Font-Size="8pt" Text="New" CssClass="Button" />
                                                                </td>
                                                                <td style="width: 100px; height: 37px"></td>
                                                            </tr>
                                                        </tbody>
                                                    </table>
                                                </ContentTemplate>
                                            </asp:UpdatePanel>
                                            <asp:UpdateProgress ID="UpdateProgress2" runat="server" AssociatedUpdatePanelID="UpdatePanel1">
                                                <ProgressTemplate>
                                                    <asp:Image ID="Image2" runat="server" Width="30px" Height="28px" ImageUrl="~/App_Themes/Granite/Images/image003.gif"></asp:Image>&nbsp; Loading ......... 
                                                </ProgressTemplate>
                                            </asp:UpdateProgress>
                                        </td>
                                        <td style="width: 100px;"></td>
                                    </tr>
                                    <tr>
                                        <td align="center" colspan="3">
                                            <asp:Panel ID="Panel2" runat="server" Height="200px" ScrollBars="Vertical" Width="100%">
                                                <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                                                    <ContentTemplate>
                                                        <asp:GridView ID="GrdDivision" runat="server" Width="90%" ForeColor="SteelBlue" Font-Size="9pt" CssClass="gridRow2" BorderColor="White" BackColor="White" HorizontalAlign="Center" AutoGenerateColumns="False" OnRowDeleting="GrdDivision_RowDeleting" OnRowCommand="GrdDivision_RowCommand" OnPageIndexChanging="GrdDivision_PageIndexChanging">
                                                            <PagerSettings FirstPageText="" LastPageText="" Mode="NextPrevious" NextPageText="Next" PreviousPageText="Previous"></PagerSettings>
                                                            <Columns>
                                                                <asp:BoundField DataField="SKU_HIE_ID" HeaderText="Id" Visible="False">
                                                                    <ItemStyle HorizontalAlign="Left" BorderColor="Silver" BorderWidth="1px" BorderStyle="Solid"></ItemStyle>
                                                                </asp:BoundField>
                                                                <asp:BoundField DataField="SKU_HIE_CODE" HeaderText="Code">
                                                                    <ItemStyle HorizontalAlign="Left" BorderColor="Silver" BorderWidth="1px" BorderStyle="Solid"></ItemStyle>
                                                                    <HeaderStyle HorizontalAlign="Left" />
                                                                </asp:BoundField>
                                                                <asp:BoundField DataField="SKU_HIE_NAME" HeaderText="Name">
                                                                    <ItemStyle HorizontalAlign="Left" BorderColor="Silver" BorderWidth="1px" BorderStyle="Solid"></ItemStyle>
                                                                    <HeaderStyle HorizontalAlign="Left" />
                                                                </asp:BoundField>
                                                                <asp:TemplateField HeaderText="Edit">
                                                                    <ItemTemplate>
                                                                        <asp:LinkButton ID="btnEdit" runat="server" Text="Edit" CommandName="Edt"></asp:LinkButton>
                                                                    </ItemTemplate>
                                                                    <ItemStyle BorderColor="Silver" BorderWidth="1px" BorderStyle="Solid"></ItemStyle>
                                                                </asp:TemplateField>
                                                                <asp:TemplateField HeaderText="Delete">
                                                                    <ItemTemplate>
                                                                        <asp:LinkButton ID="btnDelete" runat="server" CommandName="Delete" OnClientClick="javascript:return confirm('Are you sure you want to Delete?');return false;" Text="Delete"></asp:LinkButton>
                                                                    </ItemTemplate>
                                                                </asp:TemplateField>
                                                            </Columns>
                                                            <HeaderStyle CssClass="tblhead"></HeaderStyle>
                                                        </asp:GridView>
                                                    </ContentTemplate>
                                                </asp:UpdatePanel>
                                            </asp:Panel>
                                        </td>
                                    </tr>
                                </table>
                                <br />
                            </ContentTemplate>
                        </cc1:TabPanel>
                        <cc1:TabPanel ID="TabPanel3" runat="server">
                            <HeaderTemplate>
                                Category
                             
                            </HeaderTemplate>
                            <ContentTemplate>
                                <table width="100%">
                                    <tr>
                                        <td style="width: 100px"></td>
                                        <td align="center" style="width: 100px">
                                            <asp:UpdatePanel ID="UpdatePanel21" runat="server">
                                                <ContentTemplate>
                                                    <table width="100%">
                                                        <tbody>
                                                            <tr>
                                                                <td style="width: 100px; height: 16px"></td>
                                                                <td style="height: 16px" align="left" colspan="2">
                                                                    <br />
                                                                    <asp:Label ID="lblErrorMsgCategory" runat="server" ForeColor="Red" Font-Bold="True"></asp:Label></td>
                                                                <td style="width: 100px; height: 16px"></td>
                                                            </tr>
                                                            <tr>
                                                                <td style="width: 100px; height: 8px"></td>
                                                                <td style="width: 69px; height: 8px"></td>
                                                                <td style="width: 100px; height: 8px"></td>
                                                                <td style="width: 100px; height: 8px"></td>
                                                            </tr>
                                                            <tr>
                                                                <td style="width: 100px; height: 21px"></td>
                                                                <td style="width: 69px; height: 21px" align="left">
                                                                    <strong>
                                                                        <asp:Label ID="Label5" runat="server" Width="80px" Text="Principal"></asp:Label></strong></td>
                                                                <td style="width: 100px; height: 28px">
                                                                    <asp:DropDownList ID="DrpCategoryPrincipal" runat="server" Height="25px" Width="200px" AutoPostBack="True" OnSelectedIndexChanged="DrpCategoryPrincipal_SelectedIndexChanged">
                                                                    </asp:DropDownList></td>
                                                                <td style="width: 100px; height: 21px"></td>
                                                            </tr>
                                                            <tr>
                                                                <td style="width: 100px; height: 21px"></td>
                                                                <td style="width: 69px; height: 21px" align="left">
                                                                    <strong>
                                                                        <asp:Label ID="Label4" runat="server" Width="80px" Text="Division" ></asp:Label></strong> </td>
                                                                <td style="width: 100px; height: 28px">
                                                                    <asp:DropDownList ID="ddCategoryDivision" Height="25px" runat="server" Width="200px" AutoPostBack="True" OnSelectedIndexChanged="ddCategoryDivision_SelectedIndexChanged">
                                                                    </asp:DropDownList>
                                                                </td>
                                                                <td style="width: 100px; height: 21px"></td>
                                                            </tr>
                                                            <tr>
                                                                <td style="width: 100px; height: 28px"></td>
                                                                <td style="width: 69px; height: 28px" align="left">
                                                                    <strong>
                                                                        <asp:Label ID="Label121" runat="server" Width="90px" Text="Category Code"></asp:Label></strong> </td>
                                                                <td style="width: 100px; height: 28px">
                                                                    <asp:TextBox ID="txtCategoryCode" runat="server" Width="194px" Enabled="False" CssClass="txtBox "></asp:TextBox>
                                                                </td>
                                                                <td style="width: 100px; height: 28px"></td>
                                                            </tr>
                                                            <tr>
                                                                <td style="width: 100px; height: 29px"></td>
                                                                <td style="width: 69px; height: 29px" align="left">
                                                                    <strong>
                                                                        <asp:Label ID="Label211" runat="server" Width="90px" Text="Category Name"></asp:Label></strong> </td>
                                                                <td style="width: 100px; height: 29px">
                                                                    <asp:TextBox ID="txtCategoryName" runat="server" Width="194px" Enabled="False" CssClass="txtBox "></asp:TextBox>
                                                                </td>
                                                                <td style="width: 100px; height: 29px"></td>
                                                            </tr>
                                                            <tr>
                                                                <td style="width: 100px; height: 37px"></td>
                                                                <td style="width: 69px; height: 37px" align="right">&nbsp;</td>
                                                                <td style="width: 100px; height: 37px" align="left">
                                                                    <asp:Button ID="btnSaveCategory" OnClick="btnSaveCategory_Click" runat="server" Width="85px" Font-Size="8pt" Text="New" CssClass="Button" />
                                                                </td>
                                                                <td style="width: 100px; height: 37px"></td>
                                                            </tr>
                                                        </tbody>
                                                    </table>
                                                </ContentTemplate>
                                            </asp:UpdatePanel>
                                            <asp:UpdateProgress ID="UpdateProgress3" runat="server" AssociatedUpdatePanelID="UpdatePanel21">
                                                <ProgressTemplate>
                                                    <asp:Image ID="Image3" runat="server" Width="30px" Height="28px" ImageUrl="~/App_Themes/Granite/Images/image003.gif"></asp:Image>&nbsp; Loading ......... 
                                                </ProgressTemplate>
                                            </asp:UpdateProgress>
                                        </td>
                                        <td style="width: 100px"></td>
                                    </tr>
                                    <tr>
                                        <td align="center" colspan="3">
                                            <asp:Panel ID="Panel3" runat="server" Height="200px" ScrollBars="Vertical" Width="100%">
                                                <asp:UpdatePanel ID="UpdatePanel7" runat="server">
                                                    <ContentTemplate>
                                                        <asp:GridView ID="GrdCategory" runat="server" Width="90%" ForeColor="SteelBlue" Font-Size="9pt" CssClass="gridRow2" BorderColor="White" BackColor="White" HorizontalAlign="Center" AutoGenerateColumns="False" OnRowCommand="GrdCategory_RowCommand" OnRowDeleting="GrdCategory_RowDeleting" OnPageIndexChanging="GrdCategory_PageIndexChanging">
                                                            <PagerSettings FirstPageText="" LastPageText="" Mode="NextPrevious" NextPageText="Next" PreviousPageText="Previous"></PagerSettings>
                                                            <Columns>
                                                                <asp:BoundField DataField="SKU_HIE_ID" HeaderText="Id" Visible="False">
                                                                    <ItemStyle HorizontalAlign="Left" BorderColor="Silver" BorderWidth="1px" BorderStyle="Solid"></ItemStyle>
                                                                </asp:BoundField>
                                                                <asp:BoundField DataField="SKU_HIE_CODE" HeaderText="Code">
                                                                    <ItemStyle HorizontalAlign="Left" BorderColor="Silver" BorderWidth="1px" BorderStyle="Solid"></ItemStyle>
                                                                    <HeaderStyle HorizontalAlign="Left" />
                                                                </asp:BoundField>
                                                                <asp:BoundField DataField="SKU_HIE_NAME" HeaderText="Name">
                                                                    <ItemStyle HorizontalAlign="Left" BorderColor="Silver" BorderWidth="1px" BorderStyle="Solid"></ItemStyle>
                                                                    <HeaderStyle HorizontalAlign="Left" />
                                                                </asp:BoundField>
                                                                <asp:BoundField DataField="Status" HeaderText="Status">
                                                                    <ItemStyle HorizontalAlign="Left" BorderColor="Silver" BorderWidth="1px" BorderStyle="Solid"></ItemStyle>
                                                                    <HeaderStyle HorizontalAlign="Left" />
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
                                                                </asp:TemplateField>
                                                            </Columns>
                                                            <HeaderStyle CssClass="tblhead"></HeaderStyle>
                                                        </asp:GridView>
                                                    </ContentTemplate>
                                                </asp:UpdatePanel>
                                            </asp:Panel>
                                        </td>
                                    </tr>
                                </table>

                            </ContentTemplate>
                        </cc1:TabPanel>
                        <cc1:TabPanel ID="TabPanel4" runat="server">
                            <HeaderTemplate>
                                Brand
                             
                            </HeaderTemplate>
                            <ContentTemplate>
                                <table width="100%">
                                    <tr>
                                        <td style="width: 100px"></td>
                                        <td align="center" style="width: 100px">
                                            <asp:UpdatePanel ID="UpdatePanel4" runat="server">
                                                <ContentTemplate>
                                                    <table width="100%">
                                                        <tbody>
                                                            <tr>
                                                                <td colspan="2">
                                                                    <asp:Label ID="lblErrorMsgBrand" runat="server" ForeColor="Red" Font-Bold="True"></asp:Label><br />
                                                                </td>
                                                                <td style="width: 100px"></td>
                                                            </tr>
                                                            <tr>
                                                                <td style="height: 25px" align="left">
                                                                    <strong>
                                                                        <asp:Label ID="Label6" runat="server" Width="80px" Text="Principal"></asp:Label></strong></td>
                                                                <td style="width: 100px">
                                                                    <asp:DropDownList ID="DrpBrandPrincipal" runat="server" Width="200px" AutoPostBack="True" OnSelectedIndexChanged="DrpBrandPrincipal_SelectedIndexChanged">
                                                                    </asp:DropDownList></td>
                                                                <td style="width: 100px"></td>
                                                            </tr>
                                                            <tr>
                                                                <td style="height: 21px" align="left">
                                                                    <strong>
                                                                        <asp:Label ID="Label10" runat="server" Width="64px" Text="Division"></asp:Label></strong></td>
                                                                <td style="height: 25px">
                                                                    <asp:DropDownList ID="DrpBrandDivision" Height="25px" runat="server" Width="200px" AutoPostBack="True" OnSelectedIndexChanged="DrpBrandDivision_SelectedIndexChanged">
                                                                    </asp:DropDownList></td>
                                                                <td style="width: 100px; height: 21px"></td>
                                                            </tr>
                                                            <tr>
                                                                <td style="height: 25px" align="left">
                                                                    <strong>
                                                                        <asp:Label ID="Label9" runat="server" Width="80px" Text="Category"></asp:Label></strong></td>
                                                                <td style="width: 100px; height: 28px">
                                                                    <asp:DropDownList ID="ddBrandCategory" Height="25px" runat="server" Width="200px" AutoPostBack="True" OnSelectedIndexChanged="ddBrandCategory_SelectedIndexChanged">
                                                                    </asp:DropDownList></td>
                                                                <td style="width: 100px; height: 28px"></td>
                                                            </tr>
                                                            <tr>
                                                                <td style="width: 100px; height: 28px" align="left">
                                                                    <strong>
                                                                        <asp:Label ID="Label7" runat="server" Width="90px" Text="Brand Code"></asp:Label></strong></td>
                                                                <td style="width: 100px; height: 28px">
                                                                    <asp:TextBox ID="txtBrandCode" runat="server" Width="194px" Enabled="False" CssClass="txtBox "></asp:TextBox>
                                                                </td>
                                                                <td style="width: 100px; height: 28px"></td>
                                                            </tr>
                                                            <tr>
                                                                <td style="width: 100px; height: 29px" align="left">
                                                                    <strong>
                                                                        <asp:Label ID="Label8" runat="server" Width="90px" Text="Brand Name"></asp:Label></strong></td>
                                                                <td style="width: 100px; height: 29px">
                                                                    <asp:TextBox ID="txtBrandName" runat="server" Width="194px" Enabled="False" CssClass="txtBox "></asp:TextBox>
                                                                </td>
                                                                <td style="width: 100px; height: 29px"></td>
                                                            </tr>
                                                            <tr>
                                                                <td style="width: 100px; height: 37px"></td>
                                                                <td style="width: 100px; height: 37px" align="left">
                                                                    <asp:Button AccessKey="B" ID="btnSaveBrand" OnClick="btnSaveBrand_Click" runat="server" Width="85px" Font-Size="8pt" Text="New" CssClass="Button" />
                                                                </td>
                                                                <td style="width: 100px; height: 37px"></td>
                                                            </tr>
                                                        </tbody>
                                                    </table>
                                                </ContentTemplate>
                                            </asp:UpdatePanel>
                                            <asp:UpdateProgress ID="UpdateProgress4" runat="server" AssociatedUpdatePanelID="UpdatePanel4">
                                                <ProgressTemplate>
                                                    <asp:Image ID="Image4" runat="server" Width="24px" Height="23px" ImageUrl="~/App_Themes/Granite/Images/image003.gif"></asp:Image>&nbsp; Loading..... 
                                                </ProgressTemplate>
                                            </asp:UpdateProgress>
                                        </td>
                                        <td style="width: 100px"></td>
                                    </tr>
                                    <tr>
                                        <td align="center" colspan="3">
                                            <asp:Panel ID="Panel4" runat="server" Height="150px" ScrollBars="Vertical"
                                                Width="100%">
                                                <asp:UpdatePanel ID="UpdatePanel8" runat="server">
                                                    <ContentTemplate>
                                                        <asp:GridView ID="GrdBrand" runat="server" Width="90%" ForeColor="SteelBlue" Font-Size="9pt" CssClass="gridRow2" BorderColor="White" BackColor="White" HorizontalAlign="Center" AutoGenerateColumns="False" OnRowCommand="GrdBrand_RowCommand" OnRowDeleting="GrdBrand_RowDeleting" OnPageIndexChanging="GrdBrand_PageIndexChanging">
                                                            <PagerSettings FirstPageText="" LastPageText="" Mode="NextPrevious" NextPageText="Next" PreviousPageText="Previous"></PagerSettings>
                                                            <Columns>
                                                                <asp:BoundField DataField="SKU_HIE_ID" HeaderText="Id" Visible="False">
                                                                    <ItemStyle HorizontalAlign="Left" BorderColor="Silver" BorderWidth="1px" BorderStyle="Solid"></ItemStyle>
                                                                </asp:BoundField>
                                                                <asp:BoundField DataField="SKU_HIE_CODE" HeaderText="Code">
                                                                    <ItemStyle HorizontalAlign="Left" BorderColor="Silver" BorderWidth="1px" BorderStyle="Solid"></ItemStyle>
                                                                    <HeaderStyle HorizontalAlign="Left" />
                                                                </asp:BoundField>
                                                                <asp:BoundField DataField="SKU_HIE_NAME" HeaderText="Name">
                                                                    <ItemStyle HorizontalAlign="Left" BorderColor="Silver" BorderWidth="1px" BorderStyle="Solid"></ItemStyle>
                                                                    <HeaderStyle HorizontalAlign="Left" />
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
                                                                </asp:TemplateField>
                                                            </Columns>
                                                            <HeaderStyle CssClass="tblhead"></HeaderStyle>
                                                        </asp:GridView>
                                                    </ContentTemplate>
                                                </asp:UpdatePanel>
                                            </asp:Panel>
                                        </td>
                                    </tr>
                                </table>
                            </ContentTemplate>
                        </cc1:TabPanel>
                    </cc1:TabContainer></td>
            </tr>
        </table>
    </div>
</asp:Content>