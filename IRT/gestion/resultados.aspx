<%@ Page Title="" Language="C#" MasterPageFile="~/gestion/irtadmin.Master" AutoEventWireup="true" CodeBehind="resultados.aspx.cs" Inherits="IRT.gestion.resultados" meta:resourcekey="PageResource1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <section class="content-header">
        <h1>
            <asp:Literal ID="Literal1" runat="server" meta:resourcekey="Literal1Resource1" Text="Gestión de resultados"></asp:Literal>
            <small>
                <asp:Literal ID="Literal2" runat="server" meta:resourcekey="Literal2Resource1" Text="Selecciona la carrera a gestionar y carga los participantes en función de la división/split"></asp:Literal></small>
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
        <asp:Label CssClass="alert alert-danger" ID="lblmesg" runat="server" Visible="False" meta:resourcekey="lblmesgResource1"></asp:Label>
        <asp:Literal ID="lblmsg" runat="server" Visible="False" meta:resourcekey="lblmsgResource1" Text="
            &lt;div class=&quot;callout callout-success lead&quot;&gt;
            &lt;h4&gt;!Atención!&lt;/h4&gt;
            &lt;p&gt;Datos actualizados&lt;/p&gt;
        &lt;/div&gt;
        "></asp:Literal>
        <div id="panerror" class="callout callout-danger lead" runat="server" visible="false">
            <h4>
                <asp:Literal ID="lblmsg2" runat="server" Text="¡Error!"></asp:Literal></h4>
            <p>
                <asp:Literal ID="lblmsg2b" runat="server" Text="Se ha producido un error al guardar los cambios"></asp:Literal>
            </p>
        </div>

        <!-- Modal -->
        <div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
            <div class="modal-dialog modal-lg" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                        <h4 class="modal-title" id="myModalLabel">Resultados</h4>
                    </div>
                    <div class="modal-body">
                        <asp:Literal ID="Literal4" runat="server" meta:resourcekey="Literal4Resource1" Text="&lt;p&gt;Esta es la pantalla en la que gestiona el listao de pilotos inscritos&lt;/p&gt;
                        &lt;p&gt;Por defecto todos los pilotos están asignados a la división &quot;Sin Division&quot; y al split &quot;Sin split&quot;. Si no vas a hacer divisiones ni splits puedes dejarlos tal como están. No necesitarías hacer nada más en esta página a menos que quieras añadir manualmente algún inscrito (debe estar registrado en el portal primero)&lt;br /&gt;&lt;/p&gt;
                        &lt;p&gt;En caso contrario, para separar a los pilotos por divisiones/splits usa el el checkbox para seleccionar a los pilotos que quieras y luego en el apartado &lt;b&gt;Asignación de inscritos&lt;/b&gt; selecciona en los desplegables la division y/o split y pulsa el botón &lt;label class=&quot;btn btn-primary&quot;&gt;Asignar&lt;/label&gt;. La pantalla se refrescará y verás los pilotos asignados a la división/split indicada&lt;/p&gt;
                        &lt;p&gt;Estas divisiones te servirán luego para meter los resultados&lt;/p&gt;"></asp:Literal>

                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-default" data-dismiss="modal">
                            <asp:Literal ID="Literal5" runat="server" meta:resourcekey="Literal5Resource1" Text="Cerrar"></asp:Literal></button>
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
                            <asp:Literal ID="Literal6" runat="server" meta:resourcekey="Literal6Resource1" Text="Selecciona carrera"></asp:Literal></h3>
                    </div>
                    <!-- /.box-header -->
                    <div class="box-body">
                        <div class="row">
                            <div class="col-xs-3">
                                <div class="form-group">
                                    <label for="exampleInputEmail1">
                                        <asp:Literal ID="Literal7" runat="server" meta:resourcekey="Literal7Resource1" Text="Carrera"></asp:Literal>:</label>
                                    <asp:DropDownList ID="cbCarrera" CssClass="form-control" runat="server" meta:resourcekey="cbCarreraResource1"></asp:DropDownList>
                                </div>
                            </div>
                            <div class="col-xs-3">
                                <div class="form-group">
                                    <label for="exampleInputEmail1">
                                        <asp:Literal ID="Literal8" runat="server" meta:resourcekey="Literal8Resource1" Text="División"></asp:Literal>:</label>
                                    <asp:DropDownList ID="cbDivision" CssClass="form-control" runat="server" DataSourceID="objDivision" DataTextField="ES" DataValueField="ID" meta:resourcekey="cbDivisionResource1"></asp:DropDownList>
                                    <asp:ObjectDataSource ID="objDivision" runat="server" DeleteMethod="Delete" InsertMethod="Insert" OldValuesParameterFormatString="original_{0}" SelectMethod="GetData" TypeName="DL.AuxliaresDSTableAdapters.DIVISIONESTableAdapter" UpdateMethod="Update">
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
                            <div class="col-xs-3">
                                <div class="form-group">
                                    <label for="exampleInputEmail1">
                                        <asp:Literal ID="Literal9" runat="server" meta:resourcekey="Literal9Resource1" Text="Split/Grupo"></asp:Literal>:</label>
                                    <asp:DropDownList ID="cbSplit" CssClass="form-control" runat="server" DataSourceID="objSplit" DataTextField="ES" DataValueField="ID" meta:resourcekey="cbSplitResource1"></asp:DropDownList>
                                    <asp:ObjectDataSource ID="objSplit" runat="server" DeleteMethod="Delete" InsertMethod="Insert" OldValuesParameterFormatString="original_{0}" SelectMethod="GetData" TypeName="DL.AuxliaresDSTableAdapters.SPLITSTableAdapter" UpdateMethod="Update">
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
                            <div class="col-xs-3">
                                <div class="form-group">
                                    <br />
                                    <asp:Button ID="bCargar" CssClass="form-control btn btn-primary" runat="server" Text="Cargar participantes" OnClick="bCargar_Click" meta:resourcekey="bCargarResource1" />
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <div class="row">
            <div class="col-xs-12">
                <div class="box">
                    <div class="box-header">
                        <h3 class="box-title">
                            <asp:Literal ID="Literal10" runat="server" meta:resourcekey="Literal10Resource1" Text="Resultados de la carrera"></asp:Literal></h3>
                        <p>
                            <asp:Literal ID="Literal21" runat="server" meta:resourcekey="textoresultados">
                        Sólo es necesario rellenar la columna de <b>posiciones de llegada</b><br />
                            Puedes usar "DNS" para los que no iniciarion, "RET/DNF" para los que se retiran y &quot;DSQ&quot; para los descalificados. <br />
                            Al guardar el sistema calculará los resultados en función de la tabla de puntos seleccionada en los datos generales del campeonato.</asp:Literal>
                        </p>
                        <asp:Panel ID="panRR" runat="server" Visible="false">
                            <asp:Literal ID="Literal26" runat="server">
                            <b>Importar resultados de carrera</b>
                            <p>Puedes importar los resultados mediante el fichero .JSON de la carrera exportado de RaceRoom</p>
                            </asp:Literal>
                            <asp:FileUpload ID="fileRR" runat="server" />
                            <asp:Button CssClass="btn btn-info" ID="bImpRR" runat="server" Text="Importar" OnClick="bImpRR_Click" />
                            <ajaxToolkit:ConfirmButtonExtender ID="ConfirmButtonExtender1" runat="server" BehaviorID="bEliminar_ConfirmButtonExtender" ConfirmText="¿Estás segur@? ¿Has elegido la carrera y división/grupo correcta?" TargetControlID="bImpRR" />
                        </asp:Panel>
                    </div>
                    <!-- /.box-header -->
                    <div class="box-body">
                        <div class="row">
                            <div class="col-xs-12">
                                <table class="table table-bordered">
                                    <thead>
                                        <tr>
                                            <th>
                                                <asp:Literal ID="Literal11" runat="server" meta:resourcekey="Literal11Resource1" Text="Piloto"></asp:Literal></th>
                                            <th>
                                                <asp:Literal ID="Literal23" runat="server" Text="PSN"></asp:Literal></th>
                                            <th>
                                                <asp:Literal ID="Literal24" runat="server" Text="XBOXID"></asp:Literal></th>
                                            <th>
                                                <asp:Literal ID="Literal25" runat="server" Text="iRID"></asp:Literal></th>
                                            <th>
                                                <asp:Literal ID="Literal19" runat="server" meta:resourcekey="coche" Text="Coche"></asp:Literal></th>
                                            <th>
                                                <asp:Literal ID="Literal12" runat="server" meta:resourcekey="Literal12Resource1" Text="Pos.Salida"></asp:Literal></th>
                                            <th style="background-color:aliceblue">
                                                <asp:Literal ID="Literal13" runat="server" meta:resourcekey="Literal13Resource1" Text="Pos.Llegada"></asp:Literal></th>
                                            <th style="background-color:antiquewhite">
                                                <asp:Literal ID="Literal20" runat="server" meta:resourcekey="manga2" Text="Pos.Llegada Manga 2"></asp:Literal></th>
                                            <th>
                                                <asp:Literal ID="Literal14" runat="server" meta:resourcekey="Literal14Resource1" Text="V.Rápida"></asp:Literal></th>
                                            <th>
                                                <asp:Literal ID="Literal15" runat="server" meta:resourcekey="Literal15Resource1" Text="Incidentes"></asp:Literal></th>
                                            <th>
                                                <asp:Literal ID="Literal16" runat="server" meta:resourcekey="Literal16Resource1" Text="Bonificación"></asp:Literal></th>
                                            <th>
                                                <asp:Literal ID="Literal17" runat="server" meta:resourcekey="Literal17Resource1" Text="Puntos"></asp:Literal></th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <asp:Repeater ID="repResultados" runat="server">
                                            <ItemTemplate>
                                                <tr>
                                                    <td>
                                                        <div style="float: left; padding-right: 10px; margin-right: 0px;"><%# DameAvatar(DataBinder.Eval(Container.DataItem,"AVATAR"),DataBinder.Eval(Container.DataItem,"IDUSUARIO")) %></div>
                                                        <p style="float: left;"><%#DataBinder.Eval(Container.DataItem,"INSCRITO") %><br />
                                                            <span class="small"><%#DataBinder.Eval(Container.DataItem,"EQUIPO") %></span></p>
                                                    </td>
                                                    <td><%#DataBinder.Eval(Container.DataItem,"PSN") %></td>
                                                    <td><%#DataBinder.Eval(Container.DataItem,"XBOXID") %></td>
                                                    <td><%#DataBinder.Eval(Container.DataItem,"IRID") %></td>
                                                    <td><%#DataBinder.Eval(Container.DataItem,"COCHE") %></td>
                                                    <td>
                                                        <input style="width: 50px;" type="text" value='<%# DataBinder.Eval(Container.DataItem,"POSSALIDA") %>' name='sal-<%# DataBinder.Eval(Container.DataItem,"ID") %>' />
                                                    </td>
                                                    <td style="background-color:aliceblue">
                                                        <input style="width: 50px;" type="text" value='<%# DamePosLlegada(DataBinder.Eval(Container.DataItem,"POSLLEGADA")) %>' name='lle-<%# DataBinder.Eval(Container.DataItem,"ID") %>' />
                                                    </td>
                                                    <td style="background-color:antiquewhite">
                                                        <input style="width: 50px;" type="text" value='<%# DamePosLlegada(DataBinder.Eval(Container.DataItem,"POSLLEGADA2")) %>' name='lle2-<%# DataBinder.Eval(Container.DataItem,"ID") %>' />
                                                    </td>
                                                    <td>
                                                        <select style="width: 50px;" name='vta-<%# DataBinder.Eval(Container.DataItem,"ID") %>'>
                                                            <option value="N" <%# DameChecked(DataBinder.Eval(Container.DataItem,"VUELTARAPIDA"),"N") %>>N</option>
                                                            <option value="S" <%# DameChecked(DataBinder.Eval(Container.DataItem,"VUELTARAPIDA"),"S") %>>S</option>
                                                        </select>
                                                    </td>
                                                    <td>
                                                        <input style="width: 50px;" type="text" value='<%# DataBinder.Eval(Container.DataItem,"INCIDENCIAS") %>' name='inc-<%# DataBinder.Eval(Container.DataItem,"ID") %>' />
                                                    </td>
                                                    <td>
                                                        <input style="width: 50px;" type="text" value='<%# DataBinder.Eval(Container.DataItem,"BONIFICACION") %>' name='bon-<%# DataBinder.Eval(Container.DataItem,"ID") %>' />
                                                    </td>
                                                    <td><%#DataBinder.Eval(Container.DataItem,"PUNTOS") %>
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
            </div>
        </div>

        <div class="row">
            <div class="col-xs-12">
                <div class="box">
                    <div class="box-header">
                        <h3 class="box-title">
                            <asp:Literal ID="Literal18" runat="server" meta:resourcekey="Literal18Resource1" Text="Acciones"></asp:Literal></h3>
                    </div>
                    <!-- /.box-header -->
                    <div class="box-body">
                        <div class="row">
                            <div class="col-xs-2">
                                <asp:Button ID="bGuardar" CssClass="btn btn-success" runat="server" Text="Guardar Resultados" OnClick="bGuardar_Click" meta:resourcekey="bGuardarResource1" />
                            </div>
                            <div class="col-xs-2">
                                <asp:Button ID="bPublicar" CssClass="btn btn-primary <%=clase %>" runat="server" Text="Publicar Resultados" OnClick="bPublicar_Click" meta:resourcekey="bPublicarResource1" />
                            </div>
                            <div class="col-xs-8">
                                <asp:Button ID="bBorrar" meta:resourcekey="btnborrar" CssClass="btn btn-danger" runat="server" Text="Borrar Resultados" OnClick="bBorrar_Click" />
                                <p class="small">
                                    <asp:Literal ID="Literal22" meta:resourcekey="textoborrado" runat="server" Text="Usa esta opción si has reorganizado las divisiones o grupos y ya tenías resultados calculados o si quieres empezar de nuevo"></asp:Literal>
                                </p>
                                <ajaxToolkit:ConfirmButtonExtender ID="bEliminar_ConfirmButtonExtender" runat="server" BehaviorID="bEliminar_ConfirmButtonExtender" ConfirmText="¿Estás segur@? Esta acción no puede deshacerse" TargetControlID="bBorrar" />
                            </div>

                        </div>
                    </div>
                </div>
            </div>
        </div>


    </section>
</asp:Content>
