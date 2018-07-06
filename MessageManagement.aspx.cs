using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace MBAMeetingRoom
{
    public partial class MessageManagement : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["LoginName"] == null)
            {
                Response.Redirect("Login.aspx");
            }
            else if (Session["UserType"] != null)
            {
                if (Session["UserType"].ToString() != "admin")
                {
                    Response.Redirect("UserIndex.aspx");
                }
            }
        }
    }
}