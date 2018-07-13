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
    public partial class EditRoom : System.Web.UI.Page
    {
        string connStr=System.Configuration.ConfigurationManager.ConnectionStrings["MBAMeetingRoomConStr"].ConnectionString;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["LoginName"] == null)
            {
                Response.Redirect("Login.aspx");
            }
            else if (Session["EditRID"] == null || Session["EditRID"].ToString() == "")
            {
                Response.Redirect("RoomManagement.aspx");
            }
            else if (Session["UserType"].ToString() != "admin")
            {
                Session.RemoveAll();
                Response.Redirect("Login.aspx");
            }
            LoadRoomInformation();
        }

        protected void LoadRoomInformation()
        {
            string MRID = Session["EditRID"].ToString();
            string sql = "select * from tbMeetingRoom where MRID = '" + MRID + "'";
            SqlConnection con = new SqlConnection(connStr);
            SqlCommand cmd = new SqlCommand(sql, con);
            DataSet ds = new DataSet();
            con.Open();
            SqlDataAdapter adapter = new SqlDataAdapter(sql, con);
            adapter.Fill(ds);
            RoomID.Text = ds.Tables[0].Rows[0]["MRID"].ToString();
            RoomName.Text = ds.Tables[0].Rows[0]["MRName"].ToString();
            RoomLocation.Text = ds.Tables[0].Rows[0]["MRLocation"].ToString();
            RoomStatus.SelectedValue = ds.Tables[0].Rows[0]["MRStatus"].ToString();
            Capacity.Text = ds.Tables[0].Rows[0]["MRCapacity"].ToString();
            Note.InnerText= ds.Tables[0].Rows[0]["MRNote"].ToString();
            con.Close();
        }

        protected void BtnEdit_Click(object sender, EventArgs e)
        {
            string id = RoomID.Text;
            string name = RoomName.Text;
            string location = RoomLocation.Text;
            string status = RoomStatus.SelectedValue;
            string capacity = Capacity.Text;
            string note = Note.InnerText;
            string sql = "update tbMeetingRoom set MRName = '" + name + "',MRLocation = '" + location + "',MRStatus = '" + status + "',MRCapacity = '" + capacity + "'";
            if (note != string.Empty)
            {
                sql += ",MRNote = '" + note + "'";
            }
            sql += " where MRID = '" + id + "'";
            SqlConnection con = new SqlConnection(connStr);
            SqlCommand cmd = new SqlCommand(sql, con);
            con.Open();
            if (cmd.ExecuteNonQuery() == 1)
            {
                Response.Write("<script>alert('修改成功')</script>");
                con.Close();
                Response.Redirect("RoomManagement.aspx");
            }
            else
            {
                Response.Write("<script>alert('修改失败')</script>");
                con.Close();
            }
        }

        protected void BtnBack_Click(object sender, EventArgs e)
        {
            Session.Remove("EditRID");
            Response.Redirect("RoomManagement.aspx");
        }

        protected void BtnDeleteRoom_Click(object sender, EventArgs e)
        {
            if (RoomID.Text != "" || RoomID.Text != string.Empty)
            {
                string sql = "delete from tbMeetingRoom where MRID = '" + RoomID.Text + "'";
                SqlConnection con = new SqlConnection(connStr);
                SqlCommand cmd = new SqlCommand(sql, con);
                con.Open();
                if (cmd.ExecuteNonQuery() == 1)
                {
                    Response.Write("<script>alert('删除成功')</script>");
                    con.Close();
                    Response.Redirect("UserManagement.aspx");
                }
                else
                {
                    Response.Write("<script>alert('删除失败')</script>");
                    con.Close();
                }
            }
        }
    }
}