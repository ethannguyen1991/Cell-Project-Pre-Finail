using System;
using System.Web.UI;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
using System.Web.UI.WebControls;

public partial class ShowContents : Page
{
    public bool IsAddContentButtonVisible { get; set; }
    protected void Page_Load(object sender, EventArgs e)
    {
        #region Validating session
        if (Session["UserID"] == null || Session["IsStudent"] == null)
        {
            Response.Redirect("index.html", false);
            ApplicationInstance.CompleteRequest();
        }
        #endregion

        Session["HideComment"] = null;
        if (!IsPostBack)
        {
            getContents();
        }

        IsAddContentButtonVisible = true;
        if (Convert.ToInt32(Session["IsStudent"]) == 1 && Convert.ToBoolean(Session["IsAllowEdit"]) == false)
        {
            IsAddContentButtonVisible = false;
        }
    }

    public void getContents()
    {
        #region Bind contents to data list
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
            da.Fill(ds, "ShowContent");
            if (ds.Tables["ShowContent"].Rows.Count > 0)
            {
                dlContents.DataSource = ds.Tables["ShowContent"];
                dlContents.DataBind();
            }
            //SqlDataReader dr = cmd.ExecuteReader();
            //if (dr.Read())
            //{
            //    dlContents.DataSource = dr;
            //    dlContents.DataBind();
            //}
        };
        #endregion
    }
    protected void btnAddContent_Click(object sender, EventArgs e)
    {
        Session["ContentID"] = 1;
        Response.Redirect("Content.aspx", false);
        ApplicationInstance.CompleteRequest();
    }

    protected void dlContents_ItemCommand(object source, System.Web.UI.WebControls.DataListCommandEventArgs e)
    {
        if (e.CommandName == "cmdEdit")
        {
            Session["ContentID"] = Convert.ToInt32(e.CommandArgument);
            Response.Redirect("Content.aspx");
        }
        else if (e.CommandName == "cmdDelete")
        {
            Session["ContentID"] = Convert.ToInt32(e.CommandArgument);
            using (SqlConnection con = new SqlConnection())
            {
                con.ConnectionString = ConfigurationManager.ConnectionStrings["CPDBCS"].ConnectionString;
                SqlCommand cmd = new SqlCommand();
                cmd.CommandText = "DeleteContent";
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.Clear();
                cmd.Parameters.Add("@ContentId", SqlDbType.Int).Value = Convert.ToInt32(Session["ContentID"]);
                cmd.Connection = con;
                con.Open();
                cmd.ExecuteNonQuery();
                ScriptManager.RegisterStartupScript(this, this.GetType(), "alert", "alert('Content Deleted Sucessfully..')", true);
                getContents();
            }
        }
        else if(e.CommandName == "cmdView")
        {
            Session["ContentID"] = Convert.ToInt32(e.CommandArgument);
            Session["HideComment"] = true;
            Response.Redirect("SubContent.aspx", false);
            ApplicationInstance.CompleteRequest();
        }
    }

    protected void dlContents_ItemDataBound(object sender, System.Web.UI.WebControls.DataListItemEventArgs e)
    {
        if (Convert.ToInt32(Session["IsStudent"]) == 1 && Convert.ToBoolean(Session["IsAllowEdit"]) == false)
        {
            LinkButton lnkEdit = (LinkButton)e.Item.FindControl("lnkEdit");
            lnkEdit.Visible = false;
            LinkButton lnkDelete = (LinkButton)e.Item.FindControl("lnkDelete");
            lnkDelete.Visible = false;
        }
    }
}