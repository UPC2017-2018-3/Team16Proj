<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="BorrowRoom.aspx.cs" Inherits="MBAMeetingRoom.BorrowRoom1" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <meta name="description" content="" />
    <title>会议室借用</title>
    <link href="http://g.alicdn.com/sj/dpl/1.5.1/css/sui.min.css" rel="stylesheet" />
    <link href="http://g.alicdn.com/sj/dpl/1.5.1/css/sui-append.css" rel="stylesheet" />
    <link href="styles/BorrowRoom.css" rel="stylesheet" />
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
                        <asp:LinkButton ID="Mainpage" runat="server" OnClick="Mainpage_Click">主页</asp:LinkButton></li>
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
            <div id="borrow-content">
                <h1>选 择 借 用 节 数</h1>
                <div id="select-area">
                    <asp:Label ID="BorrowDateTip" runat="server" Font-Size="Large"></asp:Label><br /><br />
                    <asp:Label ID="BorrowRoomTip" runat="server" Font-Size="Large"></asp:Label><br /><br />
                    <asp:Label ID="SelectTip" runat="server" Text="点击拖动以多选" Font-Size="Large"></asp:Label><br />
                    <asp:ListBox ID="TimeListBox" runat="server" SelectionMode="Multiple" data-rules="required" style="width:100%;">
                        <asp:ListItem Value="1,2,">1，2大节</asp:ListItem>
                        <asp:ListItem Value="3,4,">3，4大节</asp:ListItem>
                        <asp:ListItem Value="5,6,">5，6大节</asp:ListItem>
                        <asp:ListItem Value="7,8,">7，8大节</asp:ListItem>
                        <asp:ListItem Value="9,10,">9，10大节</asp:ListItem>
                    </asp:ListBox>
                    <br /><br />
                    <asp:Label ID="NoteTip" runat="server" Text="输入借用理由:" Font-Size="Large"></asp:Label><br />
                    <textarea id="BorrowNote" cols="20" rows="2" runat="server" style="width:97%;"></textarea><br /><br />
                    <asp:Button ID="btnBorrow" runat="server" Text="借用" class="sui-btn" OnClientClick="confirm('确定要借用吗')" data-rules="required" OnClick="btnBorrow_Click" />
                </div>
            </div>
        </div>
    </form>
</body>
</html>
