<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="team.aspx.cs" Inherits="IRT.team" meta:resourcekey="PageResource1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="page-header">
        <div class="container">
            <div class="page-header-inner">
                <ol class="breadcrumb wow fadeInDown" data-wow-delay="300ms">
                    <li><a href="default.aspx"><asp:Literal ID="Literal2" runat="server" meta:resourcekey="Literal2Resource1" Text="Inicio"></asp:Literal></a></li>
                    <li class="page"><asp:Literal ID="Literal1" runat="server" meta:resourcekey="Literal1Resource1" Text="Equipos"></asp:Literal></li>
                </ol>
                <h1 class="page-title wow fadeInRight" data-wow-delay="300ms"><asp:Literal ID="Literal3" runat="server" meta:resourcekey="Literal3Resource1" Text="FICHA DE EQUIPO"></asp:Literal>
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
                            <img style="width:200px;height:auto" src="<%=avatar %>" alt="">
                        </div>
                        <div class="member-desc">
                            <h3><%=nombre %></h3>
                            <h5>
                                <asp:Literal ID="Literal6" runat="server" meta:resourcekey="fundado" Text="Fundado"></asp:Literal>: <%=fundacion %></h5>
                            <h5><asp:Literal ID="Literal4" runat="server" meta:resourcekey="Literal4Resource1" Text="Jefe de Equipo"></asp:Literal>: <%=jefeequipo %></h5>
                            <p><%=info %></p>
                            <div class="social-icon">
                                <%=social %>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-md-6 col-sm-12 col-xs-12">
                     <div class="speakers-member wow fadeIn animated" data-wow-delay="0.1s" style="visibility: visible; -webkit-animation-delay: 0.1s; -moz-animation-delay: 0.1s; animation-delay: 0.1s;">
                        <table class="table table-bordered table-hover">
                            <caption style="background-color:#950101; color:white;padding:5px;font-weight:bold;"><asp:Literal ID="Literal5" runat="server" meta:resourcekey="Literal5Resource1" Text="Nuestros Pilotos"></asp:Literal></caption>
                            <tbody>
                                <asp:Repeater ID="repPendientes" runat="server">
                                   
                                    <ItemTemplate>
                                        <tr>
                                            <td style="text-align:left;">
                                                <div style='float:left; padding-right:10px; margin-right:0px;'>                                                
                                                <img style="width: 40px; height: 40px;" src='<%# DameAvatar(DataBinder.Eval(Container.DataItem,"IDUSUARIO").ToString(), DataBinder.Eval(Container.DataItem,"AVATAR")) %>' /></div><p style='float:left;margin-bottom:0px;'><a href="rank.aspx?n=<%# DataBinder.Eval(Container.DataItem,"ID") %>"><%# DataBinder.Eval(Container.DataItem,"NOMBRE") %> <%# DataBinder.Eval(Container.DataItem,"APELLIDOS") %></a>&nbsp;<img src='http://simracingchamps.net/Content/img/flags/<%# DataBinder.Eval(Container.DataItem,"CODPAIS").ToString().Trim() %>.png'><br /><%# DataBinder.Eval(Container.DataItem,"ALIAS") %>&nbsp;<%# DameFB(DataBinder.Eval(Container.DataItem,"FACEBOOK")) %>&nbsp;<%# DameTwitter(DataBinder.Eval(Container.DataItem,"TWITTER")) %>&nbsp;<%# DameYT(DataBinder.Eval(Container.DataItem,"YOUTUBE")) %></p></td>
                                            
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

