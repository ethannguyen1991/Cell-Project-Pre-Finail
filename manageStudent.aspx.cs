using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;
using System.Data.SqlClient;
using System.Data;
public partial class manageStudent : System.Web.UI.Page
{
    SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["CPDBCS"].ConnectionString);
    SqlCommand cmd = new SqlCommand();
    DataSet dsStudent = new DataSet();
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
                cmd.CommandText = "GetStudent";
                adp = new SqlDataAdapter(cmd);
                adp.Fill(dsStudent, "dsStudent");
                gridStudent.DataSource = dsStudent;
                gridStudent.DataBind();
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

    protected void gridStudent_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        int rowIndex = Convert.ToInt32(e.CommandArgument);
        if (e.CommandName == "cmdDelete")
        {
            try
            {
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }
                cmd.Parameters.Clear();
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.CommandText = "DELETE_STUDENT";
                cmd.Parameters.Add("@studentId", SqlDbType.Int).Value = Convert.ToInt32(e.CommandArgument);
                cmd.Connection = con;
                cmd.ExecuteNonQuery();
            }
            catch (Exception ex)
            {
                throw new Exception(ex.Message);
            }
            finally
            {
                if (con.State == ConnectionState.Open)
                {
                    con.Close();
                }
            }
            Response.Redirect("manageStudent.aspx", false);
            ApplicationInstance.CompleteRequest();
        }
        if (e.CommandName == "cmdSave")
        {
            try
            {
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }
                GridViewRow row = gridStudent.Rows[rowIndex];
                string studentId = (row.FindControl("StuId") as HiddenField).Value;
                Boolean IsAllowedit = (row.FindControl("chkSelect") as CheckBox).Checked;
                cmd.Parameters.Clear();
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.CommandText = "UPDATE_STUDENT_Permission";
                cmd.Parameters.Add("@StudenttId", SqlDbType.Int).Value = Convert.ToInt32(studentId);
                cmd.Parameters.Add("@IsAllowEdit", SqlDbType.Bit).Value = IsAllowedit;
                cmd.Connection = con;
                cmd.ExecuteNonQuery();
            }
            catch (Exception ex)
            {
                throw new Exception(ex.Message);
            }
            finally
            {
                if (con.State == ConnectionState.Open)
                {
                    con.Close();
                }
            }
            Response.Redirect("manageStudent.aspx", false);
            ApplicationInstance.CompleteRequest();
        }
    }
}