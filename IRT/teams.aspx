<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="teams.aspx.cs" Inherits="IRT.teams" meta:resourcekey="PageResource1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        .grid-item {
            width: 33%;
        }

        .grid-item--width2 {
            width: 400px;
        }
    </style>
    <script src="assets/js/masonry.pkgd.min.js"></script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="page-header">
        <div class="container">
            <div class="page-header-inner">
                <ol class="breadcrumb wow fadeInDown" data-wow-delay="300ms">
                    <li><a href="default.aspx">
                        <asp:Literal ID="Literal1" runat="server" meta:resourcekey="Literal1Resource1" Text="Inicio"></asp:Literal></a></li>
                    <li class="page">
                        <asp:Literal ID="Literal2" runat="server" meta:resourcekey="Literal2Resource1" Text="Equipos"></asp:Literal></li>
                </ol>
                <h1 class="page-title wow fadeInRight" data-wow-delay="300ms"><asp:Literal ID="Literal3" runat="server" meta:resourcekey="Literal3Resource1" Text="LISTA DE EQUIPOS"></asp:Literal>
                </h1>
            </div>
        </div>
    </div>

    <section id="speakers" class="section">
        <div class="container">
            
                <asp:Repeater ID="repEquipos" runat="server">
                    <HeaderTemplate>
                        <div class="row grid hidden-xs">
                    </HeaderTemplate>
                    <ItemTemplate>
                        <div class="col-md-4 col-sm-6 col-xs-12 grid-item">
                            <div class="speakers-member" style="border-top:3px solid #950101;">
                                <div class="member-img">
                                    <img style="width:200px;height:auto;" src="<%# DameAvatar(DataBinder.Eval(Container.DataItem,"ID"),DataBinder.Eval(Container.DataItem,"AVATAR")) %>" alt="">
                                </div>
                                <div class="member-desc">
                                    <h3><a href='team.aspx?id=<%# DataBinder.Eval(Container.DataItem,"ID") %>'><%# DataBinder.Eval(Container.DataItem,"EQUIPO") %></a></h3>
                                    <h5><asp:Literal ID="Literal23" runat="server" meta:resourcekey="Literal23Resource1" Text="Fundado"></asp:Literal>: <%# DataBinder.Eval(Container.DataItem,"FUNDACION") %>&nbsp;</h5>
                                    <h5><asp:Literal ID="Literal43" runat="server" meta:resourcekey="Literal43Resource1" Text="Jefe de Equipo"></asp:Literal>: <%# DameJefeEquipo(DataBinder.Eval(Container.DataItem,"IDUSUARIO")) %>&nbsp;</h5>
                                    <p><a href="team.aspx?id=<%# DataBinder.Eval(Container.DataItem,"ID") %>"><i class="fa fa-address-card-o"></i> <asp:Literal ID="Literal245" runat="server" meta:resourcekey="Literal245Resource1" Text="Ver Pilotos"></asp:Literal></a></p>
                                    <div class="social-icon">
                                        <%# DameSocial(DataBinder.Eval(Container.DataItem,"WEB"),DataBinder.Eval(Container.DataItem,"FB"),DataBinder.Eval(Container.DataItem,"TWITTER")) %>&nbsp;
                                    </div>
                                </div>
                            </div>
                        </div>
                    </ItemTemplate>
                    <FooterTemplate>
                        </div>
                    </FooterTemplate>
                </asp:Repeater>
             <asp:Repeater ID="repE2" runat="server">
                    <HeaderTemplate>
                        <div class="row visible-xs">
                    </HeaderTemplate>
                    <ItemTemplate>
                        <div class="col-xs-12">
                            <div class="speakers-member" style="border-top:3px solid #950101;">
                                <div class="member-img">
                                    <img style="width:200px;height:auto;" src="<%# DameAvatar(DataBinder.Eval(Container.DataItem,"ID"),DataBinder.Eval(Container.DataItem,"AVATAR")) %>" alt="">
                                </div>
                                <div class="member-desc">
                                    <h3><a href='team.aspx?id=<%# DataBinder.Eval(Container.DataItem,"ID") %>'><%# DataBinder.Eval(Container.DataItem,"EQUIPO") %></a></h3>
                                    <h5><asp:Literal ID="Literal4" runat="server" meta:resourcekey="Literal23Resource1" Text="Fundado"></asp:Literal>: <%# DataBinder.Eval(Container.DataItem,"FUNDACION") %>&nbsp;</h5>
                                    <h5><asp:Literal ID="Literal5" runat="server" meta:resourcekey="Literal43Resource1" Text="Jefe de Equipo"></asp:Literal>: <%# DameJefeEquipo(DataBinder.Eval(Container.DataItem,"IDUSUARIO")) %>&nbsp;</h5>
                                    <p><a href="team.aspx?id=<%# DataBinder.Eval(Container.DataItem,"ID") %>"><i class="fa fa-address-card-o"></i> <asp:Literal ID="Literal6" runat="server" meta:resourcekey="Literal245Resource1" Text="Ver Pilotos"></asp:Literal></a></p>
                                    <div class="social-icon">
                                        <%# DameSocial(DataBinder.Eval(Container.DataItem,"WEB"),DataBinder.Eval(Container.DataItem,"FB"),DataBinder.Eval(Container.DataItem,"TWITTER")) %>&nbsp;
                                    </div>
                                </div>
                            </div>
                        </div>
                    </ItemTemplate>
                    <FooterTemplate>
                        </div>
                    </FooterTemplate>
                </asp:Repeater>
            
        </div>
    </section>
    <script>        
        $(document).ready(function () {
            $('.grid').masonry({
                // options
                itemSelector: '.grid-item',              
                percentPosition: true,
                horizontalOrder: true
            });
        });
    </script>
</asp:Content>


