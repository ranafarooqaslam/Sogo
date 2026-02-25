using System;
using System.Data;
using System.Web.UI;
using System.Web.UI.WebControls;
using SAMSBusinessLayer.Classes;
using SAMSCommon.Classes;

/// <summary>
/// From To Add, Edit Customer
/// </summary>
public partial class Forms_frmDistributorCustomer : System.Web.UI.Page
{
    DataControl Dc = new DataControl();

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
            this.LoadTown();
            this.LoadRoute();
            this.LoadMarket();
            this.LoadChannelType();
            this.LoadBusinessType();
            this.LoadVolumeType();
            btnSave.Attributes.Add("onclick", "return ValidateForm()");
            btnSearch.Attributes.Add("onclick", "return SearchRecord()");
            SAMSCommon.Classes.Configuration.SystemCurrentDateTime = (DateTime)this.Session["CurrentWorkDate"];
            txtRegdate.Text = SAMSCommon.Classes.Configuration.SystemCurrentDateTime.ToString("dd-MMM-yyyy");
        }
    }

    /// <summary>
    /// Loads Locations To Location Combo
    /// </summary>
    private void LoadDistributor()
    {
        DistributorController mController = new DistributorController();
        DataTable dt = mController.SelectDistributorInfo(Constants.IntNullValue, int.Parse(this.Session["UserId"].ToString()), int.Parse(this.Session["CompanyId"].ToString()));
        clsWebFormUtil.FillDropDownList(DrpDistributor, dt, 0, 2, true);
    }

    /// <summary>
    /// Loads Towns To Town Combo, Routes To Routes Comb And Markets To Market Combo
    /// </summary>
    /// <param name="sender">object</param>
    /// <param name="e">EventArgs</param>
    protected void DrpDistributor_SelectedIndexChanged(object sender, EventArgs e)
    {
        Grid_users.EditIndex = -1;
        this.LoadTown();
        this.LoadRoute();
        this.LoadMarket();
        this.SetTableSorter();
    }

    /// <summary>
    /// Loads Towns To Town Combo
    /// </summary>
    protected void LoadTown()
    {
        if (DrpDistributor.Items.Count > 0)
        {
            GeoHierarchyController gController = new GeoHierarchyController();
            DataTable dt = gController.SelectGeoHierarchy(int.Parse(DrpDistributor.SelectedValue.ToString()));
            clsWebFormUtil.FillDropDownList(DrpTown, dt, 0, 1, true);
        }
    }

    /// <summary>
    /// Loads Routes To Routes Comb And Markets To Market Combo
    /// </summary>
    /// <param name="sender">object</param>
    /// <param name="e">EventArgs</param>
    protected void DrpTown_SelectedIndexChanged(object sender, EventArgs e)
    {
        Grid_users.EditIndex = -1;
        this.LoadRoute();
        this.LoadMarket();
        this.SetTableSorter();
    }

    /// <summary>
    /// Loads Routes To Route Combo
    /// </summary>
    private void LoadRoute()
    {
        if (DrpDistributor.Items.Count > 0 && DrpTown.Items.Count > 0)
        {
            DistributorAreaController mController = new DistributorAreaController();
            DataTable dt = mController.SelectDist_Area(Constants.LongNullValue, Constants.DateNullValue, Constants.DateNullValue, int.Parse(DrpDistributor.SelectedValue.ToString()), int.Parse(DrpTown.SelectedValue.ToString()), null, null);
            clsWebFormUtil.FillDropDownList(DrpRoute, dt, 0, 6, true);
        }
    }

    /// <summary>
    /// Loads Markets To Market Combo
    /// </summary>
    /// <param name="sender">object</param>
    /// <param name="e">EventArgs</param>
    protected void DrpRoute_SelectedIndexChanged(object sender, EventArgs e)
    {
        Grid_users.EditIndex = -1;
        this.LoadMarket();
        this.SetTableSorter();
    }

    /// <summary>
    /// Loads Markets To Market Combo
    /// </summary>
    private void LoadMarket()
    {
        if (DrpDistributor.Items.Count > 0 && DrpTown.Items.Count > 0 && DrpRoute.Items.Count > 0)
        {
            DistributorRouteController gController = new DistributorRouteController();
            DataTable dt = gController.SelectDistributorRoute(Constants.LongNullValue, int.Parse(DrpDistributor.SelectedValue.ToString()), int.Parse(DrpTown.SelectedValue.ToString()), long.Parse(DrpRoute.SelectedValue.ToString()));
            clsWebFormUtil.FillDropDownList(DrpMarket, dt, 0, 8, true);
        }
        else
        {
            DrpMarket.Items.Clear();
        }
    }

    /// <summary>
    /// Loads Channel Types To Channel Type Combo
    /// </summary>
    private void LoadChannelType()
    {
        SLASHCodesController mController = new SLASHCodesController();
        DataTable dt = mController.SelectSlashCodes(Constants.IntNullValue, null, Constants.CustomerChannelType, null, Constants.IntNullValue, bool.Parse("True"));
        clsWebFormUtil.FillDropDownList(drpChannelType, dt, 0, 2, true);
    }

    /// <summary>
    /// Loads Business Types To Business Type Combo
    /// </summary>
    private void LoadBusinessType()
    {
        SLASHCodesController mController = new SLASHCodesController();
        DataTable dt = mController.SelectSlashCodes(Constants.IntNullValue, null, Constants.CustomerTypeBusiness, null, Constants.IntNullValue, bool.Parse("True"));
        clsWebFormUtil.FillDropDownList(DrpBusinessType, dt, 0, 2, true);
    }

    /// <summary>
    /// Loads Promotion Classess To Promotion Class Combo
    /// </summary>
    private void LoadVolumeType()
    {
        SLASHCodesController mController = new SLASHCodesController();
        DataTable dt = mController.SelectSlashCodes(Constants.IntNullValue, null, Constants.CustomerVolumeClassType, null, Constants.IntNullValue, bool.Parse("True"));
        clsWebFormUtil.FillDropDownList(DrpVolumeClass, dt, 0, 2, true);
        this.DrpVolumeClass.SelectedValue = "88";
    }

    /// <summary>
    /// Loads Customers To Customer Grid
    /// </summary>
    private void LoadCustomer()
    {
        if (DrpDistributor.Items.Count > 0 && DrpTown.Items.Count > 0 && DrpRoute.Items.Count > 0 && DrpMarket.Items.Count > 0)
        {
            CustomerDataController mController = new CustomerDataController();
            DataTable dt = mController.UspSelectCustomer(int.Parse(DrpDistributor.SelectedValue.ToString()), ddSearchType.SelectedValue.ToString(), txtSeach.Text);
            this.Grid_users.DataSource = dt;
            this.Grid_users.DataBind();
        }
    }

    /// <summary>
    /// Sets Customer Data For Edit. This Function Runs When An Existing Customer Needs To Be Edited
    /// </summary>
    /// <param name="sender">object</param>
    /// <param name="e">GridViewEditEventArgs</param>
    protected void Grid_users_RowEditing(object sender, GridViewEditEventArgs e)
    {
        Grid_users.EditIndex = -1;
        this.Session.Add("CustomerId", long.Parse(Grid_users.Rows[e.NewEditIndex].Cells[0].Text));
        DrpDistributor.SelectedValue = Grid_users.Rows[e.NewEditIndex].Cells[1].Text;
        DrpBusinessType.SelectedValue = Grid_users.Rows[e.NewEditIndex].Cells[2].Text;
        DrpVolumeClass.SelectedValue = Grid_users.Rows[e.NewEditIndex].Cells[3].Text;
        drpChannelType.SelectedValue = Grid_users.Rows[e.NewEditIndex].Cells[4].Text;
        this.LoadTown();
        DrpTown.SelectedValue = Grid_users.Rows[e.NewEditIndex].Cells[5].Text;
        this.LoadRoute();
        DrpRoute.SelectedValue = Grid_users.Rows[e.NewEditIndex].Cells[6].Text;
        this.LoadMarket();
        DrpMarket.SelectedValue = Grid_users.Rows[e.NewEditIndex].Cells[7].Text;
        txtCustomerName.Text = Grid_users.Rows[e.NewEditIndex].Cells[9].Text.Replace("amp;", "");
        txtContactPerson.Text = Grid_users.Rows[e.NewEditIndex].Cells[10].Text.Replace("&nbsp;", "");
        txtPhoneNo.Text = Grid_users.Rows[e.NewEditIndex].Cells[11].Text.Replace("&nbsp;", "");
        txtAddress.Text = Grid_users.Rows[e.NewEditIndex].Cells[13].Text.Replace("&nbsp;", "");
        txtIsRegister.Text = Grid_users.Rows[e.NewEditIndex].Cells[14].Text.Replace("&nbsp;", "");
        if (Grid_users.Rows[e.NewEditIndex].Cells[14].Text.Trim() == "&nbsp;")
        {
            txtIsRegister.Text = "";
            ChbIsRegister.Checked = false;
        }
        else
        {
            ChbIsRegister.Checked = true;
            txtIsRegister.Text = Grid_users.Rows[e.NewEditIndex].Cells[14].Text;
        }
        chkIsActive.Checked = bool.Parse(Grid_users.Rows[e.NewEditIndex].Cells[19].Text);
        txtRegdate.Text = Grid_users.Rows[e.NewEditIndex].Cells[20].Text.Replace("&nbsp;", "");
        txtInvoiceCount.Text = Grid_users.Rows[e.NewEditIndex].Cells[24].Text;
        txtCreditAmount.Text = Grid_users.Rows[e.NewEditIndex].Cells[25].Text;
        txtCreditDays.Text = Grid_users.Rows[e.NewEditIndex].Cells[26].Text;
        txtEmail.Text = Grid_users.Rows[e.NewEditIndex].Cells[12].Text.Replace("&nbsp;", "");
        txtTelNo.Text = Grid_users.Rows[e.NewEditIndex].Cells[27].Text.Replace("&nbsp;", "");
        txtTransporter.Text = Grid_users.Rows[e.NewEditIndex].Cells[28].Text.Replace("&nbsp;", "");
        txtReference.Text = Grid_users.Rows[e.NewEditIndex].Cells[29].Text.Replace("&nbsp;", "");
        txtCustomerPolicy.Text = Grid_users.Rows[e.NewEditIndex].Cells[30].Text.Replace("&nbsp;", "");
        btnSave.Text = "Update";
        this.SetTableSorter();
    }

    /// <summary>
    /// Sets PageIndex Of Customer Grid
    /// </summary>
    /// <param name="sender">object</param>
    /// <param name="e">GridViewPageEventArgs</param>
    protected void Grid_users_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        Grid_users.EditIndex = -1;
        Grid_users.PageIndex = e.NewPageIndex;
        this.LoadCustomer();
        this.SetTableSorter();
    }

    /// <summary>
    /// Enables GST No TextBox
    /// </summary>
    /// <param name="sender">object</param>
    /// <param name="e">EventArgs</param>
    protected void ChbIsRegister_CheckedChanged(object sender, EventArgs e)
    {
        Grid_users.EditIndex = -1;
        if (ChbIsRegister.Checked == true)
        {
            txtIsRegister.Text = "";
            txtIsRegister.Enabled = true;
        }
        else
        {
            txtIsRegister.Text = "";
            txtIsRegister.Enabled = false;
        }
        this.SetTableSorter();
    }

    /// <summary>
    /// Save Or Updates a Customer
    /// </summary>
    /// <param name="sender">object</param>
    /// <param name="e">EventArgs</param>
    protected void btnSave_Click(object sender, EventArgs e)
    {
        CustomerDataController mController = new CustomerDataController();
        Grid_users.EditIndex = -1;
        if (btnSave.Text == "Save")
        {
            SETTINGS_TABLE_Controller mSettingsTableControl = new SETTINGS_TABLE_Controller();
            DataTable dtSettingsTable = mSettingsTableControl.Select_SETTINGS_TABLE("CUSTOMER", "CUSTOMER_ID", int.Parse(DrpDistributor.SelectedValue.ToString()));

            if (dtSettingsTable.Rows.Count > 0)
            {
                long CustomerId = long.Parse(dtSettingsTable.Rows[0]["Value"].ToString()) + 1;
                string StrCode = "";


                if (CustomerId.ToString().Length == 1)
                {
                    StrCode = "OT0000" + CustomerId.ToString();
                }
                else if (CustomerId.ToString().Length == 2)
                {
                    StrCode = "OT000" + CustomerId.ToString();
                }
                else if (CustomerId.ToString().Length == 3)
                {
                    StrCode = "OT00" + CustomerId.ToString();
                }
                else if (CustomerId.ToString().Length == 4)
                {
                    StrCode = "OT0" + CustomerId.ToString();
                }
                else if (CustomerId.ToString().Length == 5)
                {
                    StrCode = "OT" + CustomerId.ToString();
                }
                //Used CNIC column for Tel # and NTN for Transporter
                mController.InsertCustomer(CustomerId, ChbIsRegister.Checked, chkIsActive.Checked, int.Parse(drpChannelType.SelectedValue.ToString()), int.Parse(DrpVolumeClass.SelectedValue.ToString()),
                int.Parse(DrpBusinessType.SelectedValue.ToString()), int.Parse(DrpRoute.SelectedValue.ToString()), int.Parse(DrpMarket.SelectedValue.ToString()), int.Parse(DrpTown.SelectedValue.ToString()),
                int.Parse(DrpDistributor.SelectedValue.ToString()), txtIsRegister.Text, txtContactPerson.Text, txtPhoneNo.Text, txtEmail.Text, StrCode, txtCustomerName.Text, txtAddress.Text,
                DateTime.Parse(txtRegdate.Text), 1, 1, txtTelNo.Text, txtTransporter.Text, Convert.ToDecimal(Dc.chkNull_0(txtCreditAmount.Text)), Convert.ToInt32(Dc.chkNull_0(txtInvoiceCount.Text)),
                Convert.ToInt32(Dc.chkNull_0(txtCreditDays.Text)), txtReference.Text, txtCustomerPolicy.Text);
                this.Session.Add("CustomerId", CustomerId);
            }
        }
        else
        {
            //Used CNIC column for Tel # and NTN for Transporter
            mController.UpdateCustomer(long.Parse(this.Session["CustomerId"].ToString()), ChbIsRegister.Checked, chkIsActive.Checked, int.Parse(drpChannelType.SelectedValue.ToString()),
                int.Parse(DrpVolumeClass.SelectedValue.ToString()), int.Parse(DrpBusinessType.SelectedValue.ToString()), int.Parse(DrpRoute.SelectedValue.ToString()),
                int.Parse(DrpMarket.SelectedValue.ToString()), int.Parse(DrpTown.SelectedValue.ToString()), int.Parse(DrpDistributor.SelectedValue.ToString()), txtIsRegister.Text,
                txtContactPerson.Text, txtPhoneNo.Text, txtEmail.Text, null, txtCustomerName.Text, txtAddress.Text, Constants.DateNullValue, 1, 1, txtTelNo.Text, txtTransporter.Text,
                Convert.ToDecimal(Dc.chkNull_0(txtCreditAmount.Text)), Convert.ToInt32(Dc.chkNull_0(txtInvoiceCount.Text)), Convert.ToInt32(Dc.chkNull_0(txtCreditDays.Text)),
                txtReference.Text, txtCustomerPolicy.Text);
        }
        ScriptManager.RegisterStartupScript(this, this.GetType(), "msg", "alert('Record Update');", true);
        this.ClearAll();
    }

    /// <summary>
    /// Clears All Controls Through ClearAll() Function
    /// </summary>
    /// <param name="sender">object</param>
    /// <param name="e">EventArgs</param>
    protected void btnCancel_Click(object sender, EventArgs e)
    {
        Grid_users.EditIndex = -1;
        this.ClearAll();
    }

    /// <summary>
    /// Filters Customer From Customer Grid
    /// </summary>
    /// <param name="sender">object</param>
    /// <param name="e">EventArgs</param>
    protected void btnSearch_Click(object sender, EventArgs e)
    {
        Grid_users.EditIndex = -1;
        this.LoadCustomer();
        this.SetTableSorter();
    }

    /// <summary>
    /// Set Customer Grid For JQuery Sorting
    /// </summary>
    private void SetTableSorter()
    {
        if (Grid_users.Rows.Count > 1)
        {
            Grid_users.UseAccessibleHeader = true;
            Grid_users.HeaderRow.TableSection = TableRowSection.TableHeader;
        }
    }

    /// <summary>
    /// Clears All  Constrols
    /// </summary>
    private void ClearAll()
    {
        txtCustomerName.Text = "";
        txtContactPerson.Text = "";
        txtAddress.Text = "";
        txtPhoneNo.Text = "";
        txtSeach.Text = "";
        txtIsRegister.Text = "";
        txtCreditDays.Text = string.Empty;
        txtCreditAmount.Text = string.Empty;
        txtInvoiceCount.Text = string.Empty;
        txtCustomerPolicy.Text = string.Empty;
        txtTelNo.Text = string.Empty;
        txtEmail.Text = string.Empty;
        txtTransporter.Text = string.Empty;
        txtReference.Text = string.Empty;
        btnSave.Text = "Save";
        Grid_users.DataSource = null;
        Grid_users.DataBind();
    }

    protected void Grid_users_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        if (e.CommandName.ToLower() == "edt")
        {
            GridViewRow row = (GridViewRow)(((LinkButton)e.CommandSource).NamingContainer);
            int index = row.RowIndex;
            this.Session.Add("CustomerId", long.Parse(Grid_users.Rows[index].Cells[0].Text));
            DrpDistributor.SelectedValue = Grid_users.Rows[index].Cells[1].Text;
            DrpBusinessType.SelectedValue = Grid_users.Rows[index].Cells[2].Text;
            DrpVolumeClass.SelectedValue = Grid_users.Rows[index].Cells[3].Text;
            drpChannelType.SelectedValue = Grid_users.Rows[index].Cells[4].Text;
            this.LoadTown();
            DrpTown.SelectedValue = Grid_users.Rows[index].Cells[5].Text;
            this.LoadRoute();
            DrpRoute.SelectedValue = Grid_users.Rows[index].Cells[6].Text;
            this.LoadMarket();
            DrpMarket.SelectedValue = Grid_users.Rows[index].Cells[7].Text;
            txtCustomerName.Text = Grid_users.Rows[index].Cells[9].Text.Replace("amp;", "");
            txtContactPerson.Text = Grid_users.Rows[index].Cells[10].Text.Replace("&nbsp;", "");
            txtPhoneNo.Text = Grid_users.Rows[index].Cells[11].Text.Replace("&nbsp;", "");
            txtAddress.Text = Grid_users.Rows[index].Cells[13].Text.Replace("&nbsp;", "");
            txtIsRegister.Text = Grid_users.Rows[index].Cells[14].Text.Replace("&nbsp;", "");
            if (Grid_users.Rows[index].Cells[14].Text.Trim() == "&nbsp;")
            {
                txtIsRegister.Text = "";
                ChbIsRegister.Checked = false;
            }
            else
            {
                ChbIsRegister.Checked = true;
                txtIsRegister.Text = Grid_users.Rows[index].Cells[14].Text;
            }
            chkIsActive.Checked = bool.Parse(Grid_users.Rows[index].Cells[19].Text);
            txtRegdate.Text = Grid_users.Rows[index].Cells[20].Text.Replace("&nbsp;", "");
            txtInvoiceCount.Text = Grid_users.Rows[index].Cells[24].Text;
            txtCreditAmount.Text = Grid_users.Rows[index].Cells[25].Text;
            txtCreditDays.Text = Grid_users.Rows[index].Cells[26].Text;
            txtEmail.Text = Grid_users.Rows[index].Cells[12].Text.Replace("&nbsp;", "");
            txtTelNo.Text = Grid_users.Rows[index].Cells[27].Text.Replace("&nbsp;", "");
            txtTransporter.Text = Grid_users.Rows[index].Cells[28].Text.Replace("&nbsp;", "");
            txtReference.Text = Grid_users.Rows[index].Cells[29].Text.Replace("&nbsp;", "");
            txtCustomerPolicy.Text = Grid_users.Rows[index].Cells[30].Text.Replace("&nbsp;", "");
            btnSave.Text = "Update";
            this.SetTableSorter();
        }
    }
}
