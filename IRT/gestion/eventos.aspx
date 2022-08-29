<%@ Page Title="" Language="C#" MasterPageFile="~/gestion/irtadmin.Master" AutoEventWireup="true" CodeBehind="eventos.aspx.cs" Inherits="IRT.gestion.eventos" meta:resourcekey="PageResource1" ValidateRequest="false" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <section class="content-header">
        <h1>
            <asp:Literal ID="Literal1" runat="server" meta:resourcekey="Literal1Resource1" Text="Gestión de Campeonatos"></asp:Literal>
            <small>
                <asp:Literal ID="Literal2" runat="server" meta:resourcekey="Literal2Resource1" Text="Añadir o editar datos generales del evento"></asp:Literal></small>
        </h1>
        <asp:Label CssClass="alert alert-danger" ID="lblmesg" runat="server" Visible="False" meta:resourcekey="lblmesgResource1"></asp:Label>
        <ol class="breadcrumb">
            <li class="active">
                <!-- Button trigger modal -->
                <button type="button" class="btn btn-danger btn-xs" data-toggle="modal" data-target="#myModal">
                    <i class="fa fa-question-circle"></i>
                    <asp:Literal ID="Literal3" runat="server" meta:resourcekey="Literal3Resource1" Text="Ayuda"></asp:Literal>
                </button>
            </li>
        </ol>

        <!-- Modal -->
        <div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
            <div class="modal-dialog modal-lg" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                        <h4 class="modal-title" id="myModalLabel">
                            <asp:Literal ID="Literal4" runat="server" meta:resourcekey="Literal4Resource1" Text="Eventos"></asp:Literal></h4>
                    </div>
                    <div class="modal-body">
                        <asp:Literal ID="Literal5" runat="server" meta:resourcekey="Literal5Resource1" Text=" &lt;p&gt;Esta es la pantalla en la que se indica la información general de tu campeonato&lt;/p&gt;
                        &lt;ul&gt;
                            &lt;li&gt;&lt;b&gt;Datos generales:&lt;/b&gt; Indica la información general del campeonato, la tabla de puntos que se va a usar para los resultados, si va a ser por pilotos / por equipos / o ambos,  el tipo de setup a usar y el color base de la plantilla de la web personalizada de tu campeonato (usa uno que case con el cartel)&lt;/li&gt;
                            &lt;li&gt;&lt;b&gt;Datos de la inscripción:&lt;/b&gt;Indica las fechas de inicio y fin (serán las que hagan aparecer de forma automática el campeonato en la web pública), la plataforma/simulador, el cartel, etc.&lt;/li&gt;
                            &lt;li&gt;&lt;b&gt;Patrocinadores:&lt;/b&gt;Aquí seleccionas los patrocinadores que aplican a este campeonato. Primero debes de haberlos dado de alta en la opción del menú &quot;Mis Patrocinadores&quot;&lt;/li&gt;
                        &lt;/ul&gt;
                        "></asp:Literal>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-default" data-dismiss="modal">
                            <asp:Literal ID="Literal6" runat="server" meta:resourcekey="Literal6Resource1" Text="Cerrar"></asp:Literal></button>
                    </div>
                </div>
            </div>
        </div>

        <!-- Modal -->
        <%--<div class="modal fade" id="myModalTabla" tabindex="-1" role="dialog" aria-labelledby="myModalLabel2">
            <div class="modal-dialog modal-lg" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                        <h4 class="modal-title" id="myModalLabel2">
                            <asp:Literal ID="Literal31" runat="server" Text="Tablas de puntos disponibles" meta:resourcekey="Literal31Resource1"></asp:Literal></h4>
                    </div>
                    <div class="modal-body">
                        <img src="../Content/img/web/tablas.jpg" />
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-default" data-dismiss="modal">
                            <asp:Literal ID="Literal33" runat="server" meta:resourcekey="Literal6Resource1" Text="Cerrar"></asp:Literal></button>
                    </div>
                </div>
            </div>
        </div>--%>
    </section>
    <section class="content">
        <div class="row">
            <div class="col-xs-12">
                <div class="box">
                    <div class="box-header">
                        <h3 class="box-title">
                            <asp:Literal ID="Literal7" runat="server" meta:resourcekey="Literal7Resource1" Text="Datos generales"></asp:Literal></h3>
                    </div>
                    <!-- /.box-header -->
                    <div class="box-body">
                        <div class="row">
                            <div class="col-xs-12">
                                <div class="form-group">
                                    <label for="exampleInputEmail1">
                                        <asp:Literal ID="Literal8" runat="server" meta:resourcekey="Literal8Resource1" Text="Nombre del evento"></asp:Literal>:</label><asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="tEvento" CssClass="label label-danger" ErrorMessage="Campo requerido" meta:resourcekey="RequiredFieldValidator1Resource1"></asp:RequiredFieldValidator>
                                    <asp:TextBox ID="tEvento" CssClass="form-control" runat="server" meta:resourcekey="tEventoResource1"></asp:TextBox>
                                    <p class="help-block">
                                        <asp:Literal ID="Literal9" runat="server" meta:resourcekey="Literal9Resource1" Text="Este es el nombre que aparecera en el portal de eventos"></asp:Literal>
                                    </p>

                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-xs-12">
                                <div class="form-group">
                                    <label for="exampleInputEmail1">
                                        <asp:Literal ID="Literal10" runat="server" meta:resourcekey="Literal10Resource1" Text="Información del evento"></asp:Literal>:</label>
                                    <asp:TextBox ID="tDescripcion" CssClass="form-control" runat="server" TextMode="MultiLine" meta:resourcekey="tDescripcionResource1"></asp:TextBox>
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-md-2 col-xs-12">
                                <div class="form-group">
                                    <label for="exampleInputEmail1">
                                        <asp:Literal ID="Literal11" runat="server" meta:resourcekey="Literal11Resource1" Text="Formato de resultados del evento"></asp:Literal>:</label>
                                    <asp:DropDownList runat="server" CssClass="form-control" ID="cbTipos" meta:resourcekey="cbTiposResource1">
                                        <asp:ListItem meta:resourcekey="ListItemResource1">Puntuan solo los pilotos</asp:ListItem>
                                        <asp:ListItem meta:resourcekey="ListItemResource2">Puntuan pilotos y equipos</asp:ListItem>
                                        <asp:ListItem meta:resourcekey="ListItemResource3">Puntuan solo equipos</asp:ListItem>
                                        <asp:ListItem>Puntuan pilotos y comunidades</asp:ListItem>
                                        <asp:ListItem>Puntuan solo comunidades</asp:ListItem>
                                    </asp:DropDownList>
                                </div>
                            </div>
                            <div class="col-md-2 col-xs-12">
                                <div class="form-group">
                                    <label for="exampleInputEmail1">
                                        <asp:Literal ID="Literal12" runat="server" meta:resourcekey="Literal12Resource1" Text="Sistema de puntuación"></asp:Literal>:</label>
                                    <a href="tablas.aspx" target="_blank" class="btn btn-danger btn-xs"><i class="fa fa-question-circle"></i></a>
                                    <a href="custom_tablas.aspx" target="_blank" class="btn btn-success btn-xs"><i class="fa fa-table"></i>Crear</a>
                                    <%--<button type="button" class="btn btn-danger btn-xs" data-toggle="modal" data-target="#myModalTabla">
                                        <i class="fa fa-question-circle"></i>
                                    </button>--%>
                                    <asp:DropDownList runat="server" ID="cbTablaPuntos" CssClass="form-control"  meta:resourcekey="cbTablaPuntosResource1"></asp:DropDownList> <%-- DataSourceID="objTablas" DataTextField="TABLA" DataValueField="Id" %>
                                    
                                    <%--<asp:ObjectDataSource ID="objTablas" runat="server" OldValuesParameterFormatString="original_{0}" SelectMethod="GetData" TypeName="DL.AuxliaresDSTableAdapters.TABLASTableAdapter"></asp:ObjectDataSource>--%>
                                </div>
                            </div>
                            <div class="col-md-2 col-xs-12">
                                <div class="form-group">
                                    <label for="exampleInputEmail1">
                                        <asp:Literal ID="Literal29" runat="server" Text="Dia de la semana:" meta:resourcekey="Literal29Resource1"></asp:Literal></label>
                                    <asp:DropDownList runat="server" CssClass="form-control" ID="cbDia" meta:resourcekey="cbDiaResource1">
                                        <asp:ListItem meta:resourcekey="ListItemResource12">Lunes</asp:ListItem>
                                        <asp:ListItem meta:resourcekey="ListItemResource13">Martes</asp:ListItem>
                                        <asp:ListItem meta:resourcekey="ListItemResource14">Miércoles</asp:ListItem>
                                        <asp:ListItem meta:resourcekey="ListItemResource15">Jueves</asp:ListItem>
                                        <asp:ListItem meta:resourcekey="ListItemResource16">Viernes</asp:ListItem>
                                        <asp:ListItem meta:resourcekey="ListItemResource17">Sabado</asp:ListItem>
                                        <asp:ListItem meta:resourcekey="ListItemResource18">Domingo</asp:ListItem>
                                    </asp:DropDownList>
                                </div>
                            </div>
                            <div class="col-md-2 col-xs-12">
                                <div class="form-group">
                                    <label for="exampleInputEmail1">
                                        <asp:Literal ID="Literal30" runat="server" Text="Hora carreras" meta:resourcekey="Literal30Resource1"></asp:Literal>(24h):</label>
                                    <asp:TextBox ID="tHora" CssClass="form-control" runat="server" meta:resourcekey="tHoraResource1"></asp:TextBox>
                                    
                                </div>
                            </div>
                            <div class="col-md-2 col-xs-12">
                                <div class="form-group">
                                    <label for="exampleInputEmail1">
                                        <asp:Literal ID="Literal33" runat="server" meta:resourcekey="dorsal" Text="Solicitar dorsal en la inscripción" ></asp:Literal>:</label>
                                    <asp:CheckBox ID="chDorsal" CssClass="form-control" runat="server" Checked="false" />
                                    
                                </div>
                            </div>
                             <div class="col-md-2 col-xs-12">
                                <div class="form-group">
                                    <label for="exampleInputEmail1">
                                        <asp:Literal ID="Literal39" runat="server" meta:resourcekey="skin" Text="Solicitar skin en la inscripción" ></asp:Literal>:</label>
                                    <asp:CheckBox ID="chSKin" CssClass="form-control" runat="server" Checked="false" />
                                    
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            
                             <div class="col-xs-3">
                                <div class="form-group">
                                    <label for="exampleInputEmail1">
                                        <asp:Literal ID="Literal38" runat="server" Text="Zona Horaria" ></asp:Literal>:</label>
                                        <asp:DropDownList ID="cbZonaHoraria" CssClass="form-control" runat="server" OnInit="cbZonaHoraria_Init"></asp:DropDownList>
                                </div>
                            </div>
                            <div class="col-xs-2">
                                <div class="form-group">
                                    <label for="exampleInputEmail1">
                                        <asp:Literal ID="Literal18" runat="server" Text="Dos mangas" meta:resourcekey="Literal18Resource2"></asp:Literal>:</label>
                                    <asp:DropDownList runat="server" CssClass="form-control" ID="tMangas" meta:resourcekey="tMangasResource1">
                                        <asp:ListItem meta:resourcekey="ListItemResource19">No</asp:ListItem>
                                        <asp:ListItem meta:resourcekey="ListItemResource20">Si</asp:ListItem>
                                    </asp:DropDownList>
                                </div>
                            </div>
                            <div class="col-xs-2">
                                <div class="form-group">
                                    <label for="exampleInputEmail1">
                                        <asp:Literal ID="Literal13" runat="server" meta:resourcekey="Literal13Resource1" Text="Tipo de Setup"></asp:Literal>:</label>
                                    <asp:DropDownList runat="server" CssClass="form-control" ID="cbSetup" meta:resourcekey="cbSetupResource1">
                                        <asp:ListItem meta:resourcekey="ListItemResource4">Fixed</asp:ListItem>
                                        <asp:ListItem meta:resourcekey="ListItemResource5">Open</asp:ListItem>
                                    </asp:DropDownList>
                                </div>
                            </div>
                            <div class="col-xs-2">
                                <div class="form-group">
                                    <label for="exampleInputEmail1">
                                        <asp:Literal ID="Literal14" runat="server" meta:resourcekey="Literal14Resource1" Text="Color de la plantilla"></asp:Literal>:</label>
                                    <asp:DropDownList runat="server" CssClass="form-control" ID="cbColor" meta:resourcekey="cbColorResource1">
                                        <asp:ListItem Value="yellow.css" meta:resourcekey="ListItemResource6">Amarillo</asp:ListItem>
                                        <asp:ListItem Value="blue.css" meta:resourcekey="ListItemResource7">Azul</asp:ListItem>
                                        <asp:ListItem Value="purple.css" meta:resourcekey="ListItemResource8">Morado</asp:ListItem>
                                        <asp:ListItem Value="red.css" meta:resourcekey="ListItemResource9">Rojo</asp:ListItem>
                                        <asp:ListItem Value="default.css" meta:resourcekey="ListItemResource10">Rosa</asp:ListItem>
                                        <asp:ListItem Value="green.css" meta:resourcekey="ListItemResource11">Verde</asp:ListItem>
                                    </asp:DropDownList>
                                </div>
                            </div>
                              <div class="col-xs-3">
                                <div class="form-group">
                                    <label for="exampleInputPassword1">
                                        <asp:Literal ID="Literal31" runat="server" Text="URL Intro Video"></asp:Literal>:</label>
                                    <asp:TextBox ID="tVideo" CssClass="form-control" runat="server"></asp:TextBox>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <div class="row">
            <div class="col-xs-12">
                <div class="box box-warning">
                    <div class="box-header">
                        <h3 class="box-title">
                            <asp:Literal ID="Literal19" runat="server" Text="Datos Servidor TeamSpeak y Dedicado"></asp:Literal></h3>
                    </div>
                    <!-- /.box-header -->
                    <div class="box-body">
                        <div class="row">
                            <div class="col-xs-6">
                                <div class="form-group">
                                    <label for="exampleInputPassword1">
                                        <asp:Literal ID="Literal32" runat="server" Text="Servidor TeamSpeak"></asp:Literal>:</label>
                                    <asp:TextBox ID="tServidorTS" CssClass="form-control" runat="server"></asp:TextBox>
                                </div>
                            </div>
                            <div class="col-xs-6">
                                <div class="form-group">
                                    <label for="exampleInputPassword1">
                                        <asp:Literal ID="Literal34" runat="server" Text="Pass TeamSpeak"></asp:Literal>:</label>
                                    <asp:TextBox ID="tServidorTSPass" CssClass="form-control" runat="server"></asp:TextBox>
                                </div>
                            </div>
                           
                        </div>
                        <div class="row">
                            <div class="col-xs-4">
                                <div class="form-group">
                                    <label for="exampleInputPassword1">
                                        <asp:Literal ID="Literal35" runat="server" Text="URL Servidor Sim"></asp:Literal>:</label>
                                    <asp:TextBox ID="tHost" CssClass="form-control" runat="server"></asp:TextBox>
                                </div>
                            </div>
                            <div class="col-xs-4">
                                <div class="form-group">
                                    <label for="exampleInputPassword1">
                                        <asp:Literal ID="Literal36" runat="server" Text="Pass Servidor Sim"></asp:Literal>:</label>
                                    <asp:TextBox ID="tPassHost" CssClass="form-control" runat="server"></asp:TextBox>
                                </div>
                            </div>
                            <div class="col-xs-4">
                                <div class="form-group">
                                    <label for="exampleInputPassword1">
                                        <asp:Literal ID="Literal37" runat="server" Text="URL Laps/Estadísticas"></asp:Literal>:</label>
                                    <asp:TextBox ID="tLap" CssClass="form-control" runat="server"></asp:TextBox>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <div class="row">
            <div class="col-xs-12">
                <div class="box box-info">
                    <div class="box-header">
                        <h3 class="box-title">
                            <asp:Literal ID="Literal15" runat="server" meta:resourcekey="Literal15Resource1" Text="Datos relativos a la inscripción"></asp:Literal></h3>
                    </div>
                    <!-- /.box-header -->
                    <div class="box-body">
                        <div class="row">
                            <div class="col-xs-4">
                                <div class="form-group">
                                    <label for="exampleInputPassword1">
                                        <asp:Literal ID="Literal16" runat="server" meta:resourcekey="Literal16Resource1" Text="Fecha inicio inscripción"></asp:Literal>:</label><asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ErrorMessage="Campo requerido" CssClass="label label-danger" ControlToValidate="tFini" meta:resourcekey="RequiredFieldValidator3Resource1"></asp:RequiredFieldValidator>
                                    <asp:TextBox ID="tFini" CssClass="form-control" runat="server" meta:resourcekey="tFiniResource1"></asp:TextBox>
                                    <ajaxToolkit:CalendarExtender ID="tFini_CalendarExtender" runat="server" BehaviorID="tFini_CalendarExtender" Format="dd/MM/yyyy" TargetControlID="tFini" OnLoad="tFini_CalendarExtender_Load" />
                                </div>
                            </div>
                            <div class="col-xs-4">
                                <div class="form-group">
                                    <label for="exampleInputPassword1">
                                        <asp:Literal ID="Literal17" runat="server" meta:resourcekey="Literal17Resource1" Text="Fecha fin inscripción"></asp:Literal>:</label><asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ErrorMessage="Campo requerido" CssClass="label label-danger" ControlToValidate="tFfin" meta:resourcekey="RequiredFieldValidator4Resource1"></asp:RequiredFieldValidator>
                                    <asp:TextBox ID="tFfin" CssClass="form-control" runat="server" meta:resourcekey="tFfinResource1"></asp:TextBox>
                                    <ajaxToolkit:CalendarExtender ID="tFfin_CalendarExtender" runat="server" BehaviorID="tFfin_CalendarExtender" Format="dd/MM/yyyy" TargetControlID="tFfin" OnLoad="tFfin_CalendarExtender_Load" />
                                </div>
                            </div>
                            <div class="col-xs-4">
                                <div class="form-group">
                                    <label for="exampleInputPassword1">
                                        <asp:Literal ID="Literal22" runat="server" meta:resourcekey="Literal22Resource1" Text="Nº máximo de inscritos permitidos"></asp:Literal>:</label>
                                    <asp:TextBox ID="tNumMax" CssClass="form-control" runat="server" meta:resourcekey="tNumMaxResource1"></asp:TextBox>
                                    <p>
                                        <asp:Literal ID="Literal23" runat="server" meta:resourcekey="Literal23Resource1" Text="Introduce 0 para desactivar el límite de inscrito"></asp:Literal>s
                                    </p>
                                </div>
                            </div>
                             <div class="col-xs-4">
                                <div class="form-group">
                                    <label for="exampleInputPassword1">
                                        <asp:Literal ID="Literal128" runat="server"  Text="Inscripción por invitación"></asp:Literal>:</label>
                                    <asp:CheckBox ID="chSinInsripcion" runat="server" meta:resourcekey="chSinInsripcionResource1" AutoPostBack="True" OnCheckedChanged="chSinInsripcion_CheckedChanged" />
                                    <p>
                                        <asp:HyperLink ID="hyInvitacion" runat="server"></asp:HyperLink>
                                    </p>
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-xs-6">
                                <div class="form-group">
                                    <label for="exampleInputPassword1">
                                        <asp:Literal ID="Literal20" runat="server" meta:resourcekey="Literal20Resource1" Text="Plataforma"></asp:Literal>:</label><asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ErrorMessage="Campo requerido" CssClass="label label-danger" ControlToValidate="cbPlataforma" meta:resourcekey="RequiredFieldValidator5Resource1"></asp:RequiredFieldValidator>
                                    <asp:DropDownList ID="cbPlataforma" CssClass="form-control" runat="server" DataSourceID="objPlataforma" DataTextField="PLATAFORMA" DataValueField="ID" OnSelectedIndexChanged="cbPlataforma_SelectedIndexChanged" AutoPostBack="True" meta:resourcekey="cbPlataformaResource1"></asp:DropDownList>
                                    <asp:ObjectDataSource ID="objPlataforma" runat="server" DeleteMethod="Delete" InsertMethod="Insert" OldValuesParameterFormatString="original_{0}" SelectMethod="GetData" TypeName="DL.AuxliaresDSTableAdapters.PLATAFORMATableAdapter" UpdateMethod="Update">
                                        <DeleteParameters>
                                            <asp:Parameter Name="Original_ID" Type="Int32" />
                                        </DeleteParameters>
                                        <InsertParameters>
                                            <asp:Parameter Name="PLATAFORMA" Type="String" />
                                        </InsertParameters>
                                        <UpdateParameters>
                                            <asp:Parameter Name="PLATAFORMA" Type="String" />
                                            <asp:Parameter Name="Original_ID" Type="Int32" />
                                        </UpdateParameters>
                                    </asp:ObjectDataSource>
                                    <asp:Label ID="lblinscritos" runat="server" Visible="False" Text="Una vez hay inscritos no es posible cambiar plataforma ni simulador" CssClass="label label-warning form-control" meta:resourcekey="lblinscritosResource1"></asp:Label>
                                </div>
                            </div>
                            <div class="col-xs-6">
                                <div class="form-group">
                                    <label for="exampleInputPassword1">
                                        <asp:Literal ID="Literal21" runat="server" meta:resourcekey="Literal21Resource1" Text="Simulador"></asp:Literal>:</label><asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ErrorMessage="Campo requerido" CssClass="label label-danger" ControlToValidate="cbSimulador" meta:resourcekey="RequiredFieldValidator6Resource1"></asp:RequiredFieldValidator>
                                    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                                        <ContentTemplate>
                                            <asp:ObjectDataSource ID="objJuegos" runat="server" OldValuesParameterFormatString="original_{0}" SelectMethod="GetDataBy" TypeName="DL.AuxliaresDSTableAdapters.V_JUEGO_PLATAFORMATableAdapter">
                                                <SelectParameters>
                                                    <asp:ControlParameter ControlID="cbPlataforma" Name="IDPLATAFORMA" PropertyName="SelectedValue" Type="Int32" />
                                                </SelectParameters>
                                            </asp:ObjectDataSource>
                                            <asp:DropDownList ID="cbSimulador" CssClass="form-control" runat="server" DataSourceID="objJuegos" DataTextField="JUEGO" DataValueField="IDJUEGO" meta:resourcekey="cbSimuladorResource1">
                                            </asp:DropDownList>
                                        </ContentTemplate>
                                        <Triggers>
                                            <asp:AsyncPostBackTrigger ControlID="cbPlataforma" EventName="SelectedIndexChanged" />
                                        </Triggers>
                                    </asp:UpdatePanel>
                                </div>
                            </div>

                        </div>
                        <div class="row">
                            <div class="col-xs-12">
                                <div class="form-group">
                                    <label for="exampleInputFile">
                                        <asp:Literal ID="Literal24" runat="server" meta:resourcekey="Literal24Resource1" Text="Cartel del evento"></asp:Literal>:</label>
                                    <asp:FileUpload ID="fUpload" runat="server" meta:resourcekey="fUploadResource1" />
                                    <%=imagenactual %>
                                    <p class="help-block">
                                        <asp:Literal ID="Literal25" runat="server" meta:resourcekey="Literal25Resource1" Text="Para que encaje con el estilo del portal debe tener un tamaño de 1920x450"></asp:Literal>
                                    </p>                                    
                                </div>
                            </div>
                        </div>

                    </div>
                </div>
                <div class="box box-info">
                    <div class="box-header">
                        <h3 class="box-title">
                            <asp:Literal ID="Literal26" runat="server" meta:resourcekey="Literal26Resource1" Text="Selecciona Patrocinadores"></asp:Literal></h3>
                        <p>
                            <asp:Literal ID="Literal27" runat="server" meta:resourcekey="Literal27Resource1" Text="Debes añadir tus patrocinadores al listado general mediante la opción de menú 'Mis Patrocinadores'. Una vez hecho eso podrás seleccionar aquí los que correspondan"></asp:Literal>
                        </p>
                    </div>
                    <!-- /.box-header -->
                    <div class="box-body">
                        <div class="row">
                            <div class="col-xs-12">
                                <asp:CheckBoxList ID="chPatrocinadores" runat="server" DataTextField="SPONSOR" DataValueField="Id" meta:resourcekey="chPatrocinadoresResource1"></asp:CheckBoxList>
                                <%--<asp:ObjectDataSource ID="objPatrocinadores" runat="server" DeleteMethod="Delete" OldValuesParameterFormatString="original_{0}" SelectMethod="GetDataBy" TypeName="DL.AuxliaresDSTableAdapters.SPONSORSTableAdapter">
                                    <DeleteParameters>
                                        <asp:Parameter Name="Original_Id" Type="Int32" />
                                    </DeleteParameters>
                                    <SelectParameters>
                                        <asp:SessionParameter DbType="Guid" Name="ID" SessionField="idu" />
                                    </SelectParameters>
                                </asp:ObjectDataSource>--%>
                            </div>
                        </div>

                    </div>
                </div>
                <div class="box box-primary">
                    <div class="box-header">
                        <h3 class="box-title">
                            <asp:Literal ID="Literal28" runat="server" meta:resourcekey="Literal28Resource1" Text="Acciones"></asp:Literal></h3>
                    </div>
                    <!-- /.box-header -->
                    <div class="box-body">
                        <div class="row">
                            <div class="col-xs-12">
                                <asp:Button ID="bGuardar" runat="server" Text="Guardar evento" CssClass="btn btn-success" OnClick="bGuardar_Click" meta:resourcekey="bGuardarResource1" />
                                <% if (Request.QueryString["id"] != null)
                                    { %>
                                <a href="copiar.aspx?id=<%= (Request.QueryString["id"].ToString()) %>" class="btn btn-primary">Copiar campeonato</a>
                                <% } %>
                                <% if (Request.QueryString["id"] != null)
                                    { %>
                                <asp:Button ID="bEliminar" runat="server" Text="Eliminar evento" CssClass="btn btn-danger" OnClick="bEliminar_Click" meta:resourcekey="bEliminarResource1" />
                                <ajaxToolkit:ConfirmButtonExtender ID="bEliminar_ConfirmButtonExtender" runat="server" BehaviorID="bEliminar_ConfirmButtonExtender" ConfirmText="¿Estás segur@? Esta acción no puede deshacerse" TargetControlID="bEliminar" />
                                <%} %>
                            </div>
                        </div>
                    </div>
                </div>

            </div>
        </div>

    </section>
</asp:Content>
