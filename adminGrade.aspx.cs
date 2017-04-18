using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;
using System.Data.SqlClient;
using System.Data;
public partial class adminGrade : System.Web.UI.Page
{
    SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["CPDBCS"].ConnectionString);
    SqlCommand cmd = new SqlCommand();
    DataSet dsGrad = new DataSet();
    SqlDataAdapter adp;
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack)
        {
            try
            {
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }
                cmd.Connection = con;
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.CommandText = "GetStudentListForGrade";
                adp = new SqlDataAdapter(cmd);
                adp.Fill(dsGrad, "dsGrad");
                gridGrade.DataSource = dsGrad;
                gridGrade.DataBind();
            }
            catch (Exception ex)
            {
                throw ex;
            }
            finally
            {
                if (con.State == ConnectionState.Open)
                {
                    con.Close();
                }
            }

        }
    }

    protected void btnSaveGrade_Click(object sender, EventArgs e)
    {
        foreach (GridViewRow row in gridGrade.Rows)
        {
            if (row.RowType == DataControlRowType.DataRow)
            {
                HiddenField hfcommentId = (row.Cells[4].FindControl("hfCommentId") as HiddenField);
                int commentId = Convert.ToInt32(hfcommentId.Value);
                TextBox txtGrade = (row.Cells[5].FindControl("txtGrade") as TextBox);
                string grade = txtGrade.Text;
                try
                {
                    if(con.State == ConnectionState.Closed)
                    {
                        con.Open();
                    }
                    cmd.Parameters.Clear();
                    cmd.Parameters.Add("@grade", SqlDbType.VarChar).Value = grade;
                    cmd.Parameters.Add("@commentId", SqlDbType.Int).Value = commentId;
                    cmd.CommandText = "UPDATE_GRADE";
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.Connection = con;
                    cmd.ExecuteNonQuery();
                    ScriptManager.RegisterStartupScript(this, this.GetType(), "alert", "alert('Grade Assigned Succefully..')", true);
                }
                catch(Exception ex)
                {
                    throw new Exception(ex.Message);
                }
                finally
                {
                    if(con.State == ConnectionState.Open)
                    {
                        con.Close();
                    }
                }
            }
        }
    }
}