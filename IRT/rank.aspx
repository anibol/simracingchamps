<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="rank.aspx.cs" Inherits="IRT.rank" meta:resourcekey="PageResource1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="page-header">
        <div class="container">
            <div class="page-header-inner">
                <ol class="breadcrumb wow fadeInDown" data-wow-delay="300ms">
                    <li><a href="default.aspx">
                        <asp:Literal ID="Literal1" runat="server" meta:resourcekey="Literal1Resource1" Text="Inicio"></asp:Literal></a></li>
                    <li class="page">
                        <asp:Literal ID="Literal2" runat="server" meta:resourcekey="Literal2Resource1" Text="Piloto"></asp:Literal></li>
                </ol>
                <h1 class="page-title wow fadeInRight" data-wow-delay="300ms">
                    <asp:Literal ID="Literal3" runat="server" meta:resourcekey="Literal3Resource1" Text="Palmarés"></asp:Literal>
                </h1>
            </div>
        </div>
    </div>

    <section id="speakers" class="section">
        <div class="container">
            <div class="row">
                <div class="col-md-4 col-sm-12 col-xs-12">
                    <div class="speakers-member wow fadeIn animated" data-wow-delay="0.1s" style="visibility: visible; -webkit-animation-delay: 0.1s; -moz-animation-delay: 0.1s; animation-delay: 0.1s;">
                        <div class="member-img">
                            <img style="max-width: 100%; height: 100%;" src="<%=avatar %>" alt="">
                        </div>
                        <div class="member-desc">
                            <h3><%=nombre %></h3>
                            <h5><%=equipo %></h5>
                            <p><%=miembro %></p>
                            <div class="social-icon">
                                <%=social %>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-md-6 col-sm-12 col-xs-12">
                    <div class="speakers-member wow fadeIn animated" data-wow-delay="0.1s" style="visibility: visible; -webkit-animation-delay: 0.1s; -moz-animation-delay: 0.1s; animation-delay: 0.1s;">
                        <table class="table table-bordered table-hover">
                            <caption style="background-color: #950101; color: white; padding: 5px; font-weight: bold;">
                                <asp:Literal ID="Literal4" runat="server" meta:resourcekey="Literal4Resource1" Text="Participaciones en Campeonatos"></asp:Literal></caption>
                            <tbody>
                                <asp:Repeater ID="repPendientes" runat="server">
                                    <HeaderTemplate>
                                        <thead>
                                            <tr style="background-color: gainsboro;">
                                                <th>
                                                    <asp:Literal ID="Literal5" runat="server" Text="Plataforma" meta:resourcekey="Literal5Resource1"></asp:Literal></th>
                                                <th>
                                                    <asp:Literal ID="Literal6" runat="server" Text="Simulador" meta:resourcekey="Literal6Resource1"></asp:Literal></th>
                                                <th style="text-align:center;">
                                                    <asp:Literal ID="Literal8" runat="server" Text="Campeonato" meta:resourcekey="Literal8Resource1"></asp:Literal></th>
                                                <th style="text-align:center;">
                                                    <asp:Literal ID="Literal9" runat="server" Text="Pos."></asp:Literal></th>
                                            </tr>
                                        </thead>
                                    </HeaderTemplate>
                                    <ItemTemplate>
                                        <tr>
                                            <td>
                                                <img style="height: 30px; width: auto;" src="Content/img/plataformas/<%# DataBinder.Eval(Container.DataItem,"IDPLATAFORMA") %>.jpg" /></td>
                                            <td>
                                                <img style="height: 30px; width: auto;" src="Content/img/juegos/<%# DataBinder.Eval(Container.DataItem,"IDJUEGO") %>.jpg" /></td>
                                            
                                            <td style="text-align: left;"><a href="eventos.aspx?id=<%# DataBinder.Eval(Container.DataItem,"IDEVENTO") %>"><%# DataBinder.Eval(Container.DataItem,"EVENTO") %></a></td>
                                            <td><%# Posicion(DataBinder.Eval(Container.DataItem,"IDEVENTO")) %></td>
                                            </tr>
                                        <tr>
                                            <td colspan="4">
                                                <asp:Repeater ID="repTareas" runat="server" DataSource='<%# Eval("myrelation") %>'>
                                                    <HeaderTemplate>
                                                        <table class="table table-bordered table-hover">
                                                            <tbody>
                                                            <thead>
                                                                <tr style="background-color: whitesmoke;">
                                                                    <th>
                                                                        <asp:Literal ID="Literal5" runat="server" Text="Fecha" ></asp:Literal></th>
                                                                    <th>
                                                                        <asp:Literal ID="Literal6" runat="server" Text="Carrera"></asp:Literal></th>
                                                                    <th>
                                                                        <asp:Literal ID="Literal7" runat="server" Text="Pos."></asp:Literal></th>
                                                                    <th>
                                                                        <asp:Literal ID="Literal8" runat="server" Text="Puntos"></asp:Literal></th>
                                                                </tr>
                                                            </thead>
                                                    </HeaderTemplate>
                                                    <ItemTemplate>
                                                        <tr>
                                                            <td style="text-align:left"><%# DateTime.Parse(Eval("FECHA").ToString()).ToShortDateString() %></td>
                                                            <td style="text-align:left"><%# Eval("CIRCUITO") %></td>
                                                            <td><%# DamePos(Eval("POSLLEGADA")) %></td>
                                                            <td><%# Eval("PUNTOS") %></td>
                                                        </tr>
                                                    </ItemTemplate>
                                                    <FooterTemplate>
                                                        </tbody>
                                                        </table>
                                                    </FooterTemplate>
                                                </asp:Repeater>
                                            </td>
                                        </tr>

                                    </ItemTemplate>
                                </asp:Repeater>
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
        </div>
    </section>
</asp:Content>
