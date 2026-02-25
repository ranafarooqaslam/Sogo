using System;
using System.Data;
using System.Web.UI;
using System.Web.UI.WebControls;
using SAMSBusinessLayer.Classes;
using SAMSCommon.Classes;
using SAMSBusinessLayer.Reports;

/// <summary>
/// Form For  Customer Wise (DSR) Report
/// </summary>
public partial class Forms_RptCustomerAddress : System.Web.UI.Page
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
            this.LoadTown();            
            this.LoadArea();
            this.LoadCustomer();
        }
    }

    /// <summary>
    /// Loads Principals To Principal Combo
    /// </summary>
    private void LoadCustomer()
    {
        ddlCustomer.Items.Clear();
        CustomerDataController mController = new CustomerDataController();
        DataTable dt = mController.SelectPrincipalCustomer(int.Parse(drpDistributor.SelectedValue.ToString()), Constants.IntNullValue, int.Parse(DrpRoute.SelectedValue.ToString()), Constants.IntNullValue);
        ddlCustomer.Items.Add(new ListItem("All", Constants.IntNullValue.ToString()));
        clsWebFormUtil.FillDropDownList(this.ddlCustomer, dt, 0, 4);
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
    /// Loads Routes To Route Combo
    /// </summary>
    private void LoadArea()
    {
        if (drpDistributor.Items.Count > 0)
        {
            DrpRoute.Items.Clear();
            DistributorAreaController mController = new DistributorAreaController();
            DataTable dt = mController.SelectDist_Area(Constants.LongNullValue, Constants.DateNullValue, Constants.DateNullValue, int.Parse(drpDistributor.SelectedValue.ToString()), Convert.ToInt32(ddlCity.SelectedValue), null, null);
            DrpRoute.Items.Add(new ListItem("All",Constants.IntNullValue.ToString()));       
            clsWebFormUtil.FillDropDownList(DrpRoute, dt, 0, 6);
        }
        else
        {
            DrpRoute.Items.Clear();
        }
    }
        
    /// <summary>
    /// Loads Towns To Town Combo
    /// </summary>
    protected void LoadTown()
    {
        ddlCity.Items.Clear();
        if (drpDistributor.Items.Count > 0)
        {
            GeoHierarchyController gController = new GeoHierarchyController();
            DataTable dt = gController.SelectGeoHierarchy(int.Parse(drpDistributor.SelectedValue.ToString()));
            ddlCity.Items.Add(new ListItem("All", Constants.IntNullValue.ToString()));
            clsWebFormUtil.FillDropDownList(ddlCity, dt, 0, 1);
        }
    }

    /// <summary>
    /// Loads Order Bookers, Routes And Delivermen
    /// </summary>
    /// <param name="sender">object</param>
    /// <param name="e">EventArgs</param>    
    protected void drpDistributor_SelectedIndexChanged(object sender, EventArgs e)
    {
        this.LoadArea();
        this.LoadTown();
        this.LoadCustomer();
    }

    /// <summary>
    /// Loads Order Bookers And Deliverymen
    /// </summary>
    /// <param name="sender">object</param>
    /// <param name="e">EventArgs</param>
    protected void DrpRoute_SelectedIndexChanged(object sender, EventArgs e)
    {
        this.LoadCustomer();
    }

    /// <summary>
    /// Shows Customer Wise (DSR) in PDF
    /// </summary>
    /// <param name="sender">object</param>
    /// <param name="e">EventArgs</param>
    protected void btnViewPDF_Click(object sender, EventArgs e)
    {
        ShowReport(0);
    }

    /// <summary>
    /// Shows Customer Wise (DSR) in Excel
    /// </summary>
    /// <param name="sender">object</param>
    /// <param name="e">EventArgs</param>
    protected void btnViewExcel_Click(object sender, EventArgs e)
    {
        ShowReport(1);
    }

    protected void ddlCity_SelectedIndexChanged(object sender, EventArgs e)
    {
        this.LoadArea();
        this.LoadCustomer();
    }

    private void ShowReport(int p_ReportType)
    {
        System.Text.StringBuilder sbCustomerIDs = new System.Text.StringBuilder();
        if (ddlCustomer.SelectedValue == Constants.IntNullValue.ToString())
        {
            foreach (ListItem li in ddlCustomer.Items)
            {
                sbCustomerIDs.Append(li.Value);
                sbCustomerIDs.Append(",");
            }
        }
        else
        {
            sbCustomerIDs.Append(ddlCustomer.SelectedValue);
        }
        RptCustomerController RptCustomerCtl = new RptCustomerController();
        DataSet ds = null;
        
        DataControl dc = new DataControl();
        ds = RptCustomerCtl.GetCustomerAddress(sbCustomerIDs.ToString());

        SAMSBusinessLayer.Reports.CrpCustomerAddress CrpReport = new SAMSBusinessLayer.Reports.CrpCustomerAddress();
        CrpReport.SetDataSource(ds);
        CrpReport.Refresh();

        this.Session.Add("CrpReport", CrpReport);
        this.Session.Add("ReportType", p_ReportType);
        string url = "'Default.aspx'";
        string script = "<script language='JavaScript' type='text/javascript'> window.open(" + url + ",\"Link\",\"toolbar=0,location=0,directories=0,status=0,menubar=0,scrollbars=1,resizable=1,width=800,height=600,left=10,top=10\");</script>";
        Type cstype = this.GetType();
        ClientScriptManager cs = Page.ClientScript;
        cs.RegisterStartupScript(cstype, "OpenWindow", script);
    }
}