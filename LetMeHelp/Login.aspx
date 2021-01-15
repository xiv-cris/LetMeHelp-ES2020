<%@ Page Title="Login" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="LetMeHelp.Login" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">

<section class="p-4 d-flex justify-content-center mb-4" style="margin-top:50px;text-align: -webkit-center;" > 
    <div id="divMessage" class="alert alert-success mb-4" role="alert" runat="server">
        <asp:Literal runat="server" ID="StatusText" />
    </div>
    <h2>Entrar</h2>
    <hr />
    <div id="divErrors" class="alert alert-danger mb-4" role="alert" runat="server">
        <asp:Literal runat="server" ID="StatusErrorText" />
    </div>
    <form style="width: 22rem; margin-bottom: 20%" >
        <div class="form-outline mb-4">
            <label for="TextBoxEmail" class="form-label">Email:</label>
            <asp:TextBox ID="TextBoxEmail" TextMode="Email" CssClass="form-control" runat="server"></asp:TextBox>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server"   
                ControlToValidate="TextBoxEmail" ErrorMessage="Por favor introduza um email!"   
                ForeColor="Red">
            </asp:RequiredFieldValidator>
        </div>

        <div class="form-outline mb-4">
            <label for="TextBoxPass" class="form-label">Palavra-passe:</label>
            <asp:TextBox ID="TextBoxPass" TextMode="Password" Cssclass="form-control" runat="server"></asp:TextBox>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server"   
                ControlToValidate="TextBoxPass" ErrorMessage="Por favor introduza a sua palavra-passe!"   
                ForeColor="Red">
            </asp:RequiredFieldValidator>
            <div style="text-align:center;">
            <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" 
                ErrorMessage="Por favor introduza uma palavra-passe com no mínimo 8 caracteres!" ValidationExpression="[^ ]{8,}" 
                ControlToValidate="TextBoxPass" ForeColor="Red">
            </asp:RegularExpressionValidator>
            </div>
        </div>
        <br /><br />

        <div class="text-center">
            <p>Ainda não é membro? <a runat="server" href="~/Register">Registe-se agora</a></p>
        </div>

        <asp:Button ID="Button1" CssClass="btn btn-primary mb-4" onclick="ButtonLogin_Click" runat="server" Text="Entrar" />
    </form>
</section>   

</asp:Content>
