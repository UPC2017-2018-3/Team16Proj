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
    public partial class RoomManagement : System.Web.UI.Page
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
            ListBind();
        }

        protected void ListBind()
        {
            string queryStr = "select * from tbMeetingRoom";
            SqlConnection con = new SqlConnection(connStr);
            con.Open();
            SqlDataAdapter sda = new SqlDataAdapter(queryStr, con);
            DataSet ds = new DataSet();
            sda.Fill(ds);
            UserInfoList.DataSource = ds;
            UserInfoList.DataBind();
            con.Close();
        }

        protected void AddRoom()
        {
            string mrid = inputRoomID.Text;
            string mrLocation = inputRoomLocation.Text;
            string mrName = inputRoomName.Text;
            string mrCapacity = inputRoomCapacity.Text;
            string mrNote = inputRoomNote.Text;
            string mrStatus = statusList.SelectedValue;
            string sql = "insert into tbMeetingRoom values('" + mrid + "','" + mrName + "','" + mrLocation + "'," + mrCapacity + ",'" + mrNote + "','" + mrStatus + "')";
            SqlConnection con = new SqlConnection(connStr);
            SqlCommand cmd = new SqlCommand(sql, con);
            con.Open();
            try
            {
                if (cmd.ExecuteNonQuery() == 1)
                {
                    Response.Write("<script>alert('添加成功')</script>");
                }
            }
            catch (Exception)
            {

            }
            finally
            {
                con.Close();
                Response.Redirect("RoomManagement.aspx");
            }
        }

        protected void btnAddSubmit_Click(object sender, EventArgs e)
        {
            AddRoom();
        }
    }
}