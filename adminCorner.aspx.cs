using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;
using System.Data.SqlClient;
using System.Data;
public partial class adminCorner : System.Web.UI.Page
{
    SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["CPDBCS"].ConnectionString);
    SqlCommand cmd = new SqlCommand();
    DataSet accountProfile = new DataSet();
    DataSet dsstudentProfile = new DataSet();
    SqlDataAdapter adp;

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack)
        {
            int userId = -1;
            int.TryParse(Session["UserID"].ToString(), out userId);
            try
            {
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }
                cmd.Connection = con;
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.CommandText = "GetAccountProfile";
                cmd.Parameters.Add("@AccountId", SqlDbType.VarChar).Value = userId;
                adp = new SqlDataAdapter(cmd);
                adp.Fill(accountProfile, "accountProfile");
                txtFirstName.Text = accountProfile.Tables["accountProfile"].Rows[0]["FIRSTNAME"].ToString();
                txtLastName.Text = accountProfile.Tables["accountProfile"].Rows[0]["LASTNAME"].ToString();
                txtEmailAddress.Text = accountProfile.Tables["accountProfile"].Rows[0]["EMAIL"].ToString();
                txtUserName.Text = accountProfile.Tables["accountProfile"].Rows[0]["USERNAME"].ToString();

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

    protected void btnUpdate_Click(object sender, EventArgs e)
    {
        
        try
        {
            if (con.State == ConnectionState.Closed)
            {
                con.Open();
            }
            cmd.Parameters.Clear();
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.CommandText = "UpdateAccountProfile";
            cmd.Connection = con;
            cmd.Parameters.Add("@firstName", SqlDbType.VarChar).Value = txtFirstName.Text;
            cmd.Parameters.Add("@lastName", SqlDbType.VarChar).Value = txtLastName.Text;
            cmd.Parameters.Add("@email", SqlDbType.VarChar).Value = txtEmailAddress.Text;
            cmd.Parameters.Add("@userName", SqlDbType.VarChar).Value = txtUserName.Text;
            cmd.ExecuteNonQuery();
            ScriptManager.RegisterStartupScript(this, this.GetType(), "alert", "alert('Profile Updated Succesfully...')", true);
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
        
    }
}