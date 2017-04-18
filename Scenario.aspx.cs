using System;
using System.Web.UI;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
using System.Web.UI.WebControls;

public partial class Scenario : Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        #region Validating session
        if (Session["UserID"] == null || Session["IsStudent"] == null)
        {
            Response.Redirect("index.html", false);
            ApplicationInstance.CompleteRequest();
        }
        #endregion

        if (!IsPostBack)
        {
            if (Session["ScenarioID"] != null)
            {
                chkContents.Visible = false;
                fileImage.Enabled = false;
                using (SqlConnection con = new SqlConnection())
                {
                    con.ConnectionString = ConfigurationManager.ConnectionStrings["CPDBCS"].ConnectionString;
                    SqlCommand cmd = new SqlCommand();
                    cmd.CommandText = "ShowScenario";
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.Parameters.Clear();
                    cmd.Parameters.Add("@ScenarioID", SqlDbType.Int).Value = Convert.ToInt32(Session["ScenarioID"]);
                    cmd.Connection = con;
                    con.Open();
                    SqlDataAdapter da = new SqlDataAdapter(cmd);
                    DataSet ds = new DataSet();
                    da.Fill(ds, "getScenario");
                    if (ds.Tables["getScenario"].Rows.Count > 0)
                    {
                        txtName.Text = ds.Tables["getScenario"].Rows[0]["Name"].ToString();
                        txtDetails.Text = ds.Tables["getScenario"].Rows[0]["Details"].ToString();
                        txtwelcome.Text = ds.Tables["getScenario"].Rows[0]["Welcome"].ToString();
                        txtlearnabt.Text = ds.Tables["getScenario"].Rows[0]["LearnAbout"].ToString();
                        txtDesc.Text = ds.Tables["getScenario"].Rows[0]["Desciption"].ToString();
                        lstRAnking.Text = ds.Tables["getScenario"].Rows[0]["Rank"].ToString();
                    }
                }
            }
            #region Bind contents to checkbox list
            using (SqlConnection con = new SqlConnection())
            {
                con.ConnectionString = ConfigurationManager.ConnectionStrings["CPDBCS"].ConnectionString;
                SqlCommand cmd = new SqlCommand();
                cmd.CommandText = "ShowContent";
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.Clear();
                cmd.Parameters.Add("@UserID", SqlDbType.Int).Value = Session["UserID"].ToString();
                cmd.Connection = con;
                con.Open();
                SqlDataAdapter da = new SqlDataAdapter(cmd);
                DataSet ds = new DataSet();
                da.Fill(ds, "CreateScenario");
                if (ds.Tables["CreateScenario"].Rows.Count > 0)
                {
                    chkContents.DataSource = ds.Tables["CreateScenario"];
                    chkContents.DataTextField = "HeadingText";
                    chkContents.DataValueField = "ContentID";
                    chkContents.DataBind();
                }
                //SqlDataReader dr = cmd.ExecuteReader();
                //if (dr.Read())
                //{
                //    chkContents.DataSource = dr;
                //    chkContents.DataTextField = "HeadingText";
                //    chkContents.DataValueField = "ContentID";
                //    chkContents.DataBind();
                //}
            };
            #endregion
        }
    }
    protected void btnClear_Click(object sender, EventArgs e)
    {
        txtName.Text = "";
        txtwelcome.Text = "";
        txtlearnabt.Text = "";
        txtDesc.Text = "";
        txtDetails.Text = "";

    }
    protected void btnSave_Click(object sender, EventArgs e)
    {
        using (SqlConnection con = new SqlConnection())
        {
            try
            {
                #region Declaration
                int isStudent = Convert.ToInt32(Session["IsStudent"]);
                string userID = Session["UserID"].ToString();

                string image = null;
                if (fileImage.HasFile)
                {
                    image = DateTime.Now.ToString("yyyyMMddHHmmssfff").ToString() + ".jpg";
                    string filePath = "ScenarioImages/" + image;
                    fileImage.SaveAs(Server.MapPath(filePath));
                }

                int scenarioID = -1;
                if (Session["ScenarioID"] != null)
                {
                    scenarioID = Convert.ToInt32(Session["ScenarioID"]);
                }
                #endregion

                #region Saving parent content
                con.ConnectionString = ConfigurationManager.ConnectionStrings["CPDBCS"].ConnectionString;
                SqlCommand cmd = new SqlCommand();
                cmd.CommandText = "SaveScenario";
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.Clear();
                cmd.Parameters.Add("@ScenarioID", SqlDbType.Int).Value = scenarioID;
                cmd.Parameters.Add("@Name", SqlDbType.VarChar).Value = txtName.Text;
                cmd.Parameters.Add("@Welcome", SqlDbType.VarChar).Value = txtwelcome.Text;
                cmd.Parameters.Add("@LearnAbt", SqlDbType.VarChar).Value = txtlearnabt.Text;
                cmd.Parameters.Add("@Desc", SqlDbType.VarChar).Value = txtDesc.Text;
                cmd.Parameters.Add("@Details", SqlDbType.VarChar).Value = txtDetails.Text;
                if (lstRAnking.Text != null)
                    cmd.Parameters.Add("@Rank", SqlDbType.VarChar).Value = lstRAnking.Text;
                else
                    cmd.Parameters.Add("@Rank", SqlDbType.VarChar).Value = "Low";

                if (!string.IsNullOrEmpty(image))
                {
                    cmd.Parameters.Add("@Image", SqlDbType.VarChar).Value = image;
                }
                cmd.Parameters.Add("@IsCreatedByStudent", SqlDbType.Int).Value = isStudent;
                cmd.Parameters.Add("@CreatedBy", SqlDbType.Int).Value = userID;
                cmd.Parameters.Add("@NewScenarioID", SqlDbType.VarChar, 50);
                cmd.Parameters["@NewScenarioID"].Direction = ParameterDirection.Output;
                cmd.Connection = con;
                con.Open();
                cmd.ExecuteNonQuery();
                string newScenarioID = cmd.Parameters["@NewScenarioID"].Value.ToString();
                #endregion

                #region Saving child content
                foreach (ListItem childContentID in chkContents.Items)
                {
                    int contentID = Convert.ToInt32(childContentID.Value);
                    int isDel = 0;
                    if (!childContentID.Selected)
                    {
                        isDel = 1;
                    }
                    cmd.CommandText = "SaveScenarioContent";
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.Parameters.Clear();
                    cmd.Parameters.Add("@ScenarioID", SqlDbType.Int).Value = newScenarioID;
                    cmd.Parameters.Add("@ContentID", SqlDbType.Int).Value = contentID;
                    cmd.Parameters.Add("@IsDeleted", SqlDbType.Int).Value = isDel;
                    cmd.Connection = con;
                    cmd.ExecuteNonQuery();
                }
                #endregion
                
                ScriptManager.RegisterClientScriptBlock(this, GetType(), "alert", "alert('Scenario saved successfully')", true);
                Response.Redirect("ShowScenarios.aspx",false);
                ApplicationInstance.CompleteRequest();
            }
            catch (Exception ex)
            {
                throw new Exception(ex.Message);
            }
        };
    }
}