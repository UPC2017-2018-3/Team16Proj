<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="SearchRoom.aspx.cs" Inherits="MBAMeetingRoom.BorrowRoom" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <meta name="description" content="" />
    <title>借用查询</title>
    <link href="http://g.alicdn.com/sj/dpl/1.5.1/css/sui.min.css" rel="stylesheet" />
    <link href="http://g.alicdn.com/sj/dpl/1.5.1/css/sui-append.css" rel="stylesheet" />
    <link href="styles/SearchRoom.css" rel="stylesheet" />
    <script type="text/javascript" src="http://g.alicdn.com/sj/lib/jquery/dist/jquery.min.js"></script>
    <script type="text/javascript" src="http://g.alicdn.com/sj/dpl/1.5.1/js/sui.min.js"></script>
</head>
<body>
    <form id="form1" runat="server" class="sui-form form-horizontal sui-validate">
        <%--nav start--%>
        <div class="sui-navbar">
            <div class="navbar-inner">
                <ul class="sui-nav">
                    <li>
                        <asp:LinkButton ID="mainpage" runat="server" OnClick="Mainpage_Click">主页</asp:LinkButton></li>
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
            <div id="select-borrow-info">
                <h1>借 用 查 询</h1>
                <div id="input-area">
                    <asp:TextBox ID="DatePicker" runat="server" data-rules="required" autocomplete="off" placeholder="请选择日期"></asp:TextBox><br />
                    <br />
                    <asp:DropDownList ID="RoomList" runat="server" DataTextField="MRName"></asp:DropDownList><br />
                    <br />
                    <asp:Button ID="btnSearch" runat="server" Text="查询" class="sui-btn" OnClick="btnSearch_Click" />
                </div>
            </div>
            <div id="divSearchResult">
                <br />
                <div id="result-area">
                    <asp:Label ID="TitleLabel" runat="server" Font-Bold="True" Font-Size="Medium"></asp:Label><br />
                    <asp:Table ID="ResultTable" runat="server" Visible="false" GridLines="Both" Width="100%">
                        <asp:TableHeaderRow>
                            <asp:TableHeaderCell>节数</asp:TableHeaderCell>
                            <asp:TableHeaderCell>状态</asp:TableHeaderCell>
                        </asp:TableHeaderRow>
                        <asp:TableRow>
                            <asp:TableCell>1，2节</asp:TableCell>
                            <asp:TableCell></asp:TableCell>
                        </asp:TableRow>
                        <asp:TableRow>
                            <asp:TableCell>3，4节</asp:TableCell>
                            <asp:TableCell></asp:TableCell>
                        </asp:TableRow>
                        <asp:TableRow>
                            <asp:TableCell>5，6节</asp:TableCell>
                            <asp:TableCell></asp:TableCell>
                        </asp:TableRow>
                        <asp:TableRow>
                            <asp:TableCell>7，8节</asp:TableCell>
                            <asp:TableCell></asp:TableCell>
                        </asp:TableRow>
                        <asp:TableRow>
                            <asp:TableCell>9，10节</asp:TableCell>
                            <asp:TableCell></asp:TableCell>
                        </asp:TableRow>
                    </asp:Table>
                    <br />
                    <div>
                        <asp:LinkButton ID="goToBorrowPage" runat="server" Visible="false" OnClick="goToBorrowPage_Click">借用当天</asp:LinkButton>
                    </div>
                </div>

            </div>
        </div>
    </form>
    <script>
        $('#DatePicker').datepicker({ size: "medium", startDate: "<%=DateTime.Now.ToShortDateString()%>" });
    </script>
</body>
</html>
