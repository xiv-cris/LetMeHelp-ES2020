<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="VerAnuncio.aspx.cs" Inherits="LetMeHelp.VerAnuncio"  MasterPageFile="~/Site.Master"%>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <section class="p-4 d-flex justify-content-center mb-4" style="margin-top:50px;text-align: left">
        <h2>Detalhes do Anuncio</h2>
        <hr />

        <div class="card mb-3" >
            <div class="row g-0">
                <div class="col-md-4">
                    <asp:Image id="imgPost"
                        style="height: 270px"
                        runat="server">
                    </asp:Image>
                </div>
                <div class="col-md-8">
                    <div class="card-body">
                        <h2 class="card-title" id="Titulo" runat="server"></h2>
                        <hr />
                        <p class="card-text" style="font-size: 18px;"><asp:Literal runat="server" ID="descr" /></p>
                        <br />
                        <p class="card-text" style="font-size: large;color:midnightblue"><span style="font-weight: 900; text-decoration: underline">Oferta:</span> <asp:Literal runat="server" ID="oferta" /></p>
                        <br />
                        <p class="card-text" style="text-align:end"><small class="text-muted"><asp:Literal runat="server" ID="Data" /></small></p>
                    </div>
                </div>
            </div>
        </div>
        <br />
        <br />
        <div id="ContactInfo" class="card mb-3" runat="server" >
            <div class="row g-0">
                <div class="col-md-4">
                    <asp:Image id="ImgPerfil"
                        style="height: 270px"
                        runat="server">
                    </asp:Image>
                </div>
                <div class="col-md-8">
                    <div class="card-body">
                        <h2>Propor ao Anunciante:</h2>
                        <h3 class="card-title" id="anunciante" runat="server"></h3>
                        <hr />
                        <p class="card-text" style="font-size: 18px;"><asp:Literal runat="server" ID="anuncDescr" /></p>
                        <br />
                        <p class="card-text" style="font-size: large;color:midnightblue"><span style="font-weight: 900; text-decoration: underline">Contato:</span> <asp:Literal runat="server" ID="anuncTel" /></p>
                        <br />
                        <form>
                            <div class="form-outline mb-4">
                                <label for="TextAreaDescription" class="form-label">Mensagem sobre a proposta:</label>
                                <asp:TextBox id="TextAreaDescription" TextMode="multiline" Columns="50" Rows="5" CssClass="form-control" runat="server" />
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator8" runat="server"   
                                    ControlToValidate="TextAreaDescription" ErrorMessage="Por favor introduza as dúvidas que tiver, se pretende aceitar ou recusar a proposta inicial, ou faça a sua contra-proposta!"   
                                    ForeColor="Red">
                                </asp:RequiredFieldValidator>
                            </div>
                            <asp:Button ID="ButtonE" CssClass="btn btn-primary mb-4" onclick="ButtonEnviar_Click" runat="server" Text="Enviar resposta" />
                        </form>

                        <div id="divMessage" class="alert alert-success mb-4" role="alert" runat="server">
                            <asp:Literal runat="server" ID="EnvioOK" />
                        </div>
                        <div id="divErro" class="alert alert-danger mb-4" role="alert" runat="server">
                            <asp:Literal runat="server" ID="ErroEnviar" />
                        </div>
                    </div>
                </div>
            </div>
        </div>

    </section>
</asp:Content>