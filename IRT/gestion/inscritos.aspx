<%@ Page Title="" Language="C#" MasterPageFile="~/gestion/irtadmin.Master" AutoEventWireup="true" CodeBehind="inscritos.aspx.cs" Inherits="IRT.gestion.inscritos" meta:resourcekey="PageResource1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        .pagination-ys {
            /*display: inline-block;*/
            padding-left: 0;
            margin: 20px 0;
            border-radius: 4px;
        }

            .pagination-ys table > tbody > tr > td {
                display: inline;
            }

                .pagination-ys table > tbody > tr > td > a,
                .pagination-ys table > tbody > tr > td > span {
                    position: relative;
                    float: left;
                    padding: 8px 12px;
                    line-height: 1.42857143;
                    text-decoration: none;
                    color: blue;
                    background-color: #ffffff;
                    border: 1px solid #dddddd;
                    margin-left: -1px;
                }

                .pagination-ys table > tbody > tr > td > span {
                    position: relative;
                    float: left;
                    padding: 8px 12px;
                    line-height: 1.42857143;
                    text-decoration: none;
                    margin-left: -1px;
                    z-index: 2;
                    color: #aea79f;
                    background-color: #f5f5f5;
                    border-color: #dddddd;
                    cursor: default;
                }

                .pagination-ys table > tbody > tr > td:first-child > a,
                .pagination-ys table > tbody > tr > td:first-child > span {
                    margin-left: 0;
                    border-bottom-left-radius: 4px;
                    border-top-left-radius: 4px;
                }

                .pagination-ys table > tbody > tr > td:last-child > a,
                .pagination-ys table > tbody > tr > td:last-child > span {
                    border-bottom-right-radius: 4px;
                    border-top-right-radius: 4px;
                }

                .pagination-ys table > tbody > tr > td > a:hover,
                .pagination-ys table > tbody > tr > td > span:hover,
                .pagination-ys table > tbody > tr > td > a:focus,
                .pagination-ys table > tbody > tr > td > span:focus {
                    color: #97310e;
                    background-color: #eeeeee;
                    border-color: #dddddd;
                }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <section class="content-header">
        <h1>
            <asp:Literal ID="Literal1" runat="server" meta:resourcekey="Literal1Resource1" Text="Gestion de documentos"></asp:Literal>
            <small>
                <asp:Literal ID="Literal2" runat="server" meta:resourcekey="Literal2Resource1" Text="Aqui puedes gestionar los inscritos. Puedes asignarlos a divisiones y splits según necesites"></asp:Literal></small>
        </h1>

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
                            <asp:Literal ID="Literal4" runat="server" meta:resourcekey="Literal4Resource1" Text="Inscritos"></asp:Literal></h4>
                    </div>
                    <div class="modal-body">
                        <asp:Literal ID="Literal5" runat="server" meta:resourcekey="Literal5Resource1" Text="&lt;p&gt;Esta es la pantalla en la que gestiona el listado de pilotos inscritos&lt;/p&gt;
                        &lt;p&gt;Por defecto todos los pilotos están asignados a la división &quot;Sin Division&quot; y al split &quot;Sin split&quot;. Si no vas a hacer divisiones ni splits puedes dejarlos tal como están. No necesitarías hacer nada más en esta página a menos que quieras añadir manualmente algún inscrito (debe estar registrado en el portal primero).&lt;br /&gt;&lt;/p&gt;
                        &lt;p&gt;En caso contrario, para separar a los pilotos por divisiones/splits usa el el checkbox para seleccionar a los pilotos que quieras y luego en el apartado &lt;b&gt;Asignación de inscritos&lt;/b&gt; selecciona en los desplegables la division y/o split y pulsa el botón &lt;label class=&quot;btn btn-info btn-xs&quot;&gt;Asignar&lt;/label&gt;. La pantalla se refrescará y verás los pilotos asignados a la división/split indicada.&lt;/p&gt;
                        &lt;p&gt;Estas divisiones te servirán luego para meter los resultados.&lt;/p&gt;
                        &lt;p&gt;Tienes la opción de añadir pilotos de forma manual y de eliminar los seleccionados de la lista. ¡Cuidado! El borrado no es recuperable&lt;/p&gt;"></asp:Literal>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-default" data-dismiss="modal">
                            <asp:Literal ID="Literal6" runat="server" meta:resourcekey="Literal6Resource1" Text="Cerrar"></asp:Literal></button>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <section class="content">
        <div class="row">
            <div class="col-xs-12">
                <asp:Label CssClass="alert alert-danger" ID="Label1" runat="server" Visible="False"></asp:Label>&nbsp;
            </div>
        </div>
        <div class="row">
            <div class="col-xs-12">
                <asp:Label CssClass="alert alert-danger" ID="lblmesg" runat="server" Visible="False"></asp:Label>
                <div class="box">
                    <div class="box-header">
                        <h3 class="box-title">
                            <asp:Literal ID="Literal7" runat="server" meta:resourcekey="Literal7Resource1" Text="Listado de inscritos"></asp:Literal></h3>
                    </div>
                    <!-- /.box-header -->
                    <div class="box-body">
                        <asp:CheckBoxList ID="chInscritos" runat="server" meta:resourcekey="chInscritosResource1">
                        </asp:CheckBoxList>
                        <asp:GridView ID="dgDatos" runat="server" AutoGenerateColumns="False" CssClass="table table-bordered" DataKeyNames="ID" AllowPaging="True" AllowSorting="True" EmptyDataText="No hay datos" OnPageIndexChanging="grdData_PageIndexChanging" OnSorting="GridView_Sorting" meta:resourcekey="dgDatosResource1">
                            <Columns>
                                <asp:TemplateField HeaderText="Selec." meta:resourcekey="TemplateFieldResource1">
                                    <ItemTemplate>
                                        <asp:CheckBox ID="chSelector" runat="server" meta:resourcekey="chSelectorResource1" />
                                    </ItemTemplate>
                                    <ItemStyle Width="100px" />
                                </asp:TemplateField>
                                <asp:BoundField DataField="ID" HeaderText="ID" InsertVisible="False" ReadOnly="True" SortExpression="ID" Visible="False" meta:resourcekey="BoundFieldResource1" />
                                <asp:BoundField DataField="IDUSUARIO" HeaderText="IDUSUARIO" SortExpression="IDUSUARIO" Visible="False" meta:resourcekey="BoundFieldResource2" />
                                <asp:BoundField DataField="IDEVENTO" HeaderText="IDEVENTO" SortExpression="IDEVENTO" Visible="False" meta:resourcekey="BoundFieldResource3" />
                                <asp:BoundField DataField="IDDIVISION" HeaderText="IDDIVISION" SortExpression="IDDIVISION" Visible="False" meta:resourcekey="BoundFieldResource4" />
                                <asp:BoundField DataField="FECHAINSCRIPCION" HeaderText="Fecha Inscripción" SortExpression="FECHAINSCRIPCION" meta:resourcekey="BoundFieldResource5">
                                    <ItemStyle Width="120px" />
                                </asp:BoundField>
                                <asp:BoundField DataField="IDSPLIT" HeaderText="IDSPLIT" SortExpression="IDSPLIT" Visible="False" meta:resourcekey="BoundFieldResource6" />
                                <asp:BoundField DataField="AVATAR" HeaderText="AVATAR" SortExpression="AVATAR" Visible="False" meta:resourcekey="BoundFieldResource7" />
                                <asp:TemplateField HeaderText="Avatar" SortExpression="AVATAR" meta:resourcekey="BoundFieldResource7" ControlStyle-Width="50px">
                                    <ItemTemplate>
                                        <img style='width: 40px; height: 40px' src='<%# DameAvatar(Eval("IDUSUARIO"),Eval("AVATAR")) %>' />
                                    </ItemTemplate>
                                    <ControlStyle Width="50px"></ControlStyle>
                                </asp:TemplateField>
                                <asp:BoundField DataField="INSCRITO" HeaderText="Piloto" ReadOnly="True" SortExpression="INSCRITO" meta:resourcekey="BoundFieldResource8">
                                    <ControlStyle Width="100%" />
                                </asp:BoundField>
                                <asp:BoundField DataField="ESCUDERIA" HeaderText="Escuderia" SortExpression="ESCUDERIA" Visible="False" />
                                <asp:BoundField DataField="PSN" HeaderText="PS ID" ReadOnly="True" SortExpression="PSID" />
                                <asp:BoundField DataField="XBOXID" HeaderText="XBox ID" ReadOnly="True" SortExpression="XBOXID" />
                                <asp:BoundField DataField="IRID" HeaderText="iR ID" ReadOnly="True" SortExpression="IRID" />
                                <asp:BoundField DataField="RRID" HeaderText="RR ID" ReadOnly="True" SortExpression="RRID" />
                                <asp:TemplateField HeaderText="Email" SortExpression="USUARIO">
                                    <ItemTemplate>
                                        <a href="mailto:<%# Eval("USUARIO") %>"><%# Eval("USUARIO") %></a>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:BoundField DataField="EQUIPO" HeaderText="Equipo" ReadOnly="True" SortExpression="EQUIPO" meta:resourcekey="equipo" />
                                <asp:BoundField DataField="DIV_ES" HeaderText="División" SortExpression="DIV_ES" meta:resourcekey="BoundFieldResource9" />
                                <asp:BoundField DataField="DIV_EN" HeaderText="Division" SortExpression="DIV_EN" Visible="False" meta:resourcekey="BoundFieldResource10" />
                                <asp:BoundField DataField="SPL_ES" HeaderText="Grupo" SortExpression="SPL_ES" meta:resourcekey="BoundFieldResource11" />
                                <asp:BoundField DataField="SP_EN" HeaderText="Group" SortExpression="SP_EN" Visible="False" meta:resourcekey="BoundFieldResource12" />
                                <asp:BoundField DataField="DORSAL" HeaderText="Dorsal" Visible="False" SortExpression="DORSAL" meta:resourcekey="dorsal2" />
                                <asp:TemplateField HeaderText="Skin" SortExpression="SKIN" Visible="False">
                                    <ItemTemplate>
                                        <%# DameSkin(Eval("IDUSUARIO"), Eval("SKIN")) %>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:BoundField DataField="COMUNIDAD" HeaderText="Comunidad" Visible="True" SortExpression="COMUNIDAD" />
                                <asp:TemplateField HeaderText="Coches">
                                    <ItemTemplate>
                                        <a class="label label-default label-small" role="button" data-toggle="collapse" href="#PC<%# Eval("ID") %>" aria-expanded="false" aria-controls="collapseExample"><i class="fa fa-list"></i></a>
                                        <%# DameCoches(Eval("ID")) %>
                                    </ItemTemplate>
                                </asp:TemplateField>
                            </Columns>

                            <PagerStyle CssClass="pagination-ys" HorizontalAlign="Center" />

                        </asp:GridView>
                    </div>
                </div>
            </div>
        </div>

        <div class="row">
            <div class="col-xs-12">
                <div class="box">
                    <div class="box-header">
                        <h3 class="box-title">
                            <asp:Literal ID="Literal8" runat="server" meta:resourcekey="Literal8Resource1" Text="Asignación de inscritos"></asp:Literal></h3>
                    </div>
                    <!-- /.box-header -->
                    <div class="box-body">
                        <h5>
                            <asp:Literal ID="Literal9" runat="server" meta:resourcekey="Literal9Resource1" Text="Divide a los inscritos por divisiones/splits si así lo necesitas. Marca primero los inscritos y luego selecciona división y/o splits según necesites y pulsa asignar"></asp:Literal>:</h5>
                        <div class="row">
                            <div class="col-xs-6">
                                <div class="form-group">
                                    <label for="exampleInputEmail1">
                                        <asp:Literal ID="Literal10" runat="server" meta:resourcekey="Literal10Resource1" Text="División"></asp:Literal>:</label>
                                    <asp:DropDownList ID="cbDivision" runat="server" CssClass="form-control" DataSourceID="objDivisiones" DataTextField="ES" DataValueField="ID" meta:resourcekey="cbDivisionResource1">
                                    </asp:DropDownList>
                                    <asp:ObjectDataSource ID="objDivisiones" runat="server" DeleteMethod="Delete" InsertMethod="Insert" OldValuesParameterFormatString="original_{0}" SelectMethod="GetData" TypeName="DL.AuxliaresDSTableAdapters.DIVISIONESTableAdapter" UpdateMethod="Update">
                                        <DeleteParameters>
                                            <asp:Parameter Name="Original_ID" Type="Int32" />
                                        </DeleteParameters>
                                        <InsertParameters>
                                            <asp:Parameter Name="ES" Type="String" />
                                            <asp:Parameter Name="EN" Type="String" />
                                        </InsertParameters>
                                        <UpdateParameters>
                                            <asp:Parameter Name="ES" Type="String" />
                                            <asp:Parameter Name="EN" Type="String" />
                                            <asp:Parameter Name="Original_ID" Type="Int32" />
                                        </UpdateParameters>
                                    </asp:ObjectDataSource>
                                </div>
                            </div>
                            <div class="col-xs-6">
                                <div class="form-group">
                                    <label for="exampleInputEmail1">
                                        <asp:Literal ID="Literal11" runat="server" meta:resourcekey="Literal11Resource1" Text="Grupo"></asp:Literal>:</label>
                                    <asp:DropDownList ID="cbSplit" runat="server" CssClass="form-control" DataSourceID="objSplits" DataTextField="ES" DataValueField="ID" meta:resourcekey="cbSplitResource1">
                                    </asp:DropDownList>
                                    <asp:ObjectDataSource ID="objSplits" runat="server" DeleteMethod="Delete" InsertMethod="Insert" OldValuesParameterFormatString="original_{0}" SelectMethod="GetData" TypeName="DL.AuxliaresDSTableAdapters.SPLITSTableAdapter" UpdateMethod="Update">
                                        <DeleteParameters>
                                            <asp:Parameter Name="Original_ID" Type="Int32" />
                                        </DeleteParameters>
                                        <InsertParameters>
                                            <asp:Parameter Name="ES" Type="String" />
                                            <asp:Parameter Name="EN" Type="String" />
                                        </InsertParameters>
                                        <UpdateParameters>
                                            <asp:Parameter Name="ES" Type="String" />
                                            <asp:Parameter Name="EN" Type="String" />
                                            <asp:Parameter Name="Original_ID" Type="Int32" />
                                        </UpdateParameters>
                                    </asp:ObjectDataSource>
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-xs-12">
                                <div class="form-group">
                                    <asp:Button ID="bAplicar" CssClass="btn btn-info" runat="server" Text="Asignar" OnClick="bAplicar_Click" meta:resourcekey="bAplicarResource1" />
                                    <p>
                                        <asp:Literal ID="Literal15" runat="server" meta:resourcekey="recuerda"><label class="label label-danger">
                                    <i class="fa fa-info-circle"></i> Recuerda</label> que si vas a reasignar pilotos y ya tienes resultados guardados <b>deberás borrar los resultados calculados hasta el momento</b> y volver a introducir la clasificación de cada carrera</asp:Literal>
                                    </p>
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
                    <div class="box-header ">
                        <h3 class="box-title">
                            <asp:Literal ID="Literal19" runat="server" meta:resourcekey="cambiacoches" Text="Cambio de Coches"></asp:Literal></h3>
                    </div>
                    <!-- /.box-header -->
                    <div class="box-body">
                        <p>
                            <asp:Literal ID="Literal20" runat="server" meta:resourcekey="Literal15Resource1" Text="1. Selecciona los pilotos en la rejilla superior<br>2. Elige el coche a asignar a los pilotos seleccionados para cada carrera"></asp:Literal>
                        </p>

                        <div class="row">
                            <div class="col-xs-12">

                                <% if (!esf1)
                                    { %>
                                <div class="label-line textarea">
                                    <span class="span"></span>
                                    <table class="table table-hover">
                                        <thead>
                                            <tr>
                                                <th>
                                                    <asp:Literal ID="Literal23" runat="server" meta:resourcekey="Literal16Resource1" Text="Fecha"></asp:Literal></th>
                                                <th>
                                                    <asp:Literal ID="Literal26" runat="server" meta:resourcekey="Literal17Resource1" Text="Carrera"></asp:Literal></th>
                                                <th>
                                                    <asp:Literal ID="Literal27" runat="server" meta:resourcekey="Literal18Resource1" Text="Coche"></asp:Literal></th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <%=cochescad2 %>
                                        </tbody>
                                    </table>
                                </div>
                                <% }

                                    else
                                    { %>
                                <div class="form-group">
                                    <label for="exampleInputEmail1">
                                        <asp:Literal ID="Literal21" runat="server" meta:resourcekey="Literal18Resource1" Text="Coche:"></asp:Literal>:</label>
                                    <%=cochescad2 %>
                                </div>
                                <% } %>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-xs-4">
                                <div class="form-group">
                                    <asp:Button ID="btnCambiaCoche" meta:resourcekey="cambiocoches" CssClass="btn btn-warning" runat="server" Text="Cambiar Coches" OnClick="btnCambiaCoche_Click" />
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <div class="row">
            <div class="col-xs-12">
                <div class="box box-primary">
                    <div class="box-header">
                        <h3 class="box-title">
                            <asp:Literal ID="Literal12" runat="server" meta:resourcekey="Literal12Resource1" Text="Inscripción manual de pilotos"></asp:Literal></h3>

                    </div>
                    <!-- /.box-header -->
                    <div class="box-body">
                        <p>
                            <asp:Literal ID="Literal13" runat="server" meta:resourcekey="Literal13Resource1" Text="Puedes inscribir a cualquier piloto siempre que esté registrado en la plataforma"></asp:Literal>
                        </p>
                        <div class="row">
                            <div class="col-xs-6">
                                <div class="form-group">
                                    <label for="exampleInputEmail1">
                                        <asp:Literal ID="Literal14" runat="server" meta:resourcekey="Literal14Resource1" Text="Email del piloto"></asp:Literal>:</label>
                                    <asp:TextBox ID="tUsuario" CssClass="form-control" runat="server" MaxLength="50" meta:resourcekey="tUsuarioResource1"></asp:TextBox>
                                </div>
                            </div>
                            <% if (dorsal)
                                { %>
                            <div class="col-xs-2">
                                <div class="form-group">
                                    <label for="exampleInputEmail1">
                                        <asp:Literal ID="Literal2823" runat="server" meta:resourcekey="dorsal" Text="Dorsal"></asp:Literal>:</label>
                                    <asp:TextBox ID="tDorsal" CssClass="form-control" runat="server" MaxLength="50"></asp:TextBox>
                                </div>
                            </div>
                            <%} %>
                            <% if (skin)
                                { %>
                            <div class="col-md-5 col-xs-12">
                                <div class="form-group">
                                    <label for="exampleInputEmail1">
                                        <asp:Literal ID="Literal28" runat="server" Text="Skin"></asp:Literal>:</label>
                                    <asp:FileUpload ID="fuSkin" CssClass="form-control" runat="server" />
                                </div>
                            </div>
                            <%} %>
                            <% if (comunidades)
                                { %>
                            <div class="col-md-5 col-xs-12">
                                <div class="form-group">
                                    <label for="exampleInputEmail1">
                                        <asp:Literal ID="Literal29" runat="server" Text="Comunidad"></asp:Literal>:</label>
                                    <asp:DropDownList ID="cbComunidad" CssClass="form-control" runat="server" DataSourceID="SqlDataSource1" DataTextField="COMUNIDAD" DataValueField="ID"></asp:DropDownList>
                                    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:DL.Properties.Settings.DB_A1ED16_irtConnectionString %>" SelectCommand="SELECT [ID], [COMUNIDAD] FROM [COMUNIDADES]"></asp:SqlDataSource>
                                </div>
                            </div>
                            <%} %>
                        </div>
                        <div class="row">
                            <div class="col-xs-12">

                                <% if (!esf1)
                                    { %>
                                <div class="label-line textarea">
                                    <span class="span"></span>
                                    <table class="table table-hover">
                                        <thead>
                                            <tr>
                                                <th>
                                                    <asp:Literal ID="Literal16" runat="server" meta:resourcekey="Literal16Resource1" Text="Fecha"></asp:Literal></th>
                                                <th>
                                                    <asp:Literal ID="Literal17" runat="server" meta:resourcekey="Literal17Resource1" Text="Carrera"></asp:Literal></th>
                                                <th>
                                                    <asp:Literal ID="Literal18" runat="server" meta:resourcekey="Literal18Resource1" Text="Coche"></asp:Literal></th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <%=cochescad %>
                                        </tbody>
                                    </table>
                                </div>
                                <% }
                                    else
                                    { %>
                                <div class="form-group">
                                    <label for="exampleInputEmail1">
                                        <asp:Literal ID="Literal22" runat="server" meta:resourcekey="Literal18Resource1" Text="Coche:"></asp:Literal>:</label>
                                    <%=cochescad %>
                                </div>
                                <% } %>
                            </div>

                        </div>
                        <div class="row">
                            <div class="col-xs-4">
                                <div class="form-group">
                                    <asp:Button ID="bInscribir" CssClass="btn btn-info" runat="server" Text="Inscribir" OnClick="bInscribir_Click" meta:resourcekey="bInscribirResource1" />
                                    <asp:Label ID="lblmensaje" Visible="False" runat="server" meta:resourcekey="lblmensajeResource1"></asp:Label>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <%--   <div class="row">
            <div class="col-xs-12">
                <div class="box box-warning">
                    <div class="box-header">
                        <h3 class="box-title"><asp:Literal ID="Literal19" runat="server" meta:resourcekey="Literal19Resource1" Text="Copiar inscritos de otro campeonato"></asp:Literal></h3>

                    </div>
                    <!-- /.box-header -->
                    <div class="box-body">
                        <p>
                            <asp:Literal ID="Literal20" runat="server" meta:resourcekey="Literal20Resource1" Text="Puedes copiar los inscritos de otro campeonato que ya se haya celebrado. Esto es útil para cuando creas un campeonato de tipo clasificación con una sola carrera y luego copias los inscritos a este campeonato para realizar la separación por divisiones y grupos"></asp:Literal>
                            <br />
                            <label class="label label-danger"><asp:Literal ID="Literal21" runat="server" meta:resourcekey="Literal21Resource1" Text="IMPORTANTE"></asp:Literal>:</label>
                            <asp:Literal ID="Literal22" runat="server" meta:resourcekey="Literal22Resource1" Text="La lista de coches de ambos campeonatos debe ser la misma y ambos campeonatos deben ser de la misma combinación plataforma/simulador"></asp:Literal>.
                        </p>

                        <div class="row">
                            <div class="col-xs-12">
                                <div class="form-group">
                                    <label>
                                        <asp:Literal ID="Literal23" runat="server" meta:resourcekey="Literal23Resource1" Text="Selecciona el campeonato del que vas a copiar los inscritos"></asp:Literal>:</label>
                                    <asp:DropDownList ID="cbCampeonatos" CssClass="form-control" runat="server" meta:resourcekey="cbCampeonatosResource1"></asp:DropDownList>
                                </div>
                            </div>
                            <div class="col-xs-4">
                                <div class="form-group">
                                    <asp:Button ID="bCopiar" CssClass="btn btn-warning" runat="server" Text="COPIAR" OnClick="bCopiar_Click" meta:resourcekey="bCopiarResource1" />
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>--%>
        <div class="row">
            <div class="col-xs-12">
                <div class="box box-danger">
                    <div class="box-header">
                        <h3 class="box-title">
                            <asp:Literal ID="Literal24" runat="server" meta:resourcekey="Literal24Resource1" Text="Borrado manual de inscritos"></asp:Literal></h3>

                    </div>
                    <!-- /.box-header -->
                    <div class="box-body">
                        <p>
                            <asp:Literal ID="Literal25" runat="server" meta:resourcekey="Literal25Resource1" Text="Puedes cancelar la inscripción de los pilotos que hayas seleccionado. ¡¡ATENCIÓN ESTA ACCIÓN NO PUEDE DESHACERSE!!"></asp:Literal>
                        </p>

                        <div class="row">
                            <div class="col-xs-4">
                                <div class="form-group">
                                    <asp:Button ID="bEliminar" CssClass="btn btn-danger" runat="server" Text="ELIMINAR" OnClick="bEliminar_Click" meta:resourcekey="bEliminarResource1" />
                                    <asp:Label ID="lblEliminar" Visible="False" runat="server" meta:resourcekey="lblEliminarResource1"></asp:Label>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
</asp:Content>
