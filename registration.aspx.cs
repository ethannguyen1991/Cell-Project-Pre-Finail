using System;
using System.Configuration;
using System.Data.SqlClient;
using System.Data;
using System.Web.UI;
public partial class registration : System.Web.UI.Page
{
    SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["CPDBCS"].ConnectionString);
    SqlCommand cmd = new SqlCommand();
    DataSet ds = new DataSet();
    SqlDataAdapter adp;
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void btnRegister_Click(object sender, EventArgs e)
    {
        if (txtPassword.Text.Equals(txtConfirmPassword.Text))
        {
            try
            {
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }
                cmd.Parameters.Clear();
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.CommandText = "RegisterStudent";
                cmd.Connection = con;
                cmd.Parameters.Add("@firstName", SqlDbType.VarChar).Value = txtFirstName.Text;
                cmd.Parameters.Add("@lastName", SqlDbType.VarChar).Value = txtLastName.Text;
                cmd.Parameters.Add("@email", SqlDbType.VarChar).Value = txtEmail.Text;
                cmd.Parameters.Add("@userName", SqlDbType.VarChar).Value = txtUserName.Text;
                cmd.Parameters.Add("@password", SqlDbType.VarChar).Value = txtPassword.Text;
                cmd.Parameters.Add("@isActive", SqlDbType.Bit).Value = 1;
                cmd.Parameters.Add("@IsAllowEdit", SqlDbType.Bit).Value = 0;
                
                cmd.ExecuteNonQuery();
                ScriptManager.RegisterStartupScript(this, this.GetType(), "alert", "alert('Registration Done Successfully !');window.location ='studentLogin.aspx';", true);
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
        else
        {
            ScriptManager.RegisterStartupScript(this, this.GetType(), "alert", "alert('Password And Confirm Password Are Not Match..')", true);
        }
    }

    
}
