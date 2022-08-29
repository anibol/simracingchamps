<%@ Page Title="" Language="C#" MasterPageFile="~/gestion/irtadmin.Master" AutoEventWireup="true" CodeBehind="respuestas.aspx.cs" Inherits="IRT.gestion.respuestas" meta:resourcekey="PageResource1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <section class="content-header">
        <h1>
            <asp:Literal ID="Literal1" runat="server" Text="Reclamaciones" meta:resourcekey="Literal1Resource1"></asp:Literal>
        </h1>
         <ol class="breadcrumb">
            <li>
                <!-- Button trigger modal -->
                <a style="color:white;" href="reclamaciones.aspx?id=<%= Request.QueryString["id"].ToString() %>" class="btn btn-xs btn-success"><asp:Literal ID="Literal3" runat="server" Text="Volver" meta:resourcekey="Literal3Resource1"></asp:Literal></a>
            </li>
        </ol>
        <asp:Literal ID="lblmsg" runat="server" Visible="False" Text="
            &lt;div class=&quot;callout callout-success lead&quot;&gt;
            &lt;h4&gt;!Atención!&lt;/h4&gt;
            &lt;p&gt;Datos actualizados&lt;/p&gt;
        &lt;/div&gt;
        " meta:resourcekey="lblmsgResource1"></asp:Literal>
        <asp:Literal ID="lblmsg2" runat="server" Visible="False" Text="
            &lt;div class=&quot;callout callout-danger lead&quot;&gt;
            &lt;h4&gt;!Atención!&lt;/h4&gt;
            &lt;p&gt;Se ha producido un error al guardar los datos&lt;/p&gt;
        &lt;/div&gt;
        " meta:resourcekey="lblmsg2Resource1"></asp:Literal>
    </section>
    <section class="content">

        <div class="box box-primary">
            <div class="box-header with-border">
                <h3 class="box-title">
                    <asp:Literal ID="Literal2" runat="server" meta:resourcekey="Literal2Resource1" Text="Datos de la reclamación"></asp:Literal><%=campeonato %></h3>
            </div>
            <div class="box-body">
                <div class="row">
                    <div class="col-lg-6">
                        <div class="form-group">
                            <label for="exampleInputEmail1">
                                <asp:Literal ID="Literal4" runat="server" meta:resourcekey="Literal4Resource1" Text="Reclamante"></asp:Literal></label>
                            <asp:TextBox ID="tReclamante" class="form-control" runat="server" ReadOnly="True" meta:resourcekey="tReclamanteResource1"></asp:TextBox>
                        </div>

                        <div class="form-group">
                            <label for="exampleInputEmail1">
                                <asp:Literal ID="Literal5" runat="server" meta:resourcekey="Literal5Resource1" Text="Reclamado"></asp:Literal></label>
                            <asp:TextBox ID="tReclamado" class="form-control" runat="server" ReadOnly="True" meta:resourcekey="tReclamadoResource1"></asp:TextBox>
                        </div>

                        <div class="row">
                            <div class="col-lg-6">
                                <div class="form-group">
                                    <label for="exampleInputFile">
                                        <asp:Literal ID="Literal6" runat="server" meta:resourcekey="Literal6Resource1" Text="Acción que se reclama"></asp:Literal></label>
                                    <asp:DropDownList ID="cbAccion" runat="server" class="form-control" ReadOnly="true" meta:resourcekey="cbAccionResource1">
                                        <asp:ListItem meta:resourcekey="ListItemResource1">Maniobra incorrecta</asp:ListItem>
                                        <asp:ListItem meta:resourcekey="ListItemResource2">Adelantamiento ilegal</asp:ListItem>
                                        <asp:ListItem meta:resourcekey="ListItemResource3">Atajos reiterados</asp:ListItem>
                                        <asp:ListItem meta:resourcekey="ListItemResource4">Infracción en boxes</asp:ListItem>
                                        <asp:ListItem meta:resourcekey="ListItemResource5">Otros</asp:ListItem>
                                    </asp:DropDownList>
                                </div>
                                <div class="form-group">
                                    <label for="exampleInputFile">
                                        <asp:Literal ID="Literal7" runat="server" meta:resourcekey="Literal7Resource1" Text="Pérdida de tiempo/posición"></asp:Literal></label>
                                    <asp:DropDownList ID="cbPerdida" runat="server" class="form-control" ReadOnly="true" meta:resourcekey="cbPerdidaResource1">
                                        <asp:ListItem meta:resourcekey="ListItemResource6">Significativa</asp:ListItem>
                                        <asp:ListItem meta:resourcekey="ListItemResource7">Media</asp:ListItem>
                                        <asp:ListItem meta:resourcekey="ListItemResource8">Leve</asp:ListItem>
                                    </asp:DropDownList>
                                </div>
                                <div class="form-group">
                                    <label for="exampleInputFile"><asp:Literal ID="Literal8" runat="server" meta:resourcekey="Literal8Resource1" Text="Daños"></asp:Literal></label>
                                    <asp:DropDownList ID="cbDanos" runat="server" class="form-control" ReadOnly="true" meta:resourcekey="cbDanosResource1">
                                        <asp:ListItem meta:resourcekey="ListItemResource9">Graves</asp:ListItem>
                                        <asp:ListItem meta:resourcekey="ListItemResource10">Medios</asp:ListItem>
                                        <asp:ListItem meta:resourcekey="ListItemResource11">Leves</asp:ListItem>
                                    </asp:DropDownList>
                                </div>
                            </div>

                            <div class="col-lg-6">
                                <div class="form-group">
                                    <label for="exampleInputFile"><asp:Literal ID="Literal9" runat="server" meta:resourcekey="Literal9Resource1" Text="Agravante"></asp:Literal>s</label>
                                    <asp:DropDownList ID="cbAgravantes" runat="server" class="form-control" ReadOnly="true" meta:resourcekey="cbAgravantesResource1">
                                        <asp:ListItem meta:resourcekey="ListItemResource12">No devolver posición</asp:ListItem>
                                        <asp:ListItem meta:resourcekey="ListItemResource13">Incidente en 1ª vuelta</asp:ListItem>
                                        <asp:ListItem meta:resourcekey="ListItemResource14">Incidente en última vuelta</asp:ListItem>
                                        <asp:ListItem meta:resourcekey="ListItemResource15">Lag permanente</asp:ListItem>
                                        <asp:ListItem meta:resourcekey="ListItemResource16">Otros</asp:ListItem>
                                    </asp:DropDownList>
                                </div>
                                <div class="form-group">
                                    <label for="exampleInputFile">
                                        <asp:Literal ID="Literal10" runat="server" meta:resourcekey="Literal10Resource1" Text="Atenuantes"></asp:Literal></label>
                                    <asp:DropDownList ID="cbAtenuantes" runat="server" class="form-control" ReadOnly="true" meta:resourcekey="cbAtenuantesResource1">
                                        <asp:ListItem meta:resourcekey="ListItemResource17">Pedir perdón en sala</asp:ListItem>
                                        <asp:ListItem meta:resourcekey="ListItemResource18">Lag esporádico</asp:ListItem>
                                        <asp:ListItem meta:resourcekey="ListItemResource19">Devolver posición</asp:ListItem>
                                        <asp:ListItem meta:resourcekey="ListItemResource20">Otros</asp:ListItem>
                                    </asp:DropDownList>
                                </div>
                            </div>

                        </div>
                    </div>

                    <div class="col-lg-6">
                        <div class="form-group">
                            <label for="exampleInputEmail1">
                                <asp:Literal ID="Literal11" runat="server" meta:resourcekey="Literal11Resource1" Text="Observaciones"></asp:Literal></label>
                            <asp:TextBox ID="tReclamaciobn" TextMode="MultiLine" class="form-control" runat="server" Height="100px" ReadOnly="True" meta:resourcekey="tReclamaciobnResource1"></asp:TextBox>
                        </div>
                        <div class="form-group">
                            <label for="exampleInputEmail1">
                                <asp:Literal ID="Literal12" runat="server" meta:resourcekey="Literal12Resource1" Text="Prueba de vídeo (hasta un máximo de 5 enlaces de youtube y de duración entre 30 seg. y 2 minutos)"></asp:Literal></label>
                            <asp:TextBox ID="tVideo1" class="form-control" runat="server" ReadOnly="True" meta:resourcekey="tVideo1Resource1"></asp:TextBox>
                            <asp:TextBox ID="tVideo2" class="form-control" runat="server" ReadOnly="True" meta:resourcekey="tVideo2Resource1"></asp:TextBox>
                            <asp:TextBox ID="tVideo3" class="form-control" runat="server" ReadOnly="True" meta:resourcekey="tVideo3Resource1"></asp:TextBox>
                            <asp:TextBox ID="tVideo4" class="form-control" runat="server" ReadOnly="True" meta:resourcekey="tVideo4Resource1"></asp:TextBox>
                            <asp:TextBox ID="tVideo5" class="form-control" runat="server" ReadOnly="True" meta:resourcekey="tVideo5Resource1"></asp:TextBox>
                        </div>
                        <div class="form-group">
                            <label for="exampleInputEmail1">
                                <asp:Literal ID="Literal13" runat="server" meta:resourcekey="Literal13Resource1" Text="Minuto del incidente en el vídeo (sólo para vídeos de retransmisiones)"></asp:Literal></label>
                            <asp:TextBox ID="tMinuto" class="form-control" runat="server" ReadOnly="True" meta:resourcekey="tMinutoResource1"></asp:TextBox>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <div class="box box-success">
            <div class="box-header ui-sortable-handle" style="cursor: move;">
                <i class="fa fa-comments-o"></i>
                <h3 class="box-title">
                    <asp:Literal ID="Literal14" runat="server" meta:resourcekey="Literal14Resource1" Text="Respuestas"></asp:Literal></h3>
            </div>
            <div class="slimScrollDiv" style="position: relative; overflow: hidden; width: auto; min-height: 50px;">
                <div class="box-body chat" id="chat-box" style="overflow: hidden; width: auto; min-height: 50px;">
                    <!-- chat item -->
                    <asp:Repeater ID="repDatos" runat="server">
                        <ItemTemplate>
                            <div class="item">
                                <img src="<%# DameAvatar(DataBinder.Eval(Container.DataItem,"AVATAR"), DataBinder.Eval(Container.DataItem,"USUARIO")) %>" alt="user image" class="online">

                                <p class="message">
                                    <a href="#" class="name">
                                        <small class="text-muted pull-right"><i class="fa fa-clock-o"></i><%# DataBinder.Eval(Container.DataItem,"FECHA") %></small>
                                        <%# DataBinder.Eval(Container.DataItem,"NOMBRE") %> <%# DataBinder.Eval(Container.DataItem,"APELLIDOS") %>
                                    </a>
                                    <%# DataBinder.Eval(Container.DataItem,"RESPUESTA") %>
                                </p>
                            </div>
                        </ItemTemplate>
                    </asp:Repeater>
                </div>
                <div class="slimScrollBar" style="background: rgb(0, 0, 0) none repeat scroll 0% 0%; width: 7px; position: absolute; top: 0px; opacity: 0.4; display: none; border-radius: 7px; z-index: 99; right: 1px; height: 187.126px;"></div>
                <div class="slimScrollRail" style="width: 7px; height: 100%; position: absolute; top: 0px; display: none; border-radius: 7px; background: rgb(51, 51, 51) none repeat scroll 0% 0%; opacity: 0.2; z-index: 90; right: 1px;"></div>
            </div>
            <!-- /.chat -->
            <div class="box-footer">
                <div class="input-group">
                    <asp:TextBox ID="tMensaje" class="form-control" runat="server" meta:resourcekey="tMensajeResource1"></asp:TextBox>
                    <div class="input-group-btn">
                        <asp:Button ID="bEnviar" CssClass="btn btn-success" runat="server" Text="Enviar" OnClick="bEnviar_Click" meta:resourcekey="bEnviarResource1" />
                    </div>
                </div>
            </div>
        </div>

    </section>
</asp:Content>
