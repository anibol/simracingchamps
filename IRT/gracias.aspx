<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="gracias.aspx.cs" Inherits="IRT.gracias" meta:resourcekey="PageResource1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="page-header">
        <div class="container">
            <div class="page-header-inner">
                <ol class="breadcrumb wow fadeInDown" data-wow-delay="300ms">
                    <li><a href="default.aspx">
                        <asp:Literal ID="Literal1" runat="server"  Text="Inicio" meta:resourcekey="Literal1Resource1"></asp:Literal></a></li>
                    <li class="page">
                        <asp:Literal ID="Literal2" runat="server"  Text="Contacto" meta:resourcekey="Literal2Resource1"></asp:Literal></li>
                </ol>
                <h1 class="page-title wow fadeInRight" data-wow-delay="300ms">
                    <asp:Literal ID="Literal3" runat="server" Text="Contacto" meta:resourcekey="Literal3Resource1"></asp:Literal>
                </h1>
            </div>
        </div>
    </div>

    <section id="about" class="section">
        <div class="container">
            <div class="row">
                <div class="col-md-12">
                    <h3 class="section-title wow fadeInUp" data-wow-delay="0s">
                        <asp:Literal ID="Literal4" runat="server" Text="Gracias, nos pondremos en contacto contigo lo antes posible." meta:resourcekey="Literal4Resource1"></asp:Literal></h3>
                                  
                </div>
            </div>
        </div>
    </section>
</asp:Content>
