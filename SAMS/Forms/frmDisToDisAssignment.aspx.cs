using System;
using System.Data;
using System.Web.UI;
using SAMSBusinessLayer.Classes;
using SAMSCommon.Classes;
using System.Collections;
using System.Web.UI.WebControls;
using System.Linq;

/// <summary>
/// From to Assign Towns To Locations.
/// </summary>
public partial class Forms_frmDisToDisAssignment : System.Web.UI.Page
{

    DistributorTownController mTownController = new DistributorTownController();
    GeoHierarchyController GControler = new GeoHierarchyController();
    DataView dv;
    DistributorController ds = new DistributorController();

    /// <summary>
    /// Page_Load Function Populates All Combos and ListBox On The Page
    /// </summary>
    /// <param name="sender">object</param>
    /// <param name="e">EventArgs</param>
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack)
        {
            LoadDistributors();
            DistributorType();
            LoadUnAssingned();
            LoadAssingned();
        }
    }
    
    private void LoadDistributors()
    {
        DistributorController distCtrl = new DistributorController();
        DataTable dt = distCtrl.SelectDistributorInfo(Constants.IntNullValue, int.Parse(Session["UserId"].ToString()), int.Parse(Session["CompanyId"].ToString()));
        if (dt != null)
        {
            if (dt.Rows.Count > 0)
            {
                clsWebFormUtil.FillDropDownList(DrpDistributor, dt, 0, 2);
            }
        }
    }
    protected void DrpDistributor_SelectedIndexChanged(object sender, EventArgs e)
    {
        LoadUnAssingned();
        LoadAssingned();
    }
    private void DistributorType()
    {
        DistributorController dController = new DistributorController();
        DataTable dt = dController.SelectDistributorTypeInfo(Constants.IntNullValue);
        clsWebFormUtil.FillDropDownList(ddDistributorType, dt, 0, 2);
    }
    private void LoadUnAssingned()
    {
        if (DrpDistributor.Items.Count > 0 && ddDistributorType.Items.Count > 0)
        {
            UserController mUserController = new UserController();
            DataTable dt = mUserController.SelectDisToDisAssignment(int.Parse(DrpDistributor.SelectedValue.ToString()), int.Parse(ddDistributorType.SelectedValue.ToString()), 0, int.Parse(this.Session["CompanyId"].ToString()));
            clsWebFormUtil.FillListBox(lstUnAssignDistributor, dt, 0, 1, true);
        }
        else
        {
            lstUnAssignDistributor.Items.Clear();
        }
    }
    private void LoadAssingned()
    {
        if (DrpDistributor.Items.Count > 0 && ddDistributorType.Items.Count > 0)
        {
            UserController mUserController = new UserController();
            DataTable dt = mUserController.SelectDisToDisAssignment(int.Parse(DrpDistributor.SelectedValue.ToString()), int.Parse(ddDistributorType.SelectedValue.ToString()), 1, int.Parse(this.Session["CompanyId"].ToString()));
            clsWebFormUtil.FillListBox(lstAssignDistributor, dt, 0, 1, true);
        }
        else
        {
            lstAssignDistributor.Items.Clear();
        }
    }
    protected void BtnAssign_Click(object sender, EventArgs e)
    {
        UserController mUserController = new UserController();
        for (int i = 0; i < lstUnAssignDistributor.Items.Count; i++)
        {
            if (lstUnAssignDistributor.Items[i].Selected == true && DrpDistributor.Items.Count > 0)
            {
                mUserController.InsertDisToDisAssignment(int.Parse(DrpDistributor.SelectedValue.ToString()), int.Parse(ddDistributorType.SelectedValue.ToString()), int.Parse(lstUnAssignDistributor.Items[i].Value.ToString()), int.Parse(this.Session["CompanyId"].ToString()));
            }
        }
        this.LoadUnAssingned();
        this.LoadAssingned();
        ScriptManager.RegisterStartupScript(this, this.GetType(), "msg", "alert('Record Updated !')", true);
    }
    protected void BtnUnAssign_Click(object sender, EventArgs e)
    {
        UserController mUserController = new UserController();
        for (int i = 0; i < lstAssignDistributor.Items.Count; i++)
        {
            if (lstAssignDistributor.Items[i].Selected == true && DrpDistributor.Items.Count > 0)
            {
                mUserController.DeleteDistoDisAssignment(int.Parse(DrpDistributor.SelectedValue.ToString()), int.Parse(ddDistributorType.SelectedValue.ToString()), int.Parse(lstAssignDistributor.SelectedValue.ToString()), int.Parse(this.Session["CompanyId"].ToString()));
            }
        }
        this.LoadUnAssingned();
        this.LoadAssingned();
        ScriptManager.RegisterStartupScript(this, this.GetType(), "msg", "alert('Record Updated !')", true);
    }

    protected void ddDistributorType_SelectedIndexChanged(object sender, EventArgs e)
    {
        LoadUnAssingned();
        LoadAssingned();
    }

    protected void DrpDistributor_SelectedIndexChanged1(object sender, EventArgs e)
    {
        LoadUnAssingned();
        LoadAssingned();
    }
}