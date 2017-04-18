<%@ Page Language="C#" AutoEventWireup="true" CodeFile="third.aspx.cs" Inherits="third" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
    <link href="bootstrap/css/bootstrap.css" rel="stylesheet" />
</head>
<body>
    <form id="form1" runat="server">
        <div class="container">
            <br />
            <br />
            <div class="row">
                <div class="col-md-12">
                    <%-- <h2 style="text-align: center"><strong>Learn about yourself</strong></h2>--%>
                </div>
            </div>
            <br />
            <div class="row">
                <div class="col-md-12">
                    <span style="background-position: center">You have been doing an excellent job transporting nutrients from the intestine into the blood stream and lymphatics nearby. You were a little unsure of yourself in your youth at day 1, but you really learned your role and began to blossom as a mature cell by your adolescence and midlife on day 2 and day 3. You are now approaching the time in your life where you get to make a decision about how to proceed in these later stages of your life. You are excited and a little nervous about what is to come!
                    </span>
                </div>
            </div>
            <br />
            <div class="row">
                <div class="col-md-4 pull-right">
                     <a href="ScenarioDetail.aspx" class="btn btn-info">Click Next To Continue</a>
                   <%-- <button type="button" class="btn btn-info" data-toggle="modal" data-target="#myModal">Click Next To Continue</button>--%>
                </div>
            </div>
        </div>
        <!-- Modal -->
        <div id="myModal" class="modal fade" role="dialog">
            <div class="modal-dialog">
                <!-- Modal content-->
                <div class="modal-content">
                    <div class="modal-header">
                        <h4 class="modal-title">Play Game</h4>
                    </div>
                    <div class="modal-body">
                        <p>Now you can start game.</p>
                    </div>
                    <div class="modal-footer">
                        <asp:Button ID="btnPlay" runat="server" Text="Play" class="btn btn-success" OnClick="btnPlay_Click" />
                    </div>
                </div>
            </div>
        </div>
    </form>
        

</body>
</html>
