using System;
using System.Collections;
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
        int PageSize = 15;
        int CurrentPage, RecordCount, PageCount;
        double PageCountdouble;

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
                CurrentPage = 0;
                ViewState["PageIndex"] = 0;
                RecordCount = CalculateRecord();
                CountLabel.Text = RecordCount.ToString();
                //计算总共有多少页
                PageCountdouble = Math.Ceiling((double)RecordCount / (double)PageSize);
                PageCount = (int)PageCountdouble;
                lblPageCount.Text = PageCount.ToString();
                ViewState["PageCount"] = PageCount;
            }
            ListBind();
        }

        private int CalculateRecord()
        {
            int intCount;
            string sql = "select count(*) as co from tbUser";
            SqlConnection con = new SqlConnection(connStr);
            SqlCommand MyComm = new SqlCommand(sql, con);
            con.Open();
            SqlDataReader dr = MyComm.ExecuteReader();
            if (dr.Read())
            {
                intCount = Int32.Parse(dr["co"].ToString());
            }
            else
            {
                intCount = 0;
            }
            dr.Close();
            con.Close();
            return intCount;
        }

        ICollection CreateSource()
        {
            int StartIndex;
            StartIndex = CurrentPage * PageSize;
            string sql = "select * from tbUser";
            SqlConnection con = new SqlConnection(connStr);
            DataSet ds = new DataSet();
            SqlDataAdapter MyAdapter = new SqlDataAdapter(sql, con);
            MyAdapter.Fill(ds, StartIndex, PageSize, "QandA");
            return ds.Tables["QandA"].DefaultView;
        }

        protected void ListBind()
        {
            UserInfoList.DataSource = CreateSource();
            UserInfoList.DataBind();
            NextPage.Enabled = true;
            PrevPage.Enabled = true;
            if (CurrentPage == (PageCount - 1)) NextPage.Enabled = false;
            if (CurrentPage == 0) PrevPage.Enabled = false;
            lblCurrentPage.Text = (CurrentPage + 1).ToString();
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

        protected void BtnEditConfirm_Click(object sender, EventArgs e)
        {
            Session["EditID"] = GetEditUser.Text;
            Response.Redirect("EditUser.aspx");
        }

        protected void PrevPage_Command(object sender, CommandEventArgs e)
        {
            CurrentPage = (int)ViewState["PageIndex"];
            PageCount = (int)ViewState["PageCount"];
            if (CurrentPage > 0) CurrentPage--;
            ViewState["PageIndex"] = CurrentPage;
            ListBind();
        }

        protected void NextPage_Command(object sender, CommandEventArgs e)
        {
            CurrentPage = (int)ViewState["PageIndex"];
            PageCount = (int)ViewState["PageCount"];
            if (CurrentPage < (PageCount - 1)) CurrentPage++;
            ViewState["PageIndex"] = CurrentPage;
            ListBind();
        }
    }
}