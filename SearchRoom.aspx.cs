using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace MBAMeetingRoom
{
    public partial class BorrowRoom : System.Web.UI.Page
    {
        string connStr = System.Configuration.ConfigurationManager.ConnectionStrings["MBAMeetingRoomConStr"].ConnectionString;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["LoginName"] == null)
            {
                Response.Redirect("Login.aspx");
            }
            if (!Page.IsPostBack)
            {
                InitializeList();
            }
        }

        protected void btnExit_Click(object sender, EventArgs e)
        {
            Session.RemoveAll();
            Response.Redirect("Login.aspx");
        }

        protected void InitializeList()
        {
            string sql = "select MRName from tbMeetingRoom where MRStatus = 'open'";
            SqlConnection con = new SqlConnection(connStr);
            con.Open();
            SqlDataAdapter sda = new SqlDataAdapter(sql, con);
            DataSet ds = new DataSet();
            sda.Fill(ds, "MRName");
            RoomList.DataSource = ds.Tables["MRName"].DefaultView;
            RoomList.DataBind();
            con.Close();
        }

        protected void btnSearch_Click(object sender, EventArgs e)
        {
            string dateStr = DatePicker.Text.ToString();
            string roomStr = RoomList.SelectedValue.ToString();
            string roomUsed = getUsedTime();
            bool[] isUsed = new bool[10];
            TitleLabel.Text = roomStr + "在" + dateStr + "的使用情况";
            if (roomUsed != "")
            {
                string[] timeStr = roomUsed.TrimEnd(',').Split(',');
                for (int i = 0; i < timeStr.Length; i++)
                {
                    int block = int.Parse(timeStr[i]);
                    isUsed[block - 1] = true;
                }
            }
            for (int i = 1,s = 1; i < ResultTable.Rows.Count; i++)
            {
                if (isUsed[s])
                {
                    ResultTable.Rows[i].Cells[1].Text = "借用";
                    ResultTable.Rows[i].Cells[1].ForeColor = Color.Red;
                }
                else
                {
                    ResultTable.Rows[i].Cells[1].Text = "空闲";
                    ResultTable.Rows[i].Cells[1].ForeColor = Color.LightGreen;
                }
                s += 2;
            }
            ResultTable.Visible = true;
            goToBorrowPage.Visible = true;
        }

        protected string getUsedTime()
        {
            string dateStr = DatePicker.Text.ToString();
            string roomStr = RoomList.SelectedValue.ToString();
            string sql = "select MRUUseTime from tbMeetingRoomUse where MRUUseDateS = '" + dateStr + "' and MRID = (select MRID from tbMeetingRoom where MRName = '" + roomStr + "') and AdminReviewStatus = 'ok'";
            SqlConnection con = new SqlConnection(connStr);
            SqlCommand cmd = new SqlCommand(sql, con);
            con.Open();
            SqlDataAdapter adapter = new SqlDataAdapter(sql, con);
            DataSet ds = new DataSet();
            adapter.Fill(ds, "MRUUseTime");
            StringBuilder builder = new StringBuilder();
            foreach (DataTable item in ds.Tables)
            {
                foreach (DataRow items in item.Rows)
                {
                    builder.Append(items[0].ToString());
                }
            }
            con.Close();
            return builder.ToString();
        }

        protected void goToBorrowPage_Click(object sender, EventArgs e)
        {
            Session["BorrowDate"] = DatePicker.Text.ToString();
            Session["BorrowRoom"] = RoomList.SelectedValue.ToString();
            Response.Redirect("BorrowRoom.aspx");
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