using System;
using System.Web.UI;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
using System.Web.UI.WebControls;

public partial class ScenarioDetail : System.Web.UI.Page
{
    
    protected void Page_Load(object sender, EventArgs e)
    {
        #region Validating session
        if (Session["UserID"] == null || Session["IsStudent"] == null)
        {
            Response.Redirect("Login.aspx", false);
            ApplicationInstance.CompleteRequest();
        }
        #endregion

        if (!IsPostBack)
        {
            pnllearnabt.Visible = false;
            pnlwelcome.Visible = true;
            pnldetails.Visible = false;
            pnldesc.Visible = false;
            if (Convert.ToInt32(Session["IsStudent"]) != 0 && Convert.ToBoolean(Session["IsAllowEdit"]) == false)
            {
                txtdesc.ReadOnly = true;
                txtlearnabt.ReadOnly = true;
                txtwelcome.ReadOnly = true;
                txtScenarioDetails.ReadOnly = true;
            }
                if (Session["ScenarioID"] != null)
            {
                #region Bind scenario to data list
                using (SqlConnection con = new SqlConnection())
                {
                    con.ConnectionString = ConfigurationManager.ConnectionStrings["CPDBCS"].ConnectionString;
                    SqlCommand cmd = new SqlCommand();
                    cmd.CommandText = "ShowScenario";
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.Parameters.Clear();
                    cmd.Parameters.Add("@UserID", SqlDbType.Int).Value = Session["UserID"].ToString();
                    cmd.Parameters.Add("@ScenarioID", SqlDbType.Int).Value = Convert.ToInt32(Session["ScenarioID"]);
                    cmd.Connection = con;
                    con.Open();

                    SqlDataAdapter da = new SqlDataAdapter(cmd);
                    DataSet ds = new DataSet();
                    da.Fill(ds, "Scenario");
                    if (ds.Tables["Scenario"].Rows.Count > 0)
                    {
                        lblScenarioName.Text = ds.Tables["Scenario"].Rows[0]["Name"].ToString();
                        txtwelcome.Text = ds.Tables["Scenario"].Rows[0]["Welcome"].ToString();
                        txtlearnabt.Text = ds.Tables["Scenario"].Rows[0]["LearnAbout"].ToString();
                        txtdesc.Text = ds.Tables["Scenario"].Rows[0]["Desciption"].ToString();
                        txtScenarioDetails.Text = ds.Tables["Scenario"].Rows[0]["Details"].ToString();
                        txtlearnabt.Text = ds.Tables["Scenario"].Rows[0]["LearnAbout"].ToString();
                        txtScenarioDetails.Text = ds.Tables["Scenario"].Rows[0]["Details"].ToString();
                    }
                };

                #region Bind buttons to grid view
                using (SqlConnection con = new SqlConnection())
                {
                    con.ConnectionString = ConfigurationManager.ConnectionStrings["CPDBCS"].ConnectionString;
                    SqlCommand cmd = new SqlCommand();
                    cmd.CommandText = "ShowContentByScenarioID";
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.Parameters.Clear();
                    cmd.Parameters.Add("@UserID", SqlDbType.Int).Value = Session["UserID"].ToString();
                    cmd.Parameters.Add("@ScenarioID", SqlDbType.Int).Value = Convert.ToInt32(Session["ScenarioID"]);
                    cmd.Connection = con;
                    con.Open();

                    SqlDataAdapter da = new SqlDataAdapter(cmd);
                    DataSet ds = new DataSet();
                    da.Fill(ds, "ContentButtons");
                    if (ds.Tables["ContentButtons"].Rows.Count > 0)
                    {
                        dlContentButtons.DataSource = ds.Tables["ContentButtons"];
                        dlContentButtons.DataBind();
                    }
                };
                #endregion
            }
            #endregion
            else
            {
                Response.Redirect("Home.aspx");
            }
        }
    }

