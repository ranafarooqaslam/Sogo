using System;
using System.Data;
using System.Web.UI;
using System.Web.UI.WebControls;
using SAMSBusinessLayer.Classes;
using SAMSCommon.Classes;
using SAMSBusinessLayer.Reports;

/// <summary>
/// Form For  Party Statement Report
/// </summary>
public partial class Forms_RptPartyBalance : System.Web.UI.Page
{
    /// <summary>
    /// Page_Load Function
    /// </summary>
    /// <param name="sender">object</param>
    /// <param name="e">EventArgs</param>
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            this.LoadDistributor();
            this.LoadChannelType();
            SAMSCommon.Classes.Configuration.SystemCurrentDateTime = (DateTime)this.Session["CurrentWorkDate"];
            txtMonth.Text = SAMSCommon.Classes.Configuration.SystemCurrentDateTime.ToString("MMM-yyyy");
        }
    }
    
    /// <summary>
    /// Loads Locations To Location Combo
    /// </summary>
    private void LoadDistributor()
    {
        DistributorController DController = new DistributorController();
        DataTable dt = DController.SelectDistributorInfo(Constants.IntNullValue, int.Parse(this.Session["UserId"].ToString()), int.Parse(this.Session["CompanyId"].ToString()));
        clsWebFormUtil.FillDropDownList(this.drpDistributor, dt, 0, 2, true);
    }

    /// <summary>
    /// Loads Channel Types To ChannelType Combo
    /// </summary>
    private void LoadChannelType()
    {
        SLASHCodesController mController = new SLASHCodesController();
        DataTable dt = mController.SelectSlashCodes(Constants.IntNullValue, null, Constants.CustomerChannelType, null, Constants.IntNullValue, bool.Parse("True"));
        ddlChannelType.Items.Add(new ListItem("All", Constants.IntNullValue.ToString()));
        clsWebFormUtil.FillDropDownList(ddlChannelType, dt, 0, 2);

    }

    /// <summary>
    /// Shows  Party Statement in PDF
    /// </summary>
    /// <param name="sender">object</param>
    /// <param name="e">EventArgs</param>
    protected void btnViewPDF_Click(object sender, EventArgs e)
    {
        ShowReport(0);
    }

    /// <summary>
    /// Shows  Party Statement in Excel
    /// </summary>
    /// <param name="sender">object</param>
    /// <param name="e">EventArgs</param>
    protected void btnViewExcel_Click(object sender, EventArgs e)
    {
        ShowReport(1);
    }

    private void ShowReport(int p_Type)
    {

        DocumentPrintController DPrint = new DocumentPrintController();
        RptCustomerController RptCustomerCtl = new RptCustomerController();
        DataSet ds = null;

        DataTable dt = DPrint.SelectReportTitle(int.Parse(drpDistributor.SelectedValue.ToString()));

        DataControl dc = new DataControl();
        ds = RptCustomerCtl.GetPartyBalance(int.Parse(drpDistributor.SelectedValue.ToString()), Convert.ToInt32(ddlChannelType.SelectedValue),
            DateTime.Parse(txtMonth.Text));

        SAMSBusinessLayer.Reports.CrpPartyBalance CrpReport = new SAMSBusinessLayer.Reports.CrpPartyBalance();
        CrpReport.SetDataSource(ds);
        CrpReport.Refresh();
        CrpReport.SetParameterValue("Location", drpDistributor.SelectedItem.Text);
        CrpReport.SetParameterValue("ChannelType", ddlChannelType.SelectedItem.Text);
        CrpReport.SetParameterValue("CompanyName", dt.Rows[0]["COMPANY_NAME"].ToString());
        CrpReport.SetParameterValue("Month1", Convert.ToDateTime(txtMonth.Text));
        CrpReport.SetParameterValue("Month2", Convert.ToDateTime(txtMonth.Text).AddMonths(-1));
        CrpReport.SetParameterValue("Month3", Convert.ToDateTime(txtMonth.Text).AddMonths(-2));
        this.Session.Add("ReportType", p_Type);
        this.Session.Add("CrpReport", CrpReport);
        string url = "'Default.aspx'";
        string script = "<script language='JavaScript' type='text/javascript'> window.open(" + url + ",\"Link\",\"toolbar=0,location=0,directories=0,status=0,menubar=0,scrollbars=1,resizable=1,width=800,height=600,left=10,top=10\");</script>";
        Type cstype = this.GetType();
        ClientScriptManager cs = Page.ClientScript;
        cs.RegisterStartupScript(cstype, "OpenWindow", script);
    }
}