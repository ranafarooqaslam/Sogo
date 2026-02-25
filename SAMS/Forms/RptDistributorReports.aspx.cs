using System;
using System.Data;
using System.Web.UI;
using System.Web.UI.WebControls;
using SAMSBusinessLayer.Classes;
using SAMSCommon.Classes;

/// <summary>
/// Form For Sales & Closing Stock Report
/// </summary>
public partial class Forms_RptDistributorReports : System.Web.UI.Page
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
            this.LoadAssingned();
            this.LoadPrincipal();
            this.LoadCategory();
            SAMSCommon.Classes.Configuration.SystemCurrentDateTime = (DateTime)this.Session["CurrentWorkDate"];
            txtStartDate.Text = SAMSCommon.Classes.Configuration.SystemCurrentDateTime.ToString("dd-MMM-yyyy");
            txtEndDate.Text = SAMSCommon.Classes.Configuration.SystemCurrentDateTime.ToString("dd-MMM-yyyy");
        }
    }

   
    private void DistributorType()
    {
        DistributorController dController = new DistributorController();
        DataTable dt = dController.SelectDistributorTypeInfo(Constants.IntNullValue);
        clsWebFormUtil.FillDropDownList(ddDistributorType, dt, 0, 2);
    }

    /// <summary>
    /// Loads User Assigned Locations To Location Combo
    /// </summary>
    private void LoadAssingned()
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

        chbCategory.Items.Clear();
        SkuHierarchyController mController = new SkuHierarchyController();
        DataTable dt = mController.SelectSKUCategory(Convert.ToInt32(DrpPrincipal.SelectedValue), Constants.SKUCategory);
       
        clsWebFormUtil.FillListBox(this.chbCategory, dt, "SKU_HIE_ID", "SKU_HIE_NAME");

    }


    /// <summary>
    /// Shows Sales & Closing Stock in PDF
    /// </summary>
    /// <param name="sender">object</param>
    /// <param name="e">EventArgs</param>
    protected void btnViewPDF_Click(object sender, EventArgs e)
    {
        ShowReport(0);
    }

    /// <summary>
    /// Loads Locations
    /// </summary>
    /// <param name="sender">object</param>
    /// <param name="e">EventArgs</param>
    protected void ddDistributorType_SelectedIndexChanged(object sender, EventArgs e)
    {
        this.LoadAssingned();
    }

    /// <summary>
    /// Shows Sales & Closing Stock in Excel
    /// </summary>
    /// <param name="sender">object</param>
    /// <param name="e">EventArgs</param>
    protected void btnViewExcel_Click(object sender, EventArgs e)
    {
        ShowReport(1);
    }

    private void ShowReport(int ReportType)
    {
        int TypeID = 0;
        if (cbQuantity.Checked && cbValue.Checked)
        {
            TypeID = 3;
        }
        else if (cbValue.Checked)
        {
            TypeID = 2;
        }
        else if (cbQuantity.Checked)
        {
            TypeID = 1;
        }
        if (TypeID > 0)
        {

            #region Category
            string Categoru_IDs = null;
            string Categorys = null;

            for (int i = 0; i < chbCategory.Items.Count; i++)
            {
                if (chbCategory.Items[i].Selected == true)
                {
                    Categoru_IDs += chbCategory.Items[i].Value.ToString() + ",";
                    Categorys += chbCategory.Items[i].Text.ToString() + ",";
                }
            }
            if (chbCategory == null)
            {
                ScriptManager.RegisterStartupScript(this, GetType(), "msg", "alert('Plz Select AtLeast One Category.');", true);
                return;
            }
            #endregion
            DocumentPrintController mDocumentPrntControl = new DocumentPrintController();
            RptSaleController RptSaleCtl = new RptSaleController();
            DataSet ds = RptSaleCtl.GetRegionSaleDetail(int.Parse(this.ddDistributorType.SelectedItem.Value), int.Parse(DrpPrincipal.SelectedValue.ToString()), Constants.IntNullValue, int.Parse(drpDistributor.SelectedValue.ToString()), DateTime.Parse(this.txtStartDate.Text), DateTime.Parse(this.txtEndDate.Text), Constants.IntNullValue, DrpReportType.SelectedIndex, TypeID, int.Parse(this.Session["UserId"].ToString()), Categoru_IDs.ToString());
            DataTable dt = mDocumentPrntControl.SelectReportTitle(int.Parse(drpDistributor.SelectedValue.ToString()));

            CrystalDecisions.CrystalReports.Engine.ReportDocument CrpReport = new CrystalDecisions.CrystalReports.Engine.ReportDocument();
            CrpReport = new SAMSBusinessLayer.Reports.RegionWiseSaleReport();

            CrpReport.SetDataSource(ds);
            CrpReport.Refresh();
            CrpReport.SetParameterValue("fromDate", txtStartDate.Text);
            CrpReport.SetParameterValue("todate", txtEndDate.Text);
            CrpReport.SetParameterValue("ReportTitle", "Daily " + DrpReportType.SelectedItem.Text);
            CrpReport.SetParameterValue("CompanyName", dt.Rows[0]["COMPANY_NAME"].ToString());
            this.Session.Add("CrpReport", CrpReport);
            this.Session.Add("ReportType", ReportType);
            string url = "'Default.aspx'";
            string script = "<script language='JavaScript' type='text/javascript'> window.open(" + url + ",\"Link\",\"toolbar=0,location=0,directories=0,status=0,menubar=0,scrollbars=1,resizable=1,width=800,height=600,left=10,top=10\");</script>";
            Type cstype = this.GetType();
            ClientScriptManager cs = Page.ClientScript;
            cs.RegisterStartupScript(cstype, "OpenWindow", script);
        }
    }

    protected void DrpPrincipal_SelectedIndexChanged(object sender, EventArgs e)
    {
        LoadCategory();
    }
}
