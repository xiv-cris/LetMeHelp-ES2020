<%@ Page Title="Perfil" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Perfil.aspx.cs" Inherits="LetMeHelp.Perfil" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">

<section class="p-4 d-flex justify-content-center mb-4" style="margin-top:50px;text-align: -webkit-center;" > 
    <h2>Perfil</h2>
    <hr />
    <div id="divErrors" class="alert alert-danger mb-4" role="alert" runat="server">
        <asp:Literal runat="server" ID="StatusText" />
    </div>

    <div id="divUpdate" class="alert alert-success mb-4" role="alert" runat="server">
        <asp:Literal runat="server" ID="UpdateText" />
    </div>

    <form style="margin-bottom: 20%" >

        <div class="form-outline md-4">
            <asp:Image id="imgUser"
                style="height: 170px"
                runat="server">
            </asp:Image>
        </div>
        <br />
        <div class="form-outline mb-4">
            <label for="ImgUpload" class="form-label">Imagem:</label>
            
            <asp:FileUpload ID="ImgUpload" runat="server" />
        </div>

        <br />

        <div class="form-outline md-4">
            <label for="TextBoxNome" class="form-label">Nome Completo:</label>
            <p><asp:Literal runat="server" ID="NomeDefault" /></p>
            <asp:TextBox ID="TextBoxNome" CssClass="form-control" runat="server"></asp:TextBox>
        </div>

        <div class="form-outline mb-4">
            <label for="TextBoxTel" class="form-label">Contacto Telefónico:</label>
            <p><asp:Literal runat="server" ID="TelDefault" /></p>
            <asp:TextBox ID="TextBoxTel" CssClass="form-control" runat="server"></asp:TextBox>
            <div style="text-align:center;">
            <asp:RegularExpressionValidator ID="RegularExpressionValidator5" runat="server" 
                ErrorMessage="Por favor introduza um contato válido!" ValidationExpression="^[0-9]{9}$" 
                ControlToValidate="TextBoxTel" ForeColor="Red">
            </asp:RegularExpressionValidator>
            </div>
        </div>
        
        <div class="form-outline mb-4">
            <label for="TextAreaDescription" class="form-label">Descrição Pessoal:</label>
            <p><asp:Literal runat="server" ID="DescriptionDefault" /></p>
            <asp:TextBox id="TextAreaDescription" TextMode="multiline" Columns="50" Rows="5" CssClass="form-control" runat="server" />
        </div>

        <div class="form-outline mb-4">
            <label for="TextBoxPass" class="form-label">Palavra-passe:</label>
            <asp:TextBox ID="TextBoxPass" TextMode="Password" CssClass="form-control" runat="server"></asp:TextBox>
        </div>

        <div class="form-outline mb-4">
            <label for="TextBoxPass2" class="form-label">Palavra-passe:</label>
            <asp:TextBox ID="TextBoxPass2" TextMode="Password" CssClass="form-control" runat="server"></asp:TextBox>
            <div style="text-align:center;">
            <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" 
                ErrorMessage="Por favor introduza uma palavra-passe com no mínimo 8 caracteres!" ValidationExpression="[^ ]{8,}" 
                ControlToValidate="TextBoxPass2" ForeColor="Red">
            </asp:RegularExpressionValidator>
            </div>
        </div>

        <br /><br />

        <asp:Button ID="Button1" CssClass="btn btn-primary mb-4" onclick="ButtonRegistar_Click" runat="server" Text="Atualizar" />
    </form>
</section>   

</asp:Content>
