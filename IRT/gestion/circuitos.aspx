<%@ Page Title="" Language="C#" MasterPageFile="~/gestion/irtadmin.Master" AutoEventWireup="true" CodeBehind="circuitos.aspx.cs" Inherits="IRT.gestion.circuitos" meta:resourcekey="PageResource1" ValidateRequest="false" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        table label {
            margin-right: 4px;
            margin-left: 4px;
            font-weight: normal;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <section class="content-header">
        <h1>
            <asp:Literal ID="Literal1" runat="server" meta:resourcekey="Literal1Resource1" Text="Gestión de carreras del campeonato"></asp:Literal>
            <small>
                <asp:Literal ID="Literal2" runat="server" meta:resourcekey="Literal2Resource1" Text="Añade las pruebas que se disputarán en el evento"></asp:Literal></small>&nbsp;
            <asp:LinkButton ID="lnkNuevo" CssClass="btn btn-success btn-xs" runat="server" OnClick="lnkNuevo_Click" meta:resourcekey="lnkNuevoResource1">
                <asp:Literal ID="litbNuevoC" runat="server" meta:resourcekey="Literal3Resource1" Text="Nueva Carrera"></asp:Literal>
            </asp:LinkButton>

        </h1>
        <ol class="breadcrumb">

            <li class="active">
                <!-- Button trigger modal -->
                <button type="button" class="btn btn-danger btn-xs" data-toggle="modal" data-target="#myModal">
                    <i class="fa fa-question-circle"></i>
                    <asp:Literal ID="Literal4" runat="server" meta:resourcekey="Literal4Resource1" Text="Ayuda"></asp:Literal>
                </button>
            </li>
        </ol>
        <p>
            <asp:Label ID="lblaviso" runat="server" Visible="False" CssClass="label label-warning" Text="No pueden añadirse carreras ni editar el circuito de las existentes así como la lista de coches ya que existen inscritos" meta:resourcekey="lblavisoResource1"></asp:Label>
        </p>
        <asp:Literal ID="lblmsg" runat="server" Visible="False" meta:resourcekey="lblmsgResource1" Text="
            &lt;div class=&quot;callout callout-success lead&quot;&gt;
            &lt;h4&gt;!Atención!&lt;/h4&gt;
            &lt;p&gt;Datos actualizados&lt;/p&gt;
        &lt;/div&gt;
        "></asp:Literal>
        <div id="panerror" class="callout callout-danger lead" runat="server" visible="false">
            <h4>
                <asp:Literal ID="lblmsg2" runat="server" Text="¡Error!" meta:resourcekey="lblmsg2Resource2"></asp:Literal></h4>
            <p>
                <asp:Literal ID="lblmsg2b" runat="server" Text="Se ha producido un error al guardar los cambios" meta:resourcekey="lblmsg2bResource1"></asp:Literal>
            </p>
        </div>


        <!-- Modal -->
        <div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
            <div class="modal-dialog modal-lg" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                        <h4 class="modal-title" id="myModalLabel">
                            <asp:Literal ID="Literal5" runat="server" meta:resourcekey="Literal5Resource1" Text="Carreras"></asp:Literal></h4>
                    </div>
                    <div class="modal-body">
                        <p>
                            <asp:Literal ID="Literal6" runat="server" meta:resourcekey="Literal6Resource1" Text="Esta es la pantalla en la que puedes añadir y editar las carreras de tu campeonato"></asp:Literal>
                        </p>
                        <p>
                            <asp:Literal ID="Literal7" runat="server" meta:resourcekey="Literal7Resource1" Text="Para &lt;u&gt;añadir una carrera&lt;/u&gt; usa el boton"></asp:Literal>
                            <a href="circuitos.aspx?id=<%= Request.QueryString["id"].ToString() %>&n=1" class="btn btn-success btn-xs">
                                <asp:Literal ID="Literal8" runat="server" meta:resourcekey="Literal8Resource1" Text="Nueva Carrrera"></asp:Literal></a>
                            <asp:Literal ID="Literal9" runat="server" meta:resourcekey="Literal9Resource1" Text="que tienes en la barra superior. Aparecerá un formulario con los siguientes apartados"></asp:Literal>:
                        </p>
                        <asp:Literal ID="Literal10" runat="server" meta:resourcekey="Literal10Resource1" Text="
                         &lt;ul&gt;
                            &lt;li&gt;&lt;b&gt;Datos generales:&lt;/b&gt; Selecciona el circuito, indica la fecha de celebración de la carrea, información extra y si va a tener emsisión por YouTube/Twitch/Etc o necesita un MOD podrás indicar las URLs correspondientes&lt;/li&gt;
                            &lt;li&gt;&lt;b&gt;Prácticas:&lt;/b&gt;Indica los datos de la práctica, duración, clima, etc&lt;/li&gt;
                            &lt;li&gt;&lt;b&gt;Clasificación:&lt;/b&gt;Indica los datos de la cuali, duración, clima, etc&lt;/li&gt;
                            &lt;li&gt;&lt;b&gt;Carrera:&lt;/b&gt;Indica los datos de la carrea, duración, clima, etc, y el &lt;u&gt;listado de coches que deberán seleccionar los pilotos&lt;/u&gt;&lt;/li&gt;
                        &lt;/ul&gt;
                        &lt;p&gt;Para &lt;u&gt;editar una carrera&lt;/u&gt; pulsa el botón &lt;label class=&quot;btn btn-xs btn-primary&quot;&gt;Editar&lt;/label&gt; de la lista de carreras previamente añadidas &lt;/p&gt;
                        &lt;p&gt;Para &lt;u&gt;eliminar una carrera&lt;/u&gt; pulsa el botón &lt;label class=&quot;btn btn-xs btn-danger&quot;&gt;Borrar&lt;/label&gt; de la lista de carreras previamente añadidas &lt;/p&gt;"></asp:Literal>

                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-default" data-dismiss="modal">
                            <asp:Literal ID="Literal11" runat="server" meta:resourcekey="Literal11Resource1" Text="Cerrar"></asp:Literal></button>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <section class="content">
        <div class="row">

            <div class="col-xs-12">
                <div class="box">
                    <div class="box-header">
                        <h3 class="box-title">
                            <asp:Literal ID="Literal12" runat="server" meta:resourcekey="Literal12Resource1" Text="Listado de carreras del campeonato"></asp:Literal></h3>
                    </div>
                    <!-- /.box-header -->
                    <div class="box-body">
                        <asp:Repeater ID="repCircuitos" runat="server">
                            <HeaderTemplate>
                                <table class="table table-bordered table-hover">
                                    <thead>
                                        <tr>
                                            <th>
                                                <asp:Literal ID="Literal13" runat="server" meta:resourcekey="Literal13Resource1" Text="Fecha"></asp:Literal></th>
                                            <th>
                                                <asp:Literal ID="Literal14" runat="server" meta:resourcekey="Literal14Resource1" Text="Hora Carrera"></asp:Literal></th>
                                            <th>
                                                <asp:Literal ID="Literal15" runat="server" meta:resourcekey="Literal15Resource1" Text="Circuito"></asp:Literal></th>
                                            <th>
                                                <asp:Literal ID="Literal16" runat="server" meta:resourcekey="Literal16Resource1" Text="Coches"></asp:Literal></th>
                                            <th>
                                                <asp:Literal ID="Literal17" runat="server" meta:resourcekey="Literal17Resource1" Text="Opciones"></asp:Literal></th>
                                        </tr>
                                    </thead>
                                    <tbody>
                            </HeaderTemplate>
                            <ItemTemplate>
                                <tr>
                                    <td><%# DateTime.Parse(DataBinder.Eval(Container.DataItem,"FECHA").ToString()).ToShortDateString() %></td>
                                    <td><%# DataBinder.Eval(Container.DataItem,"HORACARRERA") %></td>
                                    <td><%# DataBinder.Eval(Container.DataItem,"CIRCUITO") %></td>
                                    <td><%# DataBinder.Eval(Container.DataItem,"COCHES") %></td>
                                    <td><a href='circuitos.aspx?id=<%# Request.QueryString["id"].ToString() %>&ed=<%# DataBinder.Eval(Container.DataItem,"ID") %>' class="btn btn-xs btn-primary">
                                        <asp:Literal ID="Literal18" runat="server" meta:resourcekey="Literal18Resource1" Text="Editar"></asp:Literal></a>
                                        <% if (lnkNuevo.Visible)
                                            { %>
                                        &nbsp;<a href='circuitos.aspx?id=<%# Request.QueryString["id"].ToString() %>&c=<%# DataBinder.Eval(Container.DataItem,"ID") %>' class="btn btn-xs btn-warning"><asp:Literal ID="Literal126" runat="server" meta:resourcekey="bCopiar" Text="Copiar"></asp:Literal></a>
                                        <% } %>
                                        &nbsp;<a href='borrar.aspx?id=<%# Request.QueryString["id"].ToString() %>&del=<%# DataBinder.Eval(Container.DataItem,"ID") %>' class="btn btn-xs btn-danger"><asp:Literal ID="Literal16" runat="server" meta:resourcekey="Literal16Resource2" Text="Borrar"></asp:Literal></a></td>
                                </tr>
                            </ItemTemplate>
                            <FooterTemplate>
                                </tbody>
                                </table>
                            </FooterTemplate>
                        </asp:Repeater>
                    </div>
                </div>
            </div>
        </div>
        <asp:Panel ID="panCircuitos" runat="server" Visible="False" meta:resourcekey="panCircuitosResource1">
            <div class="row">
                <div class="col-xs-12">
                    <h2>
                        <asp:Literal ID="Literal16" runat="server" meta:resourcekey="Literal16Resource3" Text="Añadir/Editar carrera"></asp:Literal></h2>
                </div>
            </div>
            <div class="row">
                <div class="col-xs-12">
                    <div class="box box-primary">
                        <div class="box-header">
                            <h3 class="box-title">
                                <asp:Literal ID="Literal19" runat="server" meta:resourcekey="Literal19Resource1" Text="Datos generales de la carrera"></asp:Literal></h3>

                        </div>
                        <!-- /.box-header -->
                        <div class="box-body">
                            <div class="row">
                                <div class="col-xs-6">
                                    <div class="form-group">
                                        <label for="exampleInputPassword1">
                                            <asp:Literal ID="Literal20" runat="server" meta:resourcekey="Literal20Resource1" Text="Circuito"></asp:Literal>:</label>
                                        <asp:DropDownList CssClass="form-control" ID="cbCircuito" runat="server" meta:resourcekey="cbCircuitoResource1"></asp:DropDownList>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ErrorMessage="Campo requerido" CssClass="label label-danger" ControlToValidate="cbCircuito" meta:resourcekey="RequiredFieldValidator4Resource1"></asp:RequiredFieldValidator>
                                    </div>
                                </div>
                                <div class="col-xs-3">
                                    <div class="form-group">
                                        <label for="exampleInputPassword1">
                                            <asp:Literal ID="Literal21" runat="server" meta:resourcekey="Literal21Resource1" Text="Fecha de la carrera"></asp:Literal>:</label>
                                        <asp:TextBox ID="tFecha" CssClass="form-control" runat="server" meta:resourcekey="tFechaResource1"></asp:TextBox>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="Campo requerido" CssClass="label label-danger" ControlToValidate="tFecha" meta:resourcekey="RequiredFieldValidator2Resource1"></asp:RequiredFieldValidator>
                                        <ajaxToolkit:CalendarExtender ID="tFiniEvento_CalendarExtender" Format="dd/MM/yyyy" runat="server" BehaviorID="tFecha_CalendarExtender" TargetControlID="tFecha" OnLoad="tFiniEvento_CalendarExtender_Load" />
                                    </div>
                                </div>
                                <div class="col-xs-3">
                                    <div class="form-group">
                                        <label for="exampleInputPassword1">
                                            <asp:Literal ID="Literal77" runat="server" Text="Hora carrera (Simulador)" meta:resourcekey="Literal77Resource1"></asp:Literal>:</label>
                                        <asp:TextBox ID="tHora" CssClass="form-control" runat="server" meta:resourcekey="tHoraResource1"></asp:TextBox>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator12" runat="server" ErrorMessage="Campo requerido" CssClass="label label-danger" ControlToValidate="tHora" meta:resourcekey="RequiredFieldValidator2Resource1"></asp:RequiredFieldValidator>
                                    </div>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-xs-12">
                                    <div class="form-group">
                                        <label for="exampleInputPassword1">
                                            <asp:Literal ID="Literal22" runat="server" meta:resourcekey="Literal22Resource1" Text="Información extra"></asp:Literal>:</label>
                                        <asp:TextBox ID="tInfo" CssClass="form-control" runat="server" TextMode="MultiLine" meta:resourcekey="tInfoResource1"></asp:TextBox>
                                    </div>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-xs-6">
                                    <div class="form-group">
                                        <label for="exampleInputPassword1">
                                            <asp:Literal ID="Literal23" runat="server" meta:resourcekey="Literal23Resource1" Text="Url descarga MOD"></asp:Literal>:</label>
                                        <asp:TextBox ID="tMod" CssClass="form-control" runat="server" MaxLength="500" meta:resourcekey="tModResource1"></asp:TextBox>
                                    </div>
                                </div>
                                <div class="col-xs-6">
                                    <div class="form-group">
                                        <label for="exampleInputPassword1">
                                            <asp:Literal ID="Literal24" runat="server" meta:resourcekey="Literal24Resource1" Text="URL Emision TV"></asp:Literal>:</label>
                                        <asp:TextBox ID="tTV" CssClass="form-control" runat="server" MaxLength="500" meta:resourcekey="tTVResource1"></asp:TextBox>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

            <asp:Panel ID="panIRacing" runat="server" meta:resourcekey="panIRacingResource1">
                <div class="row">
                    <div class="col-xs-12">
                        <div class="box box-info">
                            <div class="box-header">
                                <h3 class="box-title">
                                    <asp:Literal ID="Literal25" runat="server" meta:resourcekey="Literal25Resource1" Text="Sesiones y duración"></asp:Literal></h3>
                            </div>
                            <!-- /.box-header -->
                            <div class="box-body">
                                <div class="row">

                                    <div class="col-xs-3">
                                        <div class="form-group">
                                            <label for="exampleInputPassword1">
                                                <asp:Literal ID="Literal27" runat="server" meta:resourcekey="Literal27Resource1" Text="Prácticas (minutos)"></asp:Literal>:</label>
                                            <asp:TextBox ID="tDuracionPracticas" CssClass="form-control" runat="server" meta:resourcekey="tDuracionPracticasResource1"></asp:TextBox>
                                            <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ErrorMessage="Campo requerido" CssClass="label label-danger" ControlToValidate="tDuracionPracticas" meta:resourcekey="RequiredFieldValidator5Resource1"></asp:RequiredFieldValidator>
                                        </div>
                                    </div>
                                    <div class="col-xs-3">
                                        <div class="form-group">
                                            <label for="exampleInputPassword1">
                                                <asp:Literal ID="Literal33" runat="server" meta:resourcekey="Literal33Resource1" Text="Clasificación (minutos)"></asp:Literal>:</label>
                                            <asp:TextBox ID="tDuracionCuali" CssClass="form-control" runat="server" meta:resourcekey="tDuracionCualiResource1"></asp:TextBox>
                                            <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" ErrorMessage="Campo requerido" CssClass="label label-danger" ControlToValidate="tDuracionCuali" meta:resourcekey="RequiredFieldValidator7Resource1"></asp:RequiredFieldValidator>
                                        </div>
                                    </div>
                                    <div class="col-xs-3">
                                        <div class="form-group">
                                            <label for="exampleInputPassword1">
                                                <asp:Literal ID="Literal40" runat="server" meta:resourcekey="Literal40Resource1" Text="Carrera (minutos)"></asp:Literal>:</label>
                                            <asp:TextBox ID="tDuracionCarrera" CssClass="form-control" runat="server" meta:resourcekey="tDuracionCarreraResource1"></asp:TextBox>
                                            <asp:RequiredFieldValidator ID="RequiredFieldValidator9" runat="server" ErrorMessage="Campo requerido" CssClass="label label-danger" ControlToValidate="tDuracionCarrera" meta:resourcekey="RequiredFieldValidator9Resource1"></asp:RequiredFieldValidator>
                                        </div>
                                    </div>
                                    <div class="col-xs-3">
                                        <div class="form-group">
                                            <label for="exampleInputPassword1">
                                                <asp:Literal ID="Literal41" runat="server" meta:resourcekey="Literal41Resource1" Text="Carrera nº Vueltas"></asp:Literal>:</label>
                                            <asp:TextBox ID="tVueltasCarrera" CssClass="form-control" runat="server" meta:resourcekey="tVueltasCarreraResource1"></asp:TextBox>
                                            <asp:RequiredFieldValidator ID="RequiredFieldValidator10" runat="server" ErrorMessage="Campo requerido" CssClass="label label-danger" ControlToValidate="tVueltasCarrera" meta:resourcekey="RequiredFieldValidator10Resource1"></asp:RequiredFieldValidator>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="row">
                    <div class="col-xs-12">
                        <div class="box box-success">
                            <div class="box-header">
                                <h3 class="box-title">
                                    <asp:Literal ID="Literal53" runat="server" meta:resourcekey="Literal38Resource1" Text="Configuración de Sala"></asp:Literal></h3>
                                <p class="small">
                                    <asp:Literal ID="Literal3" runat="server" meta:resourcekey="nominutos" Text="No indiques las palabras 'minutos' o 'vueltas', se añadirán automáticamente"></asp:Literal>
                                </p>
                            </div>
                            <!-- /.box-header -->
                            <div class="box-body">
                                <div class="row">
                                    <div class="col-xs-3">
                                        <div class="form-group">
                                            <label for="exampleInputPassword1">
                                                <asp:Literal ID="Literal26" runat="server" meta:resourcekey="Literal14Resource1" Text="Hora carrera"></asp:Literal>:</label>
                                            <asp:TextBox ID="tHoraCarrera" CssClass="form-control" runat="server" Text="" meta:resourcekey="tHoraCarreraResource1"></asp:TextBox>
                                            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="Campo requerido" ControlToValidate="tHoraCarrera" meta:resourcekey="RequiredFieldValidator3Resource1"></asp:RequiredFieldValidator>
                                        </div>
                                    </div>
                                    <div class="col-xs-3">
                                        <div class="form-group">
                                            <label for="exampleInputPassword1">
                                                <asp:Literal ID="Literal49" runat="server" meta:resourcekey="Literal49Resource1" Text="Periodo del dia"></asp:Literal>:</label>
                                            <asp:DropDownList runat="server" CssClass="form-control" ID="cbPeriodoCarrera" meta:resourcekey="cbPeriodoCarreraResource1">
                                                <asp:ListItem meta:resourcekey="ListItemResource17" Text="Temprano (Morning)"></asp:ListItem>
                                                <asp:ListItem meta:resourcekey="ListItemResource18" Text="Dia/Tarde (Afternoon)"></asp:ListItem>
                                                <asp:ListItem meta:resourcekey="ListItemResource19" Text="Atardeciendo (Late Afternoon)"></asp:ListItem>
                                                <asp:ListItem meta:resourcekey="ListItemResource38" Text="Por la noche (Night)"></asp:ListItem>
                                            </asp:DropDownList>
                                        </div>
                                    </div>
                                    <div class="col-xs-3">
                                        <div class="form-group">
                                            <label for="exampleInputPassword1">
                                                <asp:Literal ID="Literal50" runat="server" meta:resourcekey="Literal50Resource1" Text="Clima"></asp:Literal>:</label>
                                            <asp:TextBox ID="tIRClima" CssClass="form-control" runat="server" meta:resourcekey="tIRClimaResource1"></asp:TextBox>
                                        </div>
                                    </div>

                                </div>

                                <div class="row">
                                    <div class="col-xs-2">
                                        <div class="form-group">
                                            <label for="exampleInputPassword1">
                                                <asp:Literal ID="Literal42" runat="server" meta:resourcekey="Literal42Resource1" Text="% Deposito"></asp:Literal>:</label>
                                            <asp:TextBox ID="tDeposito" CssClass="form-control" runat="server" Text="100" meta:resourcekey="tDepositoResource1"></asp:TextBox>
                                            <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ErrorMessage="Campo requerido" ControlToValidate="tDeposito" meta:resourcekey="RequiredFieldValidator3Resource1"></asp:RequiredFieldValidator>
                                        </div>
                                    </div>

                                    <div class="col-xs-2">
                                        <div class="form-group">
                                            <label for="exampleInputPassword1">
                                                <asp:Literal ID="Literal43" runat="server" meta:resourcekey="Literal43Resource1" Text="Tipo de Salida"></asp:Literal></label>
                                            <asp:DropDownList runat="server" CssClass="form-control" ID="cbTipoSalida" meta:resourcekey="cbTipoSalidaResource1">
                                                <asp:ListItem meta:resourcekey="ListItemResource7" Text="Parado"></asp:ListItem>
                                                <asp:ListItem meta:resourcekey="ListItemResource8" Text="Lanzada"></asp:ListItem>
                                            </asp:DropDownList>
                                        </div>
                                    </div>
                                    <div class="col-xs-2">
                                        <div class="form-group">
                                            <label for="exampleInputPassword1">
                                                <asp:Literal ID="Literal44" runat="server" meta:resourcekey="Literal44Resource1" Text="Fast Repair"></asp:Literal>s</label>
                                            <asp:DropDownList runat="server" CssClass="form-control" ID="cbFastRepairs" meta:resourcekey="cbFastRepairsResource1">
                                                <asp:ListItem meta:resourcekey="ListItemResource9" Text="0"></asp:ListItem>
                                                <asp:ListItem meta:resourcekey="ListItemResource10" Text="1"></asp:ListItem>
                                                <asp:ListItem meta:resourcekey="ListItemResource11" Text="2"></asp:ListItem>
                                            </asp:DropDownList>
                                        </div>
                                    </div>
                                    <div class="col-xs-2">
                                        <div class="form-group">
                                            <label for="exampleInputPassword1">
                                                <asp:Literal ID="Literal45" runat="server" meta:resourcekey="Literal45Resource1" Text="Cautions"></asp:Literal></label>
                                            <asp:DropDownList runat="server" CssClass="form-control" ID="cbCautions" meta:resourcekey="cbCautionsResource1">
                                                <asp:ListItem meta:resourcekey="ListItemResource12" Text="Manuales"></asp:ListItem>
                                                <asp:ListItem meta:resourcekey="ListItemResource13" Text="Automaticos"></asp:ListItem>
                                            </asp:DropDownList>
                                        </div>
                                    </div>
                                    <div class="col-xs-2">
                                        <div class="form-group">
                                            <label for="exampleInputPassword1">
                                                <asp:Literal ID="Literal46" runat="server" meta:resourcekey="Literal46Resource1" Text="Incidentes"></asp:Literal>:</label>
                                            <asp:TextBox ID="tNumIncidentes" CssClass="form-control" runat="server" Text="17" meta:resourcekey="tNumIncidentesResource1"></asp:TextBox>
                                        </div>
                                    </div>
                                    <div class="col-xs-2">
                                        <div class="form-group">
                                            <label for="exampleInputPassword1">
                                                <asp:Literal ID="Literal47" runat="server" meta:resourcekey="Literal47Resource1" Text="Ayudas"></asp:Literal>:</label>
                                            <asp:DropDownList runat="server" CssClass="form-control" ID="cbAyudas" meta:resourcekey="cbAyudasResource1">
                                                <asp:ListItem meta:resourcekey="ListItemResource14" Text="Desactivadas"></asp:ListItem>
                                                <asp:ListItem meta:resourcekey="ListItemResource15" Text="Embrague automático"></asp:ListItem>
                                                <asp:ListItem meta:resourcekey="ListItemResource16" Text="Activadas"></asp:ListItem>
                                            </asp:DropDownList>
                                        </div>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-xs-12">
                                        <div class="form-group">
                                            <label for="exampleInputPassword1">
                                                <asp:Literal ID="Literal48" runat="server" meta:resourcekey="Literal48Resource1" Text="Estado pista"></asp:Literal>:</label>
                                            <asp:TextBox ID="tEstadoPista" CssClass="form-control" runat="server" MaxLength="250" meta:resourcekey="tEstadoPistaResource1"></asp:TextBox>
                                        </div>
                                    </div>
                                </div>
                            </div>

                        </div>
                    </div>
                </div>
            </asp:Panel>
            <asp:Panel ID="panComunPC_AC" runat="server" Visible="False" meta:resourcekey="panComunPC_ACResource1">
                <div class="row">
                    <div class="col-xs-12">
                        <div class="box box-success">
                            <div class="box-header">
                                <h3 class="box-title">
                                    <asp:Literal ID="Literal65" runat="server" Text="Sesiones y duración" meta:resourcekey="Literal65Resource1"></asp:Literal></h3>
                                <p class="small>">No incluyas las plabras "minutos" y "segundos", se añadirán automáticamente</p>
                            </div>
                            <!-- /.box-header -->
                            <div class="box-body">
                                <div class="row">
                                    <div class="col-xs-4">
                                        <div class="form-group">
                                            <label for="exampleInputPassword1">
                                                <asp:Literal ID="Literal66" runat="server" Text="Duración prácticas" meta:resourcekey="Literal66Resource1"></asp:Literal>:</label>
                                            <asp:TextBox CssClass="form-control" ID="tPC_PRACTICA" runat="server" meta:resourcekey="tPC_PRACTICAResource1"></asp:TextBox>
                                        </div>
                                    </div>
                                    <div class="col-xs-4">
                                        <div class="form-group">
                                            <label for="exampleInputPassword1">
                                                <asp:Literal ID="Literal67" runat="server" Text="Duración clasificación" meta:resourcekey="Literal67Resource1"></asp:Literal>:</label>
                                            <asp:TextBox CssClass="form-control" ID="tPC_CLASIFICACION" runat="server" meta:resourcekey="tPC_CLASIFICACIONResource1"></asp:TextBox>
                                        </div>
                                    </div>

                                    <div class="col-xs-4">
                                        <div class="form-group">
                                            <label for="exampleInputPassword1">
                                                <asp:Literal ID="Literal68" runat="server" Text="Duración calentamiento/retraso" meta:resourcekey="Literal68Resource1"></asp:Literal>:</label>
                                            <asp:TextBox CssClass="form-control" ID="tPC_CALENTAMIENTO" runat="server" meta:resourcekey="tPC_CALENTAMIENTOResource1"></asp:TextBox>
                                        </div>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-xs-4">
                                        <div class="form-group">
                                            <label for="exampleInputPassword1">
                                                <asp:Literal ID="Literal69" runat="server" Text="Carrera tiempo" meta:resourcekey="Literal69Resource1"></asp:Literal>:</label>
                                            <asp:TextBox CssClass="form-control" ID="tPC_CARRERA_T" runat="server" meta:resourcekey="tPC_CARRERA_TResource1"></asp:TextBox>
                                        </div>
                                    </div>
                                    <div class="col-xs-4">
                                        <div class="form-group">
                                            <label for="exampleInputPassword1">
                                                <asp:Literal ID="Literal70" runat="server" Text="Carrera vueltas" meta:resourcekey="Literal70Resource1"></asp:Literal>:</label>
                                            <asp:TextBox CssClass="form-control" ID="tPC_CARRERA_V" runat="server" meta:resourcekey="tPC_CARRERA_VResource1"></asp:TextBox>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </asp:Panel>
            <asp:Panel ID="panPC_Sala" runat="server" Visible="False" meta:resourcekey="panPC_SalaResource1">
                <div class="row">
                    <div class="col-xs-12">
                        <div class="box box-success">
                            <div class="box-header">
                                <h3 class="box-title">
                                    <asp:Literal ID="Literal52" runat="server" Text="Configuración Sala" meta:resourcekey="Literal52Resource2"></asp:Literal></h3>
                            </div>
                            <!-- /.box-header -->
                            <div class="box-body">
                                <div class="row">
                                    <div class="col-xs-4">
                                        <div class="form-group">
                                            <label for="exampleInputPassword1">
                                                <asp:Literal ID="Literal55" runat="server" Text="Espacios Meteorología" meta:resourcekey="Literal55Resource1"></asp:Literal>:</label>
                                            <asp:TextBox CssClass="form-control" ID="tPC_ESP_MET" runat="server" meta:resourcekey="tPC_ESP_METResource1"></asp:TextBox>
                                        </div>
                                    </div>
                                    <div class="col-xs-4">
                                        <div class="form-group">
                                            <label for="exampleInputPassword1">
                                                <asp:Literal ID="Literal56" runat="server" Text="Meteorología" meta:resourcekey="Literal56Resource1"></asp:Literal>:</label>
                                            <asp:TextBox CssClass="form-control" ID="tPC_MET" runat="server" meta:resourcekey="tPC_METResource1"></asp:TextBox>
                                        </div>
                                    </div>
                                    <div class="col-xs-4">
                                        <div class="form-group">
                                            <label for="exampleInputPassword1">
                                                <asp:Literal ID="Literal57" runat="server" Text="Progresión Meteorológica" meta:resourcekey="Literal57Resource1"></asp:Literal>:</label>
                                            <asp:TextBox CssClass="form-control" ID="tPC_PROG_MET" runat="server" meta:resourcekey="tPC_PROG_METResource1"></asp:TextBox>
                                        </div>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-xs-6">
                                        <div class="form-group">
                                            <label for="exampleInputPassword1">
                                                <asp:Literal ID="Literal58" runat="server" Text="Tipo de Fecha" meta:resourcekey="Literal58Resource1"></asp:Literal>:</label>
                                            <asp:TextBox CssClass="form-control" ID="tPC_TIPO_FECHA" runat="server" meta:resourcekey="tPC_TIPO_FECHAResource1"></asp:TextBox>
                                        </div>
                                    </div>

                                    <div class="col-xs-6">
                                        <div class="form-group">
                                            <label for="exampleInputPassword1">
                                                <asp:Literal ID="Literal71" runat="server" Text="Progresión Tiempo" meta:resourcekey="Literal71Resource1"></asp:Literal>:</label>
                                            <asp:TextBox CssClass="form-control" ID="tPC_PROG_TIEMPO" runat="server" meta:resourcekey="tPC_PROG_TIEMPOResource1"></asp:TextBox>
                                        </div>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-xs-4">
                                        <div class="form-group">
                                            <label for="exampleInputPassword1">
                                                <asp:Literal ID="Literal60" runat="server" Text="Clase de Coche" meta:resourcekey="Literal60Resource1"></asp:Literal>:</label>
                                            <asp:TextBox CssClass="form-control" ID="tPC_CLASE_COCHE" runat="server" meta:resourcekey="tPC_CLASE_COCHEResource1"></asp:TextBox>
                                        </div>
                                    </div>
                                    <div class="col-xs-4">
                                        <div class="form-group">
                                            <label for="exampleInputPassword1">
                                                <asp:Literal ID="Literal61" runat="server" Text="Parada Pits Obligatorio" meta:resourcekey="Literal61Resource1"></asp:Literal>:</label>
                                            <asp:TextBox CssClass="form-control" ID="tPC_PITS" runat="server" meta:resourcekey="tPC_PITSResource1"></asp:TextBox>
                                        </div>
                                    </div>
                                    <div class="col-xs-4">
                                        <div class="form-group">
                                            <label for="exampleInputPassword1">
                                                <asp:Literal ID="Literal62" runat="server" Text="Salida Lanzada" meta:resourcekey="Literal62Resource1"></asp:Literal>:</label>
                                            <asp:TextBox CssClass="form-control" ID="tPC_SALIDA" runat="server" meta:resourcekey="tPC_SALIDAResource1"></asp:TextBox>
                                        </div>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-xs-4">
                                        <div class="form-group">
                                            <label for="exampleInputPassword1">
                                                <asp:Literal ID="Literal63" runat="server" Text="Forzar Vista Interior" meta:resourcekey="Literal63Resource1"></asp:Literal>:</label>
                                            <asp:TextBox CssClass="form-control" ID="tPC_VISTA_INT" runat="server" meta:resourcekey="tPC_VISTA_INTResource1"></asp:TextBox>
                                        </div>
                                    </div>
                                    <div class="col-xs-4">
                                        <div class="form-group">
                                            <label for="exampleInputPassword1">
                                                <asp:Literal ID="Literal64" runat="server" Text="Forzar Marchas Manuales" meta:resourcekey="Literal64Resource1"></asp:Literal>:</label>
                                            <asp:TextBox CssClass="form-control" ID="tPC_MARCHAS_MAN" runat="server" meta:resourcekey="tPC_MARCHAS_MANResource1"></asp:TextBox>
                                        </div>
                                    </div>
                                    <div class="col-xs-4">
                                        <div class="form-group">
                                            <label for="exampleInputPassword1">
                                                <asp:Literal ID="Literal72" runat="server" Text="Forzar Ayudas Realistas" meta:resourcekey="Literal72Resource1"></asp:Literal>:</label>
                                            <asp:TextBox CssClass="form-control" ID="tPC_AYUDAS" runat="server" meta:resourcekey="tPC_AYUDASResource1"></asp:TextBox>
                                        </div>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-xs-4">
                                        <div class="form-group">
                                            <label for="exampleInputPassword1">
                                                <asp:Literal ID="Literal73" runat="server" Text="Permitir ABS" meta:resourcekey="Literal73Resource1"></asp:Literal>:</label>
                                            <asp:TextBox CssClass="form-control" ID="tPC_ABS" runat="server" meta:resourcekey="tPC_ABSResource1"></asp:TextBox>
                                        </div>
                                    </div>
                                    <div class="col-xs-4">
                                        <div class="form-group">
                                            <label for="exampleInputPassword1">
                                                <asp:Literal ID="Literal74" runat="server" Text="Permitir control de estabilidad" meta:resourcekey="Literal74Resource1"></asp:Literal>:</label>
                                            <asp:TextBox CssClass="form-control" ID="tPC_ESP" runat="server" meta:resourcekey="tPC_ESPResource1"></asp:TextBox>
                                        </div>
                                    </div>
                                    <div class="col-xs-4">
                                        <div class="form-group">
                                            <label for="exampleInputPassword1">
                                                <asp:Literal ID="Literal75" runat="server" Text="Permitir control de tracción" meta:resourcekey="Literal75Resource1"></asp:Literal>:</label>
                                            <asp:TextBox CssClass="form-control" ID="tPC_CT" runat="server" meta:resourcekey="tPC_CTResource1"></asp:TextBox>
                                        </div>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-xs-4">
                                        <div class="form-group">
                                            <label for="exampleInputPassword1">
                                                <asp:Literal ID="Literal89" runat="server" Text="Config. defecto fuerza" meta:resourcekey="Literal89Resource1"></asp:Literal>:</label>
                                            <asp:TextBox CssClass="form-control" ID="tPC_FUERZA" runat="server" meta:resourcekey="tPC_FUERZAResource1"></asp:TextBox>
                                        </div>
                                    </div>
                                    <div class="col-xs-4">
                                        <div class="form-group">
                                            <label for="exampleInputPassword1">
                                                <asp:Literal ID="Literal90" runat="server" Text="Daños" meta:resourcekey="Literal90Resource1"></asp:Literal>:</label>
                                            <asp:TextBox CssClass="form-control" ID="tPC_DANOS" runat="server" meta:resourcekey="tPC_DANOSResource1"></asp:TextBox>
                                        </div>
                                    </div>
                                    <div class="col-xs-4">
                                        <div class="form-group">
                                            <label for="exampleInputPassword1">
                                                <asp:Literal ID="Literal91" runat="server" Text="Fallos mecánicos" meta:resourcekey="Literal91Resource1"></asp:Literal>:</label>
                                            <asp:TextBox CssClass="form-control" ID="tPC_FALLOS" runat="server" meta:resourcekey="tPC_FALLOSResource1"></asp:TextBox>
                                        </div>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-xs-4">
                                        <div class="form-group">
                                            <label for="exampleInputPassword1">
                                                <asp:Literal ID="Literal94" runat="server" Text="Desgaste neumáticos" meta:resourcekey="Literal94Resource1"></asp:Literal>:</label>
                                            <asp:TextBox CssClass="form-control" ID="tPC_DESGASTE" runat="server" meta:resourcekey="tPC_DESGASTEResource1"></asp:TextBox>
                                        </div>
                                    </div>
                                    <div class="col-xs-4">
                                        <div class="form-group">
                                            <label for="exampleInputPassword1">
                                                <asp:Literal ID="Literal95" runat="server" Text="Uso de combustible" meta:resourcekey="Literal95Resource1"></asp:Literal>:</label>
                                            <asp:TextBox CssClass="form-control" ID="tPC_COMBUSTIBLE" runat="server" meta:resourcekey="tPC_COMBUSTIBLEResource1"></asp:TextBox>
                                        </div>
                                    </div>
                                    <div class="col-xs-4">
                                        <div class="form-group">
                                            <label for="exampleInputPassword1">
                                                <asp:Literal ID="Literal96" runat="server" Text="Arranque automático" meta:resourcekey="Literal96Resource1"></asp:Literal>:</label>
                                            <asp:TextBox CssClass="form-control" ID="tPC_ARRANQUE" runat="server" meta:resourcekey="tPC_ARRANQUEResource1"></asp:TextBox>
                                        </div>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-xs-8">
                                        <div class="form-group">
                                            <label for="exampleInputPassword1">
                                                <asp:Literal ID="Literal97" runat="server" Text="Banderas y penalizaciones" meta:resourcekey="Literal97Resource1"></asp:Literal>:</label>
                                            <asp:TextBox CssClass="form-control" ID="tPC_BANDERAS" runat="server" meta:resourcekey="tPC_BANDERASResource1"></asp:TextBox>
                                        </div>
                                    </div>
                                    <div class="col-xs-4">
                                        <div class="form-group">
                                            <label for="exampleInputPassword1">
                                                <asp:Literal ID="Literal98" runat="server" Text="Coches transparentes" meta:resourcekey="Literal98Resource1"></asp:Literal>:</label>
                                            <asp:TextBox CssClass="form-control" ID="tPC_TRANSP" runat="server" meta:resourcekey="tPC_TRANSPResource1"></asp:TextBox>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </asp:Panel>
            <asp:Panel ID="panAC_Sala" runat="server" meta:resourcekey="panAC_SalaResource1">
                <div class="row">
                    <div class="col-xs-12">
                        <div class="box box-success">
                            <div class="box-header">
                                <h3 class="box-title">
                                    <asp:Literal ID="Literal76" runat="server" Text="Configuración Sala" meta:resourcekey="Literal76Resource1"></asp:Literal></h3>
                            </div>
                            <!-- /.box-header -->
                            <div class="box-body">
                                <div class="row">
                                    <div class="col-xs-4">
                                        <div class="form-group">
                                            <label for="exampleInputPassword1">
                                                <asp:Literal ID="Literal78" runat="server" Text="Clima" meta:resourcekey="Literal78Resource1"></asp:Literal>:</label>
                                            <asp:TextBox CssClass="form-control" ID="tAC_CLIMA" runat="server" meta:resourcekey="tAC_CLIMAResource1"></asp:TextBox>
                                        </div>
                                    </div>
                                    <div class="col-xs-4">
                                        <div class="form-group">
                                            <label for="exampleInputPassword1">
                                                <asp:Literal ID="Literal79" runat="server" Text="Temperatura Ambiente" meta:resourcekey="Literal79Resource1"></asp:Literal>:</label>
                                            <asp:TextBox CssClass="form-control" ID="tAC_TEMP" runat="server" meta:resourcekey="tAC_TEMPResource1"></asp:TextBox>
                                        </div>
                                    </div>
                                    <div class="col-xs-4">
                                        <div class="form-group">
                                            <label for="exampleInputPassword1">
                                                <asp:Literal ID="Literal92" runat="server" Text="Superficie Pista" meta:resourcekey="Literal92Resource1"></asp:Literal>:</label>
                                            <asp:TextBox CssClass="form-control" ID="tAC_PISTA" runat="server" meta:resourcekey="tAC_PISTAResource1"></asp:TextBox>
                                        </div>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-xs-3">
                                        <div class="form-group">
                                            <label for="exampleInputPassword1">
                                                <asp:Literal ID="Literal80" runat="server" Text="Autoembrague" meta:resourcekey="Literal80Resource1"></asp:Literal>:</label>
                                            <asp:TextBox CssClass="form-control" ID="tAC_EMBRAGUE" runat="server" meta:resourcekey="tAC_EMBRAGUEResource1"></asp:TextBox>
                                        </div>
                                    </div>
                                    <div class="col-xs-3">
                                        <div class="form-group">
                                            <label for="exampleInputPassword1">
                                                <asp:Literal ID="Literal81" runat="server" Text="Control Tracción" meta:resourcekey="Literal81Resource1"></asp:Literal>:</label>
                                            <asp:TextBox CssClass="form-control" ID="tAC_CT" runat="server" meta:resourcekey="tAC_CTResource1"></asp:TextBox>
                                        </div>
                                    </div>
                                    <div class="col-xs-3">
                                        <div class="form-group">
                                            <label for="exampleInputPassword1">
                                                <asp:Literal ID="Literal82" runat="server" Text="ABS" meta:resourcekey="Literal82Resource1"></asp:Literal>:</label>
                                            <asp:TextBox CssClass="form-control" ID="tAC_ABS" runat="server" meta:resourcekey="tAC_ABSResource1"></asp:TextBox>
                                        </div>
                                    </div>
                                    <div class="col-xs-3">
                                        <div class="form-group">
                                            <label for="exampleInputPassword1">
                                                <asp:Literal ID="Literal83" runat="server" Text="Control Estabilidad" meta:resourcekey="Literal83Resource1"></asp:Literal>:</label>
                                            <asp:TextBox CssClass="form-control" ID="tAC_ESP" runat="server" meta:resourcekey="tAC_ESPResource1"></asp:TextBox>
                                        </div>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-xs-4">
                                        <div class="form-group">
                                            <label for="exampleInputPassword1">
                                                <asp:Literal ID="Literal84" runat="server" Text="Calentadores Neumáticos" meta:resourcekey="Literal84Resource1"></asp:Literal>:</label>
                                            <asp:TextBox CssClass="form-control" ID="tAC_CALENTADORES" runat="server" meta:resourcekey="tAC_CALENTADORESResource1"></asp:TextBox>
                                        </div>
                                    </div>
                                    <div class="col-xs-4">
                                        <div class="form-group">
                                            <label for="exampleInputPassword1">
                                                <asp:Literal ID="Literal85" runat="server" Text="Consumo Combustible" meta:resourcekey="Literal85Resource1"></asp:Literal>:</label>
                                            <asp:TextBox CssClass="form-control" ID="tAC_COMBUSTIBLE" runat="server" meta:resourcekey="tAC_COMBUSTIBLEResource1"></asp:TextBox>
                                        </div>
                                    </div>
                                    <div class="col-xs-4">
                                        <div class="form-group">
                                            <label for="exampleInputPassword1">
                                                <asp:Literal ID="Literal93" runat="server" Text="Daños" meta:resourcekey="Literal93Resource1"></asp:Literal>:</label>
                                            <asp:TextBox CssClass="form-control" ID="tAC_DAÑOS" runat="server" meta:resourcekey="tAC_DAÑOSResource1"></asp:TextBox>
                                        </div>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-xs-4">
                                        <div class="form-group">
                                            <label for="exampleInputPassword1">
                                                <asp:Literal ID="Literal86" runat="server" Text="Desgaste de Ruedas" meta:resourcekey="Literal86Resource1"></asp:Literal>:</label>
                                            <asp:TextBox CssClass="form-control" ID="tAC_DESGASTE" runat="server" meta:resourcekey="tAC_DESGASTEResource1"></asp:TextBox>
                                        </div>
                                    </div>
                                    <div class="col-xs-4">
                                        <div class="form-group">
                                            <label for="exampleInputPassword1">
                                                <asp:Literal ID="Literal87" runat="server" Text="Penalización por salirse" meta:resourcekey="Literal87Resource1"></asp:Literal>:</label>
                                            <asp:TextBox CssClass="form-control" ID="tAC_PENALIZACION" runat="server" meta:resourcekey="tAC_PENALIZACIONResource1"></asp:TextBox>
                                        </div>
                                    </div>
                                    <div class="col-xs-4">
                                        <div class="form-group">
                                            <label for="exampleInputPassword1">
                                                <asp:Literal ID="Literal88" runat="server" Text="Límite de Clasificaciones" meta:resourcekey="Literal88Resource1"></asp:Literal>:</label>
                                            <asp:TextBox CssClass="form-control" ID="tAC_LIMITE" runat="server" meta:resourcekey="tAC_LIMITEResource1"></asp:TextBox>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </asp:Panel>
            <asp:Panel ID="panRF_Sala" runat="server" meta:resourcekey="panRF_SalaResource1">
                <div class="row">
                    <div class="col-xs-12">
                        <div class="box box-success">
                            <div class="box-header">
                                <h3 class="box-title">
                                    <asp:Literal ID="Literal28" runat="server" Text="Configuración Sala" meta:resourcekey="Literal28Resource2"></asp:Literal></h3>
                            </div>
                            <!-- /.box-header -->
                            <div class="box-body">
                                <div class="row">
                                    <div class="col-xs-4">
                                        <div class="form-group">
                                            <label for="exampleInputPassword1">
                                                <asp:Literal ID="Literal29" runat="server" Text="Version rFactor" meta:resourcekey="Literal29Resource2"></asp:Literal>:</label>
                                            <asp:TextBox CssClass="form-control" ID="tRFVersion" runat="server" meta:resourcekey="tRFVersionResource1"></asp:TextBox>
                                        </div>
                                    </div>
                                    <div class="col-xs-4">
                                        <div class="form-group">
                                            <label for="exampleInputPassword1">
                                                <asp:Literal ID="Literal30" runat="server" Text="Servidor" meta:resourcekey="Literal30Resource2"></asp:Literal>:</label>
                                            <asp:TextBox CssClass="form-control" ID="tRFServidor" runat="server" meta:resourcekey="tRFServidorResource1"></asp:TextBox>
                                        </div>
                                    </div>
                                    <div class="col-xs-4">
                                        <div class="form-group">
                                            <label for="exampleInputPassword1">
                                                <asp:Literal ID="Literal31" runat="server" Text="Password" meta:resourcekey="Literal31Resource2"></asp:Literal>:</label>
                                            <asp:TextBox CssClass="form-control" ID="tRFPass" runat="server" meta:resourcekey="tRFPassResource1"></asp:TextBox>
                                        </div>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-xs-4">
                                        <div class="form-group">
                                            <label for="exampleInputPassword1">
                                                <asp:Literal ID="Literal32" runat="server" Text="Condiciones de la Pista" meta:resourcekey="Literal32Resource2"></asp:Literal>:</label>
                                            <asp:TextBox CssClass="form-control" ID="tRFEstado" runat="server" meta:resourcekey="tRFEstadoResource1"></asp:TextBox>
                                        </div>
                                    </div>
                                    <div class="col-xs-4">
                                        <div class="form-group">
                                            <label for="exampleInputPassword1">
                                                <asp:Literal ID="Literal34" runat="server" Text="Real Road" meta:resourcekey="Literal34Resource2"></asp:Literal>:</label>
                                            <asp:TextBox CssClass="form-control" ID="tRFReal" runat="server" meta:resourcekey="tRFRealResource1"></asp:TextBox>
                                        </div>
                                    </div>
                                    <div class="col-xs-4">
                                        <div class="form-group">
                                            <label for="exampleInputPassword1">
                                                <asp:Literal ID="Literal35" runat="server" Text="Consumo de Combustible" meta:resourcekey="Literal35Resource2"></asp:Literal>:</label>
                                            <asp:TextBox CssClass="form-control" ID="tRFDeposito" runat="server" meta:resourcekey="tRFDepositoResource1"></asp:TextBox>
                                        </div>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-xs-4">
                                        <div class="form-group">
                                            <label for="exampleInputPassword1">
                                                <asp:Literal ID="Literal37" runat="server" Text="Desgaste de Neumáticos" meta:resourcekey="Literal37Resource2"></asp:Literal>:</label>
                                            <asp:TextBox CssClass="form-control" ID="tRFDesgaste" runat="server" meta:resourcekey="tRFDesgasteResource1"></asp:TextBox>
                                        </div>
                                    </div>
                                    <div class="col-xs-4">
                                        <div class="form-group">
                                            <label for="exampleInputPassword1">
                                                <asp:Literal ID="Literal38" runat="server" Text="Daños" meta:resourcekey="Literal38Resource2"></asp:Literal>:</label>
                                            <asp:TextBox CssClass="form-control" ID="tRFDanos" runat="server" meta:resourcekey="tRFDanosResource1"></asp:TextBox>
                                        </div>
                                    </div>
                                    <div class="col-xs-4">
                                        <div class="form-group">
                                            <label for="exampleInputPassword1">
                                                <asp:Literal ID="Literal39" runat="server" Text="Meteorología" meta:resourcekey="Literal39Resource2"></asp:Literal>:</label>
                                            <asp:TextBox CssClass="form-control" ID="tRFMeteo" runat="server" meta:resourcekey="tRFMeteoResource1"></asp:TextBox>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </asp:Panel>
            <asp:Panel ID="panF1" runat="server" meta:resourcekey="panF1Resource1">
                <div class="row">
                    <div class="col-xs-12">
                        <div class="box box-success">
                            <div class="box-header">
                                <h3 class="box-title">
                                    <asp:Literal ID="Literal59" runat="server" Text="Opciones de la Sesión" meta:resourcekey="Literal59Resource1"></asp:Literal></h3>
                            </div>
                            <!-- /.box-header -->
                            <div class="box-body">
                                <div class="row">
                                    <div class="col-xs-4">
                                        <div class="form-group">
                                            <label for="exampleInputPassword1">
                                                <asp:Literal ID="Literal99" runat="server" Text="Tipo de Entrenamiento" meta:resourcekey="Literal99Resource1"></asp:Literal>:</label>
                                            <asp:TextBox CssClass="form-control" ID="tF1TipoEntre" runat="server" meta:resourcekey="tF1TipoEntreResource1"></asp:TextBox>
                                        </div>
                                    </div>
                                    <div class="col-xs-4">
                                        <div class="form-group">
                                            <label for="exampleInputPassword1">
                                                <asp:Literal ID="Literal100" runat="server" Text="Ronda de Clasificación" meta:resourcekey="Literal100Resource1"></asp:Literal>:</label>
                                            <asp:TextBox CssClass="form-control" ID="tF1TiempoClasif" runat="server" meta:resourcekey="tF1TiempoClasifResource1"></asp:TextBox>
                                        </div>
                                    </div>
                                    <div class="col-xs-4">
                                        <div class="form-group">
                                            <label for="exampleInputPassword1">
                                                <asp:Literal ID="Literal101" runat="server" Text="Distancia Carrera" meta:resourcekey="Literal101Resource1"></asp:Literal>:</label>
                                            <asp:TextBox CssClass="form-control" ID="tF1Distancia" runat="server" meta:resourcekey="tF1DistanciaResource1"></asp:TextBox>
                                        </div>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-xs-6">
                                        <div class="form-group">
                                            <label for="exampleInputPassword1">
                                                <asp:Literal ID="Literal102" runat="server" Text="Clima" meta:resourcekey="Literal102Resource1"></asp:Literal>:</label>
                                            <asp:TextBox CssClass="form-control" ID="tF1Clima" runat="server" meta:resourcekey="tF1ClimaResource1"></asp:TextBox>
                                        </div>
                                    </div>
                                    <div class="col-xs-6">
                                        <div class="form-group">
                                            <label for="exampleInputPassword1">
                                                <asp:Literal ID="Literal103" runat="server" Text="Clima de Inicio de Sesión" meta:resourcekey="Literal103Resource1"></asp:Literal>:</label>
                                            <asp:TextBox CssClass="form-control" ID="tF1ClimaInicio" runat="server" meta:resourcekey="tF1ClimaInicioResource1"></asp:TextBox>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="box box-success">
                            <div class="box-header">
                                <h3 class="box-title">
                                    <asp:Literal ID="Literal112" runat="server" Text="Opciones de Carrera" meta:resourcekey="Literal112Resource1"></asp:Literal></h3>
                            </div>
                            <!-- /.box-header -->
                            <div class="box-body">
                                <div class="row">
                                    <div class="col-xs-6">
                                        <div class="form-group">
                                            <label for="exampleInputPassword1">
                                                <asp:Literal ID="Literal104" runat="server" Text="Rendimiento del Coche" meta:resourcekey="Literal104Resource1"></asp:Literal>:</label>
                                            <asp:TextBox CssClass="form-control" ID="tF1Rendimiento" runat="server" meta:resourcekey="tF1RendimientoResource1"></asp:TextBox>
                                        </div>
                                    </div>
                                    <div class="col-xs-6">
                                        <div class="form-group">
                                            <label for="exampleInputPassword1">
                                                <asp:Literal ID="Literal105" runat="server" Text="Daños del Monoplaza" meta:resourcekey="Literal105Resource1"></asp:Literal>:</label>
                                            <asp:TextBox CssClass="form-control" ID="tF1Daños" runat="server" meta:resourcekey="tF1DañosResource1"></asp:TextBox>
                                        </div>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-xs-3">
                                        <div class="form-group">
                                            <label for="exampleInputPassword1">
                                                <asp:Literal ID="Literal106" runat="server" Text="Normativa del Parc Fermé" meta:resourcekey="Literal106Resource1"></asp:Literal>:</label>
                                            <asp:DropDownList ID="tF1Ferme" CssClass="form-control" runat="server" meta:resourcekey="tF1FermeResource1">
                                                <asp:ListItem meta:resourcekey="ListItemResource20">Si</asp:ListItem>
                                                <asp:ListItem meta:resourcekey="ListItemResource21">No</asp:ListItem>
                                            </asp:DropDownList>
                                        </div>
                                    </div>
                                    <div class="col-xs-3">
                                        <div class="form-group">
                                            <label for="exampleInputPassword1">
                                                <asp:Literal ID="Literal107" runat="server" Text="Colisiones" meta:resourcekey="Literal107Resource1"></asp:Literal>:</label>
                                            <asp:DropDownList ID="tF1Colisiones" CssClass="form-control" runat="server" meta:resourcekey="tF1ColisionesResource1">
                                                <asp:ListItem meta:resourcekey="ListItemResource22">Si</asp:ListItem>
                                                <asp:ListItem meta:resourcekey="ListItemResource23">No</asp:ListItem>
                                            </asp:DropDownList>
                                        </div>
                                    </div>
                                    <div class="col-xs-3">
                                        <div class="form-group">
                                            <label for="exampleInputPassword1">
                                                <asp:Literal ID="Literal108" runat="server" Text="Coche de Seguridad" meta:resourcekey="Literal108Resource1"></asp:Literal>:</label>
                                            <asp:DropDownList ID="tF1Coche" CssClass="form-control" runat="server" meta:resourcekey="tF1CocheResource1">
                                                <asp:ListItem meta:resourcekey="ListItemResource24">Si</asp:ListItem>
                                                <asp:ListItem meta:resourcekey="ListItemResource25">No</asp:ListItem>
                                            </asp:DropDownList>
                                        </div>
                                    </div>
                                    <div class="col-xs-3">
                                        <div class="form-group">
                                            <label for="exampleInputPassword1">
                                                <asp:Literal ID="Literal113" runat="server" Text="Vuelta de Formación" meta:resourcekey="Literal113Resource1"></asp:Literal>:</label>
                                            <asp:DropDownList ID="tF1Vuelta" CssClass="form-control" runat="server" meta:resourcekey="tF1VueltaResource1">
                                                <asp:ListItem meta:resourcekey="ListItemResource26">Si</asp:ListItem>
                                                <asp:ListItem meta:resourcekey="ListItemResource27">No</asp:ListItem>
                                            </asp:DropDownList>
                                        </div>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-xs-6">
                                        <div class="form-group">
                                            <label for="exampleInputPassword1">
                                                <asp:Literal ID="Literal109" runat="server" Text="Severidad al saltarse curvas" meta:resourcekey="Literal109Resource1"></asp:Literal>:</label>
                                            <asp:TextBox CssClass="form-control" ID="tF1Curvas" runat="server" meta:resourcekey="tF1CurvasResource1"></asp:TextBox>
                                        </div>
                                    </div>
                                    <div class="col-xs-6">
                                        <div class="form-group">
                                            <label for="exampleInputPassword1">
                                                <asp:Literal ID="Literal110" runat="server" Text="Arranque de Carrera" meta:resourcekey="Literal110Resource1"></asp:Literal>:</label>
                                            <asp:TextBox CssClass="form-control" ID="tF1Arranque" runat="server" meta:resourcekey="tF1ArranqueResource1"></asp:TextBox>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="box box-success">
                            <div class="box-header">
                                <h3 class="box-title">
                                    <asp:Literal ID="Literal111" runat="server" Text="Restricciones de Ayudas" meta:resourcekey="Literal111Resource1"></asp:Literal></h3>
                            </div>
                            <!-- /.box-header -->
                            <div class="box-body">
                                <div class="row">
                                    <div class="col-xs-2">
                                        <div class="form-group">
                                            <label for="exampleInputPassword1">
                                                <asp:Literal ID="Literal116" runat="server" Text="Asistencia de Frenada" meta:resourcekey="Literal116Resource1"></asp:Literal>:</label>
                                            <asp:DropDownList ID="tF1Frenada" CssClass="form-control" runat="server" meta:resourcekey="tF1FrenadaResource1">
                                                <asp:ListItem meta:resourcekey="ListItemResource28">Si</asp:ListItem>
                                                <asp:ListItem meta:resourcekey="ListItemResource29">No</asp:ListItem>
                                            </asp:DropDownList>
                                        </div>
                                    </div>
                                    <div class="col-xs-2">
                                        <div class="form-group">
                                            <label for="exampleInputPassword1">
                                                <asp:Literal ID="Literal117" runat="server" Text="Frenos Antibloqueo" meta:resourcekey="Literal117Resource1"></asp:Literal>:</label>
                                            <asp:DropDownList ID="tF1Frenos" CssClass="form-control" runat="server" meta:resourcekey="tF1FrenosResource1">
                                                <asp:ListItem meta:resourcekey="ListItemResource30">Si</asp:ListItem>
                                                <asp:ListItem meta:resourcekey="ListItemResource31">No</asp:ListItem>
                                            </asp:DropDownList>
                                        </div>
                                    </div>
                                    <div class="col-xs-2">
                                        <div class="form-group">
                                            <label for="exampleInputPassword1">
                                                <asp:Literal ID="Literal118" runat="server" Text="Control de tracción" meta:resourcekey="Literal118Resource1"></asp:Literal>:</label>
                                            <asp:DropDownList ID="tF1CT" CssClass="form-control" runat="server" meta:resourcekey="tF1CTResource1">
                                                <asp:ListItem meta:resourcekey="ListItemResource32">Si</asp:ListItem>
                                                <asp:ListItem meta:resourcekey="ListItemResource33">No</asp:ListItem>
                                            </asp:DropDownList>
                                        </div>
                                    </div>
                                    <div class="col-xs-3">
                                        <div class="form-group">
                                            <label for="exampleInputPassword1">
                                                <asp:Literal ID="Literal119" runat="server" Text="Asistencia en Boxes" meta:resourcekey="Literal119Resource1"></asp:Literal>:</label>
                                            <asp:DropDownList ID="tF1Box" CssClass="form-control" runat="server" meta:resourcekey="tF1BoxResource1">
                                                <asp:ListItem meta:resourcekey="ListItemResource34">Si</asp:ListItem>
                                                <asp:ListItem meta:resourcekey="ListItemResource35">No</asp:ListItem>
                                            </asp:DropDownList>
                                        </div>
                                    </div>
                                    <div class="col-xs-3">
                                        <div class="form-group">
                                            <label for="exampleInputPassword1">
                                                <asp:Literal ID="Literal114" runat="server" Text="Trazada dinámica" meta:resourcekey="Literal114Resource1"></asp:Literal>:</label>
                                            <asp:DropDownList ID="tF1Trazada" CssClass="form-control" runat="server" meta:resourcekey="tF1TrazadaResource1">
                                                <asp:ListItem meta:resourcekey="ListItemResource36">Si</asp:ListItem>
                                                <asp:ListItem meta:resourcekey="ListItemResource37">No</asp:ListItem>
                                            </asp:DropDownList>
                                        </div>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-xs-12">
                                        <div class="form-group">
                                            <label for="exampleInputPassword1">
                                                <asp:Literal ID="Literal120" runat="server" Text="Caja de cambios" meta:resourcekey="Literal120Resource1"></asp:Literal>:</label>
                                            <asp:TextBox CssClass="form-control" ID="tF1Caja" runat="server" meta:resourcekey="tF1CajaResource1"></asp:TextBox>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </asp:Panel>
            <asp:Panel ID="panRR" runat="server">
                <div class="row">
                    <div class="col-xs-12">
                        <div class="box box-info">
                            <div class="box-header">
                                <h3 class="box-title">
                                    <asp:Literal ID="Literal36" runat="server" meta:resourcekey="Literal25Resource1" Text="Sesiones y duración"></asp:Literal></h3>
                            </div>
                            <!-- /.box-header -->
                            <div class="box-body">
                                <div class="row">
                                    <div class="col-xs-2">
                                        <div class="form-group">
                                            <label for="exampleInputPassword1">
                                                <asp:Literal ID="Literal51" runat="server" Text="Prácticas (minutos)"></asp:Literal>:</label>
                                            <asp:TextBox ID="tRRPracticas" CssClass="form-control" runat="server" meta:resourcekey="tDuracionPracticasResource1"></asp:TextBox>
                                            <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ErrorMessage="Campo requerido" CssClass="label label-danger" ControlToValidate="tRRPracticas" meta:resourcekey="RequiredFieldValidator5Resource1"></asp:RequiredFieldValidator>
                                        </div>
                                    </div>
                                    <div class="col-xs-2">
                                        <div class="form-group">
                                            <label for="exampleInputPassword1">
                                                <asp:Literal ID="Literal133" runat="server" Text="Periodo Dia"></asp:Literal>:</label>
                                            <asp:DropDownList ID="cbRRPracticasPeriodo" CssClass="form-control" runat="server">
                                                <asp:ListItem>Sunrise</asp:ListItem>
                                                <asp:ListItem>Morning</asp:ListItem>
                                                <asp:ListItem>Noon</asp:ListItem>
                                                <asp:ListItem>Afternoon</asp:ListItem>
                                                <asp:ListItem>Sunset</asp:ListItem>
                                            </asp:DropDownList>
                                            <asp:RequiredFieldValidator ID="RequiredFieldValidator13" runat="server" ErrorMessage="Campo requerido" CssClass="label label-danger" ControlToValidate="cbRRPracticasPeriodo" meta:resourcekey="RequiredFieldValidator5Resource1"></asp:RequiredFieldValidator>
                                        </div>
                                    </div>
                                    <div class="col-xs-2">
                                        <div class="form-group">
                                            <label for="exampleInputPassword1">
                                                <asp:Literal ID="Literal115" runat="server" meta:resourcekey="Literal33Resource1" Text="Clasificación (minutos)"></asp:Literal>:</label>
                                            <asp:TextBox ID="tRRCuali" CssClass="form-control" runat="server" meta:resourcekey="tDuracionCualiResource1"></asp:TextBox>
                                            <asp:RequiredFieldValidator ID="RequiredFieldValidator8" runat="server" ErrorMessage="Campo requerido" CssClass="label label-danger" ControlToValidate="tRRCuali" meta:resourcekey="RequiredFieldValidator7Resource1"></asp:RequiredFieldValidator>
                                        </div>
                                    </div>
                                    <div class="col-xs-2">
                                        <div class="form-group">
                                            <label for="exampleInputPassword1">
                                                <asp:Literal ID="Literal134" runat="server" Text="Periodo Dia"></asp:Literal>:</label>
                                            <asp:DropDownList ID="cbRRCualiPeriodo" CssClass="form-control" runat="server">
                                                <asp:ListItem>Sunrise</asp:ListItem>
                                                <asp:ListItem>Morning</asp:ListItem>
                                                <asp:ListItem>Noon</asp:ListItem>
                                                <asp:ListItem>Afternoon</asp:ListItem>
                                                <asp:ListItem>Sunset</asp:ListItem>
                                            </asp:DropDownList>
                                            <asp:RequiredFieldValidator ID="RequiredFieldValidator15" runat="server" ErrorMessage="Campo requerido" CssClass="label label-danger" ControlToValidate="cbRRCualiPeriodo" meta:resourcekey="RequiredFieldValidator5Resource1"></asp:RequiredFieldValidator>
                                        </div>
                                    </div>
                                    <div class="col-xs-2">
                                        <div class="form-group">
                                            <label for="exampleInputPassword1">
                                                <asp:Literal ID="Literal121" runat="server" meta:resourcekey="Literal40Resource1" Text="Carrera (minutos)"></asp:Literal>:</label>
                                            <asp:TextBox ID="tRRCarrera" CssClass="form-control" runat="server"></asp:TextBox>
                                            <asp:RequiredFieldValidator ID="RequiredFieldValidator11" runat="server" ErrorMessage="Campo requerido" CssClass="label label-danger" ControlToValidate="tRRCarrera" meta:resourcekey="RequiredFieldValidator9Resource1"></asp:RequiredFieldValidator>
                                        </div>
                                    </div>
                                    <div class="col-xs-2">
                                        <div class="form-group">
                                            <label for="exampleInputPassword1">
                                                <asp:Literal ID="Literal135" runat="server" Text="Periodo Dia"></asp:Literal>:</label>
                                            <asp:DropDownList ID="cbRRCarreraPeriodo" CssClass="form-control" runat="server">
                                                <asp:ListItem>Sunrise</asp:ListItem>
                                                <asp:ListItem>Morning</asp:ListItem>
                                                <asp:ListItem>Noon</asp:ListItem>
                                                <asp:ListItem>Afternoon</asp:ListItem>
                                                <asp:ListItem>Sunset</asp:ListItem>
                                            </asp:DropDownList>
                                            <asp:RequiredFieldValidator ID="RequiredFieldValidator16" runat="server" ErrorMessage="Campo requerido" CssClass="label label-danger" ControlToValidate="cbRRCarreraPeriodo" meta:resourcekey="RequiredFieldValidator5Resource1"></asp:RequiredFieldValidator>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="row">
                    <div class="col-xs-12">
                        <div class="box box-success">
                            <div class="box-header">
                                <h3 class="box-title">
                                    <asp:Literal ID="Literal122" runat="server" meta:resourcekey="Literal38Resource1" Text="Configuración de Sala"></asp:Literal></h3>
                            </div>
                            <div class="box-body">
                                <div class="row">
                                    <div class="col-xs-6">
                                        <div class="form-group">
                                            <label for="exampleInputPassword1">
                                                <asp:Literal ID="Literal123" runat="server" Text="Reverse Start Order PLace:"></asp:Literal>:</label>
                                            <asp:TextBox ID="tRRReverse" CssClass="form-control" runat="server" Text="Off"></asp:TextBox>
                                        </div>
                                        <div class="form-group">
                                            <label for="exampleInputPassword1">
                                                <asp:Literal ID="Literal124" runat="server" Text="Tire Wear"></asp:Literal>:</label>
                                            <asp:DropDownList runat="server" CssClass="form-control" ID="cbRRTireWear">
                                                <asp:ListItem Text="Off"></asp:ListItem>
                                                <asp:ListItem Text="Normal"></asp:ListItem>
                                                <asp:ListItem Text="2x"></asp:ListItem>
                                                <asp:ListItem Text="3x"></asp:ListItem>
                                                <asp:ListItem Text="4x"></asp:ListItem>
                                            </asp:DropDownList>
                                        </div>
                                        <div class="form-group">
                                            <label for="exampleInputPassword1">
                                                <asp:Literal ID="Literal125" runat="server" Text="Mechanical Damage"></asp:Literal>:</label>
                                            <asp:DropDownList runat="server" CssClass="form-control" ID="cbRRMechDamage">
                                                <asp:ListItem Text="Off"></asp:ListItem>
                                                <asp:ListItem Text="On"></asp:ListItem>
                                            </asp:DropDownList>
                                        </div>
                                        <div class="form-group">
                                            <label for="exampleInputPassword1">
                                                <asp:Literal ID="Literal136" runat="server" Text="Flag Rules"></asp:Literal>:</label>
                                            <asp:DropDownList runat="server" CssClass="form-control" ID="cbRRFlags">
                                                <asp:ListItem Text="None"></asp:ListItem>
                                                <asp:ListItem Text="Black Only"></asp:ListItem>
                                                <asp:ListItem Text="Visual Only"></asp:ListItem>
                                                <asp:ListItem Text="Complete"></asp:ListItem>
                                            </asp:DropDownList>
                                        </div>
                                        <div class="form-group">
                                            <label for="exampleInputPassword1">
                                                <asp:Literal ID="Literal137" runat="server" Text="Kick Non Ready Clients Time"></asp:Literal>:</label>
                                            <asp:DropDownList runat="server" CssClass="form-control" ID="cbRRKick">
                                                <asp:ListItem Text="Off"></asp:ListItem>
                                                <asp:ListItem Text="Wait Forever"></asp:ListItem>
                                            </asp:DropDownList>
                                        </div>
                                        <div class="form-group">
                                            <label for="exampleInputPassword1">
                                                <asp:Literal ID="Literal138" runat="server" Text="Mandatory PitStops"></asp:Literal>:</label>
                                            <asp:DropDownList runat="server" CssClass="form-control" ID="cbRRMandPit">
                                                <asp:ListItem Text="Off"></asp:ListItem>
                                                <asp:ListItem Text="On"></asp:ListItem>
                                            </asp:DropDownList>
                                        </div>
                                        <div class="form-group">
                                            <label for="exampleInputPassword1">
                                                <asp:Literal ID="Literal139" runat="server" Text="Stay In Practice Session If Empty"></asp:Literal>:</label>
                                            <asp:DropDownList runat="server" CssClass="form-control" ID="cbRRStayInPractice">
                                                <asp:ListItem Text="Off"></asp:ListItem>
                                                <asp:ListItem Text="On"></asp:ListItem>
                                            </asp:DropDownList>
                                        </div>
                                    </div>
                                    <div class="col-xs-6">
                                        <div class="form-group">
                                            <label for="exampleInputPassword1">
                                                <asp:Literal ID="Literal140" runat="server" Text="Difficulty"></asp:Literal>:</label>
                                            <asp:DropDownList runat="server" CssClass="form-control" ID="cbRRDif">
                                                <asp:ListItem Text="Amateur"></asp:ListItem>
                                                <asp:ListItem Text="Get Real"></asp:ListItem>
                                                <asp:ListItem Text="Novice"></asp:ListItem>
                                            </asp:DropDownList>
                                        </div>
                                        <div class="form-group">
                                            <label for="exampleInputPassword1">
                                                <asp:Literal ID="Literal141" runat="server" Text="Fuel Usage"></asp:Literal>:</label>
                                            <asp:DropDownList runat="server" CssClass="form-control" ID="cbRRFuel">
                                                <asp:ListItem Text="Off"></asp:ListItem>
                                                <asp:ListItem Text="Normal"></asp:ListItem>
                                                <asp:ListItem Text="2x"></asp:ListItem>
                                                <asp:ListItem Text="3x"></asp:ListItem>
                                                <asp:ListItem Text="4x"></asp:ListItem>
                                            </asp:DropDownList>
                                        </div>
                                        <div class="form-group">
                                            <label for="exampleInputPassword1">
                                                <asp:Literal ID="Literal142" runat="server" Text="Visual Damage"></asp:Literal>:</label>
                                            <asp:DropDownList runat="server" CssClass="form-control" ID="cbRRVisDam">
                                                <asp:ListItem Text="Off"></asp:ListItem>
                                                <asp:ListItem Text="Forgiving"></asp:ListItem>
                                                <asp:ListItem Text="Realistic"></asp:ListItem>
                                            </asp:DropDownList>
                                        </div>
                                        <div class="form-group">
                                            <label for="exampleInputPassword1">
                                                <asp:Literal ID="Literal143" runat="server" Text="Race Finish Duration"></asp:Literal>:</label>
                                            <asp:DropDownList runat="server" CssClass="form-control" ID="cbRRRaceFin">
                                                <asp:ListItem Text="30"></asp:ListItem>
                                                <asp:ListItem Text="45"></asp:ListItem>
                                                <asp:ListItem Text="60"></asp:ListItem>
                                                <asp:ListItem Text="100"></asp:ListItem>
                                                <asp:ListItem Text="120"></asp:ListItem>
                                                <asp:ListItem Text="240"></asp:ListItem>
                                                <asp:ListItem Text="360"></asp:ListItem>
                                                <asp:ListItem Text="480"></asp:ListItem>
                                                <asp:ListItem Text="600"></asp:ListItem>
                                            </asp:DropDownList>
                                        </div>

                                        <div class="form-group">
                                            <label for="exampleInputPassword1">
                                                <asp:Literal ID="Literal144" runat="server" Text="Cut Rules"></asp:Literal>:</label>
                                            <asp:DropDownList runat="server" CssClass="form-control" ID="cbRRCutRules">
                                                <asp:ListItem Text="Off"></asp:ListItem>
                                                <asp:ListItem Text="Slow-Down"></asp:ListItem>
                                                <asp:ListItem Text="Stop-Go"></asp:ListItem>
                                                <asp:ListItem Text="Drive-Through"></asp:ListItem>
                                            </asp:DropDownList>
                                        </div>
                                        <div class="form-group">
                                            <label for="exampleInputPassword1">
                                                <asp:Literal ID="Literal145" runat="server" Text="Wrecker Prevention"></asp:Literal>:</label>
                                            <asp:DropDownList runat="server" CssClass="form-control" ID="cbRRWrecker">
                                                <asp:ListItem Text="Off"></asp:ListItem>
                                                <asp:ListItem Text="On"></asp:ListItem>
                                            </asp:DropDownList>
                                        </div>
                                        <div class="form-group">
                                            <label for="exampleInputPassword1">
                                                <asp:Literal ID="Literal146" runat="server" Text="Non Ready Pitlane Start Delay"></asp:Literal>:</label>
                                            <asp:TextBox ID="tRRNonReady" CssClass="form-control" runat="server" Text="Off"></asp:TextBox>
                                        </div>
                                        <div class="form-group">
                                            <label for="exampleInputPassword1">
                                                <asp:Literal ID="Literal147" runat="server" Text="Allow Players Join In Qualifying"></asp:Literal>:</label>
                                            <asp:DropDownList runat="server" CssClass="form-control" ID="cbRRAllowQuali">
                                                <asp:ListItem Text="Off"></asp:ListItem>
                                                <asp:ListItem Text="On"></asp:ListItem>
                                            </asp:DropDownList>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </asp:Panel>

            <asp:Panel ID="panFR" runat="server" Visible="False">
                <div class="row">
                    <div class="col-xs-12">
                        <div class="box box-success">
                            <div class="box-header">
                                <h3 class="box-title">
                                    <asp:Literal ID="Literal127" runat="server" Text="Sesiones y duración" meta:resourcekey="Literal65Resource1"></asp:Literal></h3>
                                <p class="small>">No incluyas las plabras "minutos" y "segundos", se añadirán automáticamente</p>
                            </div>
                            <!-- /.box-header -->
                            <div class="box-body">
                                <div class="row">
                                    <div class="col-xs-4">
                                        <div class="form-group">
                                            <label for="exampleInputPassword1">
                                                <asp:Literal ID="Literal128" runat="server" Text="Hora Apertura sala + Briefing"></asp:Literal>:</label>
                                            <asp:TextBox CssClass="form-control" ID="tFR_Apertura" runat="server"></asp:TextBox>
                                        </div>
                                    </div>
                                    <div class="col-xs-4">
                                        <div class="form-group">
                                            <label for="exampleInputPassword1">
                                                <asp:Literal ID="Literal129" runat="server" Text="Hora clasificación"></asp:Literal>:</label>
                                            <asp:TextBox CssClass="form-control" ID="tFR_Quali" runat="server"></asp:TextBox>
                                        </div>
                                    </div>
                                    <div class="col-xs-4">
                                        <div class="form-group">
                                            <label for="exampleInputPassword1">
                                                <asp:Literal ID="Literal148" runat="server" Text="Vueltas clasificación"></asp:Literal>:</label>
                                            <asp:TextBox CssClass="form-control" ID="tFR_QualiVueltas" runat="server"></asp:TextBox>
                                        </div>
                                    </div>
                                    <div class="col-xs-4">
                                        <div class="form-group">
                                            <label for="exampleInputPassword1">
                                                <asp:Literal ID="Literal130" runat="server" Text="Duración calentamiento/retraso" meta:resourcekey="Literal68Resource1"></asp:Literal>:</label>
                                            <asp:TextBox CssClass="form-control" ID="tFR_Retraso" runat="server" meta:resourcekey="tPC_CALENTAMIENTOResource1"></asp:TextBox>
                                        </div>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-xs-2">
                                        <div class="form-group">
                                            <label for="exampleInputPassword1">
                                                <asp:Literal ID="Literal131" runat="server" Text="Hora Manga 1"></asp:Literal>:</label>
                                            <asp:TextBox CssClass="form-control" ID="tFR_Manga1" runat="server"></asp:TextBox>
                                        </div>
                                    </div>
                                    <div class="col-xs-2">
                                        <div class="form-group">
                                            <label for="exampleInputPassword1">
                                                <asp:Literal ID="Literal151" runat="server" Text="Escenario clima inicio M1"></asp:Literal>:</label>
                                            <asp:TextBox CssClass="form-control" ID="tFR_Clima1" runat="server"></asp:TextBox>
                                        </div>
                                    </div>
                                    <div class="col-xs-2">
                                        <div class="form-group">
                                            <label for="exampleInputPassword1">
                                                <asp:Literal ID="Literal164" runat="server" Text="Escenario clima media-carrera M1"></asp:Literal>:</label>
                                            <asp:TextBox CssClass="form-control" ID="tfrmid1" runat="server"></asp:TextBox>
                                        </div>
                                    </div>
                                    <div class="col-xs-2">
                                        <div class="form-group">
                                            <label for="exampleInputPassword1">
                                                <asp:Literal ID="Literal165" runat="server" Text="% clima media-carrera M1"></asp:Literal>:</label>
                                            <asp:TextBox CssClass="form-control" ID="tfrporcmid1" runat="server"></asp:TextBox>
                                        </div>
                                    </div>
                                    <div class="col-xs-2">
                                        <div class="form-group">
                                            <label for="exampleInputPassword1">
                                                <asp:Literal ID="Literal166" runat="server" Text="Escenario clima fin-carrera M1"></asp:Literal>:</label>
                                            <asp:TextBox CssClass="form-control" ID="tfrend1" runat="server"></asp:TextBox>
                                        </div>
                                    </div>
                                    <div class="col-xs-2">
                                        <div class="form-group">
                                            <label for="exampleInputPassword1">
                                                <asp:Literal ID="Literal167" runat="server" Text="% clima fin-carrera M1"></asp:Literal>:</label>
                                            <asp:TextBox CssClass="form-control" ID="tfrporcend1" runat="server"></asp:TextBox>
                                        </div>
                                    </div>
                                </div>

                                <div class="row">
                                    <div class="col-xs-2">
                                        <div class="form-group">
                                            <label for="exampleInputPassword1">
                                                <asp:Literal ID="Literal132" runat="server" Text="Hora Manga 2"></asp:Literal>:</label>
                                            <asp:TextBox CssClass="form-control" ID="tFR_Manga2" runat="server"></asp:TextBox>
                                        </div>
                                    </div>
                                    <div class="col-xs-2">
                                        <div class="form-group">
                                            <label for="exampleInputPassword1">
                                                <asp:Literal ID="Literal152" runat="server" Text="Escenario clima inicio M2"></asp:Literal>:</label>
                                            <asp:TextBox CssClass="form-control" ID="tFR_Clima2" runat="server"></asp:TextBox>
                                        </div>
                                    </div>
                                    <div class="col-xs-2">
                                        <div class="form-group">
                                            <label for="exampleInputPassword1">
                                                <asp:Literal ID="Literal168" runat="server" Text="Escenario clima media-carrera M2"></asp:Literal>:</label>
                                            <asp:TextBox CssClass="form-control" ID="tfrmid2" runat="server"></asp:TextBox>
                                        </div>
                                    </div>
                                    <div class="col-xs-2">
                                        <div class="form-group">
                                            <label for="exampleInputPassword1">
                                                <asp:Literal ID="Literal169" runat="server" Text="% clima media-carrera M2"></asp:Literal>:</label>
                                            <asp:TextBox CssClass="form-control" ID="tfrporcmid2" runat="server"></asp:TextBox>
                                        </div>
                                    </div>
                                    <div class="col-xs-2">
                                        <div class="form-group">
                                            <label for="exampleInputPassword1">
                                                <asp:Literal ID="Literal170" runat="server" Text="Escenario clima fin-carrera M2"></asp:Literal>:</label>
                                            <asp:TextBox CssClass="form-control" ID="tfrend2" runat="server"></asp:TextBox>
                                        </div>
                                    </div>
                                    <div class="col-xs-2">
                                        <div class="form-group">
                                            <label for="exampleInputPassword1">
                                                <asp:Literal ID="Literal171" runat="server" Text="Prob. clima fin-carrera M2"></asp:Literal>:</label>
                                            <asp:TextBox CssClass="form-control" ID="tfrporcend2" runat="server"></asp:TextBox>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="row">
                    <div class="col-xs-12">
                        <div class="box box-success">
                            <div class="box-header">
                                <h3 class="box-title">
                                    <asp:Literal ID="Literal149" runat="server" meta:resourcekey="Literal38Resource1" Text="Configuración de Sala"></asp:Literal></h3>
                            </div>
                            <div class="box-body">
                                <div class="row">
                                    <div class="col-xs-3">
                                        <div class="form-group">
                                            <label for="exampleInputPassword1">
                                                <asp:Literal ID="Literal150" runat="server" Text="Tuneo"></asp:Literal>:</label>
                                            <asp:TextBox CssClass="form-control" ID="tFR_Tuneo" runat="server"></asp:TextBox>
                                        </div>
                                    </div>
                                    <div class="col-xs-3">
                                        <div class="form-group">
                                            <label for="exampleInputPassword1">
                                                <asp:Literal ID="Literal153" runat="server" Text="Piezas"></asp:Literal>:</label>
                                            <asp:TextBox CssClass="form-control" ID="tFR_Piezas" runat="server"></asp:TextBox>
                                        </div>
                                    </div>
                                    <div class="col-xs-3">
                                        <div class="form-group">
                                            <label for="exampleInputPassword1">
                                                <asp:Literal ID="Literal154" runat="server" Text="Daños"></asp:Literal>:</label>
                                            <asp:TextBox CssClass="form-control" ID="tFR_Daños" runat="server"></asp:TextBox>
                                        </div>
                                    </div>
                                    <div class="col-xs-3">
                                        <div class="form-group">
                                            <label for="exampleInputPassword1">
                                                <asp:Literal ID="Literal155" runat="server" Text="Ayudas"></asp:Literal>:</label>
                                            <asp:TextBox CssClass="form-control" ID="tFR_Ayudas" runat="server"></asp:TextBox>
                                        </div>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-xs-3">
                                        <div class="form-group">
                                            <label for="exampleInputPassword1">
                                                <asp:Literal ID="Literal156" runat="server" Text="Embrague"></asp:Literal>:</label>
                                            <asp:TextBox CssClass="form-control" ID="tFR_Embrague" runat="server"></asp:TextBox>
                                        </div>
                                    </div>
                                    <div class="col-xs-3">
                                        <div class="form-group">
                                            <label for="exampleInputPassword1">
                                                <asp:Literal ID="Literal157" runat="server" Text="Vista"></asp:Literal>:</label>
                                            <asp:TextBox CssClass="form-control" ID="tFR_Vista" runat="server"></asp:TextBox>
                                        </div>
                                    </div>
                                    <div class="col-xs-3">
                                        <div class="form-group">
                                            <label for="exampleInputPassword1">
                                                <asp:Literal ID="Literal158" runat="server" Text="Paradas Rápidas"></asp:Literal>:</label>
                                            <asp:TextBox CssClass="form-control" ID="tFR_Pitstops" runat="server"></asp:TextBox>
                                        </div>
                                    </div>
                                    <div class="col-xs-3">
                                        <div class="form-group">
                                            <label for="exampleInputPassword1">
                                                <asp:Literal ID="Literal159" runat="server" Text="Colision"></asp:Literal>:</label>
                                            <asp:TextBox CssClass="form-control" ID="tFR_Colision" runat="server"></asp:TextBox>
                                        </div>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-xs-3">
                                        <div class="form-group">
                                            <label for="exampleInputPassword1">
                                                <asp:Literal ID="Literal160" runat="server" Text="Tipo Salida"></asp:Literal>:</label>
                                            <asp:TextBox CssClass="form-control" ID="tFR_Salida" runat="server"></asp:TextBox>
                                        </div>
                                    </div>
                                    <div class="col-xs-3">
                                        <div class="form-group">
                                            <label for="exampleInputPassword1">
                                                <asp:Literal ID="Literal161" runat="server" Text="Tracción"></asp:Literal>:</label>
                                            <asp:TextBox CssClass="form-control" ID="tFR_Traccion" runat="server"></asp:TextBox>
                                        </div>
                                    </div>
                                    <div class="col-xs-3">
                                        <div class="form-group">
                                            <label for="exampleInputPassword1">
                                                <asp:Literal ID="Literal162" runat="server" Text="% Handicap"></asp:Literal>:</label>
                                            <asp:TextBox CssClass="form-control" ID="tFR_Handicap" runat="server"></asp:TextBox>
                                        </div>
                                    </div>
                                    <div class="col-xs-3">
                                        <div class="form-group">
                                            <label for="exampleInputPassword1">
                                                <asp:Literal ID="Literal163" runat="server" Text="% Agarre"></asp:Literal>:</label>
                                            <asp:TextBox CssClass="form-control" ID="tFR_Agarre" runat="server"></asp:TextBox>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </asp:Panel>
            <asp:Panel ID="panGTS" runat="server" Visible="False">
                <div class="row">
                    <div class="col-xs-12">
                        <div class="box box-success">
                            <div class="box-header">
                                <h3 class="box-title">
                                    <asp:Literal ID="Literal172" runat="server" Text="Ajustes de Carrera"></asp:Literal></h3>
                            </div>
                            <!-- /.box-header -->
                            <div class="box-body">
                                <div class="row">
                                    <div class="col-xs-4">
                                        <div class="form-group">
                                            <label for="exampleInputPassword1">
                                                <asp:Literal ID="Literal210" runat="server" meta:resourcekey="Literal50Resource1" Text="Clima"></asp:Literal>:</label>
                                            <asp:TextBox ID="tGT_CLIMA" CssClass="form-control" runat="server" meta:resourcekey="tIRClimaResource1"></asp:TextBox>
                                        </div>
                                    </div>
                                    <div class="col-xs-4">
                                        <div class="form-group">
                                            <label for="exampleInputPassword1">
                                                <asp:Literal ID="Literal209" runat="server" Text="Modo de Sala"></asp:Literal>:</label>
                                            <asp:TextBox CssClass="form-control" ID="tGT_MODO_SALA" runat="server"></asp:TextBox>
                                        </div>
                                    </div>
                                    <div class="col-xs-4">
                                        <div class="form-group">
                                            <label for="exampleInputPassword1">
                                                <asp:Literal ID="Literal173" runat="server" Text="Tipo de Salida"></asp:Literal>:</label>
                                            <asp:TextBox CssClass="form-control" ID="tGT_TIPO_SALIDA" runat="server"></asp:TextBox>
                                        </div>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-xs-4">
                                        <div class="form-group">
                                            <label for="exampleInputPassword1">
                                                <asp:Literal ID="Literal174" runat="server" Text="Parrilla de Salida"></asp:Literal>:</label>
                                            <asp:TextBox CssClass="form-control" ID="tGT_PARRILLA" runat="server"></asp:TextBox>
                                        </div>
                                    </div>
                                    <div class="col-xs-4">
                                        <div class="form-group">
                                            <label for="exampleInputPassword1">
                                                <asp:Literal ID="Literal175" runat="server" Text="Impulso"></asp:Literal>:</label>
                                            <asp:TextBox CssClass="form-control" ID="tGT_IMPULSO" runat="server"></asp:TextBox>
                                        </div>
                                    </div>
                                    <div class="col-xs-4">
                                        <div class="form-group">
                                            <label for="exampleInputPassword1">
                                                <asp:Literal ID="Literal176" runat="server" Text="Fuerza del Rebufo"></asp:Literal>:</label>
                                            <asp:TextBox CssClass="form-control" ID="tGT_REBUFO" runat="server"></asp:TextBox>
                                        </div>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-xs-3">
                                        <div class="form-group">
                                            <label for="exampleInputPassword1">
                                                <asp:Literal ID="Literal177" runat="server" Text="Daños Visibles"></asp:Literal>:</label>
                                            <asp:TextBox CssClass="form-control" ID="tGT_DANOS" runat="server"></asp:TextBox>
                                        </div>
                                    </div>
                                    <div class="col-xs-3">
                                        <div class="form-group">
                                            <label for="exampleInputPassword1">
                                                <asp:Literal ID="Literal178" runat="server" Text="Daños Mecánicos"></asp:Literal>:</label>
                                            <asp:TextBox CssClass="form-control" ID="tGT_DANOS_MEC" runat="server"></asp:TextBox>
                                        </div>
                                    </div>
                                    <div class="col-xs-3">
                                        <div class="form-group">
                                            <label for="exampleInputPassword1">
                                                <asp:Literal ID="Literal179" runat="server" Text="Desgaste Neumáticos"></asp:Literal>:</label>
                                            <asp:TextBox CssClass="form-control" ID="tGT_NEUMATICOS" runat="server"></asp:TextBox>
                                        </div>
                                    </div>
                                    <div class="col-xs-3">
                                        <div class="form-group">
                                            <label for="exampleInputPassword1">
                                                <asp:Literal ID="Literal180" runat="server" Text="Gasto de Combustible"></asp:Literal>:</label>
                                            <asp:TextBox CssClass="form-control" ID="tGT_COMBUSTIBLE" runat="server"></asp:TextBox>
                                        </div>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-xs-4">
                                        <div class="form-group">
                                            <label for="exampleInputPassword1">
                                                <asp:Literal ID="Literal181" runat="server" Text="Combustible Inicial"></asp:Literal>:</label>
                                            <asp:TextBox CssClass="form-control" ID="tGT_COMB_INICIAL" runat="server"></asp:TextBox>
                                        </div>
                                    </div>
                                    <div class="col-xs-4">
                                        <div class="form-group">
                                            <label for="exampleInputPassword1">
                                                <asp:Literal ID="Literal182" runat="server" Text="Agarre reduc. en mojado y bordes"></asp:Literal>:</label>
                                            <asp:TextBox CssClass="form-control" ID="tGT_AGARRE" runat="server"></asp:TextBox>
                                        </div>
                                    </div>
                                    <div class="col-xs-4">
                                        <div class="form-group">
                                            <label for="exampleInputPassword1">
                                                <asp:Literal ID="Literal183" runat="server" Text="Tiempo fin de carrera"></asp:Literal>:</label>
                                            <asp:TextBox CssClass="form-control" ID="tGT_TIEMPOFIN" runat="server" Text="180"></asp:TextBox>
                                        </div>
                                    </div>
                                    <div class="col-xs-4">
                                        &nbsp;
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="row">
                    <div class="col-xs-12">
                        <div class="box box-success">
                            <div class="box-header">
                                <h3 class="box-title">
                                    <asp:Literal ID="Literal184" runat="server" Text="Configuración de Normativa"></asp:Literal></h3>
                            </div>
                            <!-- /.box-header -->
                            <div class="box-body">
                                <div class="row">
                                    <div class="col-xs-2">
                                        <div class="form-group">
                                            <label for="exampleInputPassword1">
                                                <asp:Literal ID="Literal185" runat="server" Text="Equilibrio de Rendimiento"></asp:Literal>:</label>
                                            <asp:TextBox CssClass="form-control" ID="tGT_RENDIMIENTO" runat="server"></asp:TextBox>
                                        </div>
                                    </div>
                                    <div class="col-xs-2">
                                        <div class="form-group">
                                            <label for="exampleInputPassword1">
                                                <asp:Literal ID="Literal186" runat="server" Text="Limite de Potencia"></asp:Literal>:</label>
                                            <asp:TextBox CssClass="form-control" ID="tGT_LIMITE_POT" runat="server"></asp:TextBox>
                                        </div>
                                    </div>
                                    <div class="col-xs-2">
                                        <div class="form-group">
                                            <label for="exampleInputPassword1">
                                                <asp:Literal ID="Literal187" runat="server" Text="Peso"></asp:Literal>:</label>
                                            <asp:TextBox CssClass="form-control" ID="tGT_PESO" runat="server"></asp:TextBox>
                                        </div>
                                    </div>
                                    <div class="col-xs-3">
                                        <div class="form-group">
                                            <label for="exampleInputPassword1">
                                                <asp:Literal ID="Literal188" runat="server" Text="Clasif. Neum. Máx."></asp:Literal>:</label>
                                            <asp:TextBox CssClass="form-control" ID="tGT_CLAS_NEUM_MAX" runat="server"></asp:TextBox>
                                        </div>
                                    </div>
                                    <div class="col-xs-3">
                                        <div class="form-group">
                                            <label for="exampleInputPassword1">
                                                <asp:Literal ID="Literal196" runat="server" Text="Clasif. Neum. Mín."></asp:Literal>:</label>
                                            <asp:TextBox CssClass="form-control" ID="tGT_CLAS_NEUM_MIN" runat="server"></asp:TextBox>
                                        </div>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-xs-4">
                                        <div class="form-group">
                                            <label for="exampleInputPassword1">
                                                <asp:Literal ID="Literal189" runat="server" Text="Restricciones Diseño"></asp:Literal>:</label>
                                            <asp:TextBox CssClass="form-control" ID="tGT_DISENOS" runat="server"></asp:TextBox>
                                        </div>
                                    </div>
                                    <div class="col-xs-4">
                                        <div class="form-group">
                                            <label for="exampleInputPassword1">
                                                <asp:Literal ID="Literal190" runat="server" Text="Tipo Núm. Coche"></asp:Literal>:</label>
                                            <asp:TextBox CssClass="form-control" ID="tGT_TIPO_NUM_COCHE" runat="server"></asp:TextBox>
                                        </div>
                                    </div>
                                    <div class="col-xs-4">
                                        <div class="form-group">
                                            <label for="exampleInputPassword1">
                                                <asp:Literal ID="Literal191" runat="server" Text="Configuración"></asp:Literal>:</label>
                                            <asp:TextBox CssClass="form-control" ID="tGT_CONFIG" runat="server"></asp:TextBox>
                                        </div>
                                    </div>
                                    <div class="col-xs-4">
                                        <div class="form-group">
                                            <label for="exampleInputPassword1">
                                                <asp:Literal ID="Literal192" runat="server" Text="Kart"></asp:Literal>:</label>
                                            <asp:TextBox CssClass="form-control" ID="tGT_KART" runat="server"></asp:TextBox>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="row">
                    <div class="col-xs-12">
                        <div class="box box-success">
                            <div class="box-header">
                                <h3 class="box-title">
                                    <asp:Literal ID="Literal193" runat="server" Text="Penalizaciones y Opciones de Conducción"></asp:Literal></h3>
                            </div>
                            <!-- /.box-header -->
                            <div class="box-body">
                                <div class="row">
                                    <div class="col-xs-3">
                                        <div class="form-group">
                                            <label for="exampleInputPassword1">
                                                <asp:Literal ID="Literal194" runat="server" Text="Fantasmas en carrera"></asp:Literal>:</label>
                                            <asp:TextBox CssClass="form-control" ID="tGT_FANTASMAS" runat="server"></asp:TextBox>
                                        </div>
                                    </div>
                                     <div class="col-xs-3">
                                        <div class="form-group">
                                            <label for="exampleInputPassword1">
                                                <asp:Literal ID="Literal211" runat="server" Text="Fantasmas doblados"></asp:Literal>:</label>
                                            <asp:TextBox CssClass="form-control" ID="tGT_FANTASMAS_DOBLADOS" runat="server"></asp:TextBox>
                                        </div>
                                    </div>
                                    <div class="col-xs-3">
                                        <div class="form-group">
                                            <label for="exampleInputPassword1">
                                                <asp:Literal ID="Literal197" runat="server" Text="Penalización por choque muro"></asp:Literal>:</label>
                                            <asp:TextBox CssClass="form-control" ID="tGT_MURO" runat="server"></asp:TextBox>
                                        </div>
                                    </div>
                                    <div class="col-xs-3">
                                        <div class="form-group">
                                            <label for="exampleInputPassword1">
                                                <asp:Literal ID="Literal198" runat="server" Text="Detección choque muro"></asp:Literal>:</label>
                                            <asp:TextBox CssClass="form-control" ID="tGT_DETEC_MURO" runat="server"></asp:TextBox>
                                        </div>
                                    </div>
                                </div>
                                <div class="row">
                                     <div class="col-xs-3">
                                        <div class="form-group">
                                            <label for="exampleInputPassword1">
                                                <asp:Literal ID="Literal195" runat="server" Text="Penalización por Atajo"></asp:Literal>:</label>
                                            <asp:TextBox CssClass="form-control" ID="tGT_ATAJO" runat="server"></asp:TextBox>
                                        </div>
                                    </div>
                                    <div class="col-xs-3">
                                        <div class="form-group">
                                            <label for="exampleInputPassword1">
                                                <asp:Literal ID="Literal200" runat="server" Text="Penalización contacto lateral"></asp:Literal>:</label>
                                            <asp:TextBox CssClass="form-control" ID="tGT_LATERAL" runat="server"></asp:TextBox>
                                        </div>
                                    </div>
                                    <div class="col-xs-3">
                                        <div class="form-group">
                                            <label for="exampleInputPassword1">
                                                <asp:Literal ID="Literal201" runat="server" Text="Corregir trayectoria tras choque muro"></asp:Literal>:</label>
                                            <asp:TextBox CssClass="form-control" ID="tGT_TRAYECTORIA" runat="server"></asp:TextBox>
                                        </div>
                                    </div>
                                    <div class="col-xs-3">
                                        <div class="form-group">
                                            <label for="exampleInputPassword1">
                                                <asp:Literal ID="Literal202" runat="server" Text="Reposicionar coche abandonar circuito"></asp:Literal>:</label>
                                            <asp:TextBox CssClass="form-control" ID="tGT_REPOSICIONAR" runat="server"></asp:TextBox>
                                        </div>
                                    </div>
                                   
                                </div>
                                <div class="row">
                                     <div class="col-xs-3">
                                        <div class="form-group">
                                            <label for="exampleInputPassword1">
                                                <asp:Literal ID="Literal203" runat="server" Text="Reglas de banderas"></asp:Literal>:</label>
                                            <asp:TextBox CssClass="form-control" ID="tGT_BANDERAS" runat="server"></asp:TextBox>
                                        </div>
                                    </div>
                                    <div class="col-xs-3">
                                        <div class="form-group">
                                            <label for="exampleInputPassword1">
                                                <asp:Literal ID="Literal199" runat="server" Text="Ayuda al contravolantear"></asp:Literal>:</label>
                                            <asp:TextBox CssClass="form-control" ID="tGT_CONTRAVOLANTE" runat="server"></asp:TextBox>
                                        </div>
                                    </div>
                                    <div class="col-xs-3">
                                        <div class="form-group">
                                            <label for="exampleInputPassword1">
                                                <asp:Literal ID="Literal204" runat="server" Text="Gestión de Estabilidad (ASM)"></asp:Literal>:</label>
                                            <asp:TextBox CssClass="form-control" ID="tGT_ASM" runat="server"></asp:TextBox>
                                        </div>
                                    </div>
                                    <div class="col-xs-3">
                                        <div class="form-group">
                                            <label for="exampleInputPassword1">
                                                <asp:Literal ID="Literal205" runat="server" Text="Asistencia ajuste trazada"></asp:Literal>:</label>
                                            <asp:TextBox CssClass="form-control" ID="tGT_TRAZADA" runat="server"></asp:TextBox>
                                        </div>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-xs-4">
                                        <div class="form-group">
                                            <label for="exampleInputPassword1">
                                                <asp:Literal ID="Literal206" runat="server" Text="Control de Tracción"></asp:Literal>:</label>
                                            <asp:TextBox CssClass="form-control" ID="tGT_TCS" runat="server"></asp:TextBox>
                                        </div>
                                    </div>
                                    <div class="col-xs-4">
                                        <div class="form-group">
                                            <label for="exampleInputPassword1">
                                                <asp:Literal ID="Literal207" runat="server" Text="ABS"></asp:Literal>:</label>
                                            <asp:TextBox CssClass="form-control" ID="tGT_ABS" runat="server"></asp:TextBox>
                                        </div>
                                    </div>
                                    <div class="col-xs-4">
                                        <div class="form-group">
                                            <label for="exampleInputPassword1">
                                                <asp:Literal ID="Literal208" runat="server" Text="Piloto Automático"></asp:Literal>:</label>
                                            <asp:TextBox CssClass="form-control" ID="tGT_PILOT_AIT" runat="server"></asp:TextBox>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </asp:Panel>
            <div class="row">
                <div class="col-xs-12">
                    <div class="box box-success">
                        <div class="box-header">
                            <h3 class="box-title">
                                <asp:Literal ID="Literal54" runat="server" Text="Selección de coches" meta:resourcekey="Literal54Resource1"></asp:Literal></h3>
                        </div>
                        <!-- /.box-header -->
                        <div class="box-body">
                            <div class="row">
                                <div class="col-xs-12">
                                    <div class="form-group">
                                        <div>
                                            <asp:CheckBoxList ID="chListCoches" runat="server" meta:resourcekey="chListCochesResource1" RepeatColumns="4" CellPadding="10"></asp:CheckBoxList>
                                            <asp:Label ID="lblcoches" runat="server" Visible="False" CssClass="label label-warning" Text="La lista de coches no puede modificarse ya que existen inscritos" meta:resourcekey="lblcochesResource1"></asp:Label>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-xs-12">
                                    <asp:Button ID="bGuardar" CssClass="btn btn-info" runat="server" Text="Guardar Carrera" OnClick="bGuardar_Click" meta:resourcekey="bGuardarResource1" />
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </asp:Panel>

    </section>
</asp:Content>
