using System;
using System.Web.UI;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
using System.Web.UI.WebControls;
using System.Linq;
using System.Collections.Generic;

public partial class Content : Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        #region Validating session
        if (Session["UserID"] == null || Session["IsStudent"] == null)
        {
            Response.Redirect("index.html", false);
            ApplicationInstance.CompleteRequest();
        }
        #endregion

        if (!IsPostBack)
        {
            BindListbox(GetContentDetails());
        }
    }
    

    private List<int> GetContentDetails()
    {
        List<int> SubContentID = null;
        #region Bind data as per content ID
        if (Session["ContentID"] != null)
        {
            int contentid= Convert.ToInt32(Session["ContentID"]);
            using (CellEntities context = new CellEntities())
            {
                SubContentID = (from rs in context.SubContents where rs.ParentID == contentid select rs.ChildID).ToList();
                //SubContentID = new List<int> { 1 };
            }
            using (SqlConnection con = new SqlConnection())
            {
                con.ConnectionString = ConfigurationManager.ConnectionStrings["CPDBCS"].ConnectionString;
                SqlCommand cmd = new SqlCommand();
                cmd.CommandText = "ShowContent";
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.Clear();
                cmd.Parameters.Add("@UserID", SqlDbType.Int).Value = Convert.ToInt32(Session["UserID"]);
                cmd.Parameters.Add("@ContentID", SqlDbType.Int).Value = Convert.ToInt32(Session["ContentID"]);
                cmd.Connection = con;
                con.Open();
                SqlDataReader dr = cmd.ExecuteReader();
                if (dr.Read())
                {
                    txtHeadingID.Text = dr["HeadingID"].ToString();
                    txtHeadingText.Text = dr["HeadingText"].ToString();
                    txtContent.Text = dr["Contents"].ToString();
                    Link1Caption.Text = dr["Link1Caption"].ToString();
                    Link2Caption.Text = dr["Link2Caption"].ToString();
                    Link3Caption.Text = dr["Link3Caption"].ToString();
                    Link4Caption.Text = dr["Link4Caption"].ToString();
                    Link5Caption.Text = dr["Link5Caption"].ToString();
                    Link6Caption.Text = dr["Link6Caption"].ToString();
                    Link1Description.Text = dr["Link1Description"].ToString();
                    Link2Description.Text = dr["Link2Description"].ToString();
                    Link3Description.Text = dr["Link3Description"].ToString();
                    Link4Description.Text = dr["Link4Description"].ToString();
                    Link5Description.Text = dr["Link5Description"].ToString();
                    Link6Description.Text = dr["Link6Description"].ToString();
                }
            };
        }
        return SubContentID;
        #endregion
    }

    private void BindListbox(List<int> SubContentID)
    {
        #region Bind contents to checkbox list
        int contentid = Convert.ToInt32(Session["ContentID"]);
        using (CellEntities context = new CellEntities())
        {
            var contentlist = (from rs in context.Contents where rs.IsActive == true select rs).ToList();
            foreach (var contentitm in contentlist)
            {
                if (contentid != contentitm.ContentID)
                {
                    ListItem item = new ListItem();
                    item.Text = contentitm.HeadingText;
                    item.Value = contentitm.ContentID.ToString();
                    if (SubContentID != null)
                    {
                        if (SubContentID.Contains(contentitm.ContentID))
                            item.Selected = true;
                    }
                    chkChoices.Items.Add(item);
                }
            }

        }
       
        #endregion
    }
    protected void btnClear_Click(object sender, EventArgs e)
    {
        this.ClearControl();
        BindListbox(GetContentDetails());
    }

    private void ClearControl()
    {
        Link1Caption.Text = "";
        Link2Caption.Text = "";
        Link3Caption.Text = "";
        Link1Description.Text = "";
        Link2Description.Text = "";
        Link3Description.Text = "";
        txtHeadingID.Text = "";
        txtHeadingText.Text = "";
        txtContent.Text = "";
        foreach (ListItem item in chkChoices.Items)
        {
            item.Selected = false;
        }
    }
    protected void btnSave_Click(object sender, EventArgs e)
    {
        using (SqlConnection con = new SqlConnection())
        {
            con.ConnectionString = ConfigurationManager.ConnectionStrings["CPDBCS"].ConnectionString;
            try
            {
                #region Declaration
                int hasCommentBox = 0;
                if (chkCommentBox.Checked)
                {
                    hasCommentBox = 1;
                }
                int hasButtons = 1;
               
                int isStudent = Convert.ToInt32(Session["IsStudent"]);
                string userID = Session["UserID"].ToString();

                string image = null;
                if (fileImage.HasFile)
                {
                    image = DateTime.Now.ToString("yyyyMMddHHmmssfff").ToString() + ".jpg";
                    string filePath = "ContentImages/" + image;
                    fileImage.SaveAs(Server.MapPath(filePath));
                }

                int contentID = -1;
                if (Session["ContentID"] != null)
                {
                    contentID = Convert.ToInt32(Session["ContentID"]);
                    
                    SqlCommand cmdd = new SqlCommand();
                    cmdd.CommandText = "DeleteSubContent";
                    cmdd.CommandType = CommandType.StoredProcedure;
                    cmdd.Parameters.Clear();
                    cmdd.Parameters.Add("@ParentId", SqlDbType.Int).Value = contentID;
                    cmdd.Connection = con;
                    if (con.State == ConnectionState.Closed)
                        con.Open();
                    cmdd.ExecuteNonQuery();
                }
                #endregion

                #region Saving parent content
                SqlCommand cmd = new SqlCommand();
                cmd.CommandText = "SaveContent";
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.Clear();
                cmd.Parameters.Add("@ContentID", SqlDbType.Int).Value = contentID;
                cmd.Parameters.Add("@HeadingID", SqlDbType.VarChar).Value = txtHeadingID.Text;
                cmd.Parameters.Add("@HeadingText", SqlDbType.VarChar).Value = txtHeadingText.Text;
                cmd.Parameters.Add("@Contents", SqlDbType.VarChar).Value = txtContent.Text;
                if (!string.IsNullOrEmpty(image))
                {
                    cmd.Parameters.Add("@Image", SqlDbType.VarChar).Value = image;
                }
                cmd.Parameters.Add("@Link1Caption", SqlDbType.VarChar).Value = Link1Caption.Text;
                cmd.Parameters.Add("@Link1Description", SqlDbType.VarChar).Value = Link1Description.Text;
                cmd.Parameters.Add("@Link2Caption", SqlDbType.VarChar).Value = Link2Caption.Text;
                cmd.Parameters.Add("@Link2Description", SqlDbType.VarChar).Value = Link2Description.Text; 
                cmd.Parameters.Add("@Link3Caption", SqlDbType.VarChar).Value = Link3Caption.Text;
                cmd.Parameters.Add("@Link3Description", SqlDbType.VarChar).Value = Link3Description.Text; 

                cmd.Parameters.Add("@Link4Caption", SqlDbType.VarChar).Value = Link4Caption.Text;
                cmd.Parameters.Add("@Link4Description", SqlDbType.VarChar).Value = Link4Description.Text;
                cmd.Parameters.Add("@Link5Caption", SqlDbType.VarChar).Value = Link5Caption.Text;
                cmd.Parameters.Add("@Link5Description", SqlDbType.VarChar).Value = Link5Description.Text; 
                cmd.Parameters.Add("@Link6Caption", SqlDbType.VarChar).Value = Link6Caption.Text;
                cmd.Parameters.Add("@Link6Description", SqlDbType.VarChar).Value = Link6Description.Text; 

                cmd.Parameters.Add("@HasCommentBox", SqlDbType.Bit).Value = hasCommentBox;
                cmd.Parameters.Add("@HasButtons", SqlDbType.Bit).Value = hasButtons;
                cmd.Parameters.Add("@IsCreatedByStudent", SqlDbType.Int).Value = isStudent;
                cmd.Parameters.Add("@CreatedBy", SqlDbType.Int).Value = userID;
                cmd.Parameters.Add("@NewContentID", SqlDbType.VarChar, 50);
                cmd.Parameters["@NewContentID"].Direction = ParameterDirection.Output;
                cmd.Connection = con;
                if(con.State==ConnectionState.Closed)
                con.Open();
                cmd.ExecuteNonQuery();
                string newContentID = cmd.Parameters["@NewContentID"].Value.ToString();
                #endregion
                Session["ContentID"] = newContentID;
                #region Saving child content
                CellEntities context = new CellEntities();
                
                foreach (ListItem childSubContentID in chkChoices.Items)
                {
                    
                    int isDel = 0;
                    if (!childSubContentID.Selected)
                    {
                        isDel = 1;
                    }
                    if (childSubContentID.Selected)
                    {
                        
                        int childID = Convert.ToInt32(childSubContentID.Value);
                        cmd.CommandText = "SaveSubContent";
                        cmd.CommandType = CommandType.StoredProcedure;
                        cmd.Parameters.Clear();
                        cmd.Parameters.Add("@ParentID", SqlDbType.Int).Value = newContentID;
                        cmd.Parameters.Add("@ChildID", SqlDbType.Int).Value = childID;
                        cmd.Parameters.Add("@IsDeleted", SqlDbType.Int).Value = isDel;
                        cmd.Connection = con;
                        if (con.State == ConnectionState.Closed)
                            con.Open();
                        cmd.ExecuteNonQuery();
                    }
                }
                #endregion
                ScriptManager.RegisterClientScriptBlock(this, GetType(), "alert", "alert('Content saved successfully')", true);
            }
            catch (Exception ex)
            {
                throw new Exception(ex.Message);
            }
        };
        Response.Redirect("ShowContents.aspx", false);
        ApplicationInstance.CompleteRequest();
    }
    
}