<%@ Page Language="C#" AutoEventWireup="true" CodeFile="welcome.aspx.cs" Inherits="welcome" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link href="bootstrap/css/bootstrap.css" rel="stylesheet" />
</head>
<body>
    <form id="form1" runat="server">
    <div class="container">
        <div class="row">
            <div class="col-md-12">
                <h2 style="text-align:center"><strong>Welcome</strong></h2>
            </div>
        </div>
        <br />
        <div class="row">
            <div class="col-md-12">
                <span style="background-position:center">In this game you are a cell that will be faced with many decisions regarding your fate. Your goal is to make intelligent choices that will benefit your host body. These decisions can include when or how to progress through the cell cycle or, if necessary, when to undergo apoptosis.</span>
            </div>
        </div>
        <div class="row">
            <div class="col-md-4 pull-right">
                <a href="learn.aspx" class="btn btn-info">Click Next To Continue</a>
            </div>
        </div>
    </div>
    </form>
</body>
</html>
