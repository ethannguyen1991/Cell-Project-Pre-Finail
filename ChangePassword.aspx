<%@ Page Title="" Language="C#" MasterPageFile="~/Master.master" AutoEventWireup="true" CodeFile="ChangePassword.aspx.cs" Inherits="ChangePassword" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div class="content-wrapper">
        <section class="content-header">
            <h1>Change Password</h1>
            <ol class="breadcrumb">
                <li><a href="#"><i class="fa fa-dashboard"></i>Home</a></li>
                <li><a href="#" class="active">Change Password</a></li>
            </ol>
        </section>
        <!-- Main content -->
        <section class="content">
            <div class="row">
                <div class="col-md-12">
                    <div class="box box-info">
                        <div class="box-header with-border">
                            <h3 class="box-title">Password Settings</h3>
                        </div>
                        <div class="form-horizontal">
                            <div class="box-body">
                                <div class="col-md-6">
                                    <div class="form-group">
                                        <label for="inputEmail3" class="col-sm-3 control-label">Old Password</label>
                                        <div class="col-sm-9">
                                            <asp:TextBox ID="txtOldPass" TextMode="Password" runat="server" CssClass="form-control" required></asp:TextBox>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-md-6">
                                    <div class="form-group">
                                        <label for="inputPassword3" class="col-sm-3 control-label">New Password</label>
                                        <div class="col-sm-9">
                                            <asp:TextBox ID="txtNewPass" TextMode="Password" runat="server" CssClass="form-control" required></asp:TextBox>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-md-6">
                                    <div class="form-group">
                                        <label for="inputPassword3" class="col-sm-3 control-label">Con.Password</label>
                                        <div class="col-sm-9">
                                            <asp:TextBox ID="txtConfirmPass" TextMode="Password" runat="server" CssClass="form-control" required></asp:TextBox>
                                        </div>
                                    </div>
                                </div>


                            </div>
                            <br />
                            <div class="box-footer">
                                <asp:Button ID="btnChangePassword" runat="server" Text="Change Password" class="btn btn-info pull-right" OnClick="btnChangePassword_Click" />
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>
    </div>
</asp:Content>

