<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="recover.aspx.cs" Inherits="IRT.recover" meta:resourcekey="PageResource1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
     <div class="page-header">
        <div class="container">
            <div class="page-header-inner">
                <ol class="breadcrumb wow fadeInDown" data-wow-delay="300ms">
                    <li><a href="default.aspx"><asp:Literal ID="Literal52" runat="server" meta:resourcekey="Literal52Resource1" Text="Inicio"></asp:Literal></a></li>
                    <li class="page"><asp:Literal ID="Literal1" runat="server" meta:resourcekey="Literal1Resource1" Text="Resetear contraseña"></asp:Literal></li>
                </ol>
                <h1 class="page-title wow fadeInRight" data-wow-delay="300ms"><asp:Literal ID="Literal2" runat="server" meta:resourcekey="Literal2Resource1" Text="Resetear contraseña"></asp:Literal>
                </h1>
            </div>
        </div>
    </div>

    <section id="princing">
        <div class="container">
            <div class="row">
                <div class="col-md-12">
                    <div class="content">
                        <h2><asp:Literal ID="Literal3" runat="server" meta:resourcekey="Literal3Resource1" Text="¿Olvidaste tu contraseña?"></asp:Literal></h2>
                        <asp:Panel ID="panMensaje" runat="server" Visible="False" meta:resourcekey="panMensajeResource1">
                            <h3>
                                <asp:Label ID="lblmsg2" CssClass="label label-danger" runat="server" Text="Label" meta:resourcekey="lblmsg2Resource1"></asp:Label>
                            </h3>
                        </asp:Panel>
                        <div class="subscribe-box">
                            <div class="subscribe-form">
                                <div class="row">
                                    <div class="col-md-6">
                                        <label for="inputEmail">
                                            <asp:Literal ID="Literal4" runat="server" meta:resourcekey="Literal4Resource1" Text="Indica tu e-mail"></asp:Literal>:</label>
                                        <asp:TextBox ID="tUsuario" class="form-control" runat="server" placeholder="e-mail" meta:resourcekey="tUsuarioResource1"></asp:TextBox>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" CssClass="alert-danger" runat="server" ErrorMessage="Campo requerido" ControlToValidate="tUsuario" meta:resourcekey="RequiredFieldValidator1Resource1"></asp:RequiredFieldValidator>
                                    </div>
                                </div>                               
                                <div class="row">
                                    <div class="col-md-6">
                                        <asp:Button ID="bEntrar" runat="server" Text="Resetear contraseña" CssClass="btn btn-block btn-common"  meta:resourcekey="bEntrarResource1" OnClick="bEntrar_Click" />
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
