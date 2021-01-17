<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="HomePage.aspx.cs" Inherits="LetMeHelp.HomePage" %>



<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Let Me Help</title>
</head>
<body>
    <div class="jumbotron">
        <h1>LetMeHelp</h1>
    </div>
    <div id="DivNoPosts" runat="server">
        <p id="NoPostInfo">There are currently no posts to show.</p><br />
        <p>Thank you for using our service.</p>
    </div>

    <asp:Panel ID="ViewDynamic" runat="server" BorderColor="Black" BorderStyle="Solid" Width="100%" Height="100%">
        <div id="PostList" class="container" style="width:inherit;height:inherit" runat="server">
            <form id="form1" runat="server">
                <div>
                <asp:ListBox ID="Listbox_Posts" runat="server"></asp:ListBox><br />
                <br />
                <asp:Button ID="Button1" runat="server" onclick="Button1_Click" Text="Button"/>
                </div>
            </form>
        </div>
    </asp:Panel>

</body>
</html>
