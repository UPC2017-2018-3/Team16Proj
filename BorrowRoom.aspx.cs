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
    public partial class BorrowRoom1 : System.Web.UI.Page
    {
        string connStr = System.Configuration.ConfigurationManager.ConnectionStrings["MBAMeetingRoomConStr"].ConnectionString;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["LoginName"] == null)
            {
                Response.Redirect("Login.aspx");
            }
            if (Session["BorrowDate"] == null || Session["BorrowRoom"] == null)
            {
                Response.Write("<script>alert('请选择借用信息');</script>");
                Response.Redirect("SearchRoom.aspx");
            }
            else
            {
                BorrowDateTip.Text = "借用日期:" + Session["BorrowDate"];
                BorrowRoomTip.Text = "借用房间:" + Session["BorrowRoom"];
            }
        }

        protected void btnExit_Click(object sender, EventArgs e)
        {
            Session.RemoveAll();
            Response.Redirect("Login.aspx");
        }

        protected bool ValidateBorrowStatus()
        {
            string usedTime = GetUsedTime();
            bool[] isUsed = new bool[10];
            bool[] isSelected = new bool[10];
            bool[] validate = new bool[10];
            if (usedTime != "")
            {
                string[] usedTimes = usedTime.TrimEnd(',').Split(',');
                string[] selectedTimes = GetSelectedBorrowTimes().TrimEnd(',').Split(',');
                for (int i = 0; i < usedTimes.Length; i++)
                {
                    int block = int.Parse(usedTimes[i]);
                    isUsed[block - 1] = true;
                }
                for (int i = 0; i < selectedTimes.Length; i++)
                {
                    int block = int.Parse(selectedTimes[i]);
                    isSelected[block - 1] = true;
                }
                for (int i = 0; i < 10; i++)
                {
                    validate[i] = isUsed[i] & isSelected[i];
                    if (validate[i])
                    {
                        return false;
                    }
                }
            }
            return true;
        }

        protected string GetSelectedBorrowTimes()
        {
            string selectedItems = "";
            for (int i = 0; i < TimeListBox.Items.Count; i++)
            {
                if (TimeListBox.Items[i].Selected)
                {
                    selectedItems += TimeListBox.Items[i].Value;
                }
            }
            return selectedItems;
        }

        protected void BorrowRoom()
        {
            string sql = "insert into tbMeetingRoomUse values((select MRID from tbMeetingRoom where MRName='" + Session["BorrowRoom"] + "'),(select UserID from tbUser where UserLoginName='" + Session["LoginName"] + "'),'" + DateTime.Now.ToString() + "','" + Session["BorrowDate"] + "','" + Session["BorrowDate"] + "','" + BorrowNote.InnerText.ToString() + "','ok','" + GetSelectedBorrowTimes() + "','')";
            SqlConnection con = new SqlConnection(connStr);
            SqlCommand cmd = new SqlCommand(sql, con);
            con.Open();
            int validate = cmd.ExecuteNonQuery();
            if (validate == 1)
            {
                Session["BorrowTimes"] = GetSelectedBorrowTimes();
                Response.Redirect("BorrowResult.aspx");
            }
            else
            {
                Response.Write("<script>alert('借用失败')</script>");
            }
        }

        protected void btnBorrow_Click(object sender, EventArgs e)
        {
            if (ValidateSession())
            {
                if (ValidateBorrowStatus())
                {
                    BorrowRoom();
                }
                else
                {
                    Response.Write("<script>alert('当前有借用冲突，请重新查询')</script>");
                    Response.Redirect("SearchRoom.aspx");
                }
            }
            else
            {
                Response.Redirect("SearchRoom.aspx");
            }
        }

        protected bool ValidateSession()
        {
            if (Session["BorrowDate"] == null || Session["BorrowRoom"] == null)
            {
                return false;
            }
            else if(Session["LoginName"] == null)
            {
                return false;
            }
            return true;
        }

        protected string GetUsedTime()
        {
            string dateStr = Session["BorrowDate"].ToString();
            string roomStr = Session["BorrowRoom"].ToString();
            string sql = "select MRUUseTime from tbMeetingRoomUse where MRUUseDateS = '"+dateStr+"' and MRID = (select MRID from tbMeetingRoom where MRName = '"+roomStr+"') and AdminReviewStatus = 'ok'";
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