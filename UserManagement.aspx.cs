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
    public partial class UserManagement : System.Web.UI.Page
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
            string queryStr = "select * from tbUser";
            SqlConnection con = new SqlConnection(connStr);
            SqlCommand cmd = new SqlCommand(queryStr, con);
            con.Open();
            SqlDataAdapter sda = new SqlDataAdapter(queryStr, con);
            DataSet ds = new DataSet();
            sda.Fill(ds);
            UserInfoList.DataSource = ds;
            UserInfoList.DataBind();
            CountLabel.Text = "共有 " + ds.Tables[0].Rows.Count + " 条记录";
            con.Close();
        }

        protected void AddUser()
        {
            string loginname = inputLoginName.Text;
            string realname = inputRealName.Text;
            string passwd = inputPassword.Text;
            string type = chooseType.SelectedValue;
            string phone = inputPhone.Text;
            string sql = "insert into tbUser values('" + loginname + "','" + passwd + "','" + realname + "','" + type + "','" + phone + "','','')";
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
                Response.Redirect("UserManagement.aspx");
            }
        }

        protected void btnAddSubmit_Click(object sender, EventArgs e)
        {
            AddUser();
        }

        protected void BtnDeleteUser_Click(object sender, EventArgs e)
        {
            Response.Write("111111111");
        }
    }
}