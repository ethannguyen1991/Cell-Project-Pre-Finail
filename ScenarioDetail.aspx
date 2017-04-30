<%@ Page Title="" Language="C#" MasterPageFile="~/Master.master" AutoEventWireup="true" CodeFile="ScenarioDetail.aspx.cs" Inherits="ScenarioDetail" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div class="content-wrapper">
        <section class="content">
            <div class="panel panel-default">
                <div class="panel-heading">
                    <h3 class="panel-title">
                        <asp:Label ID="lblScenarioName" runat="server"></asp:Label></h3>
                </div>
                <asp:Panel runat="server" ID="pnlwelcome" class="panel-body">
                    <div class="row">
                        <div class="panel-heading">
                            <h3 class="panel-title">Welcome</h3>
                        </div>
                        <div class="col-md-12">
                            <div class="form-group">
                                <asp:TextBox ID="txtwelcome" runat="server" CssClass="form-control" TextMode="MultiLine" Height="125"></asp:TextBox>
                                <br />
                                <asp:Button ID="brnwelcome" runat="server" Text="Click Next To Continue" CssClass="btn btn-primary" OnClick="brnwelcome_Click" />
                            </div>

                        </div>
                    </div>
                </asp:Panel>
                <asp:Panel runat="server" ID="pnllearnabt" class="panel-body">
                    <div class="row">
                        <div class="panel-heading">
                            <h3 class="panel-title">Learn about yourself</h3>
                        </div>
                        <div class="col-md-12">
                            <div class="form-group">
                                <asp:TextBox ID="txtlearnabt" runat="server" CssClass="form-control" TextMode="MultiLine" Height="125"></asp:TextBox>
                                <br />
                                <asp:Button ID="btnlearnabt" runat="server" Text="Click Next To Continue" CssClass="btn btn-primary" OnClick="btnlearnabt_Click" />
                            </div>

                        </div>

                    </div>
                </asp:Panel>
                 <asp:Panel runat="server" ID="pnldesc" class="panel-body">
                    <div class="row">
                        <div class="panel-heading">
                            <h3 class="panel-title">Desciption</h3>
                        </div>
                        <div class="col-md-12">
                            <div class="form-group">
                                <asp:TextBox ID="txtdesc" runat="server" CssClass="form-control" TextMode="MultiLine" Height="125"></asp:TextBox>
                                <br />
                                <asp:Button ID="btndesc" runat="server" Text="Click Next To Continue" CssClass="btn btn-primary" OnClick="btndesc_Click" />
                            </div>

                        </div>

                    </div>
                </asp:Panel>
                <asp:Panel runat="server" ID="pnldetails" class="panel-body">
                    <div class="row">
                        <div class="col-md-12">
                            <div class="form-group">
                                 <asp:TextBox ID="txtScenarioDetails" runat="server" CssClass="form-control" TextMode="MultiLine" Height="125"></asp:TextBox>
                               
                            </div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-md-12">
                           <%-- <div class="form-group">
                                <label>Enter your comment</label>
                                <asp:TextBox ID="txtComment" runat="server" TextMode="MultiLine" CssClass="form-control"></asp:TextBox>
                            </div>--%>
                        </div>
                    </div>
                   
                    <%--<div class="row">
                        <div class="col-md-2">
                            <div class="form-group">
                                <asp:LinkButton ID="btnSave" runat="server" CssClass="btn btn-primary" OnClick="btnSave_Click">
                                     <span class="glyphicon glyphicon-saved"></span> Finish
                                </asp:LinkButton>
                            </div>
                        </div>
                    </div>--%>
                     <br />
                    <div class="panel-footer">
                        <asp:DataList ID="dlContentButtons" runat="server" RepeatDirection="Horizontal" RepeatColumns="4" OnItemCommand="dlContentButtons_ItemCommand">
                            <ItemTemplate>
                                <div class="row">
                                    <div class="col-md-1">
                                        <div class="form-group">
                                            <asp:LinkButton ID="linkView" runat="server" CssClass="btn btn-info btn-flat" CommandArgument='<%#Eval("ContentID")%>' CommandName="cmdView" Style="width: 234px;"> 
                                              <span class="h4" style="word-wrap:break-word; white-space:normal !important; "><%#Eval("HeadingID")%></span>
                                            </asp:LinkButton>
                                        </div>
                                    </div>
                                    <div class="col-md-11">
                                        <asp:Panel ID="pnl" runat="server">
                                        </asp:Panel>
                                    </div>
                                </div>
                            </ItemTemplate>
                        </asp:DataList>
                    </div>
                </asp:Panel>



            </div>
        </section>
    </div>
</asp:Content>
