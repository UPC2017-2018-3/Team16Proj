<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="UserBorrowingManagement.aspx.cs" Inherits="MBAMeetingRoom.UserBorrowingManagement" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <meta name="description" content="" />
    <title>借用信息</title>
    <link href="http://g.alicdn.com/sj/dpl/1.5.1/css/sui.min.css" rel="stylesheet" />
    <link href="http://g.alicdn.com/sj/dpl/1.5.1/css/sui-append.css" rel="stylesheet" />
    <link href="styles/UserBorrowManage.css" rel="stylesheet" />
    <script type="text/javascript" src="http://g.alicdn.com/sj/lib/jquery/dist/jquery.min.js"></script>
    <script type="text/javascript" src="http://g.alicdn.com/sj/dpl/1.5.1/js/sui.min.js"></script>
</head>
<body>
    <form id="form1" runat="server" class="sui-form form-horizontal">
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
        <div class="sui-container">
            <asp:Repeater ID="RptBorrowInfo" runat="server" OnItemDataBound="RptBorrowInfo_ItemDataBound">
                <ItemTemplate>
                    <div class="info-card">
                        <div class="right">
                            <asp:Label ID="StatusLabel" runat="server" Visible="false"></asp:Label>
                            <asp:Button ID="BtnCancel" runat="server" Text="取消借用" Visible="false" />
                        </div>
                        <div class="left">
                            <div class="card-content">
                                <label>借用编号：</label>
                                <%#Eval("MRUID") %>
                            </div>
                            <div class="card-content">
                                <label>借用房间：</label>
                                <%#Eval("MRID") %>
                            </div>
                            <div class="card-content">
                                <label>借用时间：</label>
                                <%#Eval("MRURecDate") %>
                            </div>
                            <div class="card-content">
                                <label>开始日期：</label>
                                <%#Eval("MRUUseDateS").ToString().Split(' ')[0] %>
                            </div>
                            <div class="card-content">
                                <label>借用节数：</label>
                                <%#Eval("MRUUseTime").ToString().TrimEnd(',') %>
                            </div>
                        </div>
                    </div>
                </ItemTemplate>
            </asp:Repeater>
        </div>
    </form>
</body>
</html>
