<%@ Page Language="C#" AutoEventWireup="true" CodeFile="RptVolumeSale.aspx.cs" Inherits="Forms_RptVolumeSale" MasterPageFile="~/Forms/PageMaster.master" Title="SAMS: Target Vs Achievement" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>

<asp:Content ID="Content1" runat="server" ContentPlaceHolderID="cphPage">
    <script language="javascript" type="text/javascript">
    
    function onCalendarShown() {
    var cal = $find("calendar1");     //Setting the default mode to month   
    cal._switchMode("months", true);          //Iterate every month Item and attach click event to it   
    if (cal._monthsBody) {
        for (var i = 0; i < cal._monthsBody.rows.length; i++) {
            var row = cal._monthsBody.rows[i];
            for (var j = 0; j < row.cells.length; j++) {
                Sys.UI.DomEvent.addHandler(row.cells[j].firstChild, "click", call);
            }
        }
    }
}

function onCalendarHidden() {
    var cal = $find("calendar1");
    //Iterate every month Item and remove click event from it
    if (cal._monthsBody) {
        for (var i = 0; i < cal._monthsBody.rows.length; i++) {
            var row = cal._monthsBody.rows[i];
            for (var j = 0; j < row.cells.length; j++) {
                Sys.UI.DomEvent.removeHandler(row.cells[j].firstChild, "click", call);
            }
        }
    }
}

function call(eventElement) {
    var target = eventElement.target;
    switch (target.mode) {
        case "month":
            var cal = $find("calendar1");
            cal._visibleDate = target.date;
            cal.set_selectedDate(target.date);
            cal._switchMonth(target.date);
            cal._blur.post(true);
            cal.raiseDateSelectionChanged();
            break;
    }
}
    </script>
    
    <div id="right_data">
        <table width="100%">
            <tr>
                <td >
                    <asp:UpdatePanel id="UpdatePanel1" runat="server">
                        <contenttemplate>
<TABLE><TBODY><TR><TD align=left colSpan=4><asp:Label id="lblErrorMsg" runat="server" ForeColor="Red" Font-Bold="True"></asp:Label> </TD><TD style="WIDTH: 1px" align=left colSpan=1></TD></TR><TR><TD align=left></TD><TD style="WIDTH: 92px" align=left>
<strong> <asp:Label id="Label3" runat="server" Width="65px" Text="Region" Enabled="False"></asp:Label></strong></TD><TD style="WIDTH: 1px" align=left></TD><TD style="WIDTH: 203px; HEIGHT: 25px" align=left><asp:DropDownList id="DrpRegion" runat="server" Width="200px" Enabled="False" OnSelectedIndexChanged="DrpRegion_SelectedIndexChanged">
            </asp:DropDownList></TD><TD style="WIDTH: 1px; HEIGHT: 25px" align=left></TD></TR><TR><TD align=left></TD><TD style="WIDTH: 92px" align=left>
            <strong><asp:Label id="Label2" runat="server" Width="48px" Text="Location"></asp:Label></strong></TD><TD style="WIDTH: 1px" align=left></TD><TD style="WIDTH: 203px; HEIGHT: 25px" align=left><asp:DropDownList id="DrpLocation" runat="server" Width="200px" AutoPostBack="True"></asp:DropDownList></TD><TD style="WIDTH: 1px; HEIGHT: 25px" align=left></TD></TR><TR><TD align=left></TD><TD style="WIDTH: 92px" align=left>
            <strong><asp:Label id="lbltoLocation" runat="server" Width="61px" Text="Principal"></asp:Label></strong></TD><TD style="WIDTH: 1px" align=left></TD><TD style="WIDTH: 203px; HEIGHT: 25px" align=left><asp:DropDownList id="drpPrincipal" runat="server" Width="200px" AutoPostBack="True"></asp:DropDownList></TD><TD style="WIDTH: 1px; HEIGHT: 25px" align=left></TD></TR><TR><TD style="HEIGHT: 25px" align=left></TD><TD style="WIDTH: 92px; HEIGHT: 25px" align=left>
            <strong><asp:Label id="Label1" runat="server" Width="48px" Text="Month"></asp:Label></strong></TD><TD style="WIDTH: 1px; HEIGHT: 25px" align=left></TD><TD style="WIDTH: 203px; HEIGHT: 25px" align=left><asp:TextBox id="txtDate" runat="server" Width="70px" CssClass="txtBox" MaxLength="10"></asp:TextBox> <asp:ImageButton id="ImgBntFromCalc" runat="server" ImageUrl="~/App_Themes/Granite/Images/date.gif"></asp:ImageButton></TD><TD style="WIDTH: 1px; HEIGHT: 25px" align=left></TD></TR></TBODY></TABLE><cc1:CalendarExtender id="CalendarExtender1" runat="server" Format="MMM-yyyy" EnableViewState="False" PopupButtonID="ImgBntFromCalc" TargetControlID="txtdate" OnClientHidden="onCalendarHidden" OnClientShown="onCalendarShown" BehaviorID="calendar1"></cc1:CalendarExtender>&nbsp; 
</contenttemplate>
                    </asp:UpdatePanel>                 &nbsp;
                    <asp:Button ID="btnViewPDF" runat="server" CssClass="Button" Width="90" Text="View PDF" OnClick="btnViewPDF_Click" />
                    <asp:Button ID="btnViewExcel" runat="server" Width="90" OnClick="btnViewExcel_Click" Text="View Excel" CssClass="Button"/></td>
            </tr>
        </table>
        
           </div>
</asp:Content>