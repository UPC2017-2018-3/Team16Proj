﻿using System;
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
        private string connStr = System.Configuration.ConfigurationManager.ConnectionStrings["MBAMeetingRoomConStr"].ConnectionString;

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
            if (!Page.IsPostBack)
            {
                LoadInformation();
                BorrowIndex.Attributes.Add("ReadOnly", "true");
            }
        }

        protected void LoadInformation()
        {
            string sql = "select top 20 * from tbMeetingRoomUse order by MRUID desc";
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

        protected void BtnEditConfirm_Click(object sender, EventArgs e)
        {
            string sql = "update tbMeetingRoomUse set AdminReviewNote = '" + FeedbackText.InnerText + "' where MRUID = " + BorrowIndex.Text;
            SqlConnection con = new SqlConnection(connStr);
            SqlCommand cmd = new SqlCommand(sql, con);
            con.Open();
            if (cmd.ExecuteNonQuery() == 1)
            {
                Response.Write("<script>alert('添加成功')</script>");
            }
            else
            {
                Response.Write("<script>alert('添加失败')</script>");
            }
            con.Close();
        }
    }
}