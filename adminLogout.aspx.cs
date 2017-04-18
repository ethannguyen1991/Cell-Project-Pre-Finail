using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class adminLogout : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if(!Page.IsPostBack)
        {
            Session.Abandon();
            Session.Clear();
            Session["studentloginDetails"] = null;
            Session["adminloginDetails"] = null;
            Response.Redirect("Login.aspx", false);
            ApplicationInstance.CompleteRequest();
        }
    }
}