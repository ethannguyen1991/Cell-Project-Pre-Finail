using System;
using System.Web.UI;
using System.Configuration;
using System.Data.SqlClient;
using System.Data;
public partial class adminChangePassword : System.Web.UI.Page
{
    SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["CPDBCS"].ConnectionString);
    SqlCommand cmd = new SqlCommand();
    DataSet dsadminProfile = new DataSet();
    SqlDataAdapter adp;
    protected void Page_Load(object sender, EventArgs e)
    {
    }
    protected void btnChangePassword_Click(object sender, EventArgs e)
    {
        if (Session["UserID"] != null  && Convert.ToInt32(Session["IsStudent"])== 0)
        {
            try
            {
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }
                if (txtNewPass.Text.Equals(txtConfirmPass.Text))
                {
                    //string userName = Session["adminloginDetails"].ToString();
                    
                    cmd.Connection = con;
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.CommandText = "CHANGE_PASSWORD";
                    cmd.Parameters.Clear();
                    cmd.Parameters.Add("@userPass", SqlDbType.VarChar).Value = txtOldPass.Text;
                    cmd.Parameters.Add("@userName", SqlDbType.VarChar).Value = Convert.ToInt32(Session["UserID"]);
                    cmd.Parameters.Add("@userNewPass", SqlDbType.VarChar).Value = txtConfirmPass.Text;
                    cmd.Parameters.Add("@message", SqlDbType.VarChar, 100);
                    cmd.Parameters["@message"].Direction = System.Data.ParameterDirection.Output;
                    cmd.ExecuteNonQuery();
                    string message = cmd.Parameters["@message"].Value.ToString();
                    ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "Alert", "alert('" + message + "')", true);
                }
                else
                {
                    ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "Alert", "alert('New Password And Confirm Password Does Not Match')", true);
                }
            }
            catch (Exception)
            {
                throw;
            }
            finally
            {
                if (con.State == ConnectionState.Open)
                {
                    con.Close();
                }
            }
        }
        else if (Session["studentloginDetails"] != null)
        {
            try
            {
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }
                if (txtNewPass.Text.Equals(txtConfirmPass.Text))
                {
                    string userName = Session["studentloginDetails"].ToString();
                    cmd.Connection = con;
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.CommandText = "CHANGE_PASSWORD_STUDENT";
                    cmd.Parameters.Clear();
                    cmd.Parameters.Add("@userPass", SqlDbType.VarChar).Value = txtOldPass.Text;
                    cmd.Parameters.Add("@userName", SqlDbType.VarChar).Value = userName;
                    cmd.Parameters.Add("@userNewPass", SqlDbType.VarChar).Value = txtConfirmPass.Text;
                    cmd.Parameters.Add("@message", SqlDbType.VarChar, 100);
                    cmd.Parameters["@message"].Direction = System.Data.ParameterDirection.Output;
                    cmd.ExecuteNonQuery();
                    string message = cmd.Parameters["@message"].Value.ToString();
                    ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "Alert", "alert('" + message + "')", true);
                }
                else
                {
                    ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "Alert", "alert('New Password And Confirm Password Does Not Match')", true);
                }
            }
            catch (Exception)
            {
                throw;
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
}