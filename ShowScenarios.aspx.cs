using System;
using System.Web.UI;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
using System.Web.UI.WebControls;
using System.Linq;

public partial class Home : Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        #region Validating session
        if (Session["UserID"] == null || Session["IsStudent"] == null)
        {
            Response.Redirect("index.html", false);
            ApplicationInstance.CompleteRequest();
        }
        if (Convert.ToInt32(Session["IsStudent"]) != 0 && Convert.ToBoolean(Session["IsAllowEdit"]) == false)
        {
            btnAddScenario.Visible = false;
        }
            #endregion
            Session["ScenarioID"] = null;
           Session["HideComment"] = null;


        if (!IsPostBack)
        {
           getScenario();
           
        }
    }
   

    public void getScenario()
    {
        try
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
                cmd.Connection = con;
                con.Open();

                SqlDataAdapter da = new SqlDataAdapter(cmd);
                DataSet ds = new DataSet();
                da.Fill(ds, "Scenario");
                if (ds.Tables["Scenario"].Rows.Count > 0)
                {

                    dlScenario.DataSource = ds.Tables["Scenario"];
                     dlScenario.DataBind();
                }
                else
                {
                    dlScenario.DataSource = null;
                }
            };
        }
        catch (Exception ex)
        {

            throw;
        }
        #endregion
    }
    protected void dlScenario_ItemCommand(object source, DataListCommandEventArgs e)
    {

        if (e.CommandName == "cmdView")
        {
            Session["ScenarioID"] = Convert.ToInt32(e.CommandArgument);
            Response.Redirect("ScenarioDetail.aspx", false);
            ApplicationInstance.CompleteRequest();
            //Response.Redirect("welcome.aspx");
        }
        else if (e.CommandName == "cmdEdit")
        {
            Session["ScenarioID"] = Convert.ToInt32(e.CommandArgument);
            Response.Redirect("Scenario.aspx", false);
            ApplicationInstance.CompleteRequest();
        }
        else if (e.CommandName == "cmdDelete")
        {
            Session["ScenarioID"] = Convert.ToInt32(e.CommandArgument);
            using (SqlConnection con = new SqlConnection())
            {
                con.ConnectionString = ConfigurationManager.ConnectionStrings["CPDBCS"].ConnectionString;
                SqlCommand cmd = new SqlCommand();
                cmd.CommandText = "DeleteScenario";
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.Clear();
                cmd.Parameters.Add("@ScenarioID", SqlDbType.Int).Value = Convert.ToInt32(Session["ScenarioID"]);
                cmd.Connection = con;
                con.Open();
                cmd.ExecuteNonQuery();
                ScriptManager.RegisterStartupScript(this, this.GetType(), "alert", "alert('Scenario Deleted Sucessfully..')", true);
                con.Close();
                getScenario();
            }
        }
    }
    protected void dlScenario_ItemDataBound(object sender, DataListItemEventArgs e)
    {
        if (Convert.ToInt32(Session["IsStudent"]) != 0 && Convert.ToBoolean(Session["IsAllowEdit"]) == false)
        {
            LinkButton lnkEdit = (LinkButton)e.Item.FindControl("lnkEdit");
            lnkEdit.Visible = false;
            LinkButton lnkDelete = (LinkButton)e.Item.FindControl("lnkDelete");
            lnkDelete.Visible = false;
        }
    }

    protected void btnAddScenario_Click(object sender, EventArgs e)
    {
        Response.Redirect("Scenario.aspx", false);
        ApplicationInstance.CompleteRequest();
    }
    


}