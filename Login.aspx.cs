using System;
using System.Web.UI;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
using System.Linq;

public partial class adminLogin : Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void btnLogin_Click(object sender, EventArgs e)
    {
        using (SqlConnection con = new SqlConnection())
        {
            //temp notes: Also added Account table, and Login SQL Stored Procedure
            try
            {
                con.ConnectionString = ConfigurationManager.ConnectionStrings["CPDBCS"].ConnectionString;
                SqlCommand cmd = new SqlCommand();
                cmd.CommandText = "Login";
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.Clear();
                cmd.Parameters.Add("@UserName", SqlDbType.VarChar).Value = txtUser.Text;
                cmd.Parameters.Add("@Password", SqlDbType.VarChar).Value = txtPass.Text;
                cmd.Parameters.Add("@AccountId", SqlDbType.VarChar, 50);
                cmd.Parameters["@AccountId"].Direction = ParameterDirection.Output;
                cmd.Parameters.Add("@IsAllowEdit", SqlDbType.Bit);
                cmd.Parameters["@IsAllowEdit"].Direction = ParameterDirection.Output;
                cmd.Parameters.Add("@IsAdmin", SqlDbType.Bit);
                cmd.Parameters["@IsAdmin"].Direction = ParameterDirection.Output;
                cmd.Parameters.Add("@displayName", SqlDbType.VarChar, 255);
                cmd.Parameters["@displayName"].Direction = ParameterDirection.Output;
                cmd.Connection = con;
                con.Open();
                cmd.ExecuteNonQuery();

                string adminID = cmd.Parameters["@AccountId"].Value.ToString();
                bool isAllowEdit = (bool)cmd.Parameters["@IsAllowEdit"].Value;
                bool isAdmin = (bool)cmd.Parameters["@IsAdmin"].Value;
                var displayName = (string)cmd.Parameters["@displayName"].Value;

                if (!String.IsNullOrWhiteSpace(displayName)) { 
                    var stringTokens = displayName.Split(' ');
                    var firstName = stringTokens[0] ?? "";
                    var lastName = stringTokens[1] ?? "";
                    if(!String.IsNullOrWhiteSpace(firstName))
                        firstName = char.ToUpper(firstName[0]) + firstName.Substring(1).ToLower();
                    if(!String.IsNullOrWhiteSpace(lastName))
                        lastName = char.ToUpper(lastName[0]) + lastName.Substring(1).ToLower();
                    displayName = firstName + " " + lastName;
                }
                if (!string.IsNullOrEmpty(adminID))
                {
                    Session["UserID"] = adminID;
                    if (isAdmin)
                    {
                        Session["IsStudent"] = 0;
                    }
                    else
                    {
                        Session["IsStudent"] = 1;
                        Session["IsAllowEdit"] = isAllowEdit;
                    }
                    Session["DisplayName"] = displayName;
                    Response.Redirect("Home.aspx");
                }
                else
                {
                    ScriptManager.RegisterClientScriptBlock(this, GetType(), "alert", "alert('The Username or Password is incorrect.')", true);
                }
                con.Close();

            }
            catch (Exception ex)
            {
                var yourMomma = ex.Message;
                //throw new Exception(ex.Message);
            }
        };
    }}