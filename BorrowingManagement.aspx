<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="BorrowingManagement.aspx.cs" Inherits="MBAMeetingRoom.BorrowingManagement" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <meta name="description" content="" />
    <title>借用管理</title>
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
                        <asp:Button runat="server" data-toggle="modal" data-target="#divAddBorrow" data-keyboard="false" class="sui-btn btn-primary btn-lg" Text="添加借用" OnClick="Unnamed1_Click"></asp:Button>
                    </li>
                </ul>
            </div>
        </div>
        <%--nav end--%>
        <div class="sui-container">
            <h2>借用管理</h2>
            <table style="text-align:center;width:100%;">
                <thead>
                    <tr>
                        <th style="width:10%">借用编号</th>
                        <th style="width:15%">借用房间</th>
                        <th style="width:15%">借用时间</th>
                        <th style="width:10%">开始时间</th>
                        <th style="width:10%">借用节数</th>
                        <th style="width:25%">借用理由</th>
                        <th style="width:15%">操作</th>
                    </tr>
                </thead>
                <tbody style="width: 100%;text-align:center;">
                    <asp:DataList ID="BorrowInfo" runat="server" style="width: 100%;text-align:center;">
                        <ItemTemplate>
                            <tr>
                                <td style="width: 10%"><%#Eval("MRUID") %></td>
                                <td style="width: 15%"><%#Eval("MRID") %></td>
                                <td style="width: 15%"><%#Eval("MRURecDate") %></td>
                                <td style="width: 10%"><%#Eval("MRUUseDateS").ToString().Split(' ')[0] %></td>
                                <td style="width: 10%"><%#Eval("MRUUseTime").ToString().TrimEnd(',') %></td>
                                <td style="width: 25%"><%#Eval("MRUUseNote") %></td>
                                <td style="width: 15%">anniu
                                </td>
                            </tr>
                        </ItemTemplate>
                    </asp:DataList>
                </tbody>
            </table>
        </div>
    </form>
</body>
</html>
