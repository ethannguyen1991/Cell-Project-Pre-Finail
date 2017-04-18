<%@ Page Title="" Language="C#" MasterPageFile="~/Master.master" AutoEventWireup="true" CodeFile="Home.aspx.cs" Inherits="Home" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div class="content-wrapper">
        <section class="content">
            <div class="panel panel-default">
                <div class="panel-heading">
                    <h3>
                        <asp:Label ID="lblwelcome" runat="server" Text=""></asp:Label></h3>
                </div>
                <div class="col-md-12">
                    <p>
                        <asp:Label ID="lblweldescp" runat="server" Text="" Font-Size="Large"></asp:Label>
                    </p>
                    <asp:Panel ID="pnlAdmin" runat="server" Visible="false">
                        <asp:Label ID="lblscenario" runat="server" Text="" Font-Size="Large"></asp:Label>
                        <asp:HyperLink ID="lnkscenario" NavigateUrl="~/ShowScenarios.aspx" runat="server">Details</asp:HyperLink><br />
                        <asp:Label ID="lblcontent" runat="server" Text="" Font-Size="Large"></asp:Label>
                        <asp:HyperLink ID="linkcontent" NavigateUrl="~/ShowContents.aspx" runat="server">Details</asp:HyperLink><br />
                        <asp:Label ID="lblstudetn" runat="server" Text="" Font-Size="Large"></asp:Label>
                        <asp:HyperLink ID="linkstudents" NavigateUrl="~/manageStudent.aspx" runat="server">Details</asp:HyperLink><br />
                    </asp:Panel>
                </div>
            </div>
                     <div class="row">
                        <div class="col-md-2 pull-right">
                            <div class="form-group col-md-4">
                                <asp:LinkButton ID="btnstartGame" runat="server" CssClass="btn btn-primary" OnClick="btnstartGame_Click">
                                    <span class="glyphicon glyphicon-plus"></span> START GAME
                                </asp:LinkButton>
                            </div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-md-2 pull-right">
                            <div class="form-group col-md-4">
                                <asp:LinkButton ID="btnRandomStart" runat="server" CssClass="btn btn-primary" OnClick="btnRandomStart_Click">
                                    <span class="glyphicon glyphicon-plus"></span> RANDOM START
                                </asp:LinkButton>
                            </div>
                        </div>
                    </div>

        </section>
    </div>
</asp:Content>

