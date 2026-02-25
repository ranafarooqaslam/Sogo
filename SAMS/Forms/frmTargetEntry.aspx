<%@ Page Language="C#" MasterPageFile="~/Forms/PageMaster.master" AutoEventWireup="true" CodeFile="frmTargetEntry.aspx.cs" Inherits="Forms_frmTargetEntry" Title="SAMS: Target Entry" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<asp:Content ID="Content1" runat="server" ContentPlaceHolderID="cphPage">
      <script language="JavaScript" type="text/javascript">
      
        Sys.WebForms.PageRequestManager.getInstance().add_beginRequest( startRequest );

        Sys.WebForms.PageRequestManager.getInstance().add_endRequest( endRequest );

        function startRequest( sender, e )
        { 
            
            document.getElementById('<%=btnTarget.ClientID%>').disabled = true;

        }

        function endRequest( sender, e ) 
        { 

            
            document.getElementById('<%=btnTarget.ClientID%>').disabled = false;

        }

 function ConfirmDelete()
 {
	    if( confirm("Do you want to Cancel this record?")==true)
		return true;
		
	    else
	    {
	    return false;
	    }
 }
    
 function ValidateForm()
 {
		var str;
    
		str  = document.getElementById('<%=txtAmount.ClientID%>').value; 
		if(str == null || str.length == 0)
		{
			alert('Must Enter Amount');
			return false;
		}
		str  = document.getElementById('<%=txtFromdate.ClientID%>').value; 
		if(str == null || str.length <= 1)
		{
			alert('Must Select Target Month');
			return false;
		}
		str  = document.getElementById('<%=drpPrincipal.ClientID%>').value; 
		if(str == null || str.length == 0)
		{
			alert('Must Select Principal');
			return false;
		}
		str  = document.getElementById('<%=drpDistributor.ClientID%>').value; 
		if(str == null || str.length == 0)
		{
			alert('Must Select Distributor');
			return false;
		}
		
        return true;
 }
  </script>
      <script type="text/javascript" src="../AjaxLibrary/jquery.searchabledropdown-1.0.8.min.js"></script>
    <script language="JavaScript" type="text/javascript">
        function pageLoad() {
            $("select").searchable();
        }
    </script>
  <div id="right_data">
    <div >
    <table width="100%">
        <tr>
            <td>
                    <asp:UpdatePanel id="upSearchResults" runat="server">
                        <contenttemplate>
<TABLE><TBODY>
    <tr>
        <td align="left" style="height: 25px">
           <strong> <asp:Label ID="Label6" runat="server" Height="14px" Text="Location"
                Width="98px"></asp:Label></strong></td>
        <td style="height: 25px" align="left">
            <asp:DropDownList ID="drpDistributor" runat="server" Width="212px" OnSelectedIndexChanged="drpDistributor_SelectedIndexChanged" AutoPostBack="True">
            </asp:DropDownList></td>
        <td style="height: 25px">
        </td>
    </tr>
    <TR><TD align=left style="height: 25px">
            <strong><asp:Label id="lbltoLocation" runat="server" Width="71px" Text="Principal"></asp:Label></strong></TD><TD style="height: 25px" align="left">
            <asp:DropDownList id="drpPrincipal" runat="server" Width="211px" AutoPostBack="True" OnSelectedIndexChanged="drpPrincipal_SelectedIndexChanged"></asp:DropDownList></TD>
    <td style="height: 25px">
        <strong><asp:Label ID="Label5" runat="server" Width="50px"></asp:Label></strong></td>
</TR><TR><TD align=left style="height: 25px">
<strong><asp:Label id="Label2" runat="server" Width="98px" Text="Target For Type" Height="14px"></asp:Label></strong></TD><TD style="height: 25px" align="left"><asp:DropDownList id="DrpTargetType" runat="server" Width="211px" OnSelectedIndexChanged="DrpTargetType_SelectedIndexChanged" AutoPostBack="True">
                    <asp:ListItem Value="96">Order Booker</asp:ListItem>
                    <asp:ListItem Value="97">Sale Person</asp:ListItem>
                    <asp:ListItem Value="98">City</asp:ListItem>
