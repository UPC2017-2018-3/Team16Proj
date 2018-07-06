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
    public partial class UserBorrowingManagement : System.Web.UI.Page
    {
        string connStr = "Data Source=47.94.107.30;Initial Catalog=MBAMeetingRoom;User ID=admin;Password=123456";

        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["LoginName"] == null)
            {
                Response.Redirect("Login.aspx");
            }
            LoadInformation();
        }

        protected void LoadInformation()
        {
            string sql = "select * from tbMeetingRoomUse where UserID = (select UserID from tbUser where UserLoginName = '" + Session["LoginName"] + "') order by MRUID desc";
            SqlConnection con = new SqlConnection(connStr);
            SqlCommand cmd = new SqlCommand(sql, con);
            DataSet ds = new DataSet();
            con.Open();
            SqlDataAdapter sda = new SqlDataAdapter(sql, con);
            sda.Fill(ds);
            RptBorrowInfo.DataSource = ds;
            RptBorrowInfo.DataBind();
            GetBtnStatus(ds);
            con.Close();
        }

        protected void btnExit_Click(object sender, EventArgs e)
        {
            Session.RemoveAll();
            Response.Redirect("Login.aspx");
        }

        protected void GetBtnStatus(DataSet ds)
        {
            string[] borrowTimes, borrowDates;
            int timeEnd, endTime;
            int[] iborrowDates = new int[3];
            for (int i = 0; i < ds.Tables[0].Rows.Count; i++)
            {
                borrowDates = ds.Tables[0].Rows[i]["MRUUseDateS"].ToString().Split(' ')[0].Split('/');
                borrowTimes = ds.Tables[0].Rows[i]["MRUUseTime"].ToString().TrimEnd(',').Split(',');
                timeEnd = int.Parse(borrowTimes[borrowTimes.Length - 1]);
                for (int j = 0; j < borrowDates.Length; j++)
                {
                    iborrowDates[j] = int.Parse(borrowDates[j]);
                }
                switch (timeEnd)
                {
                    case 2:endTime = 10;break;
                    case 4:endTime = 12;break;
                    case 6:endTime = 16;break;
                    case 8:endTime = 18;break;
                    case 10:endTime = 21;break;
                    default:endTime = 0;break;
                }
                DateTime t = new DateTime(iborrowDates[0], iborrowDates[1], iborrowDates[2], endTime, 0, 0);
                if (DateTime.Compare(t,DateTime.Now) < 0)
                {
                    Label label = (Label)RptBorrowInfo.Items[i].FindControl("StatusLabel");
                    label.Visible = true;
                    label.Text = "已完成";
                }
                else
                {
                    Button button=(Button)RptBorrowInfo.Items[i].FindControl("BtnCancel");
                    button.Visible = true;
                }
            }
        }

        protected void RptBorrowInfo_ItemDataBound(object sender, RepeaterItemEventArgs e)
        {
            
        }
    }
}