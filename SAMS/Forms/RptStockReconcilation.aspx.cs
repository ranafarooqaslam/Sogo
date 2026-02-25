using System;
using System.Data;
using System.Web.UI;
using System.Web.UI.WebControls;
using SAMSBusinessLayer.Classes;
using SAMSCommon.Classes;

/// <summary>
/// Form For Stock Reconciliation Report
/// </summary>
public partial class Forms_RptStockReconcilation : System.Web.UI.Page
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
        clsWebFormUtil.FillListBox(this.cblPrincipal, m_dt, 0, 1);

        foreach (ListItem li in cblPrincipal.Items)
        {
            li.Selected = true;
        }

        cblPrincipal.Attributes.Add("onclick", string.Format("javascript:CheckBoxListSelect({0})", cblPrincipal.ClientID));
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
        string PrincipalIDs = null;
        string PrincipalNames = "";
        foreach (ListItem li in cblPrincipal.Items)
        {
            if (li.Selected)
            {
                PrincipalIDs += li.Value + ",";
                PrincipalNames += li.Text + ", ";
            }
        }

        PrincipalIDs = PrincipalIDs.Substring(0, PrincipalIDs.Length - 1);
        PrincipalNames = PrincipalNames.Substring(0, PrincipalNames.Length - 1);
        DocumentPrintController mController = new DocumentPrintController();
        RptInventoryController RptInventoryCtl = new RptInventoryController();
        SAMSBusinessLayer.Reports.StockReConsilation CrpReport = new SAMSBusinessLayer.Reports.StockReConsilation();
        DataTable dt = mController.SelectReportTitle(int.Parse(drpDistributor.SelectedValue.ToString()));
        DataSet ds = RptInventoryCtl.SelectPrincipalStockReconcilation(int.Parse(drpDistributor.SelectedValue.ToString()),PrincipalIDs, DateTime.Parse(txtStartDate.Text), DateTime.Parse(txtEndDate.Text), int.Parse(this.Session["UserId"].ToString()),ddlType.SelectedIndex,Convert.ToInt32(rblRate.SelectedValue));
        CrpReport.SetDataSource(ds);
        CrpReport.Refresh();


        CrpReport.SetParameterValue("division", drpDistributor.SelectedItem.Text);
        CrpReport.SetParameterValue("Principal", PrincipalNames);
        CrpReport.SetParameterValue("fromdate", txtStartDate.Text);
        CrpReport.SetParameterValue("todate", txtEndDate.Text );
        CrpReport.SetParameterValue("CompanyName", dt.Rows[0]["COMPANY_NAME"].ToString());
        CrpReport.SetParameterValue("Price", rblRate.SelectedItem.Text);
        CrpReport.SetParameterValue("ZeroElimination", cbZero.Checked);
        CrpReport.SetParameterValue("ReportType", "Stock Reconciliation Report ( " + ddlType.SelectedItem.Text + " )");

        this.Session.Add("CrpReport", CrpReport);
        this.Session.Add("ReportType", 0);  
        string url = "'Default.aspx'";
        string script = "<script language='JavaScript' type='text/javascript'> window.open(" + url + ",\"Link\",\"toolbar=0,location=0,directories=0,status=0,menubar=0,scrollbars=1,resizable=1,width=800,height=600,left=10,top=10\");</script>";
        Type cstype = this.GetType();
        ClientScriptManager cs = Page.ClientScript;
        cs.RegisterStartupScript(cstype, "OpenWindow", script);            
    }

    /// <summary>
    /// Shows Stock Reconciliation in Excel
    /// </summary>
    /// <param name="sender">object</param>
    /// <param name="e">EventArgs</param>
    protected void btnViewExcel_Click(object sender, EventArgs e)
    {
        string PrincipalIDs = null;
        string PrincipalNames = "";
        foreach (ListItem li in cblPrincipal.Items)
        {
            if (li.Selected)
            {
                PrincipalIDs += li.Value + ",";
                PrincipalNames += li.Text + ", ";
            }
        }

        PrincipalIDs = PrincipalIDs.Substring(0, PrincipalIDs.Length - 1);
        PrincipalNames = PrincipalNames.Substring(0, PrincipalNames.Length - 1);

        DocumentPrintController mController = new DocumentPrintController();
        RptInventoryController RptInventoryCtl = new RptInventoryController();
        SAMSBusinessLayer.Reports.StockReConsilation CrpReport = new SAMSBusinessLayer.Reports.StockReConsilation();
        DataTable dt = mController.SelectReportTitle(int.Parse(drpDistributor.SelectedValue.ToString()));
        DataSet ds = RptInventoryCtl.SelectPrincipalStockReconcilation(int.Parse(drpDistributor.SelectedValue.ToString()), PrincipalIDs, DateTime.Parse(txtStartDate.Text), DateTime.Parse(txtEndDate.Text), int.Parse(this.Session["UserId"].ToString()),ddlType.SelectedIndex,Convert.ToInt32(rblRate.SelectedValue));
        CrpReport.SetDataSource(ds);
        CrpReport.Refresh();


        CrpReport.SetParameterValue("division", drpDistributor.SelectedItem.Text);
        CrpReport.SetParameterValue("Principal", PrincipalNames);
        CrpReport.SetParameterValue("fromdate", txtStartDate.Text);
        CrpReport.SetParameterValue("todate", txtEndDate.Text);
        CrpReport.SetParameterValue("CompanyName", dt.Rows[0]["COMPANY_NAME"].ToString());
        CrpReport.SetParameterValue("Price", rblRate.SelectedItem.Text);
        CrpReport.SetParameterValue("ReportType", "Stock Reconciliation Report ( " + ddlType.SelectedItem.Text + " )");

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
}