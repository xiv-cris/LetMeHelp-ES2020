<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="CriarAnuncio.aspx.cs" Inherits="LetMeHelp.CriarAnuncio" MasterPageFile="~/Site.Master" %>


<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <section class="p-4 d-flex justify-content-center mb-4" style="margin-top:50px;text-align: -webkit-center;">
        <h2>Novo Anúncio</h2>
        <hr />

        <div id="divErrors" class="alert alert-danger mb-4" role="alert" runat="server">
            <asp:Literal runat="server" ID="StatusText" />
        </div>

        <form style="width: 22rem; margin-bottom: 20%" >

        <div class="form-outline mb-4">
            <label for="TextBoxTitulo" class="form-label">Titulo do anúncio:</label>
            <asp:TextBox ID="TextBoxTitulo" CssClass="form-control" runat="server"></asp:TextBox>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server"   
                ControlToValidate="TextBoxTitulo" ErrorMessage="Por favor introduza um Titulo"   
                ForeColor="Red">
            </asp:RequiredFieldValidator>
        </div>

        <div class="form-outline mb-4">
            <label for="TextBoxDescricao" class="form-label">Descriçao</label><br />
            <asp:TextBox ID="TextBoxDescricao" CssClass="form-control" runat="server"></asp:TextBox>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server"   
                ControlToValidate="TextBoxDescricao" ErrorMessage="Por favor introduza uma descricao!"
                ForeColor="Red">
            </asp:RequiredFieldValidator>
            <div style="text-align:center;">
            </div>
        </div>
        <br />
        <asp:Button ID="Button_CriarAd" CssClass="btn btn-primary mb-4" onclick="ButtonCriar_Click" runat="server" Text="Criar" />
    </form>

    </section>
</asp:Content>
