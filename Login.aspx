<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Login.aspx.cs" Inherits="adminLogin" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>Cell Project |Admin Log in</title>
    <meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" name="viewport">
    <link href="bootstrap/css/bootstrap.min.css" rel="stylesheet" />
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.5.0/css/font-awesome.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/ionicons/2.0.1/css/ionicons.min.css">
    <link href="dist/css/AdminLTE.min.css" rel="stylesheet" />
    <link href="plugins/iCheck/square/blue.css" rel="stylesheet" />
</head>
<body class="hold-transition login-page">
    <div class="login-box">
        <div class="login-logo">
            <a href="#"><b>Cell Project</b></a>

        </div>
        <div class="login-box-body">
            <p class="login-box-msg">Sign in to start your session</p>
            <form runat="server">
                <div class="form-group has-feedback">
                    <asp:TextBox ID="txtUser" runat="server" CssClass="form-control" required></asp:TextBox>
                    <span class="glyphicon glyphicon-envelope form-control-feedback"></span>
                </div>
                <div class="form-group has-feedback">
                    <asp:TextBox ID="txtPass" TextMode="Password" runat="server" CssClass="form-control" required></asp:TextBox>
                    <span class="glyphicon glyphicon-lock form-control-feedback"></span>
                </div>
                <div class="row">
                    <div class="col-xs-8">
                    </div>
                    <div class="col-xs-4">
                        <asp:Button ID="btnLogin" runat="server" Text="Sign In" class="btn btn-primary btn-block btn-flat" OnClick="btnLogin_Click" />
                    </div>
                </div>
            </form>
            <a href="registration.aspx">New Registration</a>
        </div>
    </div>

    <div style="text-align:center;">
            <%--background: url("../Images/Banner.jpg") no-repeat fixed center center / 100% auto rgba(0, 0, 0, 0);--%>
            <img src="../Images/WhatChaMaCallIt.gif" alt="Smiley face" style="border: 17px solid #4cff00;border-radius:25px 25px 25px 25px;">
    </div>

    <script src="plugins/jQuery/jquery-2.2.3.min.js"></script>
    <script src="bootstrap/js/bootstrap.min.js"></script>
    <script src="plugins/iCheck/icheck.min.js"></script>
    <script>
        $(function () {
            $('input').iCheck({
                checkboxClass: 'icheckbox_square-blue',
                radioClass: 'iradio_square-blue',
                increaseArea: '20%' // optional
            });
        });
</script>
</body>
</html>

