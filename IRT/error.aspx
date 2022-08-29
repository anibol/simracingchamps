<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="error.aspx.cs" Inherits="IRT.error" meta:resourcekey="PageResource1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
     <div class="page-header">
        <div class="container">
            <div class="page-header-inner">
                <ol class="breadcrumb wow fadeInDown" data-wow-delay="300ms">
                    <li><a href="default.aspx">
                        <asp:Literal ID="Literal1" runat="server" meta:resourcekey="Literal1Resource1" Text="Inicio"></asp:Literal></a></li>
                    <li class="page">Error</li>
                </ol>
                <h1 class="page-title wow fadeInRight" data-wow-delay="300ms">Upsss... 
                </h1>
            </div>
        </div>
    </div>

    <section id="about" class="section">
        <div class="container">
            <div class="row">
                <div class="col-md-12">
                    <h2 class="section-title wow fadeInUp" data-wow-delay="0s">
                        <asp:Literal ID="Literal2" runat="server" meta:resourcekey="Literal2Resource1" Text="Se ha producido un error"></asp:Literal></h2>
                    <div class="col-md-12 col-sm-12">
                        <div class="service-block wow fadeInDown" data-wow-delay="0.1s">
                            <div class="img-wrap">
                                <img src="assets/img/feature/img-1.jpg" alt="">
                            </div>
                            <div class="descr">
                                <h4>
                                    <asp:Literal ID="Literal3" runat="server" meta:resourcekey="Literal3Resource1" Text="¿Qué ha ocurrido?"></asp:Literal></h4>
                                <p><asp:Literal ID="Literal4" runat="server" meta:resourcekey="Literal4Resource1" Text="Lo sentimos, SimRacingChamps.net es una aplicación web en desarrollo y aún contiene algún error que otro. &lt;br /&gt;Hemos enviado un correo al programador a ver si suelta el volante y coge al teclado ;)"></asp:Literal></p>                                
                            </div>
                        </div>
                    </div>                 
                </div>
            </div>
        </div>
    </section>


    
</asp:Content>
