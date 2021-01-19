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
            <label for="TextAreaDescription" class="form-label">Descrição do anúncio:</label>
            <asp:TextBox id="TextAreaDescription" TextMode="multiline" Columns="50" Rows="5" CssClass="form-control" runat="server" />
            <asp:RequiredFieldValidator ID="RequiredFieldValidator8" runat="server"   
                ControlToValidate="TextAreaDescription" ErrorMessage="Por favor introduza uma pequena descrição do que será necessário fazer!"   
                ForeColor="Red">
            </asp:RequiredFieldValidator>
        </div>

        <div class="form-outline mb-4">
            <label for="TextOferta" class="form-label">Oferta:</label>
            <asp:TextBox ID="TextOferta" CssClass="form-control" runat="server"></asp:TextBox>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server"   
                ControlToValidate="TextOferta" ErrorMessage="Por favor introduza uma oferta, não pode ser monetário!"   
                ForeColor="Red">
            </asp:RequiredFieldValidator>
        </div>

        <div class="form-outline mb-4">
            <label for="ImgUpload" class="form-label">Imagem:</label>
            
            <asp:FileUpload ID="ImgUpload" runat="server" />
            
            <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server"   
                ControlToValidate="ImgUpload" ErrorMessage="Por favor introduza uma imagem elucidativa ao anúncio!"   
                ForeColor="Red">
            </asp:RequiredFieldValidator>
        </div>

            

        <br />
        <asp:Button ID="Button_CriarAd" CssClass="btn btn-primary mb-4" onclick="ButtonCriar_Click" runat="server" Text="Criar" />
    </form>

    </section>
</asp:Content>
