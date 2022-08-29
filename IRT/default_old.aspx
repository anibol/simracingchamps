<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="default_old.aspx.cs" Inherits="IRT._default" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta charset="utf-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->
    <meta name="description" content="" />
    <meta name="author" content="" />
    <link rel="icon" href="../../favicon.ico" />
    <link href="Content/events.css" rel="stylesheet" />
    <title>Is Race Time!</title>

    <!-- Bootstrap core CSS -->
    <link href="Content/bootstrap.min.css" rel="stylesheet" />
    <link href="Content/font-awesome.min.css" rel="stylesheet" />

    <link href="Content/carousel.css" rel="stylesheet" />
    <!-- IE10 viewport hack for Surface/desktop Windows 8 bug -->

    <link href="Content/ie10.css" rel="stylesheet" />

    <!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
    <!--[if lt IE 9]>
      <script src="https://oss.maxcdn.com/html5shiv/3.7.3/html5shiv.min.js"></script>
      <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
    <![endif]-->


</head>
<body>
    <form id="form1" runat="server">
        <div class="navbar-wrapper">
            <div class="container">
                <div class="navbar navbar-inverse">
                    <div class="container">
                        <div class="navbar-header">
                            <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
                                <span class="icon-bar"></span>
                                <span class="icon-bar"></span>
                                <span class="icon-bar"></span>
                            </button>
                            <a href="./" class="navbar-brand">Is Race Time!</a>
                        </div>
                        <div class="navbar-collapse collapse">
                            <ul class="nav navbar-nav">
                                <li><a href="./">Inicio</a></li>
                                <li><a href="About">Acerca de</a></li>
                                <li><a href="Contact">Contacto</a></li>
                            </ul>
                            <ul class="nav navbar-nav navbar-right">
                                <li><a runat="server" href="cuenta.aspx">Regístrate</a></li>
                                <li><a runat="server" href="login.aspx">Acceder</a></li>
                            </ul>
                        </div>

                    </div>
                </div>
            </div>
        </div>

        <!-- Carousel
    ================================================== -->
        <div id="myCarousel" class="carousel slide" data-ride="carousel">
            <!-- Indicators -->
            <ol class="carousel-indicators">
                <li data-target="#myCarousel" data-slide-to="0" class="active"></li>
                <li data-target="#myCarousel" data-slide-to="1"></li>
                <li data-target="#myCarousel" data-slide-to="2"></li>
            </ol>
            <div class="carousel-inner" role="listbox">
                <div class="item active">
                    <img class="first-slide" src="Content/img/carousel/assetto.jpg" alt="First slide">
                    <div class="container">
                        <%-- <div class="carousel-caption">
              <h1>Example headline.</h1>
              <p>Note: If you're viewing this page via a <code>file://</code> URL, the "next" and "previous" Glyphicon buttons on the left and right might not load/display properly due to web browser security rules.</p>
              <p><a class="btn btn-lg btn-primary" href="#" role="button">Sign up today</a></p>
            </div>--%>
                    </div>
                </div>
                <div class="item">
                    <img class="second-slide" src="Content/img/carousel/automobilista.jpg" alt="Second slide">
                    <div class="container">
                        <%--<div class="carousel-caption">
              <h1>Another example headline.</h1>
              <p>Cras justo odio, dapibus ac facilisis in, egestas eget quam. Donec id elit non mi porta gravida at eget metus. Nullam id dolor id nibh ultricies vehicula ut id elit.</p>
              <p><a class="btn btn-lg btn-primary" href="#" role="button">Learn more</a></p>
            </div>--%>
                    </div>
                </div>
                <div class="item">
                    <img class="third-slide" src="Content/img/carousel/iracing.jpg" alt="Third slide">
                    <div class="container">
                        <%--<div class="carousel-caption">
              <h1>One more for good measure.</h1>
              <p>Cras justo odio, dapibus ac facilisis in, egestas eget quam. Donec id elit non mi porta gravida at eget metus. Nullam id dolor id nibh ultricies vehicula ut id elit.</p>
              <p><a class="btn btn-lg btn-primary" href="#" role="button">Browse gallery</a></p>
            </div>--%>
                    </div>
                </div>
            </div>
            <a class="left carousel-control" href="#myCarousel" role="button" data-slide="prev">
                <span class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
                <span class="sr-only">Previous</span>
            </a>
            <a class="right carousel-control" href="#myCarousel" role="button" data-slide="next">
                <span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
                <span class="sr-only">Next</span>
            </a>
        </div>
        <!-- /.carousel -->

        <div class="container marketing">
            <%-- <div class="jumbotron">
                <h1>Is Race Time!</h1>
                <p class="lead">Bienvenidos al portal donde gestionar tus campeonatos y ligas de simracing. Una web de gestión sencilla que facilita a los simracers encontrar e inscribirse a los eventos del mundo simracer</p>
                <p><a href="about.aspx" class="btn btn-primary btn-lg">Más información</a></p>
            </div>--%>

            <div class="row">
                <div class="col-md-8">
                    <div class="row">
                        <h3>Nuevos eventos</h3>
                        <ul class="event-list">

                            <asp:Repeater ID="repEventos" runat="server">
                                <ItemTemplate>
                                    <li>
                                        <time datetime="<%# DateTime.Parse(DataBinder.Eval(Container.DataItem,"FECHAALTA").ToString()) %>">
                                            <span class="day"><%# DateTime.Parse(DataBinder.Eval(Container.DataItem,"FECHAALTA").ToString()).Day %></span>
                                            <span class="month"><%# DameMes(DataBinder.Eval(Container.DataItem,"FECHAALTA").ToString()) %></span>
                                            <span class="year"><%# DateTime.Parse(DataBinder.Eval(Container.DataItem,"FECHAALTA").ToString()).Year  %></span>
                                            <span class="time">ALL DAY</span>
                                        </time>

                                        <img alt="<%# DataBinder.Eval(Container.DataItem,"NOMBRE") %>" src="Content/img/avatar/<%# DataBinder.Eval(Container.DataItem,"IDUSUARIO") %>/<%# DataBinder.Eval(Container.DataItem,"AVATAR") %>" />

                                        <div class="info">
                                            <h2 class="title"><%# DataBinder.Eval(Container.DataItem,"EVENTO") %></h2>
                                            <p class="desc">Plazo de Inscripción: <%# DateTime.Parse(DataBinder.Eval(Container.DataItem,"FECHAINI").ToString()).ToShortDateString() %>  al <%# DateTime.Parse(DataBinder.Eval(Container.DataItem,"FECHAFIN").ToString()).ToShortDateString() %></p>

                                            <ul>
                                                <li style="width: 40%;"><a href="<%# DataBinder.Eval(Container.DataItem,"WEB") %>">Organiza:&nbsp;<%# DameBandera(DataBinder.Eval(Container.DataItem,"CODPAIS"))%>&nbsp;<span class="fa fa-globe"></span><%# DataBinder.Eval(Container.DataItem,"NOMBRE") %></a></li>
                                                <li style="width: 5%;"><a href="<%# DataBinder.Eval(Container.DataItem,"FACEBOOK") %>"><span class="fa fa-facebook"></span></a></li>
                                                <li style="width: 5%;"><a href="<%# DataBinder.Eval(Container.DataItem,"TWITTER") %>"><span class="fa fa-twitter"></span></a></li>
                                                <li style="width: 5%;"><a href="<%# DataBinder.Eval(Container.DataItem,"YOUTUBE") %>"><span class="fa fa-youtube"></span></a></li>
                                                <li>
                                                    <a style="color:white;font-weight:bold;width: 80px; margin-right: 10px; float: right;" href="eventos.aspx?id=<%# DataBinder.Eval(Container.DataItem,"ID") %>" class="btn btn-info btn-xs">Inscríbete</a></li>
                                            </ul>
                                        </div>

                                        <div class="social">
                                            <ul>
                                                <li class="facebook" style="width: 50%;">
                                                    <img src="Content/img/juegos/<%# DataBinder.Eval(Container.DataItem,"IDJUEGO") %>.jpg"></li>
                                                <li class="twitter" style="width: 50%;">
                                                    <img src="Content/img/plataformas/<%# DataBinder.Eval(Container.DataItem,"IDPLATAFORMA") %>.jpg"></li>

                                            </ul>
                                        </div>
                                    </li>
                                </ItemTemplate>
                            </asp:Repeater>

                        </ul>
                    </div>
                    <div class="row">
                        <h3>Próximas carreras</h3>
                        <ul class="event-list">

                            <asp:Repeater ID="repProxCarreras" runat="server">
                                <ItemTemplate>
                                    <li>
                                        <time datetime="<%# DateTime.Parse(DataBinder.Eval(Container.DataItem,"FECHA").ToString()) %>">
                                            <span class="day"><%# DateTime.Parse(DataBinder.Eval(Container.DataItem,"FECHA").ToString()).Day %></span>
                                            <span class="month"><%# DameMes(DataBinder.Eval(Container.DataItem,"FECHA").ToString()) %></span>
                                            <span class="year"><%# DateTime.Parse(DataBinder.Eval(Container.DataItem,"FECHA").ToString()).Year  %></span>
                                            <span class="time">ALL DAY</span>
                                        </time>

                                        <img alt="<%# DataBinder.Eval(Container.DataItem,"CIRCUITO") %>" style="height: 79px; width: auto;" src="Content/img/circuitos/<%# DataBinder.Eval(Container.DataItem,"IDLOGO") %>.jpg" />

                                        <div class="info">
                                            <h2 class="title"><%# DataBinder.Eval(Container.DataItem,"EVENTO") %> / <%# DataBinder.Eval(Container.DataItem,"CIRCUITO") %></h2>
                                            <p class="desc">Hora: <%# DataBinder.Eval(Container.DataItem,"HORACARRERA") %> | Duración: Duración: <%# DameDuracion(DataBinder.Eval(Container.DataItem,"CARRERAVUELTAS"),DataBinder.Eval(Container.DataItem,"CARRERATIEMPO")) %></p>
                                            <p class="desc">Coches: <%# DataBinder.Eval(Container.DataItem,"COCHES") %></p>                                            
                                            <ul>
                                                <li style="width: 40%;"><a href="<%# DataBinder.Eval(Container.DataItem,"WEB") %>">Organiza:&nbsp;<%# DameBandera(DataBinder.Eval(Container.DataItem,"CODPAIS"))%>&nbsp;<span class="fa fa-globe"></span><%# DataBinder.Eval(Container.DataItem,"NOMBRE") %></a></li>
                                                <li style="width: 5%;"><a href="<%# DataBinder.Eval(Container.DataItem,"FACEBOOK") %>"><span class="fa fa-facebook"></span></a></li>
                                                <li style="width: 5%;"><a href="<%# DataBinder.Eval(Container.DataItem,"TWITTER") %>"><span class="fa fa-twitter"></span></a></li>
                                                <li style="width: 5%;"><a href="<%# DataBinder.Eval(Container.DataItem,"YOUTUBE") %>"><span class="fa fa-youtube"></span></a></li>
                                                <li>
                                                    <a style="color:white;font-weight:bold;width: 80px; margin-right: 10px; float: right;" href="evento.aspx?id=<%# DataBinder.Eval(Container.DataItem,"ID") %>" class="btn btn-info btn-xs" >Más info</a></li>
                                            </ul>
                                        </div>

                                        <div class="social">
                                            <ul>
                                                <li class="facebook" style="width: 50%;">
                                                    <img src="Content/img/juegos/<%# DataBinder.Eval(Container.DataItem,"IDJUEGO") %>.jpg"></li>
                                                <li class="twitter" style="width: 50%;">
                                                    <img src="Content/img/plataformas/<%# DataBinder.Eval(Container.DataItem,"IDPLATAFORMA") %>.jpg"></li>

                                            </ul>
                                        </div>
                                    </li>
                                </ItemTemplate>
                            </asp:Repeater>

                        </ul>
                    </div>

                    <div class="row">
                        <h3>Últimos resultados</h3>
                        <ul class="event-list">

                            <asp:Repeater ID="repResultados" runat="server">
                                <ItemTemplate>
                                    <li>
                                        <time datetime="<%# DateTime.Parse(DataBinder.Eval(Container.DataItem,"FECHA").ToString()) %>">
                                            <span class="day"><%# DateTime.Parse(DataBinder.Eval(Container.DataItem,"FECHA").ToString()).Day %></span>
                                            <span class="month"><%# DameMes(DataBinder.Eval(Container.DataItem,"FECHA").ToString()) %></span>
                                            <span class="year"><%# DateTime.Parse(DataBinder.Eval(Container.DataItem,"FECHA").ToString()).Year  %></span>
                                            <span class="time">ALL DAY</span>
                                        </time>

                                        <img alt="<%# DataBinder.Eval(Container.DataItem,"CIRCUITO") %>" style="height: 79px; width: auto;" src="Content/img/circuitos/<%# DataBinder.Eval(Container.DataItem,"IDLOGO") %>.jpg" />

                                        <div class="info">
                                            <h2 class="title"><%# DataBinder.Eval(Container.DataItem,"EVENTO") %> / <%# DataBinder.Eval(Container.DataItem,"CIRCUITO") %></h2>
                                            <p class="desc">Hora: <%# DataBinder.Eval(Container.DataItem,"HORACARRERA") %> | Duración: <%# DameDuracion(DataBinder.Eval(Container.DataItem,"CARRERAVUELTAS"),DataBinder.Eval(Container.DataItem,"CARRERATIEMPO")) %></p>
                                            <p class="desc">Coches: <%# DataBinder.Eval(Container.DataItem,"COCHES") %></p>
                                             <ul>
                                                <li style="width: 40%;"><a href="<%# DataBinder.Eval(Container.DataItem,"WEB") %>">Organiza:&nbsp;<%# DameBandera(DataBinder.Eval(Container.DataItem,"CODPAIS"))%>&nbsp;<span class="fa fa-globe"></span><%# DataBinder.Eval(Container.DataItem,"NOMBRE") %></a></li>
                                                <li style="width: 5%;"><a href="<%# DataBinder.Eval(Container.DataItem,"FACEBOOK") %>"><span class="fa fa-facebook"></span></a></li>
                                                <li style="width: 5%;"><a href="<%# DataBinder.Eval(Container.DataItem,"TWITTER") %>"><span class="fa fa-twitter"></span></a></li>
                                                <li style="width: 5%;"><a href="<%# DataBinder.Eval(Container.DataItem,"YOUTUBE") %>"><span class="fa fa-youtube"></span></a></li>
                                                <li>
                                                    <a style="color:white;font-weight:bold;width: 80px; margin-right: 10px; float: right;" href="evento.aspx?id=<%# DataBinder.Eval(Container.DataItem,"ID") %>" class="btn btn-info btn-xs">Resultados</a></li>
                                            </ul>                                           
                                        </div>

                                        <div class="social">
                                            <ul>
                                                <li class="facebook" style="width: 50%;">
                                                    <img style="height: 40px; width: 40px;" src="Content/img/juegos/<%# DataBinder.Eval(Container.DataItem,"IDJUEGO") %>.jpg"></li>
                                                <li class="twitter" style="width: 50%;">
                                                    <img style="height: 40px; width: 40px;" src="Content/img/plataformas/<%# DataBinder.Eval(Container.DataItem,"IDPLATAFORMA") %>.jpg"></li>

                                            </ul>
                                        </div>
                                    </li>
                                </ItemTemplate>
                            </asp:Repeater>

                        </ul>
                    </div>
                </div>
                <div class="col-md-4">
                    <h2>Organiza tu propio evento</h2>
                    <p>
                        Si estas pensando organizar un campeonato de simracing, IsRaceTime.com, te permite gestionarlo de forma sencilla. Regístrate como organizador y tendrás acceso a la web de forma totalmente gratuita.
                    </p>
                    <p>
                        <a class="btn btn-default" href="cuenta.aspx?org=1">Registrate</a>
                    </p>
                    <h2>Bienvenido SimRacer</h2>
                    <p>
                        Si eres piloto, esta es la web donde estarás al día de todos los eventos relacionados con tu simulador favorito, inscripciones, resultados, etc., todo de una manera fácil.
                    </p>
                    <p>
                        <a class="btn btn-default" href="cuenta.aspx?org=1">Registrate</a>
                    </p>
                </div>
            </div>


            <hr />
            <footer>
                <p>&copy; 2017 - Is Race Time.com</p>
            </footer>
        </div>



    </form>
    <!-- Bootstrap core JavaScript
    ================================================== -->
    <!-- Placed at the end of the document so the pages load faster -->
    <script src="Scripts/jquery-3.1.1.min.js"></script>
    <script>window.jQuery || document.write('<script src="Scripts/jquery-3.1.1.min.js"><\/script>')</script>
    <script src="Scripts/bootstrap.min.js"></script>
</body>
</html>
