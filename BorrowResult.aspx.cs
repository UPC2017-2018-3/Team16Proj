using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace MBAMeetingRoom
{
    public partial class BorrowResult : System.Web.UI.Page
    {
        string connStr = System.Configuration.ConfigurationManager.ConnectionStrings["MBAMeetingRoomConStr"].ConnectionString;

        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void LoadBasicInformation()
        {
            string sql = "select UserName from tbUser where UserLoginName=" + Session["LoginName"];
            SqlConnection con = new SqlConnection(connStr);
            SqlCommand cmd = new SqlCommand(sql, con);
            con.Open();
            string name = cmd.ExecuteScalar().ToString();
            NameLabel.Text = name + "老师你好，会议室借用成功，以下是你的借用信息:";

        }

        protected void btnExit_Click(object sender, EventArgs e)
        {
            Session.RemoveAll();
            Response.Redirect("Login.aspx");
        }

        protected void Mainpage_Click(object sender, EventArgs e)
        {
            if (Session["UserType"].ToString() == "admin")
            {
                Response.Redirect("AdminIndex.aspx");
            }
            else
            {
                Response.Redirect("UserIndex.aspx");
            }
        }
    }
}