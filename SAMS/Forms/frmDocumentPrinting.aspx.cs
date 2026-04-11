using System;
using System.Data;
using System.Web.UI;
using System.Web.UI.WebControls;
using SAMSBusinessLayer.Classes;
using SAMSCommon.Classes;
using SAMSBusinessLayer.Reports;  
using CrystalDecisions.CrystalReports.Engine;

/// <summary>
/// Form For Print Sale Document Report
/// </summary>
public partial class Forms_frmDocumentPrinting : System.Web.UI.Page
{
    DocumentPrintController DPrint = new DocumentPrintController();
    DataTable dtCompany;
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
            LoadChannelType();
            dtCompany = DPrint.SelectReportTitle(int.Parse(drpDistributor.SelectedValue.ToString()));
            DrpLedgerType.Items.Add(new ListItem("Sales Invoice", "1"));
            if (dtCompany.Rows[0]["COMPANY_NAME"].ToString() == "Corporate Brands" || dtCompany.Rows[0]["COMPANY_NAME"].ToString() == "SSJ Enterprises")
            {
                DrpLedgerType.Items.Add(new ListItem("Sales Invoice(New)", "5"));
            }
            DrpLedgerType.Items.Add(new ListItem("Delivery Challan", "2"));
            DrpLedgerType.Items.Add(new ListItem("Sale Return", "3"));
            DrpLedgerType.Items.Add(new ListItem("Sale Return(DC)", "4"));
            LoadTown();
            this.LoadSaleForce();
            this.LoadRoute();
            LoadOrderBooker();
            this.LoadCustomer();
            SAMSCommon.Classes.Configuration.SystemCurrentDateTime = (DateTime)this.Session["CurrentWorkDate"];
            txtStartDate.Text = SAMSCommon.Classes.Configuration.SystemCurrentDateTime.ToString("dd-MMM-yyyy");
            txtEndDate.Text = SAMSCommon.Classes.Configuration.SystemCurrentDateTime.ToString("dd-MMM-yyyy");
        }
    }

    private void LoadChannelType()
    {
        SLASHCodesController mController = new SLASHCodesController();
        DataTable dt = mController.SelectSlashCodes(Constants.IntNullValue, null, Constants.CustomerChannelType, null, Constants.IntNullValue, bool.Parse("True"));
        ddlChannelType.Items.Add(new ListItem("All", Constants.IntNullValue.ToString()));
        clsWebFormUtil.FillDropDownList(ddlChannelType, dt, 0, 2);
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
    /// Loads Sale Forces To Sale Force Combo
    /// </summary>
    private void LoadSaleForce()
    {
        DrpArea.Items.Clear();
        SaleForceController mDController = new SaleForceController();
        DataTable m_dt = mDController.SelectRollBackInvoiceSaleForce(int.Parse(DrpLedgerType.SelectedValue.ToString()), Constants.IntNullValue, int.Parse(drpDistributor.SelectedValue.ToString()));
        DrpArea.Items.Add(new ListItem("All", Constants.IntNullValue.ToString()));       
        clsWebFormUtil.FillDropDownList(this.DrpArea, m_dt, 0, 1);
    }
    private void LoadOrderBooker()
    {
        if (drpDistributor.Items.Count > 0 && DrpRoute.Items.Count > 0)
        {
            SaleForceController mDController = new SaleForceController();
            DataTable m_dt = mDController.SelectSaleForceAssignedArea(Constants.SALES_FORCE_ORDERBOOKER, int.Parse(drpDistributor.SelectedValue.ToString()), int.Parse(DrpRoute.SelectedValue.ToString()), int.Parse(this.Session["CompanyId"].ToString()), Constants.IntNullValue);
            DrpOrderBooker.Items.Add(new ListItem("All", Constants.IntNullValue.ToString()));
            clsWebFormUtil.FillDropDownList(this.DrpOrderBooker, m_dt, 0, 3);
        }
        else
        {
            DrpOrderBooker.Items.Clear();
        }
    }
    /// <summary>
    /// Loads Routes To Route Combo
    /// </summary>
    private void LoadRoute()
    {
        if (drpDistributor.Items.Count > 0)
        {
            DrpRoute.Items.Clear();
            DistributorAreaController mController = new DistributorAreaController();
            DataTable dt = mController.SelectDist_Area(Constants.LongNullValue, Constants.DateNullValue, Constants.DateNullValue, int.Parse(drpDistributor.SelectedValue.ToString()), int.Parse(DrpTown.SelectedValue.ToString()), null, null);
            DrpRoute.Items.Add(new ListItem("All", Constants.IntNullValue.ToString()));
            clsWebFormUtil.FillDropDownList(DrpRoute, dt, 0, 6);
        }
        else
        {
            DrpRoute.Items.Clear();
        }
    }
    protected void LoadTown()
    {
        if (drpDistributor.Items.Count > 0)
        {
            GeoHierarchyController gController = new GeoHierarchyController();
            DataTable dt = gController.SelectGeoHierarchy(int.Parse(drpDistributor.SelectedValue.ToString()));
            DrpTown.Items.Add(new ListItem("All", Constants.IntNullValue.ToString()));
            clsWebFormUtil.FillDropDownList(DrpTown, dt, 0, 1);
        }
    }
    /// <summary>
    /// Loads Customers To Customer Combo
    /// </summary>
    private void LoadCustomer()
    {
        DrpCustomer.Items.Clear();
        DrpCustomer.Items.Add(new ListItem("All", Constants.IntNullValue.ToString()));
        if (drpDistributor.Items.Count > 0 && DrpRoute.Items.Count > 0 && DrpRoute.SelectedValue != Constants.IntNullValue.ToString())
        {
            CustomerDataController mController = new CustomerDataController();
            DataTable dt = mController.SelectAllCustomer(int.Parse(drpDistributor.SelectedValue.ToString()), int.Parse(DrpRoute.SelectedValue.ToString()), Constants.IntNullValue);
            clsWebFormUtil.FillDropDownList(this.DrpCustomer, dt, 0, 3, false);

        }
    }

    /// <summary>
    /// Loads Sale Forces And Routes
    /// </summary>
    /// <param name="sender">object</param>
    /// <param name="e">EventArgs</param>
    protected void drpDistributor_SelectedIndexChanged(object sender, EventArgs e)
    {
        this.LoadSaleForce();
        this.LoadRoute();
    }
    protected void DrpTown_SelectedIndexChanged(object sender, EventArgs e)
    {
        this.LoadRoute();
        DrpRoute_SelectedIndexChanged(null,null);
    }
    /// <summary>
    /// Loads Sale Forces
    /// </summary>
    /// <param name="sender">object</param>
    /// <param name="e">EventArgs</param>
    protected void DrpLedgerType_SelectedIndexChanged(object sender, EventArgs e)
    {
        this.LoadSaleForce();
        if (DrpLedgerType.SelectedValue == "1" || DrpLedgerType.SelectedValue == "5")
        {
            btnViewPdfWithLedgerBal.Visible = true;
        }
        else {
            btnViewPdfWithLedgerBal.Visible = false;
        }
    }

    /// <summary>
    /// Loads Customers
    /// </summary>
    /// <param name="sender">object</param>
    /// <param name="e">EventArgs</param>
    protected void DrpRoute_SelectedIndexChanged(object sender, EventArgs e)
    {
        LoadCustomer();
    }

    /// <summary>
    /// Shows Print Sale Document in PDF
    /// </summary>
    /// <param name="sender">object</param>
    /// <param name="e">EventArgs</param>
    protected void btnViewPDF_Click(object sender, EventArgs e)
    {
        ShowReport(0);
    }
    
    /// <summary>
    /// Gets Print Sale Document And Shows Either in Excel or PDF
    /// </summary>
    /// <param name="p_ReportType">Type</param>
    private void ShowReport(int p_ReportType)
    {
        int p_CustomerType = Constants.IntNullValue;

        RptSaleController RptSaleCtl = new RptSaleController();
        DataSet ds = null;
        try
        {
            dtCompany = DPrint.SelectReportTitle(int.Parse(drpDistributor.SelectedValue.ToString()));
            if (dtCompany.Rows.Count > 0)
            {
                try
                {
                    DataControl dc = new DataControl();
                    ds = RptSaleCtl.SelectDocumentforPrint(int.Parse(drpDistributor.SelectedValue.ToString()), Convert.ToInt32(DrpArea.SelectedValue), Constants.IntNullValue,
                        DateTime.Parse(txtStartDate.Text + " 00:00:00"), DateTime.Parse(txtEndDate.Text + " 23:59:59"), 
                        int.Parse(DrpLedgerType.SelectedValue.ToString()), Constants.LongNullValue, p_CustomerType, Convert.ToInt32(DrpCustomer.SelectedValue), 
                        Convert.ToInt32(DrpRoute.SelectedValue), int.Parse(DrpTown.SelectedValue),int.Parse(DrpOrderBooker.SelectedValue),Convert.ToInt32(ddlChannelType.SelectedValue));
                    ReportDocument CrpReport = new ReportDocument();
                    if (DrpLedgerType.SelectedValue == "2" || DrpLedgerType.SelectedValue == "4")
                    {
                        CrpReport = new SAMSBusinessLayer.Reports.CrpPrintDocumentDC();
                    }
                    else if (DrpLedgerType.SelectedValue == "5")
                    {
                        CrpReport = new SAMSBusinessLayer.Reports.CrpPrintDocumentNew();
                    }
                    else
                    {

                        if (dtCompany.Rows[0]["COMPANY_NAME"].ToString() == "Corporate Brands" || dtCompany.Rows[0]["COMPANY_NAME"].ToString() == "SSJ Enterprises")
                        {
                            CrpReport = new SAMSBusinessLayer.Reports.CrpPrintDocument();
                        }
                        else

                        {
                            CrpReport = new SAMSBusinessLayer.Reports.CrpPrintDocumentRCR();
                        }
                    }
                    if (rbtSortOrder.SelectedIndex == 0)
                    {
                        CrpReport.DataDefinition.SortFields[0].SortDirection = CrystalDecisions.Shared.SortDirection.AscendingOrder;

                    }
                    else
                    {
                        CrpReport.DataDefinition.SortFields[0].SortDirection = CrystalDecisions.Shared.SortDirection.DescendingOrder;
                    }
                    CrpReport.SetDataSource(ds);
                    CrpReport.Refresh();
                    try
                    {
                        CrpReport.SetParameterValue("COMPANY_NAME", dtCompany.Rows[0]["COMPANY_NAME"].ToString());
                        CrpReport.SetParameterValue("NtnNumber", "NTN :" + dtCompany.Rows[0]["NTN_NO"].ToString());
                        CrpReport.SetParameterValue("CompanyAddress", dtCompany.Rows[0]["CompanyAddress"].ToString());
                        CrpReport.SetParameterValue("BranchAddress", "Branch Address: " + dtCompany.Rows[0]["ADDRESS1"].ToString());
                        CrpReport.SetParameterValue("TAXREGISTERATION_NO", dtCompany.Rows[0]["GST_NUMBER"].ToString());
                        CrpReport.SetParameterValue("DISTRIBUTOR_NAME", dtCompany.Rows[0]["DISTRIBUTOR_NAME"].ToString());
                        CrpReport.SetParameterValue("CONTACT_NUMBER", "Ph: " + dtCompany.Rows[0]["CONTACT_NUMBER"].ToString());
                        CrpReport.SetParameterValue("PrintedBy", Session["UserName2"].ToString());
                        CrpReport.SetParameterValue("ChannelType", ddlChannelType.SelectedItem.Text);
                        CrpReport.SetParameterValue("PrintType", "0");
                        this.Session.Add("CrpReport", CrpReport);
                        this.Session.Add("ReportType", p_ReportType);
                        string url = "'Default.aspx'";
                        string script = "<script language='JavaScript' type='text/javascript'> window.open(" + url + ",\"Link\",\"toolbar=0,location=0,directories=0,status=0,menubar=0,scrollbars=1,resizable=1,width=800,height=600,left=10,top=10\");</script>";
                        Type cstype = this.GetType();
                        ClientScriptManager cs = Page.ClientScript;
                        cs.RegisterStartupScript(cstype, "OpenWindow", script);
                    }
                    catch (Exception ex)
                    {
                        ScriptManager.RegisterStartupScript(this, this.GetType(), "msg", "alert('3" + ex.Message + "')", true);
                    }
                }
                catch (Exception ex)
                {
                    ScriptManager.RegisterStartupScript(this, this.GetType(), "msg", "alert('2" + ex.Message + "')", true);
                }
            }
        }
        catch (Exception ex)
        {
            ScriptManager.RegisterStartupScript(this, this.GetType(), "msg", "alert('1" + ex.Message + "')", true);
        }
    }

    /// <summary>
    /// Shows Print Sale Document in Excel
    /// </summary>
    /// <param name="sender">object</param>
    /// <param name="e">EventArgs</param>
    protected void btnViewExcel_Click(object sender, EventArgs e)
    {
        ShowReport(1);
    }

    protected void btnViewPdfWithLedgerBal_Click(object sender, EventArgs e)
    {
        int p_CustomerType = Constants.IntNullValue;

        RptSaleController RptSaleCtl = new RptSaleController();
        DataSet ds = null;
        try
        {
            dtCompany = DPrint.SelectReportTitle(int.Parse(drpDistributor.SelectedValue.ToString()));
            if (dtCompany.Rows.Count > 0)
            {
                try
                {
                    DataControl dc = new DataControl();
                    ds = RptSaleCtl.SelectDocumentforPrint(int.Parse(drpDistributor.SelectedValue.ToString()), Convert.ToInt32(DrpArea.SelectedValue), Constants.IntNullValue,
                        DateTime.Parse(txtStartDate.Text + " 00:00:00"), DateTime.Parse(txtEndDate.Text + " 23:59:59"), int.Parse(DrpLedgerType.SelectedValue.ToString()), Constants.LongNullValue, p_CustomerType,
                        Convert.ToInt32(DrpCustomer.SelectedValue), Convert.ToInt32(DrpRoute.SelectedValue) , int.Parse(DrpTown.SelectedValue), int.Parse(DrpOrderBooker.SelectedValue),Convert.ToInt32(ddlChannelType.SelectedValue));
                    ReportDocument CrpReport = new ReportDocument();
                  if (DrpLedgerType.SelectedValue == "5")
                    {
                        CrpReport = new SAMSBusinessLayer.Reports.CrpPrintDocumentNewLblnc();
                    }
                    else if (DrpLedgerType.SelectedValue == "1")
                    {
                            CrpReport = new SAMSBusinessLayer.Reports.CrpPrintDocumentWithLedgerBal();
                                           }
                    if (rbtSortOrder.SelectedIndex == 0)
                    {
                        CrpReport.DataDefinition.SortFields[0].SortDirection = CrystalDecisions.Shared.SortDirection.AscendingOrder;

                    }
                    else
                    {
                        CrpReport.DataDefinition.SortFields[0].SortDirection = CrystalDecisions.Shared.SortDirection.DescendingOrder;
                    }
                    CrpReport.SetDataSource(ds);
                    CrpReport.Refresh();
                    try
                    {
                        CrpReport.SetParameterValue("COMPANY_NAME", dtCompany.Rows[0]["COMPANY_NAME"].ToString());
                        CrpReport.SetParameterValue("NtnNumber", "NTN :" + dtCompany.Rows[0]["NTN_NO"].ToString());
                        CrpReport.SetParameterValue("CompanyAddress", dtCompany.Rows[0]["CompanyAddress"].ToString());
                        CrpReport.SetParameterValue("BranchAddress", "Branch Address: " + dtCompany.Rows[0]["ADDRESS1"].ToString());
                        CrpReport.SetParameterValue("TAXREGISTERATION_NO", dtCompany.Rows[0]["GST_NUMBER"].ToString());
                        CrpReport.SetParameterValue("DISTRIBUTOR_NAME", dtCompany.Rows[0]["DISTRIBUTOR_NAME"].ToString());
                        CrpReport.SetParameterValue("CONTACT_NUMBER", "Ph: " + dtCompany.Rows[0]["CONTACT_NUMBER"].ToString());
                        CrpReport.SetParameterValue("PrintedBy", Session["UserName2"].ToString());
                        CrpReport.SetParameterValue("PrintType", "0");
                        this.Session.Add("CrpReport", CrpReport);
                        this.Session.Add("ReportType", 0);
                        string url = "'Default.aspx'";
                        string script = "<script language='JavaScript' type='text/javascript'> window.open(" + url + ",\"Link\",\"toolbar=0,location=0,directories=0,status=0,menubar=0,scrollbars=1,resizable=1,width=800,height=600,left=10,top=10\");</script>";
                        Type cstype = this.GetType();
                        ClientScriptManager cs = Page.ClientScript;
                        cs.RegisterStartupScript(cstype, "OpenWindow", script);
                    }
                    catch (Exception ex)
                    {
                        ScriptManager.RegisterStartupScript(this, this.GetType(), "msg", "alert('3" + ex.Message + "')", true);
                    }
                }
                catch (Exception ex)
                {
                    ScriptManager.RegisterStartupScript(this, this.GetType(), "msg", "alert('2" + ex.Message + "')", true);
                }
            }
        }
        catch (Exception ex)
        {
            ScriptManager.RegisterStartupScript(this, this.GetType(), "msg", "alert('1" + ex.Message + "')", true);
        }
    }
}