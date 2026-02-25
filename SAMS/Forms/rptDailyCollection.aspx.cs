using System;
using System.Data;
using System.Web.UI;
using System.Web.UI.WebControls;
using SAMSBusinessLayer.Classes;
using SAMSCommon.Classes;
using CrystalDecisions.CrystalReports.Engine;
public partial class Forms_rptDailyCollection : System.Web.UI.Page
{

    CustomerDataController CustCtl = new CustomerDataController();

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack)
        {
            LoadDistributor();
            LoadCity();
            LoadArea();
            LoadChannelType();
            LoadData();
            Configuration.SystemCurrentDateTime = (DateTime)Session["CurrentWorkDate"];
            txtStartDate.Text = Configuration.SystemCurrentDateTime.ToString("dd-MMM-yyyy");
            txtEndDate.Text = Configuration.SystemCurrentDateTime.ToString("dd-MMM-yyyy");
            txtStartDate.Attributes.Add("readonly", "readonly");
            txtEndDate.Attributes.Add("readonly", "readonly");
        }
    }

    private void LoadDistributor()
    {
        DistributorController DController = new DistributorController();
        DataTable dt = DController.SelectDistributorInfo(Constants.IntNullValue, int.Parse(Session["UserId"].ToString()), int.Parse(Session["CompanyId"].ToString()));
        if (dt.Rows.Count > 0)
        {
            drpDistributor.Items.Add(new ListItem("All", Constants.IntNullValue.ToString()));
            clsWebFormUtil.FillDropDownList(drpDistributor, dt, 0, 2, false);
        }
    }
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
    private void LoadData()
    {
        DrpCustomer.Items.Clear();
        if (drpDistributor.Items.Count > 0 && ddlArea.Items.Count > 0)
        {
            CustomerDataController mController = new CustomerDataController();
            DataTable dt = mController.SelectPrincipalCustomer(int.Parse(drpDistributor.SelectedValue.ToString()), int.Parse(ddlArea.SelectedValue.ToString()), Constants.IntNullValue, Constants.IntNullValue);
            DrpCustomer.Items.Add(new ListItem("All", Constants.LongNullValue.ToString()));
            clsWebFormUtil.FillDropDownList(this.DrpCustomer, dt, 0, 4);
        }
        else
        {
            DrpCustomer.Items.Add(new ListItem("Customer Not Found", Constants.IntNullValue.ToString()));
        }
    }
    private void LoadCity()
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
    private void LoadChannelType()
    {
        SLASHCodesController mController = new SLASHCodesController();
        DataTable dt = mController.SelectSlashCodes(Constants.IntNullValue, null, Constants.CustomerChannelType, null, Constants.IntNullValue, bool.Parse("True"));
        ddlChannelType.Items.Add(new ListItem("All", Constants.IntNullValue.ToString()));
        clsWebFormUtil.FillDropDownList(ddlChannelType, dt, 0, 2);
    }
    protected void drpDistributor_SelectedIndexChanged(object sender, EventArgs e)
    {
        LoadCity();
        LoadArea();
        LoadData();
    }
    protected void ddlCity_SelectedIndexChanged(object sender, EventArgs e)
    {
        LoadData();
    }
    protected void ddlArea_SelectedIndexChanged(object sender, EventArgs e)
    {
        LoadData();
    }
    protected void rdbReportType_SelectedIndexChanged(object sender, EventArgs e)
    {
        if (rdbReportType.SelectedValue == "0")
        {
            reportType.Visible = false;
        }
        else
        {
            reportType.Visible = true;
        }
    }
    private void ShowReport(int p_Report_Type)
    {
        RptCustomerController RptCustomerCtl = new RptCustomerController();

        DataSet ds;
        string dsName = "";
        try
        {
            if (rdbReportType.SelectedValue == "0")
            {
                ds = RptCustomerCtl.CustomerCollectionSummary(int.Parse(drpDistributor.SelectedValue.ToString()), long.Parse(DrpCustomer.SelectedValue.ToString()),
                         DateTime.Parse(txtStartDate.Text + " 00:00:00"), DateTime.Parse(txtEndDate.Text + " 23:59:59"), Convert.ToInt32(drpReportType.SelectedValue)
                         , Constants.IntNullValue, int.Parse(ddlArea.SelectedValue), Convert.ToInt32(ddlChannelType.SelectedValue), Convert.ToInt32(ddlCity.SelectedValue), int.Parse(Session["UserId"].ToString()));

                dsName = "spDailyCollectionSummary";
            }
            else
            {
                ds = RptCustomerCtl.CustomerCollection(int.Parse(drpDistributor.SelectedValue.ToString()), long.Parse(DrpCustomer.SelectedValue.ToString()),
                          DateTime.Parse(txtStartDate.Text + " 00:00:00"), DateTime.Parse(txtEndDate.Text + " 23:59:59"), Convert.ToInt32(drpReportType.SelectedValue)
                          , Constants.IntNullValue, int.Parse(ddlArea.SelectedValue), Convert.ToInt32(ddlChannelType.SelectedValue), Convert.ToInt32(ddlCity.SelectedValue), int.Parse(Session["UserId"].ToString()));
                dsName = "spDailyCollection";
            }
            if (ds.Tables[dsName].Rows.Count > 0)
            {
                dvMsg.Visible = false;
                DocumentPrintController DPrint = new DocumentPrintController();
                DataTable dt = DPrint.SelectReportTitle(int.Parse(drpDistributor.SelectedValue.ToString()));

                ReportDocument CrpReport = new ReportDocument();

                if (rdbReportType.SelectedValue == "0")
                {
                    CrpReport = new SAMSBusinessLayer.Reports.CrpDailyCollectionSummary();
                   
                }
                else
                {
                 CrpReport = new SAMSBusinessLayer.Reports.CrpDailyCollection();
                }
                CrpReport.SetDataSource(ds);
                CrpReport.Refresh();

                CrpReport.SetParameterValue("Division", ddlCity.SelectedItem.Text);
                CrpReport.SetParameterValue("FromDate", DateTime.Parse(txtStartDate.Text));
                CrpReport.SetParameterValue("To_date", DateTime.Parse(txtEndDate.Text));
                CrpReport.SetParameterValue("Location", drpDistributor.SelectedItem.Text);
                CrpReport.SetParameterValue("Type", drpReportType.SelectedItem.Text);
                CrpReport.SetParameterValue("CompanyName", dt.Rows[0]["COMPANY_NAME"].ToString());
                CrpReport.SetParameterValue("ChannelType", ddlChannelType.SelectedItem.Text);

                Session.Add("CrpReport", CrpReport);
                Session.Add("ReportType", p_Report_Type);
                const string url = "'Default.aspx'";
                const string script = "<script language='JavaScript' type='text/javascript'> window.open(" + url + ",\"Link\",\"toolbar=0,location=0,directories=0,status=0,menubar=0,scrollbars=1,resizable=1,width=800,height=600,left=10,top=10\");</script>";
                Type cstype = GetType();
                ClientScriptManager cs = Page.ClientScript;
                cs.RegisterStartupScript(cstype, "OpenWindow", script);
            }
            else
            {
                dvMsg.Visible = true;

            }
        }
        catch (Exception ex)
        {

            dvMsg.Visible = true;
        }
    }

    protected void btnViewPDF_Click(object sender, EventArgs e)
    {
        ShowReport(0);
    }

    protected void btnViewExcel_Click(object sender, EventArgs e)
    {
        ShowReport(1);
    }
}