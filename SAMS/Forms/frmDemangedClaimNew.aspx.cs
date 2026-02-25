using System;
using System.Data;
using System.Web.UI;
using System.Web.UI.WebControls;
using SAMSBusinessLayer.Classes;
using SAMSCommon.Classes;

/// <summary>
/// Form To Add, Edit Customer Claim
/// </summary>
public partial class Forms_frmDemangedClaimNew : System.Web.UI.Page
{
    AccountHeadController AccountCtl = new AccountHeadController();
    DataControl dc = new DataControl();
    /// <summary>
    /// Page_Load Function Populates All Combos And Grid On The Page
    /// </summary>
    /// <param name="sender">object</param>
    /// <param name="e">EventArgs</param>
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack)
        {
            this.LoadDistributor();
            this.LoadClaimType();
            this.LoadAccountHead();
            this.CreatTable();
            this.LoadArea();
            this.LoadCustomer();
            this.LoadGrid();
            btnAddNew.Attributes.Add("onclick", "return ValidateForm();");
            ScriptManager.GetCurrent(Page).SetFocus(drpDistributor);
            lblRowId.Text = "-1";
            LoadData();
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
    /// Loads Claim Types To RadioButtonList
    /// </summary>
    private void LoadClaimType()
    {
        RbdClaimType.Items.Add(new ListItem("Debit Claim", Constants.DebitClaim.ToString()));
        RbdClaimType.Items.Add(new ListItem("Credit Claim", Constants.CreditClaim.ToString()));
        RbdClaimType.SelectedIndex = 0;         
    }
    
    /// <summary>
    /// Loads Account Heads To AccountHead Combo
    /// Modified by: Hazrat Ali
    /// 2012-Feb-16 10:40 AM
    /// Hard coded Account Heads as per Saddruddin Sb Instructions
    /// This is valid only for FDMPL and invalid for BDN and FDM
    /// Commited old code
    /// </summary>
    private void LoadAccountHead()
    {   
        DataTable dt = AccountCtl.SelectClaimHead(int.Parse(RbdClaimType.SelectedValue.ToString()));
        clsWebFormUtil.FillDropDownList(DrpAccountHead, dt, 0, 2, true);
    }
    
    /// <summary>
    /// Creates Datatable For Customer Claim Data
    /// </summary>
    private void CreatTable()
    {
        DataTable dtVoucher = new DataTable();
        dtVoucher.Columns.Add("Account_Head_Id", typeof(long));
        dtVoucher.Columns.Add("Account_Code", typeof(string));
        dtVoucher.Columns.Add("Account_Name", typeof(string));
        dtVoucher.Columns.Add("Debit", typeof(decimal));
        dtVoucher.Columns.Add("Credit", typeof(decimal));
        dtVoucher.Columns.Add("Remarks", typeof(string));
        this.Session.Add("dtVoucher", dtVoucher);
        GrdOrder.DataSource = dtVoucher;
        GrdOrder.DataBind();  

    }
    
    /// <summary>
    /// Loads Routes To Route Combo
    /// </summary>
    private void LoadArea()
    {
        DistributorAreaController mController = new DistributorAreaController();
        DataTable dt = mController.SelectDist_Area(Constants.LongNullValue, Constants.DateNullValue, Constants.DateNullValue, int.Parse(drpDistributor.SelectedValue.ToString()), Constants.IntNullValue, null, null);
        clsWebFormUtil.FillDropDownList(DrpRoute, dt, 0, 6, true);
        DrpRoute.Enabled = true;        
    }
    
    /// <summary>
    /// Loads Customers To Customer Combo
    /// </summary>
    private void LoadCustomer()
    {
        LedgerController LController = new LedgerController();
        if (drpDistributor.Items.Count > 0 && DrpRoute.Items.Count > 0)
        {
            CustomerDataController mController = new CustomerDataController();
           // DataTable dt = mController.SelectPrincipalCustomer(int.Parse(drpDistributor.SelectedValue.ToString()), int.Parse(DrpRoute.SelectedValue.ToString()), Constants.IntNullValue, Constants.IntNullValue);
           // clsWebFormUtil.FillDropDownList(this.DrpCustomer, dt, 0, 4, true);
            DataTable dtCredit = LController.SelectCreditPendingInvoice(int.Parse(drpDistributor.SelectedValue.ToString()), Constants.IntNullValue, Constants.LongNullValue,int.Parse(DrpRoute.SelectedValue));
            clsWebFormUtil.FillDropDownList(this.DrpCustomer, dtCredit, 0, 1, true);
        }
        else
        {
            DrpCustomer.Items.Clear();   
        }
    }
    
    /// <summary>
    /// Loads Customer Claims To Grid
    /// </summary>
    private void LoadGrid()
    {
        if (drpDistributor.Items.Count > 0)
        {
            LedgerController LController = new LedgerController();
            DataTable dt = LController.SelectClaimDetail(int.Parse(drpDistributor.SelectedValue.ToString()),int.Parse(RbdClaimType.SelectedValue.ToString()),
                DateTime.Parse(this.Session["CurrentWorkDate"].ToString()), DateTime.Parse(this.Session["CurrentWorkDate"].ToString()));
            GrdOrder.DataSource = dt;
            GrdOrder.DataBind();
        }
    }

    /// <summary>
    /// Loads Routes And Customers
    /// </summary>
    /// <param name="sender">object</param>
    /// <param name="e">EventArgs</param>
    protected void drpDistributor_SelectedIndexChanged(object sender, EventArgs e)
    {
        this.LoadArea();
        this.LoadCustomer();
        DrpCustomer_SelectedIndexChanged(null, null);
    }

    /// <summary>
    /// Loads Customers
    /// </summary>
    /// <param name="sender">object</param>
    /// <param name="e">EventArgs</param>
    protected void DrpRoute_SelectedIndexChanged(object sender, EventArgs e)
    {
        this.LoadCustomer();
        DrpCustomer_SelectedIndexChanged(null, null);
    }

    /// <summary>
    /// Deletes Customer Claim
    /// </summary>
    /// <param name="sender">object</param>
    /// <param name="e">GridViewEditEventArgs</param>
    protected void GrdOrder_RowDeleting(object sender, GridViewDeleteEventArgs e)
    {
        LedgerController LController = new LedgerController();
        DataControl dc = new DataControl();

        LController.DeleteWareHouseLedgernew(int.Parse(drpDistributor.SelectedValue.ToString()), int.Parse(dc.chkNull_0(GrdOrder.Rows[e.RowIndex].Cells[2].Text)),
        int.Parse(dc.chkNull_0(GrdOrder.Rows[e.RowIndex].Cells[6].Text)), int.Parse(dc.chkNull_0(GrdOrder.Rows[e.RowIndex].Cells[9].Text)), decimal.Parse(dc.chkNull_0(GrdOrder.Rows[e.RowIndex].Cells[7].Text)));
        this.LoadGrid();
        LoadData();
        
    }

    /// <summary>
    /// Saves Customer Claim
    /// </summary>
    /// <param name="sender">object</param>
    /// <param name="e">EventArgs</param>
    protected void btnAddNew_Click(object sender, EventArgs e)
    {
        LedgerController LController = new LedgerController();

        string MaxDocumentId = LController.SelectLedgerMaxDocumentId(Constants.Journal_Voucher, int.Parse(drpDistributor.SelectedValue.ToString()));
        CashRealization(MaxDocumentId);
        //if (RbdClaimType.SelectedValue == Constants.DebitClaim.ToString())
        //{
            
        //    LController.PostingCash_Bank_Account(Constants.Journal_Voucher, long.Parse(MaxDocumentId), long.Parse(DrpAccountHead.SelectedValue.ToString()), int.Parse(drpDistributor.SelectedValue.ToString()), 0, decimal.Parse(txtAmount.Text),
        //       DateTime.Parse(this.Session["CurrentWorkDate"].ToString()), txtRemarks.Text, DateTime.Now, int.Parse(DrpCustomer.SelectedValue.ToString()), 0,
        //        null, int.Parse(this.Session["UserId"].ToString()), Constants.LongNullValue,null, Constants.IntNullValue, null, Constants.DateNullValue, Constants.DebitClaim, "");
        //}
        //else
        //{
        //    LController.PostingCash_Bank_Account(Constants.Journal_Voucher, long.Parse(MaxDocumentId), long.Parse(DrpAccountHead.SelectedValue.ToString()), int.Parse(drpDistributor.SelectedValue.ToString()), decimal.Parse(txtAmount.Text), 0,
        //        DateTime.Parse(this.Session["CurrentWorkDate"].ToString()), txtRemarks.Text, DateTime.Now, int.Parse(DrpCustomer.SelectedValue.ToString()), 0,
        //         null, int.Parse(this.Session["UserId"].ToString()), Constants.LongNullValue,null, Constants.IntNullValue, null, Constants.DateNullValue, Constants.CreditClaim, "");            
        //}
        txtAmount.Text = "";
        txtRemarks.Text = ""; 
        this.LoadGrid();
        this.LoadData();
        if (RbdClaimType.SelectedValue == Constants.DebitClaim.ToString())
        {
            this.PrintVoucher(Convert.ToInt64(MaxDocumentId), Constants.Journal_Voucher, Constants.DebitClaim);
        }
        else
        {
            this.PrintVoucher(Convert.ToInt64(MaxDocumentId), Constants.Journal_Voucher, Constants.CreditClaim);
        }
    }

    /// <summary>
    /// Loads Account Heads And Claim Data
    /// </summary>
    /// <param name="sender">object</param>
    /// <param name="e">EventArgs</param>
    protected void RbdClaimType_SelectedIndexChanged(object sender, EventArgs e)
    {
        this.LoadAccountHead();
        this.LoadGrid();
    }

    /// <summary>
    /// Shows Vouchers in Crystal Report For Print Purpose
    /// </summary>
    /// <param name="VoucherNo">Voucher</param>
    private void PrintVoucher(long VoucherNo, int VoucherTypeID, int PaymentMode)
    {
        DocumentPrintController DPrint = new DocumentPrintController();
        ChequeEntryController CController = new ChequeEntryController();
        CrystalDecisions.CrystalReports.Engine.ReportDocument SubReport = new CrystalDecisions.CrystalReports.Engine.ReportDocument();
        SAMSBusinessLayer.Reports.CrpVoucherView2 CrpReport = new SAMSBusinessLayer.Reports.CrpVoucherView2();
        SubReport = CrpReport.OpenSubreport("srInvoiceDetail");


        DataSet ds = null;
        DataTable dt = DPrint.SelectReportTitle(int.Parse(drpDistributor.SelectedValue.ToString()));
        ds = CController.GetPaymentVoucher(Convert.ToInt64(DrpCustomer.SelectedValue), Convert.ToInt32(drpDistributor.SelectedValue), Convert.ToDateTime(Session["CurrentWorkDate"]), Convert.ToDateTime(Session["CurrentWorkDate"]), VoucherNo, VoucherTypeID, PaymentMode);
        CrpReport.SetDataSource(ds);
        SubReport.SetDataSource(ds);
        CrpReport.Refresh();

        CrpReport.SetParameterValue("Company_Name", dt.Rows[0]["COMPANY_NAME"].ToString());
        CrpReport.SetParameterValue("DISTRIBUTOR_NAME", dt.Rows[0]["DISTRIBUTOR_NAME"].ToString());
        CrpReport.SetParameterValue("PrintedBy", Session["UserName2"].ToString());
        this.Session.Add("CrpReport", CrpReport);
        this.Session.Add("ReportType", 0);
        string url = "'Default.aspx'";
        string script = "<script language='JavaScript' type='text/javascript'> window.open(" + url + ",\"Link\",\"toolbar=0,location=0,directories=0,status=0,menubar=0,scrollbars=1,resizable=1,width=800,height=600,left=10,top=10\");</script>";
        Type cstype = this.GetType();
        ClientScriptManager cs = Page.ClientScript;
        cs.RegisterStartupScript(cstype, "OpenWindow", script);
    }

    private void LoadData()
    {
        SelectCreditInvoice();
    }

    protected void DrpCustomer_SelectedIndexChanged(object sender, EventArgs e)
    {
        SelectCreditInvoice();
    }
    private void SelectCreditInvoice()
    {
        LedgerController LController = new LedgerController();
        GrdCredit.DataSource = null;
        GrdCredit.DataBind();
        if (DrpCustomer.Items.Count > 0)
        {
            DataTable dtCredit = LController.SelectCreditPendingInvoice(int.Parse(drpDistributor.SelectedValue.ToString()), Constants.IntNullValue, long.Parse(DrpCustomer.SelectedValue.ToString()), 0);
            GrdCredit.DataSource = dtCredit;
            GrdCredit.DataBind();
        }
    }

    private void CashRealization(string MaxDocumentID)
    {
        LedgerController LController = new LedgerController();
        if (GrdCredit.Rows.Count > 0)
        {
           // string MaxDocumentID = LController.SelectLedgerMaxDocumentId(Constants.Cash_Voucher, int.Parse(drpDistributor.SelectedValue.ToString()));
            decimal OfferAmount = decimal.Parse(txtAmount.Text);

            DataTable dtCreditSKU = LController.SelectCreditPendingInvoice(int.Parse(drpDistributor.SelectedValue.ToString()), Constants.IntNullValue, long.Parse(DrpCustomer.SelectedValue.ToString()), -1);

            foreach (GridViewRow dr in GrdCredit.Rows)
            {
                CheckBox chRelized = (CheckBox)dr.Cells[0].FindControl("ChbIsAssigned");
                if (chRelized.Checked == true)
                {
                    if (decimal.Parse(dr.Cells[3].Text) > OfferAmount)
                    {
                        DataRow[] foundrows = dtCreditSKU.Select("SALE_INVOICE_ID =" + GrdCredit.DataKeys[dr.RowIndex].Values["SALE_INVOICE_ID"].ToString());
                        if (foundrows.Length > 0)
                        {
                            foreach (DataRow drSKU in foundrows)
                            {
                                decimal SKUPer = OfferAmount * Convert.ToDecimal(drSKU["CURRENT_CREDIT_AMOUNT"]) / decimal.Parse(dr.Cells[3].Text);
                                if (SKUPer > 0)
                                {
                                    if (RbdClaimType.SelectedValue == Constants.DebitClaim.ToString())
                                    {
                                        LController.PostingCash_Bank_AccountNew(Constants.Journal_Voucher, long.Parse(MaxDocumentID), 107, int.Parse(drpDistributor.SelectedValue.ToString()), SKUPer,0 ,
                                    DateTime.Parse(this.Session["CurrentWorkDate"].ToString()), txtRemarks.Text, DateTime.Now, int.Parse(DrpCustomer.SelectedValue.ToString()), 0,
                                   "", int.Parse(this.Session["UserId"].ToString()), Convert.ToInt64(GrdCredit.DataKeys[dr.RowIndex].Values["SALE_INVOICE_ID"]), dr.Cells[1].Text, Constants.Document_Invoice,null, Constants.DateNullValue, 222, null, Convert.ToInt32(dc.chkNull_0(drSKU["SKU_ID"].ToString())));

                                        LController.PostingCash_Bank_AccountNew(Constants.Journal_Voucher, long.Parse(MaxDocumentID), long.Parse(DrpAccountHead.SelectedValue.ToString()), int.Parse(drpDistributor.SelectedValue.ToString()), 0, SKUPer,
                                        DateTime.Parse(this.Session["CurrentWorkDate"].ToString()), txtRemarks.Text, DateTime.Now, int.Parse(DrpCustomer.SelectedValue.ToString()), 0,
                                      "", int.Parse(this.Session["UserId"].ToString()), Convert.ToInt64(GrdCredit.DataKeys[dr.RowIndex].Values["SALE_INVOICE_ID"]), dr.Cells[1].Text, Constants.Document_Invoice, null, Constants.DateNullValue, Constants.DebitClaim, null, Convert.ToInt32(dc.chkNull_0(drSKU["SKU_ID"].ToString())));
                                    }
                                    else
                                    {
                                        LController.PostingCash_Bank_AccountNew(Constants.Journal_Voucher, long.Parse(MaxDocumentID),107, int.Parse(drpDistributor.SelectedValue.ToString()), 0, SKUPer,
                                   DateTime.Parse(this.Session["CurrentWorkDate"].ToString()), txtRemarks.Text, DateTime.Now, int.Parse(DrpCustomer.SelectedValue.ToString()), 0,
                                  "", int.Parse(this.Session["UserId"].ToString()), Convert.ToInt64(GrdCredit.DataKeys[dr.RowIndex].Values["SALE_INVOICE_ID"]), dr.Cells[1].Text, Constants.Document_Invoice, null, Constants.DateNullValue, 222, null, Convert.ToInt32(dc.chkNull_0(drSKU["SKU_ID"].ToString())));

                                        LController.PostingCash_Bank_AccountNew(Constants.Journal_Voucher, long.Parse(MaxDocumentID), long.Parse(DrpAccountHead.SelectedValue.ToString()), int.Parse(drpDistributor.SelectedValue.ToString()), SKUPer, 0,
                                        DateTime.Parse(this.Session["CurrentWorkDate"].ToString()), txtRemarks.Text, DateTime.Now, int.Parse(DrpCustomer.SelectedValue.ToString()), 0,
                                      "", int.Parse(this.Session["UserId"].ToString()), Convert.ToInt64(GrdCredit.DataKeys[dr.RowIndex].Values["SALE_INVOICE_ID"]), dr.Cells[1].Text, Constants.Document_Invoice, null, Constants.DateNullValue, Constants.CreditClaim, null, Convert.ToInt32(dc.chkNull_0(drSKU["SKU_ID"].ToString())));

                                    }
                                    LController.UpdateCreditInvoice(Constants.LongNullValue, Convert.ToInt64(GrdCredit.DataKeys[dr.RowIndex].Values["SALE_INVOICE_ID"]), SKUPer, Convert.ToInt32(dc.chkNull_0(drSKU["SKU_ID"].ToString())), Convert.ToInt32(Session["UserID"]));
                                }
                            }
                        }

                        OfferAmount = decimal.Parse(dr.Cells[3].Text) - OfferAmount;
                        break;
                    }
                    else
                    {
                        DataRow[] foundrows = dtCreditSKU.Select("SALE_INVOICE_ID =" + GrdCredit.DataKeys[dr.RowIndex].Values["SALE_INVOICE_ID"].ToString());
                        if (foundrows.Length > 0)
                        {
                            foreach (DataRow drSKU in foundrows)
                            {
                                if (Convert.ToDecimal(drSKU["CURRENT_CREDIT_AMOUNT"]) > 0)
                                {
                                    if (RbdClaimType.SelectedValue == Constants.DebitClaim.ToString())
                                    {
                                        LController.PostingCash_Bank_AccountNew(Constants.Journal_Voucher, long.Parse(MaxDocumentID), 107, int.Parse(drpDistributor.SelectedValue.ToString()), 0, Convert.ToDecimal(drSKU["CURRENT_CREDIT_AMOUNT"]),
                                    DateTime.Parse(this.Session["CurrentWorkDate"].ToString()), txtRemarks.Text, DateTime.Now, int.Parse(DrpCustomer.SelectedValue.ToString()), 0,
                                    null, int.Parse(this.Session["UserId"].ToString()), Convert.ToInt64(GrdCredit.DataKeys[dr.RowIndex].Values["SALE_INVOICE_ID"]), dr.Cells[1].Text, Constants.Document_Invoice, null, Constants.DateNullValue, 222, null, Convert.ToInt32(dc.chkNull_0(drSKU["SKU_ID"].ToString())));

                                        LController.PostingCash_Bank_AccountNew(Constants.Journal_Voucher, long.Parse(MaxDocumentID), long.Parse(DrpAccountHead.SelectedValue.ToString()), int.Parse(drpDistributor.SelectedValue.ToString()), Convert.ToDecimal(drSKU["CURRENT_CREDIT_AMOUNT"]), 0,
                                        DateTime.Parse(this.Session["CurrentWorkDate"].ToString()), txtRemarks.Text, DateTime.Now, int.Parse(DrpCustomer.SelectedValue.ToString()), 0,
                                       null, int.Parse(this.Session["UserId"].ToString()), Convert.ToInt64(GrdCredit.DataKeys[dr.RowIndex].Values["SALE_INVOICE_ID"]), dr.Cells[1].Text, Constants.Document_Invoice, null, Constants.DateNullValue, Constants.DebitClaim, null, Convert.ToInt32(dc.chkNull_0(drSKU["SKU_ID"].ToString())));

                                        OfferAmount = OfferAmount - Convert.ToDecimal(drSKU["CURRENT_CREDIT_AMOUNT"]);
                                        LController.UpdateCreditInvoice(Constants.LongNullValue, Convert.ToInt64(GrdCredit.DataKeys[dr.RowIndex].Values["SALE_INVOICE_ID"]), Convert.ToDecimal(drSKU["CURRENT_CREDIT_AMOUNT"]), Convert.ToInt32(dc.chkNull_0(drSKU["SKU_ID"].ToString())), Convert.ToInt32(Session["UserID"]));
                                    }
                                    else
                                    {
                                        LController.PostingCash_Bank_AccountNew(Constants.Journal_Voucher, long.Parse(MaxDocumentID),107, int.Parse(drpDistributor.SelectedValue.ToString()), 0, Convert.ToDecimal(drSKU["CURRENT_CREDIT_AMOUNT"]),
                                       DateTime.Parse(this.Session["CurrentWorkDate"].ToString()), txtRemarks.Text, DateTime.Now, int.Parse(DrpCustomer.SelectedValue.ToString()), 0,
                                       null, int.Parse(this.Session["UserId"].ToString()), Convert.ToInt64(GrdCredit.DataKeys[dr.RowIndex].Values["SALE_INVOICE_ID"]), dr.Cells[1].Text, Constants.Document_Invoice, null, Constants.DateNullValue, 222, null, Convert.ToInt32(dc.chkNull_0(drSKU["SKU_ID"].ToString())));

                                        LController.PostingCash_Bank_AccountNew(Constants.Journal_Voucher, long.Parse(MaxDocumentID), long.Parse(DrpAccountHead.SelectedValue.ToString()), int.Parse(drpDistributor.SelectedValue.ToString()), Convert.ToDecimal(drSKU["CURRENT_CREDIT_AMOUNT"]), 0,
                                        DateTime.Parse(this.Session["CurrentWorkDate"].ToString()), txtRemarks.Text, DateTime.Now, int.Parse(DrpCustomer.SelectedValue.ToString()), 0,
                                       null, int.Parse(this.Session["UserId"].ToString()), Convert.ToInt64(GrdCredit.DataKeys[dr.RowIndex].Values["SALE_INVOICE_ID"]), dr.Cells[1].Text, Constants.Document_Invoice, null, Constants.DateNullValue, Constants.CreditClaim, null, Convert.ToInt32(dc.chkNull_0(drSKU["SKU_ID"].ToString())));

                                        OfferAmount = OfferAmount - Convert.ToDecimal(drSKU["CURRENT_CREDIT_AMOUNT"]);
                                        LController.UpdateCreditInvoice(Constants.LongNullValue, Convert.ToInt64(GrdCredit.DataKeys[dr.RowIndex].Values["SALE_INVOICE_ID"]), Convert.ToDecimal(drSKU["CURRENT_CREDIT_AMOUNT"]), Convert.ToInt32(dc.chkNull_0(drSKU["SKU_ID"].ToString())), Convert.ToInt32(Session["UserID"]));

                                    }
                                }
                            }
                        }
                    }
                }
            }
          //  this.PrintVoucher(Convert.ToInt64(MaxDocumentID), Constants.Cash_Voucher, Constants.CashPayment);
        }
    }
}
