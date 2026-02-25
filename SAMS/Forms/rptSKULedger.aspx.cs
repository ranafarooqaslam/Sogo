using System;
using System.Data;
using System.Web.UI;
using System.Web.UI.WebControls;
using SAMSBusinessLayer.Classes;
using SAMSCommon.Classes;

/// <summary>
/// Form For Stock Reconciliation Report
/// </summary>
public partial class Forms_rptSKULedger : System.Web.UI.Page
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
            this.LoadDistributor();
            this.LoadPrincipal();
            this.LoadCategory();
            this.LoadSKU();
            SAMSCommon.Classes.Configuration.SystemCurrentDateTime = (DateTime)this.Session["CurrentWorkDate"];
            txtStartDate.Text = SAMSCommon.Classes.Configuration.SystemCurrentDateTime.ToString("dd-MMM-yyyy");
            txtEndDate.Text = SAMSCommon.Classes.Configuration.SystemCurrentDateTime.ToString("dd-MMM-yyyy");
        }
    }

    /// <summary>
    /// Loads Principals To Principal Combo
    /// </summary>
    private void LoadPrincipal()
    {
        SKUPriceDetailController PController = new SKUPriceDetailController();
        DataTable m_dt = PController.SelectDataPrice(Constants.IntNullValue, Constants.IntNullValue, Constants.IntNullValue, Constants.IntNullValue, Constants.IntNullValue, int.Parse(this.Session["UserId"].ToString()), Constants.IntNullValue, 0, DateTime.Parse(this.Session["CurrentWorkDate"].ToString()));
        ddlPrincipal.Items.Add(new ListItem("All", Constants.IntNullValue.ToString()));
        clsWebFormUtil.FillDropDownList(this.ddlPrincipal, m_dt, 0, 1);        
    }

    private void LoadCategory()
    {
        ddlCategory.Items.Clear();
        SkuHierarchyController mController = new SkuHierarchyController();
        DataTable dt = mController.SelectSKUCategory(Convert.ToInt32(ddlPrincipal.SelectedValue), Constants.SKUCategory);
        ddlCategory.Items.Add(new ListItem("All", Constants.IntNullValue.ToString()));
        clsWebFormUtil.FillDropDownList(this.ddlCategory, dt, "SKU_HIE_ID", "SKU_HIE_NAME");
    }

    private void LoadSKU()
    {
        ddlSKU.Items.Clear();
        SkuController mSKUController = new SkuController();
        DataTable m_SKUDt = mSKUController.SelectSkuInfo(int.Parse(ddlPrincipal.SelectedValue.ToString()), Constants.IntNullValue, int.Parse(ddlCategory.SelectedValue.ToString()), Constants.IntNullValue, int.Parse(this.Session["CompanyId"].ToString()));
        ddlSKU.Items.Add(new ListItem("All", Constants.IntNullValue.ToString()));
        clsWebFormUtil.FillDropDownList(this.ddlSKU, m_SKUDt, "SKU_ID", "SKU_NAME");
    }

    /// <summary>
    /// Loads Locations To Location Combo
    /// </summary>
    private void LoadDistributor()
    {
        DistributorController DController = new DistributorController();
        DataTable dt = DController.SelectDistributorInfo(Constants.IntNullValue, int.Parse(this.Session["UserId"].ToString()), int.Parse(this.Session["CompanyId"].ToString()));
        clsWebFormUtil.FillDropDownList(this.drpDistributor, dt, 0, 2);
    }

    /// <summary>
    /// Shows Stock Reconciliation in PDF
    /// </summary>
    /// <param name="sender">object</param>
    /// <param name="e">EventArgs</param>
    protected void btnViewPDF_Click(object sender, EventArgs e)
    {
        ShowReport(0);
    }

    /// <summary>
    /// Shows Stock Reconciliation in Excel
    /// </summary>
    /// <param name="sender">object</param>
    /// <param name="e">EventArgs</param>
    protected void btnViewExcel_Click(object sender, EventArgs e)
    {
        ShowReport(1);
    }
    
    protected void ddlCategory_SelectedIndexChanged(object sender, EventArgs e)
    {
        this.LoadSKU();
    }

    private void ShowReport(int ReportType)
    {
        DocumentPrintController mController = new DocumentPrintController();
        RptInventoryController RptInventoryCtl = new RptInventoryController();
        SAMSBusinessLayer.Reports.CrpSKULedger CrpReport = new SAMSBusinessLayer.Reports.CrpSKULedger();
        DataTable dt = mController.SelectReportTitle(int.Parse(drpDistributor.SelectedValue.ToString()));
        DataSet ds = RptInventoryCtl.GetSKULedgerData(Convert.ToDateTime(txtStartDate.Text),Convert.ToDateTime(txtEndDate.Text + " 23:59:59"),Convert.ToInt32(ddlPrincipal.SelectedValue),Convert.ToInt32(ddlSKU.SelectedValue),drpDistributor.SelectedValue,Convert.ToInt32(ddlCategory.SelectedValue));
        CrpReport.SetDataSource(ds);
        CrpReport.Refresh();

        CrpReport.SetParameterValue("CompanyName", dt.Rows[0]["COMPANY_NAME"].ToString());
        CrpReport.SetParameterValue("Location", drpDistributor.SelectedItem.Text);
        CrpReport.SetParameterValue("Principal", ddlPrincipal.SelectedItem.Text);
        CrpReport.SetParameterValue("Category", ddlCategory.SelectedItem.Text);
        CrpReport.SetParameterValue("FromDate", txtStartDate.Text);
        CrpReport.SetParameterValue("To_date", txtEndDate.Text);
        
        this.Session.Add("CrpReport", CrpReport);
        this.Session.Add("ReportType", ReportType);
        string url = "'Default.aspx'";
        string script = "<script language='JavaScript' type='text/javascript'> window.open(" + url + ",\"Link\",\"toolbar=0,location=0,directories=0,status=0,menubar=0,scrollbars=1,resizable=1,width=800,height=600,left=10,top=10\");</script>";
        Type cstype = this.GetType();
        ClientScriptManager cs = Page.ClientScript;
        cs.RegisterStartupScript(cstype, "OpenWindow", script);            
    }
    
    protected void ddlPrincipal_SelectedIndexChanged(object sender, EventArgs e)
    {
        this.LoadCategory();
        this.LoadSKU();
    }
}