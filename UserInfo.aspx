<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="UserInfo.aspx.cs" Inherits="MBAMeetingRoom.UserInfo" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <meta name="description" content="" />
    <title>个人信息</title>
    <link href="http://g.alicdn.com/sj/dpl/1.5.1/css/sui.min.css" rel="stylesheet" />
    <link href="http://g.alicdn.com/sj/dpl/1.5.1/css/sui-append.css" rel="stylesheet" />
    <script type="text/javascript" src="http://g.alicdn.com/sj/lib/jquery/dist/jquery.min.js"></script>
    <script type="text/javascript" src="http://g.alicdn.com/sj/dpl/1.5.1/js/sui.min.js"></script>
</head>
<body>
    <form id="form1" runat="server" class="sui-form form-horizontal">
        <!--nav start-->
        <div class="sui-navbar">
            <div class="navbar-inner">
                <ul class="sui-nav">
                    <li>
                        <asp:LinkButton ID="Mainpage" runat="server" OnClick="Mainpage_Click">主页</asp:LinkButton></li>
                    <li><a href="SearchRoom.aspx">借用</a></li>
                </ul>
                <ul class="sui-nav pull-right">
                    <li class="sui-dropdown">
                        <a href="javascript:void(0);" data-toggle="dropdown" class="dropdown-toggle">个人中心<i class="caret"></i></a>
                        <ul role="menu" class="sui-dropdown-menu">
                            <li role="presentation"><a role="menuitem" tabindex="-1" href="UserInfo.aspx">个人资料</a></li>
                            <li role="presentation"><a role="menuitem" tabindex="-1" href="UserBorrowingManagement.aspx">借用管理</a></li>
                            <li role="presentation">
                                <asp:LinkButton ID="btnExit" runat="server" role="menuitem" TabIndex="-1" OnClick="btnExit_Click">退出</asp:LinkButton>
                            </li>
                        </ul>
                    </li>
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
                <label for="Phone" class="control-label">电话号码</label>
                <div class="controls">
                    <asp:TextBox ID="Phone" runat="server" data-rules="required"></asp:TextBox>
                </div>
            </div>
            <div class="control-group">
                <asp:Button ID="BtnEdit" runat="server" Text="保存" OnClick="BtnEdit_Click" class="sui-btn btn-large btn-primary" />&nbsp;&nbsp;
                <asp:Button ID="BtnBack" runat="server" Text="返回" OnClick="BtnBack_Click" class="sui-btn btn-large" />
            </div>
        </div>
    </form>
</body>
</html>
