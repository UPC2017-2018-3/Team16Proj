<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="EditUser.aspx.cs" Inherits="MBAMeetingRoom.EditUser" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <meta name="description" content="" />
    <title>编辑用户</title>
    <link href="http://g.alicdn.com/sj/dpl/1.5.1/css/sui.min.css" rel="stylesheet" />
    <script type="text/javascript" src="http://g.alicdn.com/sj/lib/jquery/dist/jquery.min.js"></script>
    <script type="text/javascript" src="http://g.alicdn.com/sj/dpl/1.5.1/js/sui.min.js"></script>
</head>
<body>
    <form id="form1" runat="server" class="sui-form form-horizontal sui-validate">
        <!--nav start-->
        <div class="sui-navbar">
            <div class="navbar-inner">
                <ul class="sui-nav">
                    <li><a href="AdminIndex.aspx">主页</a></li>
                    <li><a href="BorrowingManagement.aspx">借用信息</a></li>
                    <li><a href="UserManagement.aspx">用户管理</a></li>
                    <li><a href="MessageManagement.aspx">通知发布</a></li>
                    <li><a href="RoomManagement.aspx">会议室管理</a></li>
                </ul>
            </div>
        </div>
        <!--nav end-->
        <div class="sui-container">
            <h2>编辑用户</h2>
            <div class="control-group">
                <label for="LoginNM" class="control-label">登录名</label>
                <div class="controls">
                    <asp:TextBox ID="LoginNM" runat="server" ReadOnly="true" class="uneditable-input" data-rules="required"></asp:TextBox>
                </div>
            </div>
            <div class="control-group">
                <label for="RealName" class="control-label">真实姓名</label>
                <div class="controls">
                    <asp:TextBox ID="RealName" runat="server" data-rules="required"></asp:TextBox>
                </div>
            </div>
            <div class="control-group">
                <label for="PassWD" class="control-label">密码</label>
                <div class="controls">
                    <asp:TextBox ID="PassWD" runat="server" data-rules="required"></asp:TextBox>
                </div>
            </div>
            <div class="control-group">
                <label for="UserType" class="control-label">用户类型</label>
                <div class="controls">
                    <asp:DropDownList ID="UserType" runat="server">
                        <asp:ListItem Value="user">用户</asp:ListItem>
                        <asp:ListItem Value="admin">管理员</asp:ListItem>
                    </asp:DropDownList>
                </div>
            </div>
            <div class="control-group">
                <label for="Phone" class="control-label">电话号码</label>
                <div class="controls">
                    <asp:TextBox ID="Phone" runat="server" data-rules="required"></asp:TextBox>
                </div>
            </div>
            <div class="control-group">
                <asp:Button ID="BtnEdit" runat="server" Text="保存" OnClick="BtnEdit_Click" class="sui-btn btn-large btn-primary" />&nbsp;&nbsp;
                <asp:Button ID="BtnBack" runat="server" Text="返回" OnClick="BtnBack_Click" class="sui-btn btn-large" />&nbsp;&nbsp;
                <asp:Button runat="server" ID="BtnDeleteUser" Text="删除" class="sui-btn btn-large btn-danger" OnClientClick="confirm('确认删除此用户吗');" OnClick="BtnDeleteUser_Click" />
            </div>
        </div>
    </form>
</body>
</html>
