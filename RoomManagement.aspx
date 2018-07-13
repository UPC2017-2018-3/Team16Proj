<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="RoomManagement.aspx.cs" Inherits="MBAMeetingRoom.RoomManagement" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <meta name="description" content="" />
    <title>会议室管理</title>
    <link href="http://g.alicdn.com/sj/dpl/1.5.1/css/sui.min.css" rel="stylesheet" />
    <script type="text/javascript" src="http://g.alicdn.com/sj/lib/jquery/dist/jquery.min.js"></script>
    <script type="text/javascript" src="http://g.alicdn.com/sj/dpl/1.5.1/js/sui.min.js"></script>
    <script type="text/javascript" src="Scripts/RoomManagement.js"></script>
</head>
<body>
    <form id="form1" runat="server" class="sui-form form-horizontal sui-validate">
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
                    <li>
                        <button data-toggle="modal" data-target="#divAddRooms" data-keyboard="false" class="sui-btn btn-primary btn-lg">添加会议室</button>
                    </li>
                </ul>
            </div>
        </div>
        <%--nav end--%>
        <div class="sui-container">
            <h2>会议室管理</h2>
            <table style="text-align:center;width:100%;">
                <thead>
                    <tr>
                        <th style="width:15%">会议室编号</th>
                        <th style="width:15%">会议室名</th>
                        <th style="width:15%">会议室位置</th>
                        <th style="width:5%">会议室容量</th>
                        <th style="width:25%">备注</th>
                        <th style="width:10%">状态</th>
                        <th style="width:15%">操作</th>
                    </tr>
                </thead>
                <tbody style="width:100%;">
                    <asp:DataList ID="UserInfoList" runat="server" style="text-align:center;width:100%;">
                        <ItemTemplate>
                            <tr>
                                <td style="width:15%"><%#Eval("MRID") %></td>
                                <td style="width:15%"><%#Eval("MRName") %></td>
                                <td style="width:15%"><%#Eval("MRLocation") %></td>
                                <td style="width:5%"><%#Eval("MRCapacity") %></td>
                                <td style="width:25%"><%#Eval("MRNote") %></td>
                                <td style="width:10%"><%#Eval("MRStatus") %></td>
                                <td style="width:15%">
                                    <input type="button" class="sui-btn" runat="server" value="编辑" onclick="fillInfo(this);" data-toggle="modal" data-target="#ConfirmModal" data-keyboard="false" />
                                </td>
                            </tr>
                        </ItemTemplate>
                    </asp:DataList>
                </tbody>
            </table>
        </div>
        <!--model start-->
        <div id="divAddRooms" tabindex="-1" role="dialog" data-hasfoot="false" class="sui-modal hide fade">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <button type="button" data-dismiss="modal" aria-hidden="true" class="sui-close">×</button>
                        <h4 id="myModalLabel" class="modal-title">添加会议室</h4>
                    </div>
                    <div class="modal-body">
                        <div class="control-group">
                            <label for="inputRoomID" class="control-label">会议室编号：</label>
                            <div class="controls">
                                <asp:TextBox ID="inputRoomID" runat="server" data-rules="required" placeholder="会议室编号"></asp:TextBox>
                            </div>
                        </div>
                        <div class="control-group">
                            <label for="inputRoomName" class="control-label">会议室名称：</label>
                            <div class="controls">
                                <asp:TextBox ID="inputRoomName" runat="server" data-rules="required" placeholder="会议室名称"></asp:TextBox>
                            </div>
                        </div>
                        <div class="control-group">
                            <label for="inputRoomLocation" class="control-label">会议室位置：</label>
                            <div class="controls">
                                <asp:TextBox ID="inputRoomLocation" runat="server" data-rules="required" placeholder="会议室位置"></asp:TextBox>
                            </div>
                        </div>
                        <div class="control-group">
                            <label for="inputRoomCapacity" class="control-label">会议室容量：</label>
                            <div class="controls">
                                <asp:TextBox ID="inputRoomCapacity" runat="server" data-rules="required" placeholder="会议室位置" TextMode="Number"></asp:TextBox>
                            </div>
                        </div>
                        <div class="control-group">
                            <label for="statusList" class="control-label">状态：</label>
                            <div class="controls">
                                <asp:DropDownList ID="statusList" runat="server">
                                    <asp:ListItem Value="open">开放</asp:ListItem>
                                    <asp:ListItem Value="close">关闭</asp:ListItem>
                                </asp:DropDownList>
                            </div>
                        </div>
                        <div class="control-group">
                            <label for="inputRoomNote" class="control-label">会议室备注：</label>
                            <div class="controls">
                                <asp:TextBox ID="inputRoomNote" runat="server" class="input-block-level" Rows="3"></asp:TextBox>
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
        <!--model end-->
        <!--editroom modal start-->
        <div id="ConfirmModal" tabindex="-1" role="dialog" data-hasfoot="false" class="sui-modal hide fade">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <button type="button" data-dismiss="modal" aria-hidden="true" class="sui-close">×</button>
                        <h4 class="modal-title">确认</h4>
                    </div>
                    <div class="modal-body">
                        确认编辑此会议室吗
                        <asp:TextBox ID="GetEditRoom" runat="server" style="display:none;"></asp:TextBox>
                    </div>
                    <div class="modal-footer">
                        <asp:Button ID="BtnEditConfirm" runat="server" Text="确认" class="sui-btn btn-primary btn-large" OnClick="BtnEditConfirm_Click" OnClientClick="removeValidate();" />
                        <button type="button" data-dismiss="modal" class="sui-btn btn-default btn-large">取消</button>
                    </div>
                </div>
            </div>
        </div>
        <!--editroom modal end-->
    </form>
    <script>
        function fillInfo(obj) {
            var tds = $(obj).parent().parent().find('td');
            $("#GetEditRoom").val(tds.eq(0).text());
        }
    </script>
</body>
</html>
