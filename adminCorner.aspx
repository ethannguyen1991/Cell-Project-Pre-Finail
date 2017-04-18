<%@ Page Title="" Language="C#" MasterPageFile="~/Master.master" AutoEventWireup="true" CodeFile="adminCorner.aspx.cs" Inherits="adminCorner" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div class="content-wrapper">
        <section class="content-header">
            <h1>My Corner</h1>
            <ol class="breadcrumb">
                <li><a href="#"><i class="fa fa-dashboard"></i>Home</a></li>
                <li><a href="#" class="active">My Corner</a></li>
            </ol>
        </section>
        <!-- Main content -->
        <section class="content">
            <div class="row">
                <div class="col-md-12">
                    <div class="box box-info">
                        <div class="box-header with-border">
                            <h3 class="box-title">Edit Profile</h3>
                        </div>
                        <div class="form-horizontal">
                            <div class="box-body">
                                <div class="col-md-6">
                                    <div class="form-group">
                                        <label for="inputEmail3" class="col-sm-3 control-label">First Name</label>
                                        <div class="col-sm-9">
                                            <asp:TextBox ID="txtFirstName" runat="server" CssClass="form-control" required></asp:TextBox>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-md-6">
                                    <div class="form-group">
                                        <label for="inputPassword3" class="col-sm-3 control-label">Last Name</label>
                                        <div class="col-sm-9">
                                            <asp:TextBox ID="txtLastName" runat="server" CssClass="form-control" required></asp:TextBox>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-md-6">
                                    <div class="form-group">
                                        <label for="inputPassword3" class="col-sm-3 control-label">Email Addr</label>
                                        <div class="col-sm-9">
                                           <asp:TextBox ID="txtEmailAddress" runat="server" CssClass="form-control" required></asp:TextBox>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-md-6">
                                    <div class="form-group">
                                        <label for="inputPassword3" class="col-sm-3 control-label">User Name</label>
                                        <div class="col-sm-9">
                                            <asp:TextBox ID="txtUserName" runat="server" CssClass="form-control"></asp:TextBox>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <br />
                            <div class="box-footer">
                                <asp:Button ID="btnUpdate" runat="server" Text="Update Profile" class="btn btn-info pull-right" OnClick="btnUpdate_Click" />
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>
    </div>
</asp:Content>

