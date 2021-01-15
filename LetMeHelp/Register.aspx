<%@ Page Title="Register" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Resgister.aspx.cs" Inherits="LetMeHelp.Resgister" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">

<section class="p-4 d-flex justify-content-center mb-4" style="margin-top:50px;text-align: -webkit-center;" > 
    <h2>Registar</h2>
    <hr />
    <div id="divErrors" class="alert alert-danger mb-4" role="alert" runat="server">
        <asp:Literal runat="server" ID="StatusText" />
    </div>
    <form style="width: 22rem; margin-bottom: 20%" >

        <div class="form-outline mb-4">
            <label for="TextBoxNome" class="form-label">Nome Completo:</label>
            <asp:TextBox ID="TextBoxNome" CssClass="form-control" runat="server"></asp:TextBox>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server"   
                ControlToValidate="TextBoxNome" ErrorMessage="Por favor introduza um nome!"   
                ForeColor="Red">
            </asp:RequiredFieldValidator>
        </div>

        <div class="form-outline mb-4">
            <label for="TextBoxData" class="form-label">Data de Nascimnto:</label>
            <asp:TextBox ID="TextBoxData" TextMode="Date" CssClass="form-control" runat="server"></asp:TextBox>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server"   
                ControlToValidate="TextBoxData" ErrorMessage="Tem de introduzir uma data de nascimento!"
                ForeColor="Red">
            </asp:RequiredFieldValidator>
            <div style="text-align:center;">
            <asp:RangeValidator ID="RangeValidator2" runat="server"
                  ControlToValidate="TextBoxData" Display="Dynamic" ErrorMessage="Tem de ser maior de 18 anos de idade!"
                  MaximumValue="01/01/2002" MinimumValue="01/01/1940" SetFocusOnError="True"
                  Type="Date" ForeColor="Red">
            </asp:RangeValidator>
            </div>
        </div>

        <div class="form-outline mb-4">
            <div style="text-align:center;">
            <label for="DropDownList1" class="form-label">Género:</label>
            </div>
            <asp:DropDownList CssClass="form-control" ID="DropDownList1" runat="server" AppendDataBoundItems="true">  
                <asp:ListItem Value="-1">Selecione uma opção</asp:ListItem>  
                <asp:ListItem>Masculino</asp:ListItem>  
                <asp:ListItem>Feminino</asp:ListItem>  
            </asp:DropDownList>  
            <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server"   
                ControlToValidate="DropDownList1" ErrorMessage="Por favor introduza um género!"   
                ForeColor="Red">
            </asp:RequiredFieldValidator>
        </div>

        <div class="form-outline mb-4">
            <label for="TextBoxTel" class="form-label">Contacto Telefónico:</label>
            <asp:TextBox ID="TextBoxTel" CssClass="form-control" runat="server"></asp:TextBox>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server"   
                ControlToValidate="TextBoxTel" ErrorMessage="Por favor introduza um contato telefónico!"
                ForeColor="Red">
            </asp:RequiredFieldValidator>
            <div style="text-align:center;">
            <asp:RegularExpressionValidator ID="RegularExpressionValidator5" runat="server" 
                ErrorMessage="Por favor introduza um contato válido!" ValidationExpression="^[0-9]{9}$" 
                ControlToValidate="TextBoxTel" ForeColor="Red">
            </asp:RegularExpressionValidator>
            </div>
        </div>
        
        <div class="form-outline mb-4">
            <label for="TextAreaDescription" class="form-label">Descrição Pessoal:</label>
            <asp:TextBox id="TextAreaDescription" TextMode="multiline" Columns="50" Rows="5" CssClass="form-control" runat="server" />
            <asp:RequiredFieldValidator ID="RequiredFieldValidator8" runat="server"   
                ControlToValidate="TextAreaDescription" ErrorMessage="Por favor introduza uma pequena descrição que será apresentada no seu perfil!"   
                ForeColor="Red">
            </asp:RequiredFieldValidator>
        </div>

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
            <asp:TextBox ID="TextBoxPass" TextMode="Password" CssClass="form-control" runat="server"></asp:TextBox>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server"   
                ControlToValidate="TextBoxPass" ErrorMessage="Por favor introduza a sua palavra-passe!"   
                ForeColor="Red">
            </asp:RequiredFieldValidator>
        </div>

        <div class="form-outline mb-4">
            <label for="TextBoxPass2" class="form-label">Palavra-passe:</label>
            <asp:TextBox ID="TextBoxPass2" TextMode="Password" CssClass="form-control" runat="server"></asp:TextBox>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server"   
                ControlToValidate="TextBoxPass2" ErrorMessage="Por favor introduza novamente a sua palavra-passe!"   
                ForeColor="Red">
            </asp:RequiredFieldValidator>
            <div style="text-align:center;">
            <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" 
                ErrorMessage="Por favor introduza uma palavra-passe com no mínimo 8 caracteres!" ValidationExpression="[^ ]{8,}" 
                ControlToValidate="TextBoxPass2" ForeColor="Red">
            </asp:RegularExpressionValidator>
            </div>
        </div>
        <br /><br />

        <div class="text-center">
            <p>Já é membro? <a runat="server" href="~/Login">Entre agora</a></p>
        </div>

        <asp:Button ID="Button1" CssClass="btn btn-primary mb-4" onclick="ButtonRegistar_Click" runat="server" Text="Registar" />
    </form>
</section>   

</asp:Content>
