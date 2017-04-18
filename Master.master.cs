using System;
using System.Web.UI;

public partial class Master : MasterPage
{

    protected void Page_Init(object sender, EventArgs e)
    {
        if (Session["UserID"] == null || Session["IsStudent"] == null)
        {
            Response.Redirect("index.html", false);
            ApplicationInstance.CompleteRequest();
        }
    }
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["UserID"] != null && Convert.ToInt32(Session["IsStudent"]) == 0)
        {
            adminGrade.Visible = true;
            studGrade.Visible = false;
            manageStudent.Visible = true;
        }
        else if (Session["UserID"] != null && Convert.ToInt32(Session["IsStudent"]) != 0)
        {
            studGrade.Visible = true;
            adminGrade.Visible = false;
            manageStudent.Visible = false;
        }
    }

    protected void lnkscenario_Click(object sender, EventArgs e)
    {
        if (Session["UserID"] != null && Convert.ToInt32(Session["IsStudent"]) != 1)
        {
            Response.Redirect("ShowScenarios.aspx", false);
            ApplicationInstance.CompleteRequest();
        }
        else if (Convert.ToBoolean(Session["IsAllowEdit"]) == true)
        {
            Response.Redirect("ShowScenarios.aspx", false);
            ApplicationInstance.CompleteRequest();
        }

    }
}
