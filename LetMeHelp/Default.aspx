<%@ Page Title="Home Page" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="LetMeHelp.Default" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">


    <div class="jumbotron">
        <h1>LetMeHelp</h1>
        <p class="lead">Aqui encontrará formas de ajudar o próximo e de pedir ajuda sem ser necessário pagamentos munetários.</p>

        <asp:Button ID="ButtonE" CssClass="btn btn-primary mb-4" onclick="ButtonNovo_Click" runat="server" Text="Novo Anúncio" />
    </div>

    <h2>Anúncios</h2>
    <hr />

    <div id="DivNoPosts" runat="server">
        <p id="NoPostInfo">There are currently no posts to show.</p><br />
        <p>Thank you for using our service.</p>
    </div>

    <section id="postsDedicated" style="text-align:center" runat="server">
    </section>
</asp:Content>
