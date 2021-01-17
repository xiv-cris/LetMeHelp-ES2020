<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="VerAnuncio.aspx.cs" Inherits="LetMeHelp.VerAnuncio"  MasterPageFile="~/Site.Master"%>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <section class="p-4 d-flex justify-content-center mb-4" style="margin-top:50px;text-align: left">
        <h2 id="Titulo" runat="server"></h2>
        <hr />

        <form style="width: 22rem; margin-bottom: 20%">
            <label>Descrição</label>
            <br />
            <textarea style="width:100%;height:100%" id="descr" runat="server"></textarea>
            <br />
        </form>

        <br />
        <br />

        <div id="ContactInfo" runat="server" style="border:solid">
            <label>Contacto do anunciante:</label><br />
            <p id="contactMail" runat="server">Email:</p>
            <p id="contactPhone" runat="server">Telefone:</p>
        </div>

    </section>
</asp:Content>