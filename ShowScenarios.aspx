<%@ Page Title="" Language="C#" MasterPageFile="~/Master.master" AutoEventWireup="true" CodeFile="ShowScenarios.aspx.cs" Inherits="Home" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
      <div class="content-wrapper">
        <section class="content">
            <div class="panel panel-default">
                <div class="panel-heading">
                    <h3 class="panel-title">Scenarios</h3>
                </div>

                <div class="panel-body">
                     <div class="row">
                        <div class="col-md-2 pull-right">
                            <div class="form-group">
                                <asp:LinkButton ID="btnAddScenario" runat="server" CssClass="btn btn-primary" OnClick="btnAddScenario_Click">
                                    <span class="glyphicon glyphicon-plus"></span> Add Scenario
                                </asp:LinkButton>
                            </div>
                            <div class="col-md-4">
                            <div class="form-group">
                                <asp:TextBox ID="txtName" runat="server" CssClass="form-control" require></asp:TextBox>
                            </div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-md-12">
                            <div class="form-group">
                                <div class="table-responsive">
                                    <asp:DataList ID="dlScenario" runat="server" RepeatDirection="Horizontal" RepeatColumns="4" OnItemCommand="dlScenario_ItemCommand" OnItemDataBound="dlScenario_ItemDataBound">
                                        <ItemTemplate>
                                            <div class="well">
                                                <div class="row">
                                                    <div class="col-md-12">
                                                        <div class="form-group">
                                                            <asp:Image ID="imgScenario" runat="server" ImageUrl='<%#Bind("Image","~/ScenarioImages/{0}") %>' Width="220" Height="120" />
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="row">
                                                    <div class="col-md-12">
                                                        <div class="form-group">
                                                            <span class="h4"><%#Eval("Name")%></span>
                                                        </div>
                                                        <br />
                                                    </div>
                                                </div>
                                                <div class="row">
                                                    <div class="col-md-3">
                                                        <div class="form-group">
                                                            <asp:LinkButton ID="linkView" runat="server" CssClass="btn btn-primary btn-flat" CommandArgument='<%#Eval("ScenarioID")%>' CommandName="cmdView"> View
                                                            </asp:LinkButton>
                                                        </div>
                                                    </div>

                                                    <div class="col-md-3">
                                                        <div class="form-group">
                                                            <asp:LinkButton ID="lnkEdit" runat="server" CssClass="btn btn-info btn-flat" CommandArgument='<%#Eval("ScenarioID")%>' CommandName="cmdEdit">Edit</asp:LinkButton>
                                                        </div>
                                                    </div>

                                                    <div class="col-md-3">
                                                        <div class="form-group">
                                                            <asp:LinkButton ID="lnkDelete" runat="server" CssClass="btn btn-danger btn-flat" CommandArgument='<%#Eval("ScenarioID")%>' CommandName="cmdDelete">Delete</asp:LinkButton>
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

