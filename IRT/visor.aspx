<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="visor.aspx.cs" Inherits="IRT.visor" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>SimRacingChamps.net</title>
    <link href="Content/events3.css" rel="stylesheet" />
    <link href="Content/bootstrap.min.css" rel="stylesheet" />    
</head>
<body>
    <form id="form1" runat="server">
     <ul class="event-list">
           <asp:Repeater ID="repProximosCampeonatos" runat="server">
                                <ItemTemplate>
                                    <li class="box <%# DataBinder.Eval(Container.DataItem,"IDPLATAFORMA") %>">
                                        <time class="hidden-xs" datetime="<%# DateTime.Parse(DataBinder.Eval(Container.DataItem,"FECHAPRIMERA").ToString()) %>">
                                            <span class="day"><%# DateTime.Parse(DataBinder.Eval(Container.DataItem,"FECHAPRIMERA").ToString()).Day %></span>
                                            <span class="month"><%# DameMes(DataBinder.Eval(Container.DataItem,"FECHAPRIMERA").ToString()) %></span>
                                            <span class="year"><%# DateTime.Parse(DataBinder.Eval(Container.DataItem,"FECHAPRIMERA").ToString()).Year  %></span>
                                        </time>

                                        <img class="hidden-xs" alt="<%# DataBinder.Eval(Container.DataItem,"NOMBRE") %>" style="height: 79px; width: 140px;" src="http://simracingchamps.net/Content/img/avatar/<%# DataBinder.Eval(Container.DataItem,"IDUSUARIO") %>/<%# DataBinder.Eval(Container.DataItem,"AVATAR") %>" />

                                        <div class="info">
                                            <h2 class="title" data-id="<%# DataBinder.Eval(Container.DataItem,"ID") %>"><%# DataBinder.Eval(Container.DataItem,"EVENTO") %></h2>
                                            <p class="desc" style="line-height: 16px">
                                                <asp:Label ID="lblPlazoInscripcion" runat="server" Text="Plazo de Inscripción:" meta:resourcekey="lblPlazoInscripcionResource1"></asp:Label>
                                                <%# DateTime.Parse(DataBinder.Eval(Container.DataItem,"FECHAINI").ToString()).ToShortDateString() %>
                                                <asp:Label ID="lblAl" runat="server" Text="al" meta:resourcekey="lblAlResource1"></asp:Label>
                                                <%# DateTime.Parse(DataBinder.Eval(Container.DataItem,"FECHAFIN").ToString()).ToShortDateString() %>
                                            </p>

                                            <ul>
                                                <li class="organizador" style="width: 60%;"><a target="_blank" href="<%# DataBinder.Eval(Container.DataItem,"WEB") %>">
                                                    <asp:Label ID="lblOrganiza3" runat="server" Text="Organiza" CssClass="hidden-xs" meta:resourcekey="lblOrganizaResource1"></asp:Label>&nbsp;</span><%# DameBandera(DataBinder.Eval(Container.DataItem,"CODPAIS"))%>&nbsp;<span class="fa fa-globe"></span><%# DataBinder.Eval(Container.DataItem,"NOMBRE") %></a></li>
                                                <li class="hidden-xs" style="width: 5%;"><a target="_blank" href="<%# DataBinder.Eval(Container.DataItem,"FACEBOOK") %>"><span class="fa fa-facebook"></span></a></li>
                                                <li class="hidden-xs" style="width: 5%;"><a target="_blank" href="<%# DameTwitter(DataBinder.Eval(Container.DataItem,"TWITTER")) %>"><span class="fa fa-twitter"></span></a></li>
                                                <li class="hidden-xs" style="width: 5%;"><a target="_blank" href="<%# DataBinder.Eval(Container.DataItem,"YOUTUBE") %>"><span class="fa fa-youtube"></span></a></li>
                                                <li>
                                                    <a class="hidden-xs" style="border-radius: 5px; width: 80px; color: white; font-weight: bold; padding-left: 10px; background-color: royalblue;" href="http://simracingchamps.net/eventos.aspx?id=<%# DataBinder.Eval(Container.DataItem,"ID") %>">
                                                        <asp:Literal ID="bInscribete" runat="server" meta:resourcekey="bMasInfoResource1" Text="Más info"></asp:Literal></a>
                                                   
                                                </li>
                                            </ul>
                                        </div>

                                        <div class="social">
                                            <ul>
                                                <li class="facebook">
                                                    <img src="http://simracingchamps.net/Content/img/juegos/<%# DataBinder.Eval(Container.DataItem,"IDJUEGO") %>.jpg"></li>
                                                <li class="twitter">
                                                    <img src="http://simracingchamps.net/Content/img/plataformas/<%# DataBinder.Eval(Container.DataItem,"IDPLATAFORMA") %>.jpg"></li>

                                            </ul>
                                        </div>
                                    </li>

                                </ItemTemplate>
                            </asp:Repeater>
      </ul>
    </form>
</body>
</html>
