<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="EditRoom.aspx.cs" Inherits="MBAMeetingRoom.EditRoom" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <meta name="description" content="" />
    <title>编辑会议室</title>
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
                    <li><a href="RoomManagement.aspx">会议室管理</a></li>
                </ul>
            </div>
        </div>
        <!--nav end-->
        <div class="sui-container">
            <h2>编辑会议室</h2>
            <div class="control-group">
                <label for="RoomID" class="control-label">会议室编号</label>
                <div class="controls">
                    <asp:TextBox ID="RoomID" runat="server" ReadOnly="true" class="uneditable-input" data-rules="required"></asp:TextBox>
                </div>
            </div>
            <div class="control-group">
                <label for="RoomName" class="control-label">会议室名称</label>
                <div class="controls">
                    <asp:TextBox ID="RoomName" runat="server" data-rules="required"></asp:TextBox>
                </div>
            </div>
            <div class="control-group">
                <label for="RoomLocation" class="control-label">会议室位置</label>
                <div class="controls">
                    <asp:TextBox ID="RoomLocation" runat="server" data-rules="required"></asp:TextBox>
                </div>
            </div>
            <div class="control-group">
                <label for="RoomStatus" class="control-label">会议室状态</label>
                <div class="controls">
                    <asp:DropDownList ID="RoomStatus" runat="server">
                        <asp:ListItem Value="open">开放</asp:ListItem>
                        <asp:ListItem Value="close">关闭</asp:ListItem>
                    </asp:DropDownList>
                </div>
            </div>
            <div class="control-group">
                <label for="Capacity" class="control-label">容量</label>
                <div class="controls">
                    <asp:TextBox ID="Capacity" runat="server" data-rules="required"></asp:TextBox>
                </div>
            </div>
            <div class="control-group">
                <label for="Note" class="control-label">备注</label>
                <div class="controls">
                    <textarea runat="server" id="Note"></textarea>
                </div>
            </div>
            <div class="control-group">
                <asp:Button ID="BtnEdit" runat="server" Text="保存" OnClick="BtnEdit_Click" class="sui-btn btn-large btn-primary" />&nbsp;&nbsp;
                <asp:Button ID="BtnBack" runat="server" Text="返回" OnClick="BtnBack_Click" class="sui-btn btn-large" />&nbsp;&nbsp;
                <asp:Button runat="server" ID="BtnDeleteRoom" Text="删除" class="sui-btn btn-large btn-danger" OnClientClick="confirm('确认删除此会议室吗');" OnClick="BtnDeleteRoom_Click" />
            </div>
        </div>
    </form>
</body>
</html>
