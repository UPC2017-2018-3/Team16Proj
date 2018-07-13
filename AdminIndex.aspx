﻿<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AdminIndex.aspx.cs" Inherits="MBAMeetingRoom.AdminIndex" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <meta name="description" content="" />
    <title>管理员页面</title>
    <link href="http://g.alicdn.com/sj/dpl/1.5.1/css/sui.min.css" rel="stylesheet" />
    <link href="styles/AdminIndex.css" rel="stylesheet" />
    <script type="text/javascript" src="http://g.alicdn.com/sj/lib/jquery/dist/jquery.min.js"></script>
    <script type="text/javascript" src="http://g.alicdn.com/sj/dpl/1.5.1/js/sui.min.js"></script>
</head>
<body>
    <form id="form1" runat="server" class="sui-form">
        <%--nav start--%>
        <div class="sui-navbar">
            <div class="navbar-inner">
                <ul class="sui-nav">
                    <li><a href="AdminIndex.aspx">主页</a></li>
                    <li><a href="BorrowingManagement.aspx">借用信息</a></li>
                    <li><a href="UserManagement.aspx">用户管理</a></li>
                    <li><a href="RoomManagement.aspx">会议室管理</a></li>
                </ul>
                <ul class="sui-nav pull-right">
                    <li class="sui-dropdown">
                        <a href="javascript:void(0);" data-toggle="dropdown" class="dropdown-toggle">个人中心<i class="caret"></i></a>
                        <ul role="menu" class="sui-dropdown-menu">
                            <li role="presentation"><a role="menuitem" tabindex="-1" href="UserInfo.aspx">个人资料</a></li>
                            <li role="presentation">
                                <asp:LinkButton ID="btnExit" runat="server" role="menuitem" tabindex="-1" OnClick="btnExit_Click">退出</asp:LinkButton>
                            </li>
                        </ul>
                    </li>
                </ul>
            </div>
        </div>
        <%--nav end--%>
        <div class="sui-container">
            <h1>欢迎你，管理员</h1>
            <h2>今天是<%=DateTime.Now.Year %>年<%=DateTime.Now.Month %>月<%=DateTime.Now.Day %>日</h2>
            <br />
            <div id="pic-content">
                <div class="pics" style="float:right">
                    <a href="AdminIndex.aspx"><img src="pics\index_myinfo.png" /></a>
                </div>
                <div class="pics">
                    <a href="SearchRoom.aspx"><img src="pics\index_borrow.png" /></a>
                </div>
            </div>
        </div>
    </form>
</body>
</html>