    //protected void btnSave_Click(object sender, EventArgs e)
    //{
    //    try
    //    {
    //        if (txtComment.Text == "")
    //        {
    //            ScriptManager.RegisterStartupScript(this, this.GetType(), "alert", "alert('Please Post Your Comment')", true);
    //            return;
    //        }
    //        else
    //        {
    //            #region Save comment
    //            using (SqlConnection con = new SqlConnection())
    //            {
    //                con.ConnectionString = ConfigurationManager.ConnectionStrings["CPDBCS"].ConnectionString;
    //                SqlCommand cmd = new SqlCommand();
    //                cmd.CommandText = "SaveComment";
    //                cmd.CommandType = CommandType.StoredProcedure;
    //                cmd.Parameters.Clear();
    //                cmd.Parameters.Add("@ScenarioID", SqlDbType.Int).Value = Convert.ToInt32(Session["ScenarioID"]);
    //                if (Session["ContentID"] != null)
    //                {
    //                    cmd.Parameters.Add("@ContentID", SqlDbType.Int).Value = Session["ContentID"].ToString();
    //                }
    //                cmd.Parameters.Add("@StudentID", SqlDbType.Int).Value = Session["UserID"].ToString();
    //                cmd.Parameters.Add("@Comment", SqlDbType.VarChar).Value = "";//txtComment.Text;
    //                cmd.Connection = con;
    //                con.Open();
    //                cmd.ExecuteNonQuery();
    //                ScriptManager.RegisterStartupScript(this, GetType(), "alert", "alert('Comment saved successfully');window.location ='Home.aspx';", true);
    //            };
    //            this.UpdateScenario();
    //        }
        
    //    #endregion
    //        }
    //    catch (Exception EX)
    //    {

    //        throw;
    //    }
    //}

    private void UpdateScenario()
    {
        try
        {
            if (Convert.ToBoolean(Session["IsAllowEdit"]) == true)
            {
                using (SqlConnection con = new SqlConnection())
                {
                    con.ConnectionString = ConfigurationManager.ConnectionStrings["CPDBCS"].ConnectionString;
                    SqlCommand cmd = new SqlCommand();
                    cmd.CommandText = "SaveUpdateScenario";
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.Parameters.Clear();
                    cmd.Parameters.Add("@ScenarioID", SqlDbType.Int).Value = Convert.ToInt32(Session["ScenarioID"]); ;
                    cmd.Parameters.Add("@Welcome", SqlDbType.VarChar).Value = txtwelcome.Text;
                    cmd.Parameters.Add("@LearnAbt", SqlDbType.VarChar).Value = txtlearnabt.Text;
                    cmd.Parameters.Add("@Desc", SqlDbType.VarChar).Value = txtdesc.Text;
                    cmd.Parameters.Add("@Details", SqlDbType.VarChar).Value = txtScenarioDetails.Text;
                    cmd.Connection = con;
                    con.Open();
                    cmd.ExecuteNonQuery();
                }
            }
        }
        catch (Exception ex)
        {

            throw;
        }
    }

    protected void dlContentButtons_ItemCommand(object source, DataListCommandEventArgs e)
    {
        if (e.CommandName == "cmdView")
        {
            Session["ContentID"] = Convert.ToInt32(e.CommandArgument);
            Response.Redirect("SubContent.aspx", false);
            ApplicationInstance.CompleteRequest();
        }
    }

    protected void brnwelcome_Click(object sender, EventArgs e)
    {
        pnllearnabt.Visible = true;
        pnlwelcome.Visible = false;
        pnldetails.Visible = false;
        pnldesc.Visible = false;
        this.UpdateScenario();

    }

    protected void btnlearnabt_Click(object sender, EventArgs e)
    {
        pnllearnabt.Visible = false;
        pnlwelcome.Visible = false;
        pnldetails.Visible = false;
        pnldesc.Visible = true;
        this.UpdateScenario();

    }

    protected void btndesc_Click(object sender, EventArgs e)
    {
        pnllearnabt.Visible = false;
        pnlwelcome.Visible = false;
        pnldetails.Visible = true;
        pnldesc.Visible = false;
        this.UpdateScenario();
    }
}