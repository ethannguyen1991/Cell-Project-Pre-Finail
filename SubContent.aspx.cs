using System;
using System.Web.UI;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
using System.Web.UI.WebControls;
using System.Linq;

public partial class SubContent : System.Web.UI.Page
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
            if (Session["ContentID"] != null)
            {
                if (Session["HideComment"] != null)
                {
                    lblComment.Visible = false;
                    txtComment.Visible = false;
                    btnSave.Visible = false;    
                }
                #region Bind scenario to data list
                using (SqlConnection con = new SqlConnection())
                {
                    con.ConnectionString = ConfigurationManager.ConnectionStrings["CPDBCS"].ConnectionString;
                    SqlCommand cmd = new SqlCommand();
                    cmd.CommandText = "ShowContent";
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.Parameters.Clear();
                    cmd.Parameters.Add("@UserID", SqlDbType.Int).Value = Session["UserID"].ToString();
                    cmd.Parameters.Add("@ContentID", SqlDbType.Int).Value = Convert.ToInt32(Session["ContentID"]);
                    cmd.Connection = con;
                    con.Open();

                    SqlDataAdapter da = new SqlDataAdapter(cmd);
                    DataSet ds = new DataSet();
                    da.Fill(ds, "Content");
                    if (ds.Tables["Content"].Rows.Count > 0)
                    {
                        lblContentHeadingID.Text = ds.Tables["Content"].Rows[0]["HeadingID"].ToString();
                        lblContentDetails.Text = ds.Tables["Content"].Rows[0]["Contents"].ToString();
                        btnLink1Caption.Text = ds.Tables["Content"].Rows[0]["Link1Caption"].ToString();
                        btnLink2Caption.Text = ds.Tables["Content"].Rows[0]["Link2Caption"].ToString();
                        btnLink3Caption.Text = ds.Tables["Content"].Rows[0]["Link3Caption"].ToString();
                        btnLink4Caption.Text = ds.Tables["Content"].Rows[0]["Link4Caption"].ToString();
                        btnLink5Caption.Text = ds.Tables["Content"].Rows[0]["Link5Caption"].ToString();
                        btnLink6Caption.Text = ds.Tables["Content"].Rows[0]["Link6Caption"].ToString();
                        Session["Link1Description"] = ds.Tables["Content"].Rows[0]["Link1Description"].ToString();
                        Session["Link2Description"] = ds.Tables["Content"].Rows[0]["Link2Description"].ToString();
                        Session["Link3Description"] = ds.Tables["Content"].Rows[0]["Link3Description"].ToString();
                        Session["Link4Description"] = ds.Tables["Content"].Rows[0]["Link4Description"].ToString();
                        Session["Link5Description"] = ds.Tables["Content"].Rows[0]["Link5Description"].ToString();
                        Session["Link6Description"] = ds.Tables["Content"].Rows[0]["Link6Description"].ToString();
                        if (Convert.ToBoolean(ds.Tables["Content"].Rows[0]["HasButtons"]) == false)
                        {
                            
                            panelButton.Visible = false;
                            rightButtons.Visible = false;
                        }
                        if (Convert.ToBoolean(ds.Tables["Content"].Rows[0]["HasCommentBox"]) == false)
                        {
                            lblComment.Visible = false;
                            txtComment.Visible = false;
                            btnSave.Visible = false;
                        }
                        if (string.IsNullOrEmpty(btnLink1Caption.Text))
                            btnLink1Caption.Visible = false;
                        if (string.IsNullOrEmpty(btnLink2Caption.Text))
                            btnLink2Caption.Visible = false;
                        if (string.IsNullOrEmpty(btnLink3Caption.Text))
                            btnLink3Caption.Visible = false;
                        if (string.IsNullOrEmpty(btnLink4Caption.Text))
                            btnLink4Caption.Visible = false;
                        if (string.IsNullOrEmpty(btnLink5Caption.Text))
                            btnLink5Caption.Visible = false;
                        if (string.IsNullOrEmpty(btnLink6Caption.Text))
                            btnLink6Caption.Visible = false;
                    }
                };

                #region Bind buttons to grid view
                using (SqlConnection con = new SqlConnection())
                {
                    con.ConnectionString = ConfigurationManager.ConnectionStrings["CPDBCS"].ConnectionString;
                    SqlCommand cmd = new SqlCommand();
                    cmd.CommandText = "ShowSubContentByContentID";
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.Parameters.Clear();
                    cmd.Parameters.Add("@UserID", SqlDbType.Int).Value = Session["UserID"].ToString();
                    cmd.Parameters.Add("@ContentID", SqlDbType.Int).Value = Convert.ToInt32(Session["ContentID"]);
                    cmd.Connection = con;
                    con.Open();

                    SqlDataAdapter da = new SqlDataAdapter(cmd);
                    DataSet ds = new DataSet();
                    da.Fill(ds, "ContentButtons");
                    if (ds.Tables["ContentButtons"].Rows.Count > 0)
                    {
                        Session["IsFinish"] = false;
                        btnSave.Text = "Comment";
                        btnSave.Enabled = true;
                        dlContentButtons.DataSource = ds.Tables["ContentButtons"];
                        dlContentButtons.DataBind();
                    }
                    else
                    {
                        btnSave.Text = "Finish";
                        Session["IsFinish"] = true;
                        lblComment.Visible = true;
                        txtComment.Visible = true;
                        btnSave.Visible = true;
                        btnSave.Enabled = true;
                    }
                };
                #endregion
            }
            #endregion
            else
            {
                Response.Redirect("Home.aspx", false);
                ApplicationInstance.CompleteRequest();
            }
        }
    }

    protected void btnSave_Click(object sender, EventArgs e)
    {
        int scenarioid = Convert.ToInt32(Session["ScenarioID"]);
        if (txtComment.Text == "")
        {
            ScriptManager.RegisterStartupScript(this, this.GetType(), "alert", "alert('Please Post Your Comment')", true);
            return;
        }
        #region Save comment
        using (SqlConnection con = new SqlConnection())
        {
            con.ConnectionString = ConfigurationManager.ConnectionStrings["CPDBCS"].ConnectionString;
            SqlCommand cmd = new SqlCommand();
            cmd.CommandText = "SaveComment";
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.Clear();
            cmd.Parameters.Add("@ScenarioID", SqlDbType.Int).Value = scenarioid;
            if (Session["ContentID"] != null)
            {
                cmd.Parameters.Add("@ContentID", SqlDbType.Int).Value = Session["ContentID"].ToString();
            }
            cmd.Parameters.Add("@StudentID", SqlDbType.Int).Value = Session["UserID"].ToString();
            cmd.Parameters.Add("@Comment", SqlDbType.VarChar).Value = txtComment.Text;
            cmd.Connection = con;
            con.Open();
            cmd.ExecuteNonQuery();
            btnSave.Enabled = false;
            if (btnSave.Text == "Finish")
            {
                using (CellEntities context = new CellEntities())
                {
                    var getscanrio = (from rs in context.Scenarios where rs.ScenarioID == scenarioid select rs).FirstOrDefault();
                    if(getscanrio!=null)
                    {
                        getscanrio.Rank = getscanrio.Rank + 1;
                        context.SaveChanges();
                    }

                }
                    ScriptManager.RegisterStartupScript(this, GetType(), "alert", "alert('Game finish successfully');window.location ='Home.aspx';", true);
            }
        };
        #endregion
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

    protected void btnLink2Caption_Click(object sender, EventArgs e)
    {
        panelButton.Visible = true;
        lblButtonHeading.Text =  btnLink2Caption.Text;
        lblButtonDetails.Text = Session["Link2Description"].ToString();
    }

    protected void btnLink3Caption_Click(object sender, EventArgs e)
    {
        panelButton.Visible = true;
        lblButtonHeading.Text = btnLink3Caption.Text;
        lblButtonDetails.Text = Session["Link3Description"].ToString();
    }

    protected void btnLink1Caption_Click(object sender, EventArgs e)
    {
        panelButton.Visible = true;
        lblButtonHeading.Text = btnLink1Caption.Text;
        lblButtonDetails.Text = Session["Link1Description"].ToString();
    }
    protected void btnLink4Caption_Click(object sender, EventArgs e)
    {
        panelButton.Visible = true;
        lblButtonHeading.Text = btnLink4Caption.Text;
        lblButtonDetails.Text = Session["Link4Description"].ToString();
    }
    protected void btnLink5Caption_Click(object sender, EventArgs e)
    {
        panelButton.Visible = true;
        lblButtonHeading.Text = btnLink5Caption.Text;
        lblButtonDetails.Text = Session["Link5Description"].ToString();
    }
    protected void btnLink6Caption_Click(object sender, EventArgs e)
    {
        panelButton.Visible = true;
        lblButtonHeading.Text = btnLink6Caption.Text;
        lblButtonDetails.Text = Session["Link6Description"].ToString();
    }
    protected void btnFunction_Click(object sender, EventArgs e)
    {
        panelButton.Visible = true;
        lblButtonHeading.Text = "Function of Intestinal Epithelial Cells";
        lblButtonDetails.Text = "Columnar epithelial cells line the lumen of the intestinal tract and are important for absorption of nutrients. These cells contain microvilli, or small projections, to increase surface area and maximize nutrient absorption.";
    }
}