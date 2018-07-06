<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="MBAMeetingRoom.Login" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <meta name="description" content="" />
    <title>登录</title>
    <link href="http://g.alicdn.com/sj/dpl/1.5.1/css/sui.min.css" rel="stylesheet" />
    <link href="styles/Login.css" rel="stylesheet" />
    <script type="text/javascript" src="http://g.alicdn.com/sj/lib/jquery/dist/jquery.min.js"></script>
    <script type="text/javascript" src="http://g.alicdn.com/sj/dpl/1.5.1/js/sui.min.js"></script>
</head>
<body>
    <form id="form1" runat="server">
        <%--nav start--%>
        <div class="nav">
            <div class="inner-nav">
                <span>经济管理学院会议室管理系统</span>
            </div>
        </div>
        <%--nav end--%>
        <div class="sui-container">
            <div class="login-area">
                <div id="login-title">
                    <h2>登&nbsp;&nbsp;&nbsp;&nbsp;录</h2>
                </div>
                <div id="login-forms">
                    <div>
                        <div>
                            <asp:TextBox ID="textUsername" runat="server" placeholder="请输入用户名" class="input-text"></asp:TextBox>
                        </div>
                        <asp:RequiredFieldValidator ID="UsernameValidator" runat="server" ErrorMessage="请输入用户名" ControlToValidate="textUsername" ForeColor="Red"></asp:RequiredFieldValidator>
                    </div>
                    <div>
                        <div>
                            <asp:TextBox ID="textPassword" runat="server" placeholder="请输入密码" data-rules="required" TextMode="Password"  class="input-text"></asp:TextBox>
                        </div>
                        <asp:RequiredFieldValidator ID="PasswdValidator" runat="server" ErrorMessage="请输入密码" ControlToValidate="textPassword" ForeColor="Red"></asp:RequiredFieldValidator>
                    </div>
                    <div class="controls-group">
                        <label class="control-label"></label>
                        <div class="controls">
                            <asp:Label ID="msgLabel" runat="server" Text="" Visible="false"></asp:Label>
                        </div>
                    </div>
                    <div>
                        <div>
                            <asp:Button ID="submit" runat="server" Text="登录" class="sui-btn mybtn" OnClick="submit_Click" />
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </form>
</body>
</html>
