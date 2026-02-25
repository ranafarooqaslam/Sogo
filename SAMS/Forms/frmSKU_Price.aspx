<%@ Page Language="C#" MasterPageFile="~/Forms/PageMaster.master" AutoEventWireup="true" CodeFile="frmSKU_Price.aspx.cs" Inherits="SKU_Price" Title="SAMS: SKU Price" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="cphPage" Runat="Server">
 <script language="JavaScript" type="text/javascript">
        function ValidateForm()
		{
			var str;
			str  = document.getElementById('<%=ddskuName.ClientID%>').value; 
			if(str == null || str.length == 0)
			{
				alert('Must Select SKU Name');
				return false;
			}
			str  = document.getElementById('<%=txtFromdate.ClientID%>').value; 
			if(str == null || str.length == 0)
			{
				alert('Must Select Price Efftive Date');
				return false;
			}
			str  = document.getElementById('<%=txtTaxPrices.ClientID%>').value; 
			if(str == null || str.length == 0)
			{
				alert('Must enter Tax Price');
				return false;
			}
			str  = document.getElementById('<%=txtTradePrice.ClientID%>').value; 
			if(str == null || str.length == 0)
			{
				alert('Must enter Trade Price');
				return false;
			}
			str  = document.getElementById('<%=txtRetailPrice.ClientID%>').value; 
			if(str == null || str.length == 0)
			{
				alert('Must enter Retail Price');
				return false;
			}
			str  = document.getElementById('<%=txtDistributorPrice.ClientID%>').value; 
			if(str == null || str.length == 0)
			{
				alert('Must enter Factory Pricet');
				return false;
			}
			return true;		
		}
	function CheckBoxListSelect()
    {    
        var chkBoxList = document.getElementById('<%= ChbDistributorList.ClientID %>');
        var chkBox = document.getElementById('<%= ChbSelectAll.ClientID %>');
        if(chkBox.checked == true)
        {
            var chkBoxCount= chkBoxList.getElementsByTagName("input");
        
            for(var i=0;i<chkBoxCount.length;i++) 
            {
                chkBoxCount[i].checked = true;
            }
        }
        else
        {
            var chkBoxCount= chkBoxList.getElementsByTagName("input");
        
            for(var i=0;i<chkBoxCount.length;i++) 
            {
                chkBoxCount[i].checked = false;
            }
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
         <asp:UpdatePanel ID="UpdatePanel3" runat="server" UpdateMode="Conditional" >
             <ContentTemplate>
<TABLE width="100%"><TBODY><TR><TD colSpan=2><asp:Label id="lblErrorMsg" runat="server" ForeColor="Red" Font-Bold="True" __designer:wfdid="w361"></asp:Label> </TD>
<TD colSpan=1></TD>
<TD colSpan=1></TD>
</TR>
<TR><TD style="WIDTH: 106px; HEIGHT: 18px" align=left>
<strong> <asp:Label id="Label1" runat="server" Width="103px" Text="Principal Name" __designer:wfdid="w362"></asp:Label></strong></TD><TD style="WIDTH: 298px; HEIGHT: 18px" align=left><asp:DropDownList id="ddskuPrincipal" runat="server" Width="200px" __designer:wfdid="w363" OnSelectedIndexChanged="ddskuPrincipal_SelectedIndexChanged" AutoPostBack="True"></asp:DropDownList> </TD>
<TD style="width:200; BORDER-RIGHT: darkgray 1px ridge; BORDER-TOP: darkgray 1px ridge; BORDER-LEFT: darkgray 1px ridge; BORDER-BOTTOM: darkgray 1px ridge" align="left" rowspan="10">
<TABLE><TBODY><TR><td class="tblhead" width="200">
<strong><asp:Label id="Label11" runat="server" Width="140px" ForeColor="White" Font-Bold="True" Text="Location Name" ></asp:Label></strong></TD></TR><TR>
<TD><asp:CheckBox id="ChbSelectAll" onclick="CheckBoxListSelect()" runat="server" Width="75px" Font-Size="8pt" Text="Select All" ></asp:CheckBox></TD></TR><TR>
<TD width="300">
<asp:Panel id="Panel1" runat="server" Width="250px" Height="220px" ScrollBars="Vertical"  BorderWidth="1px" BorderStyle="Groove" BorderColor="Silver" BackColor="White">
<asp:CheckBoxList id="ChbDistributorList" runat="server" Width="174px" Font-Size="8pt" __designer:wfdid="w368">
                    </asp:CheckBoxList></asp:Panel> </TD></TR></TBODY></TABLE></TD>
<TD style="HEIGHT: 18px"></TD></TR><TR><TD style="WIDTH: 106px" align=left>
<strong><asp:Label id="Label2" runat="server" Width="101px" Text="Division Name" __designer:wfdid="w369"></asp:Label></strong></TD><TD style="WIDTH: 298px" align=left><asp:DropDownList id="ddskuDivision" runat="server" Width="200px" __designer:wfdid="w370" OnSelectedIndexChanged="ddskuDivision_SelectedIndexChanged" AutoPostBack="True">
            </asp:DropDownList></TD><TD></TD></TR><TR><TD style="WIDTH: 106px" align=left>
            <strong><asp:Label id="Label7" runat="server" Width="101px" Text="SKU Category" __designer:wfdid="w371"></asp:Label></strong></TD><TD align=left><asp:DropDownList id="ddskuCategory" runat="server" Width="200px" __designer:wfdid="w372" OnSelectedIndexChanged="ddskuCategory_SelectedIndexChanged" AutoPostBack="True">
            </asp:DropDownList></TD><TD></TD></TR><TR><TD style="WIDTH: 106px" align=left>
            <strong><asp:Label id="Label9" runat="server" Width="101px" Text="SKU Brand" __designer:wfdid="w373"></asp:Label></strong></TD><TD align=left><asp:DropDownList id="ddskuBrand" runat="server" Width="200px" __designer:wfdid="w374" OnSelectedIndexChanged="ddskuBrand_SelectedIndexChanged" AutoPostBack="True">
            </asp:DropDownList></TD><TD></TD></TR><TR><TD style="WIDTH: 106px; HEIGHT: 20px" align=left>
            <strong><asp:Label id="Label6" runat="server" Width="100px" Text="SKU Name" __designer:wfdid="w375"></asp:Label></strong></TD><TD style="HEIGHT: 20px" align=left><asp:DropDownList id="ddskuName" runat="server" Width="200px" __designer:wfdid="w376" OnSelectedIndexChanged="ddskuName_SelectedIndexChanged" AutoPostBack="True">
        </asp:DropDownList></TD><TD style="WIDTH: 201px; HEIGHT: 20px"></TD></TR><TR><TD style="WIDTH: 106px" align=left>
        <strong><asp:Label id="Label8" runat="server" Width="100px" Text="Date Effected" __designer:wfdid="w377"></asp:Label></strong></TD><TD style="WIDTH: 298px" align=left><asp:TextBox style="TEXT-ALIGN: justify" id="txtFromdate" tabIndex=2 runat="server" Width="148px" __designer:wfdid="w378" CssClass="txtBox" ValidationGroup="MKE" MaxLength="1"></asp:TextBox> <asp:ImageButton id="ImgBntFromCalc" runat="server" __designer:wfdid="w379" ImageUrl="~/App_Themes/Granite/Images/date.gif" CausesValidation="False"></asp:ImageButton><cc1:CalendarExtender id="CalendarExtender1" runat="server" __designer:wfdid="w380" Format="dd-MMM-yyyy" PopupButtonID="ImgBntFromCalc" TargetControlID="txtFromdate"></cc1:CalendarExtender> </TD><TD style="WIDTH: 201px" align=left></TD></TR><TR><TD align=left>
        <strong><asp:Label id="Label10" runat="server" Width="90px" Text="Factory Price" __designer:wfdid="w381"></asp:Label></strong></TD><TD style="WIDTH: 298px" align=left><asp:TextBox id="txtDistributorPrice" runat="server" Width="193px" __designer:wfdid="w382" CssClass="txtBox " MaxLength="8"></asp:TextBox></TD><TD style="WIDTH: 201px" align=left></TD></TR><TR><TD align=left>
        <strong><asp:Label id="Label3" runat="server" Width="101px" Text="Trade Price" __designer:wfdid="w383"></asp:Label></strong></TD><TD style="WIDTH: 298px" align=left><asp:TextBox id="txtTradePrice" runat="server" Width="192px" __designer:wfdid="w384" CssClass="txtBox " MaxLength="8"></asp:TextBox></TD><TD style="WIDTH: 201px" align=left></TD></TR><TR><TD style="WIDTH: 106px" align=left>
        <strong><asp:Label id="Label4" runat="server" Width="103px" Text="Retail Price" __designer:wfdid="w385"></asp:Label></strong></TD><TD align=left><asp:TextBox id="txtRetailPrice" runat="server" Width="192px" __designer:wfdid="w386" CssClass="txtBox " MaxLength="8"></asp:TextBox></TD><TD style="WIDTH: 201px" align=left></TD></TR><TR><TD style="WIDTH: 106px; HEIGHT: 12px" align=left>
        <strong><asp:Label id="Label5" runat="server" Width="102px" Text="G.S.T (%)" __designer:wfdid="w387"></asp:Label></strong></TD><TD align=left><asp:TextBox id="txtTaxPrices" runat="server" Width="192px" __designer:wfdid="w388" CssClass="txtBox " MaxLength="8"></asp:TextBox></TD><TD style="WIDTH: 201px; HEIGHT: 12px" align=left></TD></TR><TR><TD style="WIDTH: 106px; HEIGHT: 12px" align=left>
        <strong><asp:Label id="Label14" runat="server" Width="102px" Text="S.E.D (%)" __designer:wfdid="w389"></asp:Label></strong></TD><TD style="WIDTH: 298px; HEIGHT: 12px" align=left><asp:TextBox id="txtSADTax" runat="server" Width="192px" __designer:wfdid="w390" CssClass="txtBox " MaxLength="8"></asp:TextBox></TD><TD style="WIDTH: 201px; HEIGHT: 12px" align=left></TD></TR><TR><TD style="WIDTH: 106px"></TD><TD style="WIDTH: 298px" align=left>
        <asp:Button id="btnSave" onclick="btnSave_Click" runat="server" Width="90px" Font-Size="8pt" Text="Save" ValidationGroup="vg" CssClass="Button" /> &nbsp; <cc1:FilteredTextBoxExtender id="FilteredTextBoxExtender1" runat="server" __designer:wfdid="w392" TargetControlID="txtTaxPrices" ValidChars="0123456789." FilterType="Custom">
            </cc1:FilteredTextBoxExtender> <cc1:FilteredTextBoxExtender id="FilteredTextBoxExtender2" runat="server" __designer:wfdid="w393" TargetControlID="txtTradePrice" ValidChars=".0123456789" FilterType="Custom">
            </cc1:FilteredTextBoxExtender> <cc1:FilteredTextBoxExtender id="FilteredTextBoxExtender3" runat="server" __designer:wfdid="w394" TargetControlID="txtRetailPrice" ValidChars=".0123456789" FilterType="Custom">
            </cc1:FilteredTextBoxExtender> <cc1:FilteredTextBoxExtender id="FilteredTextBoxExtender4" runat="server" __designer:wfdid="w395" TargetControlID="txtDistributorPrice" ValidChars=".0123456789" FilterType="Custom">
            </cc1:FilteredTextBoxExtender> </TD><TD align=left></TD><TD align=left></TD></TR></TBODY></TABLE>
            <DIV style="Z-INDEX: 101; LEFT: 530px; WIDTH: 100px; POSITION: absolute; TOP: 440px; HEIGHT: 100px">&nbsp; <asp:Panel id="Panel21" runat="server" __designer:wfdid="w396"><asp:UpdateProgress id="UpdateProgress1" runat="server" __designer:wfdid="w397" AssociatedUpdatePanelID="UpdatePanel3"><ProgressTemplate>
<asp:ImageButton id="ImageButton1" runat="server" Width="23px" Height="26px" __designer:wfdid="w398" ImageUrl="~/App_Themes/Granite/Images/image003.gif"></asp:ImageButton> Wait Update 
</ProgressTemplate>
</asp:UpdateProgress> </asp:Panel> </DIV>
</ContentTemplate>
            </asp:UpdatePanel>
     
     </div>
 <div >
        <asp:UpdatePanel ID="UpdatePanel1" runat="server">
            <ContentTemplate>
<asp:Panel id="Panel2" runat="server" Width="100%" Height="200px" ScrollBars="Vertical" __designer:wfdid="w405"><asp:GridView id="Grid_pricedetails" runat="server" Width="99%" ForeColor="SteelBlue" __designer:wfdid="w406" CssClass="gridRow2" BorderColor="White" BackColor="White" AutoGenerateColumns="False" HorizontalAlign="Center">
<PagerSettings FirstPageText="" LastPageText="" Mode="NextPrevious" NextPageText="Next" PreviousPageText="Previous"></PagerSettings>
<Columns>
    <asp:BoundField DataField="distributor_name" HeaderText="Location">
        <ItemStyle BorderColor="Silver" BorderStyle="Solid" BorderWidth="1px" />
    </asp:BoundField>
<asp:BoundField DataField="SKU_CODE" HeaderText="SKU Code">
<ItemStyle BorderColor="Silver" BorderWidth="1px" BorderStyle="Solid"></ItemStyle>
    <HeaderStyle HorizontalAlign="Left" />
</asp:BoundField>
<asp:BoundField DataField="SKU_NAME" HeaderText="SKU Name">
<ItemStyle BorderColor="Silver" BorderWidth="1px" BorderStyle="Solid"></ItemStyle>
    <HeaderStyle HorizontalAlign="Left" />
</asp:BoundField>
    <asp:BoundField DataField="GST_ON" HeaderText="GST">
        <ItemStyle BorderColor="Silver" BorderStyle="Solid" BorderWidth="1px" />
    </asp:BoundField>
<asp:BoundField DataField="DISTRIBUTOR_PRICE" HeaderText="Factory Price" DataFormatString="{0:F2}">
<ItemStyle BorderColor="Silver" BorderWidth="1px" BorderStyle="Solid"></ItemStyle>
    <HeaderStyle HorizontalAlign="Left" />
</asp:BoundField>
<asp:BoundField DataField="TRADE_PRICE" HeaderText="Trade Price" DataFormatString="{0:F2}">
<ItemStyle BorderColor="Silver" BorderWidth="1px" BorderStyle="Solid"></ItemStyle>
    <HeaderStyle HorizontalAlign="Left" />
</asp:BoundField>
<asp:BoundField DataField="RETAIL_PRICE" HeaderText="Retail Price" DataFormatString="{0:F2}">
<ItemStyle BorderColor="Silver" BorderWidth="1px" BorderStyle="Solid"></ItemStyle>
    <HeaderStyle HorizontalAlign="Left" />
</asp:BoundField>
<asp:BoundField DataField="TAX_PRICE" HeaderText="GST (%)" DataFormatString="{0:F2}">
<HeaderStyle HorizontalAlign="Left"></HeaderStyle>

<ItemStyle BorderColor="DarkGray" BorderWidth="1px" BorderStyle="Solid"></ItemStyle>
</asp:BoundField>
    <asp:BoundField DataField="SED_TAX" DataFormatString="{0:F2}" HeaderText="SED (%)">
        <ItemStyle BorderColor="Silver" BorderStyle="Solid" BorderWidth="1px" />
    </asp:BoundField>
<asp:BoundField DataField="DATE_EFFECTED" HeaderText="Date Effected">
<ItemStyle BackColor="Transparent" BorderColor="Silver" BorderWidth="1px" BorderStyle="Solid"></ItemStyle>
    <HeaderStyle HorizontalAlign="Left" />
</asp:BoundField>
</Columns>
<HeaderStyle CssClass="tblhead"></HeaderStyle>
</asp:GridView> </asp:Panel> 
</ContentTemplate>
        </asp:UpdatePanel>
    </div>
</div>
</asp:Content>