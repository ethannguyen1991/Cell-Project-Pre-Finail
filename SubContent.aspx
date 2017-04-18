<%@ Page Title="" Language="C#" MasterPageFile="~/Master.master" AutoEventWireup="true" CodeFile="SubContent.aspx.cs" Inherits="SubContent" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div class="content-wrapper">
        <section class="content">
            <div class="panel panel-default" id="panelButton" runat="server" visible="false">
                <div class="panel-heading">
                    <strong>
                        <h3 class="panel-title" style="text-align: center">
                            <asp:Label ID="lblButtonHeading" runat="server"></asp:Label></h3>
                    </strong>
                </div>
                <div class="panel-body">
                    <div class="row">
                        <div class="form-group">
                            <asp:Label ID="lblButtonDetails" runat="server" style="padding-left:5px;"></asp:Label>
                        </div>
                    </div>
                </div>
            </div>
            <div class="panel panel-default">
                <div class="panel-heading">
                    <h3 class="panel-title">
                        <asp:Label ID="lblContentHeadingID" runat="server"></asp:Label></h3>
                </div>
                <div class="panel-body">
                    <div class="row">
                        <div class="col-md-10">
                            <div class="form-group">
                                <asp:Label ID="lblContentDetails" runat="server"></asp:Label>
                            </div>
                        </div>
                        <div id="rightButtons" runat="server" class="col-md-2">
                            <asp:Button ID="btnLink1Caption" runat="server" Text="Nutrition" CssClass="btn btn-success btn-flat" Style="width: auto; margin-top: 2px;" OnClick="btnLink1Caption_Click" /><br />
                            <asp:Button ID="btnLink2Caption" runat="server" Text="Life" CssClass="btn btn-success btn-flat" Style="width: auto; margin-top: 2px;" OnClick="btnLink2Caption_Click" /><br />
                            <asp:Button ID="btnLink3Caption" runat="server" Text="Shape" CssClass="btn btn-success btn-flat" Style="width: auto; margin-top: 2px;" OnClick="btnLink3Caption_Click" /><br />
                             <asp:Button ID="btnLink4Caption" runat="server" Text="Nutrition" CssClass="btn btn-success btn-flat" Style="width: auto; margin-top: 2px;" OnClick="btnLink4Caption_Click" /><br />
                            <asp:Button ID="btnLink5Caption" runat="server" Text="Life" CssClass="btn btn-success btn-flat" Style="width: auto; margin-top: 2px;" OnClick="btnLink5Caption_Click" /><br />
                            <asp:Button ID="btnLink6Caption" runat="server" Text="Shape" CssClass="btn btn-success btn-flat" Style="width: auto; margin-top: 2px;" OnClick="btnLink6Caption_Click" /><br />
                          <%--  <asp:Button ID="btnFunction" runat="server" Text="Function" CssClass="btn btn-success btn-flat" Style="width: 80px; margin-top: 2px;" OnClick="btnFunction_Click" />--%>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-md-12">
                            <div class="form-group">
                                <label id="lblComment" runat="server">Enter your comment</label>
                                <asp:TextBox ID="txtComment" runat="server" TextMode="MultiLine" CssClass="form-control"></asp:TextBox>
                            </div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-md-2">
                            <div class="form-group">
                                <asp:LinkButton ID="btnSave" runat="server" CssClass="btn btn-primary" OnClick="btnSave_Click">
                                     <span class="glyphicon glyphicon-saved"></span> Finish
                                </asp:LinkButton>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="panel-footer">
                    <asp:DataList ID="dlContentButtons" runat="server" RepeatDirection="Horizontal" RepeatColumns="4" OnItemCommand="dlContentButtons_ItemCommand">
                        <ItemTemplate>
                            <div class="row">
                                <div class="col-md-3">
                                    <div class="form-group">
                                        <asp:LinkButton ID="linkView" runat="server" CssClass="btn btn-info btn-flat" CommandArgument='<%#Eval("ContentID")%>' CommandName="cmdView" Style="width: 234px; margin-left: 4px;"> 
                                              <span class="h4" style="word-wrap:hyphenate break-word; white-space:normal !important; height:80px;"><%#Eval("HeadingID")%></span>
                                        </asp:LinkButton>
                                    </div>
                                </div>
                            </div>
                        </ItemTemplate>
                    </asp:DataList>
                </div>
            </div>
        </section>
    </div>
</asp:Content>

