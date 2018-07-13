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
    public partial class EditUser : System.Web.UI.Page
    {
        private string connStr = System.Configuration.ConfigurationManager.ConnectionStrings["MBAMeetingRoomConStr"].ConnectionString;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["LoginName"] == null)
            {
                Response.Redirect("Login.aspx");
            }
            else if (Session["EditID"] == null || Session["EditID"].ToString() == "")
            {
                Response.Redirect("UserManagement.aspx");
            }
            else if (Session["UserType"].ToString() != "admin")
            {
                Response.Redirect("Login.aspx");
            }
            LoadUserInformation();
        }

        protected void LoadUserInformation()
        {
            string LoginName = Session["EditID"].ToString();
            string sql = "select * from tbUser where UserLoginName = '" + LoginName + "'";
            SqlConnection con = new SqlConnection(connStr);
            SqlCommand cmd = new SqlCommand(sql,con);
            DataSet ds = new DataSet();
            con.Open();
            SqlDataAdapter adapter = new SqlDataAdapter(sql, con);
            adapter.Fill(ds);
            LoginNM.Text = ds.Tables[0].Rows[0]["UserLoginName"].ToString();
            RealName.Text = ds.Tables[0].Rows[0]["UserName"].ToString();
            PassWD.Text = ds.Tables[0].Rows[0]["UserPWD"].ToString();
            UserType.SelectedValue = ds.Tables[0].Rows[0]["UserType"].ToString();
            Phone.Text = ds.Tables[0].Rows[0]["UserTel"].ToString();
            con.Close();
        }

        protected void BtnBack_Click(object sender, EventArgs e)
        {
            Session.Remove("EditID");
            Response.Redirect("UserManagement.aspx");
        }

        protected void BtnEdit_Click(object sender, EventArgs e)
        {
            string realname = RealName.Text;
            string passwd = PassWD.Text;
            string type = UserType.SelectedValue;
            string phone = Phone.Text;
            string loginName = LoginNM.Text;
            string sql = "update tbUser set UserName = '" + realname + "',UserPWD = '" + passwd + "',UserType = '" + type + "',UserTel = '" + phone + "' where UserLoginName = '" + loginName + "'";
            SqlConnection con = new SqlConnection(connStr);
            SqlCommand cmd = new SqlCommand(sql, con);
            con.Open();
            if (cmd.ExecuteNonQuery() == 1)
            {
                Response.Write("<script>alert('修改成功')</script>");
                con.Close();
                Response.Redirect("UserManagement.aspx");
            }
            else
            {
                Response.Write("<script>alert('修改失败')</script>");
                con.Close();
            }
        }

        protected void BtnDeleteUser_Click(object sender, EventArgs e)
        {
            if (LoginNM.Text != "" || LoginNM.Text != string.Empty)
            {
                string sql = "delete from tbUser where UserLoginName = '" + LoginNM.Text + "'";
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