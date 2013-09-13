<%@ Page Language="C#" AutoEventWireup="true" CodeFile="ControlsTest.aspx.cs" Inherits="Test_Default" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">
    </style>
    <link href="../Styles/Styles.css" rel="stylesheet" type="text/css" />
</head>
<body>
    <form id="form1" runat="server">
        <div>
            Your name xD<asp:TextBox ID="YourName" runat="server"></asp:TextBox>
            <asp:Button ID="SubmitButtom" runat="server" OnClick="SubmitButtom_Click" Text="Submit Information" />
            <br />
            <asp:Label ID="Result" runat="server"></asp:Label>

            <nav>
                <asp:Button CssClass="Buttons" ID="Button1" runat="server" OnClick="Button1_Click" Text="Agrupación" />
                <asp:Button CssClass="Buttons" ID="Button2" runat="server" OnClick="Button2_Click" Text="Eventos" />
                <asp:Button CssClass="Buttons" ID="Button3" runat="server" OnClick="Button3_Click" Text="Calendarios" />
            </nav>

        </div>
    </form>
</body>
</html>
