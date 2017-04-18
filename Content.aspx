<%@ Page Title="" Language="C#" MasterPageFile="~/Master.master" AutoEventWireup="true" CodeFile="Content.aspx.cs" Inherits="Content" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <style type="text/css">
        .auto-style1 {
            width: 225px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div class="content-wrapper">
        <section class="content">
            <div class="panel panel-default">
                <div class="panel-heading">
                    <h3 class="panel-title">Add Content</h3>
                </div>
                <div class="panel-body">
                    <div class="row">
                        <div class="col-md-2">
                            <div class="form-group">
                                <label>Heading ID</label>
                            </div>
                        </div>
                        <div class="col-md-4">
                            <div class="form-group">
                                <asp:TextBox ID="txtHeadingID" runat="server" CssClass="form-control" require></asp:TextBox>
                            </div>
                        </div>
                        <div class="col-md-2">
                            <div class="form-group">
                                <label>Heading Text</label>
                            </div>
                        </div>
                        <div class="col-md-4">
                            <div class="form-group">
                                <asp:TextBox ID="txtHeadingText" runat="server" CssClass="form-control" required></asp:TextBox>
                            </div>
                        </div>
                    </div>

                    <div class="row">
                        <div class="col-md-2">
                            <div class="form-group">
                                <label>Content</label>
                            </div>
                        </div>
                        <div class="col-md-4">
                            <div class="form-group">
                                <asp:TextBox ID="txtContent" runat="server" CssClass="form-control" TextMode="MultiLine" require></asp:TextBox>
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
                                <br />
                                 <div class="form-group">
                                <asp:CheckBox ID="chkCommentBox" TextAlign="Right" Text="Comment Box" runat="server" />
                            </div>
                            </div>
                        </div>
                    </div>

                <%--    <div class="row">
                        <div class="col-md-2">
                            <div class="form-group">
                                <label>Comment Box</label>
                            </div>
                        </div>
                        <div class="col-md-4">
                            <div class="form-group">
                                <asp:CheckBox ID="chkCommentBox" runat="server" />
                            </div>
                        </div>
                        <div class="col-md-2">
                            <div class="form-group">
                                <label>Add Content (Buttons)</label>
                            </div>
                        </div>
                        <div class="col-md-4">
                            <div class="form-group">
                                <asp:CheckBox ID="chkButton" runat="server" />
                            </div>
                        </div>
                    </div>--%>

                   

                </div>
               
                <div class="form-group">
                    <table class="table">
                        <thead class="thead-inverse">
                            <tr>
                                <th class="auto-style1">Value </div></th>
                                <th>Description</th>
                            </tr>
                        </thead>
                        <tbody>
                            <tr>
                                <td class="auto-style1"><asp:TextBox ID="Link1Caption" runat="server" CssClass="form-control" Width="250"/></td>
                                <td> <asp:TextBox ID="Link1Description" runat="server" CssClass="form-control" TextMode="MultiLine" require></asp:TextBox></td>
                            </tr>
                            <tr>
                                <td class="auto-style1"><asp:TextBox ID="Link2Caption" runat="server" CssClass="form-control" Width="250"/></td>
                                <td> <asp:TextBox ID="Link2Description" runat="server" CssClass="form-control" TextMode="MultiLine" require></asp:TextBox></td>
                            </tr>
                            <tr>
                                <td class="auto-style1"><asp:TextBox ID="Link3Caption" runat="server" CssClass="form-control" Width="250"/></td>
                                <td> <asp:TextBox ID="Link3Description" runat="server" CssClass="form-control" TextMode="MultiLine" require></asp:TextBox></td>
                            </tr>
                             <tr>
                                <td class="auto-style1"><asp:TextBox ID="Link4Caption" runat="server" CssClass="form-control" Width="250"/></td>
                                <td> <asp:TextBox ID="Link4Description" runat="server" CssClass="form-control" TextMode="MultiLine" require></asp:TextBox></td>
                            </tr>
                             <tr>
                                <td class="auto-style1"><asp:TextBox ID="Link5Caption" runat="server" CssClass="form-control" Width="250"/></td>
                                <td> <asp:TextBox ID="Link5Description" runat="server" CssClass="form-control" TextMode="MultiLine" require></asp:TextBox></td>
                            </tr>
                             <tr>
                                <td class="auto-style1"><asp:TextBox ID="Link6Caption" runat="server" CssClass="form-control" Width="250"/></td>
                                <td> <asp:TextBox ID="Link6Description" runat="server" CssClass="form-control" TextMode="MultiLine" require></asp:TextBox></td>
                            </tr>
                        </tbody>
                    </table>
                </div>
                <div class="col-md-2">
                 <div class="form-group">
                         <label>Add choices</label>
                    </div>
                    </div>
                 <div class="form-group">
                    <asp:Panel ID="pnlscroll" runat="server" ScrollBars="Vertical" Height="100">
                        <asp:CheckBoxList ID="chkChoices" runat="server" TextAlign="Right" CellSpacing="5" CellPadding="5" RepeatLayout="UnorderedList" RepeatColumns="0" RepeatDirection="Vertical">
                        </asp:CheckBoxList>
                    </asp:Panel>
                </div>
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

