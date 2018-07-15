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
    public partial class Login : System.Web.UI.Page
    {
        private string connStr = System.Configuration.ConfigurationManager.ConnectionStrings["MBAMeetingRoomConStr"].ConnectionString;

        protected void Page_Load(object sender, EventArgs e)
        {
            msgLabel.Visible = false;
        }

        protected void submit_Click(object sender, EventArgs e)
        {
            string username = textUsername.Text.ToString();
            string password = textPassword.Text.ToString();
            if (ValidateInput(username,password))
            {
                string sql = "select UserLoginName from tbUser where UserLoginName='" + username + "' and UserPWD='" + password + "' and UserStatus = 'open'";
                SqlConnection conn = new SqlConnection(connStr);
                SqlCommand cmd = new SqlCommand(sql, conn);
                try
                {
                    conn.Open();
                    string validate = cmd.ExecuteScalar().ToString();
                    if (validate == username)
                    {
                        string idSql = "select UserType from tbUser where UserLoginName='" + username + "'";
                        SqlCommand idCmd = new SqlCommand(idSql, conn);
                        string type = idCmd.ExecuteScalar().ToString();
                        if (type == "admin")
                        {
                            Session["LoginName"] = username;
                            Session["UserType"] = type;
                            Response.Redirect("AdminIndex.aspx");
                        }
                        else
                        {
                            Session["LoginName"] = username;
                            Session["UserType"] = type;
                            Response.Redirect("UserIndex.aspx");
                        }
                    }
                    else
                    {
                        msgLabel.Text = "用户名或密码错误";
                        msgLabel.ForeColor = System.Drawing.Color.Red;
                        msgLabel.Visible = true;
                    }
                }
                catch (Exception)
                {
                    Response.Write("<script>alert('登陆失败')</script>");
                }
                finally
                {
                    conn.Close();
                }
            }
        }

        protected bool ValidateInput(string username,string password)
        {
            string[] forbiddenWords = new string[] { "select", "update", "delete", "'", "where", "--" };
            for (int i = 0; i < forbiddenWords.Length; i++)
            {
                if (username.ToLower().Contains(forbiddenWords[i]) || password.ToLower().Contains(forbiddenWords[i]))
                {
                    msgLabel.Text = "输入项含有非法字符";
                    msgLabel.ForeColor = System.Drawing.Color.Red;
                    msgLabel.Visible = true;
                    return false;
                }
            }
            return true;
        }
    }
}