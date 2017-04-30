<%@ Page Title="" Language="C#" MasterPageFile="~/Master.master" AutoEventWireup="true" CodeFile="Scenario.aspx.cs" Inherits="Scenario" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div class="content-wrapper">
        <section class="content">
            <div class="panel panel-default">
                <div class="panel-heading">
                    <h3 class="panel-title">Add Scenario</h3>
                </div>
                <div class="panel-body">
                    <div class="row">
                        <div class="col-md-2">
                            <div class="form-group">
                                <label>Name</label>
                            </div>
                        </div>
                        <div class="col-md-4">
                            <div class="form-group">
                                <asp:TextBox ID="txtName" runat="server" CssClass="form-control" require></asp:TextBox>
                            </div>
                        </div>
                        <div class="col-md-2">
                            <div class="form-group">
                                <label>Image</label>
                            </div>
                        </div>
                        <div class="col-md-4">
                            <div class="form-group">
                                <asp:FileUpload ID="fileImage" runat="server" />
                            </div>
                        </div>
                    </div>


                    <div class="row">
                        <div class="col-md-2">
                            <div class="form-group">
                                <label>Welcome</label>
                            </div>
                        </div>
                        <div class="col-md-4">
                            <div class="form-group">
                                <asp:TextBox ID="txtwelcome" runat="server" CssClass="form-control" TextMode="MultiLine" require></asp:TextBox>
                            </div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-md-2">
                            <div class="form-group">
                                <label>Learn about yourself</label>
                            </div>
                        </div>
                        <div class="col-md-4">
                            <div class="form-group">
                                <asp:TextBox ID="txtlearnabt" runat="server" CssClass="form-control" TextMode="MultiLine" require></asp:TextBox>
                            </div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-md-2">
                            <div class="form-group">
                                <label>Description</label>
                            </div>
                        </div>
                        <div class="col-md-4">
                            <div class="form-group">
                                <asp:TextBox ID="txtDesc" runat="server" CssClass="form-control" TextMode="MultiLine" require></asp:TextBox>
                            </div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-md-2">
                            <div class="form-group">
                                <label>Details</label>
                            </div>
                        </div>
                        <div class="col-md-4">
                            <div class="form-group">
                                <asp:TextBox ID="txtDetails" runat="server" CssClass="form-control" TextMode="MultiLine" require></asp:TextBox>
                            </div>
                        </div>
                    </div>
                    <%--<div class="row">
                        <div class="col-md-2">
                            <div class="form-group">
                                <label>Rank</label>
                            </div>
                        </div>
                        <div class="col-md-4">
                            <asp:ListBox ID="lstRAnking" runat="server">
                                <asp:ListItem>Low</asp:ListItem>
                                <asp:ListItem>Medium</asp:ListItem>
                                <asp:ListItem>High</asp:ListItem>
                            </asp:ListBox>
                        </div>
                    </div>--%>
                    <br />
                    <div class="row">
                        <div class="col-md-2">
                            <div class="form-group">
                                <label>Link to</label>
                            </div>
                        </div>
                        <div class="col-md-4">
                            <asp:Panel ID="pnlscroll" runat="server" ScrollBars="Vertical" Height="150" BorderStyle="None">
                                <asp:CheckBoxList ID="chkContents" runat="server" Style="display: inline-block; margin-right: 00px;" TextAlign="Right" CellSpacing="5" CellPadding="5" RepeatLayout="UnorderedList" RepeatColumns="1" RepeatDirection="Vertical">
                                </asp:CheckBoxList>
                            </asp:Panel>
                        </div>
                    </div>
                </div>
                <br />
                <div class="panel-footer">
                    <asp:LinkButton ID="btnSave" runat="server" CssClass="btn btn-primary" OnClick="btnSave_Click">
                        <span class="glyphicon glyphicon-saved"></span> Save
                    </asp:LinkButton>
                    <asp:LinkButton ID="LinkButton1" runat="server" CssClass="btn btn-primary" OnClick="btnClear_Click">
                        <span class="glyphicon glyphicon-saved"></span> Clear
                    </asp:LinkButton>
                </div>
            </div>
        </section>
    </div>
</asp:Content>



