<%@ Page Title="" Language="C#" MasterPageFile="~/Master.master" AutoEventWireup="true" CodeFile="ShowContents.aspx.cs" Inherits="ShowContents" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div class="content-wrapper">
        <section class="content">
            <div class="panel panel-default">
                <div class="panel-heading">
                    <h3 class="panel-title">Contents</h3>
                </div>
                <div class="panel-body">
                    <div class="row">
                        <div class="col-md-2 pull-right">
                            <div class="form-group">
                                <asp:LinkButton ID="btnAddContent" runat="server" CssClass="btn btn-primary" OnClick="btnAddContent_Click">
                                    <span class="glyphicon glyphicon-plus"></span> Add New Content
                                </asp:LinkButton>
                            </div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-md-12">
                            <div class="form-group">
                                <div class="table-responsive">
                                    <asp:DataList ID="dlContents" runat="server" RepeatDirection="Horizontal" RepeatColumns="4" OnItemCommand="dlContents_ItemCommand" OnItemDataBound="dlContents_ItemDataBound" Height="653px">
                                        <ItemTemplate>
                                            <div class="well">
                                                <div class="row">
                                                    <div class="col-md-12">
                                                        <div class="form-group">
                                                            <asp:Image ID="imgContent" runat="server" ImageUrl='<%#Bind("Image","~/ContentImages/{0}") %>' Width="220" Height="120" />
                                                        </div>
                                                    </div>
                                                </div>

                                                <div class="row">
                                                    <div class="col-md-12">
                                                        <div class="form-group">
                                                            <span class="h4"><%#Eval("HeadingText")%></span>
                                                        </div>
                                                    </div>
                                                </div>

                                                <div class="row">
                                                    <div class="col-md-3">
                                                        <div class="form-group">
                                                            <asp:LinkButton ID="linkView" runat="server" CssClass="btn btn-primary btn-flat" CommandArgument='<%#Eval("ContentID")%>' CommandName="cmdView">View</asp:LinkButton>
                                                        </div>
                                                    </div>

                                                    <div class="col-md-3">
                                                        <div class="form-group">
                                                            <asp:LinkButton ID="lnkEdit" runat="server" CssClass="btn btn-info btn-flat" CommandArgument='<%#Eval("ContentID")%>' CommandName="cmdEdit">Edit</asp:LinkButton>
                                                        </div>
                                                    </div>

                                                    <div class="col-md-3">
                                                        <div class="form-group">
                                                            <asp:LinkButton ID="lnkDelete" runat="server" CssClass="btn btn-danger btn-flat" CommandArgument='<%#Eval("ContentID")%>' CommandName="cmdDelete">Delete</asp:LinkButton>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </ItemTemplate>
                                    </asp:DataList>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>
    </div>
</asp:Content>