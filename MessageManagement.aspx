<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="MessageManagement.aspx.cs" Inherits="MBAMeetingRoom.MessageManagement" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <meta name="description" content="" />
    <title>消息管理</title>
    <link href="http://g.alicdn.com/sj/dpl/1.5.1/css/sui.min.css" rel="stylesheet" />
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
                    <li><a href="BorrowingManagement.aspx">借用信息</a></li>
                    <li><a href="UserManagement.aspx">用户管理</a></li>
                    <li><a href="MessageManagement.aspx">通知发布</a></li>
                    <li><a href="RoomManagement.aspx">会议室管理</a></li>
                </ul>
                <ul class="sui-nav pull-right">
                    <li>
                        <button class="sui-btn btn-primary btn-lg">添加消息</button>
                    </li>
                </ul>
            </div>
        </div>
        <%--nav end--%>
    </form>
</body>
</html>
