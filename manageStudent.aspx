<%@ Page Title="" Language="C#" MasterPageFile="~/Master.master" AutoEventWireup="true" CodeFile="manageStudent.aspx.cs" Inherits="manageStudent" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div class="content-wrapper">
        <section class="content-header">
            <h1>Student Master</h1>
            <ol class="breadcrumb">
                <li><a href="#"><i class="fa fa-dashboard"></i>Home</a></li>
                <li><a href="#" class="active">Student</a></li>
            </ol>
        </section>
        <!-- Main content -->
        <section class="content">
            <div class="row">
                <div class="col-md-12">
                    <div class="box box-info">
                        <div class="box-header with-border">
                            <h3 class="box-title">Manage Student</h3>
                        </div>
                        <asp:GridView ID="gridStudent" runat="server" AutoGenerateColumns="false" EmptyDataText="No Record Found" CssClass="table table-bordered table-hover table-striped" HorizontalAlign="Center" OnRowCommand="gridStudent_RowCommand">
                            <Columns>
                                <asp:TemplateField HeaderText="Sr.No">
                                    <ItemTemplate>
                                        <%#Container.DataItemIndex+1 %>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:BoundField DataField="STUDENTNAME" HeaderText="Student Name" />
                                <asp:TemplateField HeaderText="Allow Edit">
                                    <ItemTemplate>
                                        <asp:CheckBox ID="chkSelect" runat="server" Checked='<%# Eval("IsAllowEdit") %>' />
                                        <asp:HiddenField Value='<%#Eval("STUDENTID") %>' ID="StuId" runat="server" />
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:ButtonField CommandName="cmdSave" Text="Save" ButtonType="Button" ControlStyle-CssClass="btn btn-primary" />
                                <asp:TemplateField HeaderText="Action">
                                    <ItemTemplate>
                                        <asp:Button ID="btnDelete" runat="server" Text="Delete" CommandName="cmdDelete" CommandArgument='<%#Eval("STUDENTID") %>' CssClass="btn btn-danger btn-flat" />
                                    </ItemTemplate>
                                </asp:TemplateField>


                            </Columns>
                        </asp:GridView>
                    </div>
                </div>
            </div>
        </section>
    </div>
</asp:Content>

