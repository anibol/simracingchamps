<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="contact.aspx.cs" Inherits="IRT.contact" meta:resourcekey="PageResource1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="page-header">
        <div class="container">
            <div class="page-header-inner">
                <ol class="breadcrumb wow fadeInDown" data-wow-delay="300ms">
                    <li><a href="index.html">
                        <asp:Literal ID="Literal1" runat="server" meta:resourcekey="Literal1Resource1" Text="Inicio"></asp:Literal></a></li>
                    <li class="page">
                        <asp:Literal ID="Literal2" runat="server" meta:resourcekey="Literal2Resource1" Text="Contacto"></asp:Literal></li>
                </ol>
                <h1 class="page-title wow fadeInRight" data-wow-delay="300ms"><asp:Literal ID="Literal3" runat="server" meta:resourcekey="Literal3Resource1" Text="Contacto"></asp:Literal>
                </h1>
            </div>
        </div>
    </div>

   <section id="map">
        <div class="container-fluid">
            <div class="row">
                <div id="map_canvas"></div>
            </div>
        </div>
    </section>


    <div class="main-content">

        <section id="contact">
            <div class="container">
                <div class="row wow fadeInDown" data-wow-delay="0.3s">
                    <div class="col-md-12 col-sm-12 contact-form">
                        <div role="form" id="contactForm" data-toggle="validator">
                            <div class="title-header">
                                <h3 class="title-medium pull-left">
                                    <asp:Literal ID="Literal4" runat="server" meta:resourcekey="Literal4Resource1" Text="Envíanos un mensaje"></asp:Literal></h3>
                                <div class="icon pull-right"><i class="icon-envelope"></i></div>
                            </div>
                            <div class="row">
                                <div class="col-md-6">
                                    <div class="label-line">
                                        <span class="span"></span>
                                        <label class="label transition">
                                            <asp:Literal ID="Literal5" runat="server" meta:resourcekey="Literal5Resource1" Text="Nombre"></asp:Literal></label>
                                        <input runat="server" type="text" class="input" id="name" >
                                        <div class="help-block with-errors"></div>
                                    </div>
                                </div>
                                <div class="col-md-6">
                                    <div class="label-line">
                                        <span class="span"></span>
                                        <label class="label transition">Email</label>
                                        <input runat="server" type="email" class="input" id="email" >
                                        <div class="help-block with-errors"></div>
                                    </div>
                                </div>
                                <div class="col-md-12">
                                    <div class="label-line textarea">
                                        <span class="span"></span>
                                        <label class="label transition">
                                            <asp:Literal ID="Literal6" runat="server" meta:resourcekey="Literal6Resource1" Text="Mensaje"></asp:Literal></label>
                                        <textarea runat="server" id="message" class="input" ></textarea>
                                        <div class="help-block with-errors"></div>
                                    </div>
                                    <button type="submit" id="form-submit" class="btn btn-common">
                                        <asp:Literal ID="Literal7" runat="server" meta:resourcekey="Literal7Resource1" Text="Enviar"></asp:Literal> <i class="icon-paper-plane" aria-hidden="true"></i></button>
                                    <div id="msgSubmit" class="h3 text-center hidden">
                                        <asp:Label ID="lblmsg" runat="server" meta:resourcekey="lblmsgResource1"></asp:Label>
                                    </div>
                                    <div class="clearfix"></div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>
    </div>
</asp:Content>
