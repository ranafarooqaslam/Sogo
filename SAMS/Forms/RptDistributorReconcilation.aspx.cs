using System;
using System.Data;
using System.Web.UI;
using System.Web.UI.WebControls;
using SAMSCommon.Classes;
using SAMSBusinessLayer.Classes;

/// <summary>
/// Form For SKU Wise Branch Sales Report
/// </summary>
public partial class Forms_RptDistributorReconcilation : System.Web.UI.Page
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
            this.LoadChannelType();
            this.DistributorType();
            this.LoadDistributor();
            this.LoadTown();
            this.LoadArea();
            this.LoadCreditCustomer();
            this.LoadPrincipal();
            this.LoadCategory();
            this.LoadSKU();
            SAMSCommon.Classes.Configuration.SystemCurrentDateTime = (DateTime)this.Session["CurrentWorkDate"];
            txtStartDate.Text = SAMSCommon.Classes.Configuration.SystemCurrentDateTime.ToString("dd-MMM-yyyy");
            txtEndDate.Text = SAMSCommon.Classes.Configuration.SystemCurrentDateTime.ToString("dd-MMM-yyyy");
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
    /// Loads User Assigned Locations To Location Combo
    /// </summary>
    private void LoadDistributor()
    {
        if (ddDistributorType.Items.Count > 0)
        {
            drpDistributor.Items.Clear();
            UserController mUserController = new UserController();
            DataTable dt = mUserController.SelectUserAssignment(int.Parse(this.Session["UserId"].ToString()), int.Parse(ddDistributorType.SelectedValue.ToString()), 1, int.Parse(this.Session["CompanyId"].ToString()));
            clsWebFormUtil.FillDropDownList(drpDistributor, dt, 0, 1);
        }
    }

    /// <summary>
    /// Loads Channel Types To ChannelType Combo
    /// </summary>
    private void LoadChannelType()
    {
        SLASHCodesController mController = new SLASHCodesController();
        DataTable dt = mController.SelectSlashCodes(Constants.IntNullValue, null, Constants.CustomerChannelType, null, Constants.IntNullValue, bool.Parse("True"));
        ddlChannel.Items.Add(new ListItem("All", Constants.IntNullValue.ToString()));
        clsWebFormUtil.FillDropDownList(ddlChannel, dt, 0, 2);

    }

    /// <summary>
    /// Loads Principals To Principal Combo
    /// </summary>
    private void LoadPrincipal()
    {
        SKUPriceDetailController PController = new SKUPriceDetailController();
        DataTable m_dt = PController.SelectDataPrice(Constants.IntNullValue, Constants.IntNullValue, Constants.IntNullValue, Constants.IntNullValue, Constants.IntNullValue, int.Parse(this.Session["UserId"].ToString()), Constants.IntNullValue, 0, DateTime.Parse(this.Session["CurrentWorkDate"].ToString()));
        DrpPrincipal.Items.Add(new ListItem("All", Constants.IntNullValue.ToString()));
        clsWebFormUtil.FillDropDownList(this.DrpPrincipal, m_dt, 0, 1);
    }

    private void LoadCategory()
    {
        cblCategory.Items.Clear();
        SkuHierarchyController mController = new SkuHierarchyController();
        DataTable dt = mController.SelectSKUCategory(Convert.ToInt32(DrpPrincipal.SelectedValue), Constants.SKUCategory);
        clsWebFormUtil.FillListBox(this.cblCategory, dt, "SKU_HIE_ID", "SKU_HIE_NAME");
        foreach(ListItem li in cblCategory.Items)
        {
            li.Selected = true;
        }
    }

    /// <summary>
    /// Loads SKU Data To Session
    /// </summary>
    private void LoadSKU()
    {
        string CategoryID = "";
        foreach(ListItem li in cblCategory.Items)
        {
            if(li.Selected)
            {
                CategoryID += li.Value.ToString();
                CategoryID += ",";
            }
        }
        ddlSKU.Items.Clear();
        SkuController mSKUController = new SkuController();
        DataTable dtSKU = mSKUController.SelectSkuInfo2(int.Parse(DrpPrincipal.SelectedValue.ToString()), Constants.IntNullValue, CategoryID, Constants.IntNullValue, int.Parse(this.Session["CompanyId"].ToString()));
        if(dtSKU.Rows.Count > 0)
        {
            ddlSKU.Items.Add(new ListItem("All", Constants.IntNullValue.ToString()));
        }
        clsWebFormUtil.FillDropDownList(ddlSKU, dtSKU, "SKU_ID", "SKU_NAME");
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
    /// Loads Routes To Route Combo
    /// </summary>
    private void LoadArea()
    {
        if (drpDistributor.Items.Count > 0)
        {
            ddlArea.Items.Clear();
            DistributorAreaController mController = new DistributorAreaController();
            DataTable dt = mController.SelectDist_Area(Constants.LongNullValue, Constants.DateNullValue, Constants.DateNullValue, int.Parse(drpDistributor.SelectedValue.ToString()), Constants.IntNullValue, null, null);
            ddlArea.Items.Add(new ListItem("All", Constants.IntNullValue.ToString()));
            clsWebFormUtil.FillDropDownList(ddlArea, dt, 0, 6);
        }
        else
        {
            ddlArea.Items.Clear();
        }
    }

    /// <summary>
    /// Loads Credit Customers To Customer Combo
    /// </summary>
    private void LoadCreditCustomer()
    {
        ddlCustomer.Items.Clear();
        if (drpDistributor.Items.Count > 0 && ddlArea.Items.Count > 0)
        {
            CustomerDataController mController = new CustomerDataController();
            DataTable dt = mController.SelectPrincipalCustomer(int.Parse(drpDistributor.SelectedValue.ToString()), int.Parse(ddlArea.SelectedValue.ToString()), Constants.IntNullValue, Constants.IntNullValue);
            ddlCustomer.Items.Add(new ListItem("All", Constants.IntNullValue.ToString()));
            clsWebFormUtil.FillDropDownList(this.ddlCustomer, dt, 0, 4);
        }
        else
        {
            ddlCustomer.Items.Add(new ListItem("Customer Not Found", Constants.IntNullValue.ToString()));
        }
    }

    /// <summary>
    /// Loads Locations
    /// </summary>
    /// <param name="sender">object</param>
    /// <param name="e">EventArgs</param>
    protected void ddDistributorType_SelectedIndexChanged(object sender, EventArgs e)
    {
        this.LoadDistributor();
        this.LoadArea();
    }

    /// <summary>
    /// Shows SKU Wise Branch Sales in PDF
    /// </summary>
    /// <param name="sender">object</param>
    /// <param name="e">EventArgs</param>
    protected void btnViewPDF_Click(object sender, EventArgs e)
    {
        string CategoryID = "";
        foreach (ListItem li in cblCategory.Items)
        {
            if (li.Selected)
            {
                CategoryID += li.Value.ToString();
                CategoryID += ",";
            }
        }

        string Category = "";
        foreach (ListItem li in cblCategory.Items)
        {
            if (li.Selected)
            {
                Category += li.Text.ToString();
                Category += ",";
            }
        }
        DocumentPrintController mDocumentPrntControl = new DocumentPrintController();
        RptSaleController RptSaleCtl = new RptSaleController();
        DataSet ds = RptSaleCtl.GetDistributorReconcilation(int.Parse(this.ddDistributorType.SelectedItem.Value), int.Parse(DrpPrincipal.SelectedValue.ToString()),CategoryID,Convert.ToInt32(ddlSKU.SelectedValue), int.Parse(drpDistributor.SelectedValue.ToString()), DateTime.Parse(this.txtStartDate.Text + " 00:00:00"), DateTime.Parse(this.txtEndDate.Text + " 23:59:59"),Convert.ToInt32(ddlChannel.SelectedValue),Convert.ToInt32(ddlArea.SelectedValue),Convert.ToInt32(ddlCustomer.SelectedValue), int.Parse(this.Session["UserId"].ToString()),Convert.ToInt32(ddlCity.SelectedValue));
        DataTable dt = mDocumentPrntControl.SelectReportTitle(int.Parse(drpDistributor.SelectedValue.ToString()));
        SAMSBusinessLayer.Reports.CrpDistributorReconcilation CrpReport = new SAMSBusinessLayer.Reports.CrpDistributorReconcilation();
        CrpReport.SetDataSource(ds);
        CrpReport.Refresh();
        CrpReport.SetParameterValue("FromDate", txtStartDate.Text);
        CrpReport.SetParameterValue("ToDate", txtEndDate.Text);
        CrpReport.SetParameterValue("Principal", DrpPrincipal.SelectedItem.Text);
        CrpReport.SetParameterValue("CompanyName", dt.Rows[0]["COMPANY_NAME"].ToString());
        CrpReport.SetParameterValue("City", ddlCity.SelectedItem.Text);
        CrpReport.SetParameterValue("PrintedBy",Session["UserName2"].ToString());
        CrpReport.SetParameterValue("LocationType", ddDistributorType.SelectedItem.Text);
        CrpReport.SetParameterValue("Location", drpDistributor.SelectedItem.Text);
        CrpReport.SetParameterValue("Channel", ddlChannel.SelectedItem.Text);
        CrpReport.SetParameterValue("Area", ddlArea.SelectedItem.Text);
        CrpReport.SetParameterValue("Customer", ddlCustomer.SelectedItem.Text);
        CrpReport.SetParameterValue("Category", Category);
        CrpReport.SetParameterValue("SKU", ddlSKU.SelectedItem.Text);
        this.Session.Add("CrpReport", CrpReport);
        this.Session.Add("ReportType", 0);
        string url = "'Default.aspx'";
        string script = "<script language='JavaScript' type='text/javascript'> window.open(" + url + ",\"Link\",\"toolbar=0,location=0,directories=0,status=0,menubar=0,scrollbars=1,resizable=1,width=800,height=600,left=10,top=10\");</script>";
        Type cstype = this.GetType();
        ClientScriptManager cs = Page.ClientScript;
        cs.RegisterStartupScript(cstype, "OpenWindow", script); 
    }

    /// <summary>
    /// Shows SKU Wise Branch Sales in Excel
    /// </summary>
    /// <param name="sender">object</param>
    /// <param name="e">EventArgs</param>
    protected void btnViewExce_Click(object sender, EventArgs e)
    {
        string CategoryID = "";
        foreach (ListItem li in cblCategory.Items)
        {
            if (li.Selected)
            {
                CategoryID += li.Value.ToString();
                CategoryID += ",";
            }
        }

        string Category = "";
        foreach (ListItem li in cblCategory.Items)
        {
            if (li.Selected)
            {
                Category += li.Text.ToString();
                Category += ",";
            }
        }

        DocumentPrintController mDocumentPrntControl = new DocumentPrintController();
        RptSaleController RptSaleCtl = new RptSaleController();
        DataSet ds = RptSaleCtl.GetDistributorReconcilation(int.Parse(this.ddDistributorType.SelectedItem.Value), int.Parse(DrpPrincipal.SelectedValue.ToString()), CategoryID, Convert.ToInt32(ddlSKU.SelectedValue), int.Parse(drpDistributor.SelectedValue.ToString()), DateTime.Parse(this.txtStartDate.Text + " 00:00:00"), DateTime.Parse(this.txtEndDate.Text + " 23:59:59"), Convert.ToInt32(ddlChannel.SelectedValue), Convert.ToInt32(ddlArea.SelectedValue), Convert.ToInt32(ddlCustomer.SelectedValue), int.Parse(this.Session["UserId"].ToString()), Convert.ToInt32(ddlCity.SelectedValue));
        DataTable dt = mDocumentPrntControl.SelectReportTitle(int.Parse(drpDistributor.SelectedValue.ToString()));


        SAMSBusinessLayer.Reports.CrpDistributorReconcilation CrpReport = new SAMSBusinessLayer.Reports.CrpDistributorReconcilation();
        CrpReport.SetDataSource(ds);
        CrpReport.Refresh();
        CrpReport.SetParameterValue("FromDate", txtStartDate.Text);
        CrpReport.SetParameterValue("ToDate", txtEndDate.Text);
        CrpReport.SetParameterValue("Principal", DrpPrincipal.SelectedItem.Text);
        CrpReport.SetParameterValue("CompanyName", dt.Rows[0]["COMPANY_NAME"].ToString());
        CrpReport.SetParameterValue("City", ddlCity.SelectedItem.Text);
        CrpReport.SetParameterValue("PrintedBy", Session["UserName2"].ToString());
        CrpReport.SetParameterValue("LocationType", ddDistributorType.SelectedItem.Text);
        CrpReport.SetParameterValue("Location", drpDistributor.SelectedItem.Text);
        CrpReport.SetParameterValue("Channel", ddlChannel.SelectedItem.Text);
        CrpReport.SetParameterValue("Area", ddlArea.SelectedItem.Text);
        CrpReport.SetParameterValue("Customer", ddlCustomer.SelectedItem.Text);
        CrpReport.SetParameterValue("Category", Category);
        CrpReport.SetParameterValue("SKU", ddlSKU.SelectedItem.Text);

        string path = SAMSCommon.Classes.Configuration.GetAppInstallationPath() + "\\ExportedFile.xls";

        CrpReport.SetDatabaseLogon("sa", "Laislabonitamac2065");

        CrpReport.ExportToDisk(CrystalDecisions.Shared.ExportFormatType.Excel, path);

        System.IO.FileInfo file = new System.IO.FileInfo(path);

        if (file.Exists)
        {
            Response.Clear();

            Response.AddHeader("Content-Disposition", "attachment; filename=" + file.Name);

            Response.AddHeader("Content-Length", file.Length.ToString());

            Response.ContentType = "application/octet-stream";

            Response.WriteFile(file.FullName);

            Response.End();

        }
        else
        {
            Response.Write("This file does not exist.");
        }        
    }

    protected void drpDistributor_SelectedIndexChanged(object sender, EventArgs e)
    {
        this.LoadTown();
        this.LoadArea();
    }
    
    protected void ddlArea_SelectedIndexChanged(object sender, EventArgs e)
    {
        this.LoadCreditCustomer();
    }
    
    protected void DrpPrincipal_SelectedIndexChanged(object sender, EventArgs e)
    {
        this.LoadCategory();
    }


    protected void cbCategory_CheckedChanged(object sender, EventArgs e)
    {
        LoadSKU();
    }

    protected void cblCategory_SelectedIndexChanged(object sender, EventArgs e)
    {
        LoadSKU();
    }
}