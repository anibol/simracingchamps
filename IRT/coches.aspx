<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="coches.aspx.cs" Inherits="IRT.coches" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->
    <meta name="description" content="">
    <meta name="author" content="">
    <link rel="icon" href="../../favicon.ico">
    <link href="Content/events2.css" rel="stylesheet" />
    <title>Is Race Time!</title>

    <!-- Bootstrap core CSS -->
    <link href="Content/bootstrap.min.css" rel="stylesheet" />

    <!-- IE10 viewport hack for Surface/desktop Windows 8 bug -->
    <link href="Content/ie10.css" rel="stylesheet" />

    <!-- Custom styles for this template -->
    <style>
        /* Move down content because we have a fixed navbar that is 50px tall */
        body {          
            padding-bottom: 20px;
        }

        .example5 .navbar-brand {
            display: flex;
            align-items: center;
        }

            .example5 .navbar-brand > img {
                padding: 7px 14px;
            }

    </style>

    <!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
    <!--[if lt IE 9]>
      <script src="https://oss.maxcdn.com/html5shiv/3.7.3/html5shiv.min.js"></script>
      <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
    <![endif]-->
</head>

<body>
    <form id="form1" runat="server">
        <nav class="navbar navbar-default navbar-static-top">
            <div class="container example5">
                <div class="navbar-header">
                    <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#navbar" aria-expanded="false" aria-controls="navbar">
                        <span class="sr-only">Toggle navigation</span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                    </button>
                    <a class="navbar-brand" href="#">
                        <img  style="width: 40px; height: 40px;" src="<%=logo %>" />&nbsp;<%=organizador %></a>
                </div>
                <div id="navbar" class="navbar-collapse collapse pull-right">
                    <ul class="nav navbar-nav">
                        <li><a href="./">Inicio</a></li>
                        <li><a href="#info">Información</a></li>
                        <li><a href="#agenda">Agenda</a></li>
                        <li><a href="#inscripcion">Inscríbete</a></li>
                    </ul>
                </div>
                <!--/.navbar-collapse -->
            </div>
        </nav>


        <!-- Main jumbotron for a primary marketing message or call to action -->
        <div class="jumbotron" style="background: url(<%= cartel %>) no-repeat center center; width: 100%;">
            <div class="container">
                <h1><%=nombreevento %></h1>
                <p>Plazo inscripcion: <%=desde %> - <%=hasta %></p>

            </div>
        </div>

        <div class="container">
            <!-- Example row of columns -->
            <div class="row">
                 <div class="col-md-8">
                    <h2>Información</h2>
                    <p><%=informacion %></p>
                    <%--<p><a class="btn btn-default" href="#" role="button">View details &raquo;</a></p>--%>
                </div>               
               
            </div>
            
           <div class="row">
               <div class="col-md-12">
                   <table class="table table-hover">
                       <thead>
                           <th>Fecha</th>
                           <th>Carrera</th>
                           <th>Coche</th>
                       </thead>
                       <tbody>
                      
                               <%=cochescad %>
                         
                       </tbody>
                   </table>
                   <asp:Button ID="bInscribir" runat="server" CssClass="btn btn-success col-md-2"  Text="Aceptar selección de coches e inscribirme" OnClick="bInscribir_Click" />
               </div>
           </div>

            <hr>

            <footer>
                <p>&copy; 2017 Is Race Time!</p>
            </footer>
        </div>
        <!-- /container -->

        <script src="Scripts/jquery-3.1.1.min.js"></script>
        <script>window.jQuery || document.write('<script src="Scripts/jquery-3.1.1.min.js"><\/script>')</script>
        <script src="Scripts/bootstrap.min.js"></script>
    </form>
</body>
</html>




