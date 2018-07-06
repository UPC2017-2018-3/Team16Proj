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
    public partial class BorrowingManagement : System.Web.UI.Page
    {
        private string connStr = "Data Source=47.94.107.30;Initial Catalog=MBAMeetingRoom;User ID=admin;Password=123456";

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
            LoadInformation();
        }

        protected void LoadInformation()
        {
            string sql = "select * from tbMeetingRoomUse order by MRUID desc";
            SqlConnection con = new SqlConnection(connStr);
            SqlCommand cmd = new SqlCommand(sql, con);
            DataSet ds = new DataSet();
            con.Open();
            SqlDataAdapter sda = new SqlDataAdapter(sql, con);
            sda.Fill(ds);
            BorrowInfo.DataSource = ds;
            BorrowInfo.DataBind();
            con.Close();
        }

        protected void Unnamed1_Click(object sender, EventArgs e)
        {
            Response.Redirect("SearchRoom.aspx");
        }
    }
}