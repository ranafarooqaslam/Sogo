using System;
using System.Data;
using System.Web.UI;
using System.Web.UI.WebControls;
using SAMSBusinessLayer.Classes;
using SAMSCommon.Classes;

/// <summary>
/// Form For Value Reconciliation Report
/// </summary>
public partial class Forms_rptOnePager : System.Web.UI.Page
{
    /// <summary>
    /// Page_Load Function
    /// </summary>
    /// <param name="sender">object</param>
    /// <param name="e">EventArgs</param>
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack)
        {
            this.DistributorType();
            this.LoadDistributor();
            SAMSCommon.Classes.Configuration.SystemCurrentDateTime = (DateTime)this.Session["CurrentWorkDate"];
            txtDate.Text = SAMSCommon.Classes.Configuration.SystemCurrentDateTime.ToString("dd-MMM-yyyy");
        }
    }
    
    /// <summary>
    /// Loads Location Types
    /// </summary>
    private void DistributorType()
    {
        DistributorController dController = new DistributorController();
        DataTable dt = dController.SelectDistributorTypeInfo(Constants.IntNullValue);
        clsWebFormUtil.FillDropDownList(ddDistributorType, dt, 0, 2);
    }

    /// <summary>
    /// Loads Locations To Location Combo
    /// </summary>
    private void LoadDistributor()
    {
        if (ddDistributorType.Items.Count > 0)
        {
            drpDistributor.Items.Clear();
            UserController mUserController = new UserController();
            DataTable dt = mUserController.SelectUserAssignment(int.Parse(this.Session["UserId"].ToString()), int.Parse(ddDistributorType.SelectedValue.ToString()), 1, int.Parse(this.Session["CompanyId"].ToString()));
            drpDistributor.Items.Add(new ListItem("All", Constants.IntNullValue.ToString()));
            clsWebFormUtil.FillDropDownList(drpDistributor, dt, 0, 1);
        }
    }

    /// <summary>
    /// Gets Value Reconciliation And Shows Either in Excel or PDF
    /// </summary>
    /// <param name="p_ReportType">Type</param>
    private void ShowReport(int p_Report_Type)
    {
        DateTime dtTo = Convert.ToDateTime(txtDate.Text);
        DateTime dtFrom = new DateTime();
        dtFrom = new DateTime(dtTo.Year, dtTo.Month, 1);

        System.Text.StringBuilder sbDistIDs = new System.Text.StringBuilder();

        foreach (ListItem li in drpDistributor.Items)
        {
            if (li.Value != Constants.IntNullValue.ToString())
            {
                sbDistIDs.Append(li.Value);
                sbDistIDs.Append(",");
            }
        }

        DocumentPrintController mController = new DocumentPrintController();
        RptSaleController RptSaleCtl = new RptSaleController();
        RptAccountController RptAccountCtl = new RptAccountController();
        string ReportType = GetReportType();
        DataTable dt = mController.SelectReportTitle(int.Parse(drpDistributor.SelectedValue.ToString()));
        DataSet ds = RptSaleCtl.GetOnePagerData(sbDistIDs.ToString(), Constants.IntNullValue,dtFrom, DateTime.Parse(dtTo.ToShortDateString() + " 23:59:59"));

        decimal OpeningValue = RptAccountCtl.GeneralLedgerOpening(Constants.IntNullValue, 136, Convert.ToInt32(ddDistributorType.SelectedValue), int.Parse(drpDistributor.SelectedValue.ToString()),
                       DateTime.Parse(txtDate.Text + " 00:00:00"), DateTime.Parse(txtDate.Text + " 23:59:59"),Constants.IntNullValue);

        SAMSBusinessLayer.Reports.CrpOnePagerReport CrpReport = new SAMSBusinessLayer.Reports.CrpOnePagerReport();
        CrpReport.SetDataSource(ds);
        CrpReport.Refresh();
        CrpReport.SetParameterValue("Date", txtDate.Text);
        CrpReport.SetParameterValue("CompanyName", dt.Rows[0]["COMPANY_NAME"].ToString());
        CrpReport.SetParameterValue("Location", drpDistributor.SelectedItem.Text);
        CrpReport.SetParameterValue("PettyBalance", OpeningValue);
        this.Session.Add("CrpReport", CrpReport);
        this.Session.Add("ReportType", p_Report_Type);
        string url = "'Default.aspx'";
        string script = "<script language='JavaScript' type='text/javascript'> window.open(" + url +
                        ",\"Link\",\"toolbar=0,location=0,directories=0,status=0,menubar=0,scrollbars=1,resizable=1,width=800,height=600,left=10,top=10\");</script>";
        Type cstype = this.GetType();
        ClientScriptManager cs = Page.ClientScript;
        cs.RegisterStartupScript(cstype, "OpenWindow", script);
    }

    /// <summary>
    /// Shows Value Reconciliation in PDF
    /// </summary>
    /// <param name="sender">object</param>
    /// <param name="e">EventArgs</param>
    protected void btnViewPDF_Click(object sender, EventArgs e)
    {
        ShowReport(0);
    }

    /// <summary>
    /// Shows Value Reconciliation in Excel
    /// </summary>
    /// <param name="sender">object</param>
    /// <param name="e">EventArgs</param>
    protected void btnViewExcel_Click(object sender, EventArgs e)
    {
        ShowReport(1);
    }
    
    /// <summary>
    /// Sets Report Type
    /// </summary>
    /// <returns>ReportType as String</returns>
    private string GetReportType()
    {
        string SelectedValues = string.Empty;
        if (!cbSelectAll.Checked)
        {
            foreach (ListItem li in cblReportFilter.Items)
            {
                if (li.Selected)
                {
                    SelectedValues += li.Value;
                }
            }
        }
        else
        {
            SelectedValues = "All";
        }
        return SelectedValues;
    }

    /// <summary>
    /// Loads Locations
    /// </summary>
    /// <param name="sender">object</param>
    /// <param name="e">EventArgs</param>
    protected void ddDistributorType_SelectedIndexChanged(object sender, EventArgs e)
    {
        this.LoadDistributor();
    }
}