</asp:DropDownList></TD>
                    <td style="height: 25px">
                    </td>
                </TR>
    <tr>
        <td align="left" style="height: 25px">
            <strong><asp:Label id="lblDocumentNo" runat="server" Width="76px" Text="Target For"></asp:Label></strong></td>
        <td style="height: 25px" align="left">
            <asp:DropDownList id="DrpTargetFor" runat="server" Width="210px"></asp:DropDownList></td>
        <td style="height: 25px">
            </td>
    </tr>
    <tr>
        <td align="left" style="height: 25px">
            <strong><asp:Label id="Label1" runat="server" Width="72px" Text="For Month"></asp:Label></strong></td>
        <td style="height: 25px" align="left">
            <asp:TextBox id="txtFromdate" runat="server" Width="204px" CssClass="txtBox" MaxLength="1"></asp:TextBox></td>
        <td style="height: 25px">
            <asp:ImageButton ID="ibtnStartDate" runat="server" ImageUrl="~/App_Themes/Granite/Images/date.gif"
                Width="16px" /></td>
    </tr>
    <tr>
        <td align="left" style="height: 25px">
            <strong><asp:Label ID="Label4" runat="server" Text="Target Value" Width="97px"></asp:Label></strong></td>
        <td align="left" style="height: 25px">
                                    <asp:TextBox ID="txtAmount" runat="server" CssClass="txtBox" Width="204px">0</asp:TextBox></td>
        <td style="height: 25px">
        </td>
    </tr>
    <tr>
        <td align="left" style="height: 25px" valign="top">
            </td>
        <td style="width: 1px; height: 25px;" valign="top">
            <%@ register assembly="AjaxControlToolkit" namespace="AjaxControlToolkit"
                    tagprefix="cc1" %>
            <cc1:CalendarExtender ID="CEStartDate" runat="server" Format="MMM-yyyy" PopupButtonID="ibtnStartDate"
                TargetControlID="txtFromdate">
            </cc1:CalendarExtender><asp:Button ID="btnTarget" runat="server" Font-Size="8pt"
                                        Text="Save" ValidationGroup="vg" Width="95px" OnClick="btnTarget_Click" CssClass="Button" /></td>
        <td style="width: 1px; height: 25px;" valign="top">
        </td>
    </tr>
</TBODY></TABLE>
</contenttemplate>
                    </asp:UpdatePanel>&nbsp;</td>
        </tr>
    </table>
        
           </div>
    <div >
    <table width="100%">
        <tr>
            <td >
                <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                    <ContentTemplate>
                        <table width="100%">
                            <tr>
                                <td colspan="6">
                                    <asp:Panel ID="Panel2" runat="server" BorderColor="Silver" BorderStyle="Groove" BorderWidth="1px"
                                        Height="180px" ScrollBars="Vertical" Width="640px">
                                        <asp:GridView ID="GrdPurchase" runat="server" AutoGenerateColumns="False" BackColor="White"
                                            BorderColor="White" CssClass="gridRow2" ForeColor="SteelBlue" HorizontalAlign="Center"
                                            OnRowDeleting="GrdPurchase_RowDeleting" OnRowCommand="GrdPurchase_RowCommand" Width="620px">
                                            <PagerSettings FirstPageText="" LastPageText="" Mode="NextPrevious" NextPageText="Next"
                                                PreviousPageText="Previous" />
                                            <Columns>
                                                <asp:BoundField DataField="TARGET_ID" HeaderText="TARGET_ID">
                                                    <HeaderStyle CssClass="HidePanel" />
                                                    <ItemStyle CssClass="HidePanel" />
                                                </asp:BoundField>
                                                <asp:BoundField DataField="TARGET_FOR_ID" HeaderText="TARGET_FOR_ID">
                                                    <HeaderStyle CssClass="HidePanel" />
                                                    <ItemStyle CssClass="HidePanel" />
                                                </asp:BoundField>
                                                <asp:BoundField DataField="USER_CODE" HeaderText="Code">
                                                    <ItemStyle BorderColor="Silver" BorderStyle="Solid" BorderWidth="2px" HorizontalAlign="Left"
                                                        Width="85px" />
                                                </asp:BoundField>
                                                <asp:BoundField DataField="User_NAME" HeaderText="Description">
                                                    <ItemStyle BorderColor="Silver" BorderStyle="Solid" BorderWidth="2px" HorizontalAlign="Left"
                                                        Width="205px" />
                                                </asp:BoundField>
                                                <asp:BoundField DataField="TARGET_MONTH" HeaderText="Target Month">
                                                    <ItemStyle BorderColor="Silver" BorderStyle="Solid" BorderWidth="1px" />
                                                </asp:BoundField>
                                                <asp:BoundField DataField="AMOUNT" HeaderText="Value" DataFormatString="{0:F2}">
                                                    <ItemStyle BorderColor="Silver" BorderStyle="Solid" BorderWidth="1px" HorizontalAlign="Right" />
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
                                            <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" CssClass="tblhead" />
                                        </asp:GridView>
                                    </asp:Panel>
                                </td>
                            </tr>
                        </table>
                        &nbsp;
                    </ContentTemplate>
                </asp:UpdatePanel>
            </td>
        </tr>
    </table>
        &nbsp;
    </div>   
   </div>
</asp:Content>

