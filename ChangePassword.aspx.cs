using System;
using System.Web.UI;
using System.Configuration;
using System.Data.SqlClient;
using System.Data;
public partial class ChangePassword : System.Web.UI.Page
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
            try
            {
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }
                if (txtNewPass.Text.Equals(txtConfirmPass.Text))
                {                    
                    cmd.Connection = con;
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.CommandText = "ChangePassword";
                    cmd.Parameters.Clear();
                    cmd.Parameters.Add("@currentPassword", SqlDbType.VarChar).Value = txtOldPass.Text;
                    cmd.Parameters.Add("@accountId", SqlDbType.VarChar).Value = Convert.ToInt32(Session["UserID"]);
                    cmd.Parameters.Add("@newPassword", SqlDbType.VarChar).Value = txtConfirmPass.Text;
                    cmd.Parameters.Add("@success", SqlDbType.Bit);
                    cmd.Parameters["@success"].Direction = System.Data.ParameterDirection.Output;
                    cmd.ExecuteNonQuery();
                    
                    var success = (bool)cmd.Parameters["@success"].Value;
                if (success)
                    {
                        ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "Alert", "alert('Password Updated Successfuly')", true);
                    }
                    else
                    {
                        ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "Alert", "alert('Error - The current password entered is incorrect')", true);
                    }
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