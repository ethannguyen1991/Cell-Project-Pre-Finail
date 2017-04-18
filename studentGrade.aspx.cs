using System;
using System.Configuration;
using System.Data.SqlClient;
using System.Data;
public partial class studentGrade : System.Web.UI.Page
{
    SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["CPDBCS"].ConnectionString);
    SqlCommand cmd = new SqlCommand();
    DataSet dsGrade = new DataSet();
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
                cmd.Parameters.Clear();
                cmd.Parameters.Add("@studentId", SqlDbType.Int).Value = Convert.ToInt32(Session["UserID"]);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.CommandText = "SHOW_GRADE_TO_STUDENT";
                adp = new SqlDataAdapter(cmd);
                adp.Fill(dsGrade, "dsGrade");
                gridGrade.DataSource = dsGrade;
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
}