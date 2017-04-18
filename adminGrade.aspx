<%@ Page Title="" Language="C#" MasterPageFile="~/Master.master" AutoEventWireup="true" CodeFile="adminGrade.aspx.cs" Inherits="adminGrade" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div class="content-wrapper">
        <section class="content-header">
            <h1>Grade Master</h1>
            <ol class="breadcrumb">
                <li><a href="#"><i class="fa fa-dashboard"></i>Home</a></li>
                <li><a href="#" class="active">Grade</a></li>
            </ol>
        </section>
        <!-- Main content -->
        <section class="content">
            <div class="row">
                <div class="col-md-12">
                    <div class="box box-info">
                        <div class="box-header with-border">
                            <h3 class="box-title">Assign Grade</h3>
                        </div>
                        <asp:GridView ID="gridGrade" runat="server" AutoGenerateColumns="false" EmptyDataText="No Record Found" CssClass="table table-bordered table-hover table-striped" HorizontalAlign="Center">
                            <Columns>
                                <asp:TemplateField HeaderText="Sr.No">
                                    <ItemTemplate>
                                        <%#Container.DataItemIndex+1 %>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:BoundField DataField="STUDENTNAME" HeaderText="Name" />
                                <asp:BoundField DataField="LEVEL" HeaderText="Level" />
                                <asp:BoundField DataField="COMMENT" HeaderText="Comment" />
                                <asp:TemplateField>
                                    <ItemTemplate>
                                        <asp:HiddenField ID="hfCommentId" runat="server" Value='<%#Eval("COMMENTID") %>' />
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField>
                                    <HeaderTemplate>Grade</HeaderTemplate>
                                    <ItemTemplate>
                                        <asp:TextBox ID="txtGrade" runat="server" CssClass="form-control" Text='<%#Eval("GRADE") %>'></asp:TextBox>
                                    </ItemTemplate>
                                </asp:TemplateField>
                            </Columns>
                        </asp:GridView>
                    </div>
                     <br />
                     <div class="box-footer">
                               <asp:Button ID="btnSaveGrade" runat="server" Text="Assign Grade" CssClass="btn btn-info btn-flat" OnClick="btnSaveGrade_Click" />
                            </div>
                </div>
            </div>
        </section>
    </div>
</asp:Content>

