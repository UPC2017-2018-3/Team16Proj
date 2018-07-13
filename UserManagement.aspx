<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="UserManagement.aspx.cs" Inherits="MBAMeetingRoom.UserManagement" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <meta name="description" content="" />
    <title>用户管理</title>
    <link href="http://g.alicdn.com/sj/dpl/1.5.1/css/sui.min.css" rel="stylesheet" />
    <script type="text/javascript" src="http://g.alicdn.com/sj/lib/jquery/dist/jquery.min.js"></script>
    <script type="text/javascript" src="http://g.alicdn.com/sj/dpl/1.5.1/js/sui.min.js"></script>
    <script type="text/javascript" src="Scripts/UserManagement.js"></script>
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
                <ul class="sui-nav pull-right">
                    <li>
                        <button data-toggle="modal" data-target="#divAddUsers" data-keyboard="false" class="sui-btn btn-primary btn-lg" onclick="addValidate();">添加用户</button>
                    </li>
                </ul>
                <div class="pull-right sui-form" style="margin-right: 10px;">
                    <asp:TextBox ID="inputSearch" runat="server" placeholder="搜索用户名"></asp:TextBox>
                    <asp:Button ID="btnSearch" runat="server" Text="搜索" CssClass="sui-btn" OnClientClick="removeValidate();" />
                </div>
            </div>
        </div>
        <!--nav end-->
        <div class="sui-container">
            <h2>用户管理</h2>
            <table style="text-align: center; width: 100%;">
                <thead>
                    <tr>
                        <th style="width: 15%">用户编号</th>
                        <th style="width: 15%">登录名</th>
                        <th style="width: 15%">真实姓名</th>
                        <th style="width: 15%">用户密码</th>
                        <th style="width: 5%">用户类型</th>
                        <th style="width: 20%">电话号码</th>
                        <th style="width: 15%">操作</th>
                    </tr>
                </thead>
                <tbody style="width: 100%;">
                    <asp:DataList ID="UserInfoList" runat="server" Style="text-align: center; width: 100%;">
                        <ItemTemplate>
                            <tr>
                                <td style="width: 15%"><%#Eval("UserID") %></td>
                                <td style="width: 15%"><%#Eval("UserLoginName") %></td>
                                <td style="width: 15%"><%#Eval("UserName") %></td>
                                <td style="width: 15%"><%#Eval("UserPWD") %></td>
                                <td style="width: 5%"><%#Eval("UserType") %></td>
                                <td style="width: 20%"><%#Eval("UserTel") %></td>
                                <td style="width: 15%">
                                    <input type="button" class="sui-btn" runat="server" value="编辑" onclick="fillInfo(this);" data-toggle="modal" data-target="#ConfirmModal" data-keyboard="false" />
                                </td>
                            </tr>
                        </ItemTemplate>
                    </asp:DataList>
                </tbody>
            </table>
            <asp:Label ID="CountLabel" runat="server"></asp:Label>
        </div>
        <!--adduser modal start-->
        <div id="divAddUsers" tabindex="-1" role="dialog" data-hasfoot="false" class="sui-modal hide fade">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <button type="button" data-dismiss="modal" aria-hidden="true" class="sui-close">×</button>
                        <h4 class="modal-title">添加用户</h4>
                    </div>
                    <div class="modal-body">
                        <div class="control-group">
                            <label for="inputLoginName" class="control-label">登录名：</label>
                            <div class="controls">
                                <asp:TextBox ID="inputLoginName" runat="server" data-rules="required" placeholder="登录名"></asp:TextBox>
                            </div>
                        </div>
                        <div class="control-group">
                            <label for="inputRealName" class="control-label">真实姓名：</label>
                            <div class="controls">
                                <asp:TextBox ID="inputRealName" runat="server" data-rules="required" placeholder="真实姓名"></asp:TextBox>
                            </div>
                        </div>
                        <div class="control-group">
                            <label for="inputPassword" class="control-label">密码：</label>
                            <div class="controls">
                                <asp:TextBox ID="inputPassword" runat="server" data-rules="required" placeholder="密码" TextMode="Password"></asp:TextBox>
                            </div>
                        </div>
                        <div class="control-group">
                            <label for="chooseType" class="control-label">身份：</label>
                            <div class="controls">
                                <asp:DropDownList ID="chooseType" runat="server">
                                    <asp:ListItem Value="user">教师</asp:ListItem>
                                    <asp:ListItem Value="admin">管理员</asp:ListItem>
                                </asp:DropDownList>
                            </div>
                        </div>
                        <div class="control-group">
                            <label for="inputPhone" class="control-label">电话号码：</label>
                            <div class="controls">
                                <asp:TextBox ID="inputPhone" runat="server" data-rules="required" placeholder="电话号码" TextMode="Phone"></asp:TextBox>
                            </div>
                        </div>
                    </div>
                    <div class="modal-footer">
                        <asp:Button ID="btnAddSubmit" runat="server" Text="添加" class="sui-btn btn-primary btn-large" OnClick="btnAddSubmit_Click" />
                        <button type="button" data-dismiss="modal" class="sui-btn btn-default btn-large">取消</button>
                    </div>
                </div>
            </div>
        </div>
        <!--adduser modal end-->
        <!--edituser modal start-->
        <div id="ConfirmModal" tabindex="-1" role="dialog" data-hasfoot="false" class="sui-modal hide fade">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <button type="button" data-dismiss="modal" aria-hidden="true" class="sui-close">×</button>
                        <h4 id="myModalLabel" class="modal-title">确认</h4>
                    </div>
                    <div class="modal-body">
                        确认编辑此用户吗
                        <asp:TextBox ID="GetEditUser" runat="server" style="display:none;"></asp:TextBox>
                    </div>
                    <div class="modal-footer">
                        <asp:Button ID="BtnEditConfirm" runat="server" Text="确认" class="sui-btn btn-primary btn-large" OnClick="BtnEditConfirm_Click" OnClientClick="removeValidate();" />
                        <button type="button" data-dismiss="modal" class="sui-btn btn-default btn-large">取消</button>
                    </div>
                </div>
            </div>
        </div>
        <!--edituser modal end-->
    </form>
    <script>
        function fillInfo(obj) {
            var tds = $(obj).parent().parent().find('td');
            $("#GetEditUser").val(tds.eq(1).text());
        }
    </script>
</body>
</html>
