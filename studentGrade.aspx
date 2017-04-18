<%@ Page Title="" Language="C#" MasterPageFile="~/Master.master" AutoEventWireup="true" CodeFile="studentGrade.aspx.cs" Inherits="studentGrade" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
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
                                <asp:BoundField DataField="LEVEL" HeaderText="Level" />
                                <asp:BoundField DataField="COMMENT" HeaderText="Comment" />
                                <asp:BoundField DataField="GRADE" HeaderText="Grade" />
                            </Columns>
                        </asp:GridView>
                    </div>
                </div>
            </div>
        </section>
    </div>
</asp:Content>

