<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="BorrowResult.aspx.cs" Inherits="MBAMeetingRoom.BorrowResult" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <meta name="description" content="" />
    <title>借用结果</title>
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
                    <li><asp:LinkButton ID="Mainpage" runat="server" OnClick="Mainpage_Click">主页</asp:LinkButton></li>
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
        <div class="sui-container">
            <h2>借用成功</h2>
            <asp:Label ID="NameLabel" runat="server"></asp:Label><br />
            <div class="control-group">
                <label class="control-label">借用开始日期：</label>
                <div class="controls"><%=Session["BorrowDate"].ToString() %></div>
            </div>
            <div class="control-group">
                <label class="control-label">借用房间：</label>
                <div class="controls"><%=Session["BorrowRoom"].ToString() %></div>
            </div>
            <div class="control-group">
                <label class="control-label">借用节数：</label>
                <div class="controls"><%=Session["BorrowTimes"].ToString().TrimEnd(',') %>大节</div>
            </div>
            <span>借用之后请你按时到达，超时使用可能会与其他借用冲突，你可以在个人中心-借用管理里面查看和取消此次借用</span>
        </div>
    </form>
</body>
</html>
