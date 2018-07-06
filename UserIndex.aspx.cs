using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace MBAMeetingRoom
{
    public partial class UserIndex : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["LoginName"] == null)
            {
                Response.Redirect("Login.aspx");
            }
        }

        protected void btnExit_Click(object sender, EventArgs e)
        {
            Session.RemoveAll();
            Response.Redirect("Login.aspx");
        }
    }
}