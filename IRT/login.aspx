<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/Site.Master" CodeBehind="login.aspx.cs" Inherits="IRT.login" meta:resourcekey="PageResource1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="page-header">
        <div class="container">
            <div class="page-header-inner">
                <ol class="breadcrumb wow fadeInDown" data-wow-delay="300ms">
                    <li><a href="default.aspx"><asp:Literal ID="Literal52" runat="server" meta:resourcekey="Literal52Resource1" Text="Inicio"></asp:Literal></a></li>
                    <li class="page"><asp:Literal ID="Literal1" runat="server" meta:resourcekey="Literal1Resource1" Text="Acceso a tu Panel"></asp:Literal></li>
                </ol>
                <h1 class="page-title wow fadeInRight" data-wow-delay="300ms"><asp:Literal ID="Literal2" runat="server" meta:resourcekey="Literal2Resource1" Text="Acceso a tu Panel"></asp:Literal>
                </h1>
            </div>
        </div>
    </div>

    <section id="princing">
        <div class="container">
            <div class="row">
                <div class="col-md-12">
                    <div class="content">
                        <h2><asp:Literal ID="Literal3" runat="server" meta:resourcekey="Literal3Resource1" Text="Indica tus datos de acceso"></asp:Literal></h2>
                        <asp:Panel ID="panMensaje" runat="server" Visible="False" meta:resourcekey="panMensajeResource1">
                            <h3>
                                <label id="lblmsg" runat="server" class="label label-danger"></label>
                            </h3>
                        </asp:Panel>
                        <div class="subscribe-box">
                            <div class="subscribe-form">
                                <div class="row">
                                    <div class="col-md-6">
                                        <label for="inputEmail">E-mail:</label>
                                        <asp:TextBox ID="tUsuario" class="form-control" runat="server" placeholder="e-mail" meta:resourcekey="tUsuarioResource1" MaxLength="50"></asp:TextBox>
                                        <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ErrorMessage="No es un correo válido" ControlToValidate="tUsuario" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"></asp:RegularExpressionValidator><asp:RequiredFieldValidator ID="RequiredFieldValidator1" CssClass="alert-danger" runat="server" ErrorMessage="Campo requerido" ControlToValidate="tUsuario" meta:resourcekey="RequiredFieldValidator1Resource1"></asp:RequiredFieldValidator>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-md-6">
                                        <label for="inputEmail"><asp:Literal ID="Literal4" runat="server" meta:resourcekey="Literal4Resource1" Text="Contraseña"></asp:Literal>:</label>
                                        <asp:TextBox ID="tPass" TextMode="Password" class="form-control" runat="server" meta:resourcekey="tPassResource1" MaxLength="50"></asp:TextBox>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" CssClass="alert-danger" runat="server" ErrorMessage="Campo requerido" ControlToValidate="tPass" meta:resourcekey="RequiredFieldValidator2Resource1"></asp:RequiredFieldValidator>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-md-6">
                                        <asp:Button ID="bEntrar" runat="server" Text="Entrar" CssClass="btn btn-block btn-common" OnClick="bEntrar_Click" meta:resourcekey="bEntrarResource1" />
                                        <br />
                                        <a href="recover.aspx">
                                            <asp:Literal ID="Literal5" runat="server" meta:resourcekey="Literal5Resource1" Text="¿Has olvidado tu contraseña?"></asp:Literal></a>
                                    </div>
                                </div>
                            </div>

                        </div>
                    </div>
                </div>
            </div>
        </div>
        <p>&nbsp;</p>
        <p>&nbsp;</p>
        <p>&nbsp;</p>
        <p>&nbsp;</p>
    </section>
</asp:Content>
