<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="UserIndex.aspx.cs" Inherits="MBAMeetingRoom.UserIndex" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <meta name="description" content="" />
    <title>首页</title>
    <link href="http://g.alicdn.com/sj/dpl/1.5.1/css/sui.min.css" rel="stylesheet" />
    <link href="http://g.alicdn.com/sj/dpl/1.5.1/css/sui-append.css" rel="stylesheet" />
    <script type="text/javascript" src="http://g.alicdn.com/sj/lib/jquery/dist/jquery.min.js"></script>
    <script type="text/javascript" src="http://g.alicdn.com/sj/dpl/1.5.1/js/sui.min.js"></script>
</head>
<body>
    <form id="form1" runat="server">
        <%--nav start--%>
        <div class="sui-navbar">
            <div class="navbar-inner">
                <ul class="sui-nav">
                    <li><a href="AdminIndex.aspx">主页</a></li>
                    <li><a href="SearchRoom.aspx">借用</a></li>
                    <li><a href="#">通知</a></li>
                </ul>
                <ul class="sui-nav pull-right">
                    <li class="sui-dropdown">
                        <a href="javascript:void(0);" data-toggle="dropdown" class="dropdown-toggle">个人中心<i class="caret"></i></a>
                        <ul role="menu" class="sui-dropdown-menu">
                            <li role="presentation"><a role="menuitem" tabindex="-1" href="#">个人资料</a></li>
                            <li role="presentation"><a role="menuitem" tabindex="-1" href="UserBorrowingManagement.aspx">借用管理</a></li>
                            <li role="presentation">
                                <asp:LinkButton ID="btnExit" runat="server" role="menuitem" TabIndex="-1" OnClick="btnExit_Click">退出</asp:LinkButton>
                            </li>
                        </ul>
                    </li>
                </ul>
            </div>
        </div>
        <%--nav end--%>
    </form>
</body>
</html>
