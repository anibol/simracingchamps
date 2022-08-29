<%@ Page Title="" Language="C#" MasterPageFile="~/driver/driver.Master" AutoEventWireup="true" CodeBehind="respuestas.aspx.cs" Inherits="IRT.driver.respuestas" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <section class="content-header">
        <h1>
            <asp:Literal ID="Literal1" runat="server" Text="Reclamaciones"></asp:Literal>
        </h1>
         <ol class="breadcrumb">
            <li>
                <!-- Button trigger modal -->
                <a style="color:white;" href="reclamaciones.aspx?id=<%= Request.QueryString["id"].ToString() %>" class="btn btn-xs btn-success"><asp:Literal ID="Literal3" runat="server" Text="Volver"></asp:Literal></a>
            </li>
        </ol>
        <asp:Literal ID="lblmsg" runat="server" Visible="False" Text="
            &lt;div class=&quot;callout callout-success lead&quot;&gt;
            &lt;h4&gt;!Atención!&lt;/h4&gt;
            &lt;p&gt;Datos actualizados&lt;/p&gt;
        &lt;/div&gt;
        "></asp:Literal>
        <asp:Literal ID="lblmsg2" runat="server" Visible="False" Text="
            &lt;div class=&quot;callout callout-danger lead&quot;&gt;
            &lt;h4&gt;!Atención!&lt;/h4&gt;
            &lt;p&gt;Se ha producido un error al guardar los datos&lt;/p&gt;
        &lt;/div&gt;
        "></asp:Literal>
    </section>
    <section class="content">

        <div class="box box-primary">
            <div class="box-header with-border">
                <h3 class="box-title">Datos de la reclamación<%=campeonato %></h3>
            </div>
            <div class="box-body">
                <div class="row">
                    <div class="col-lg-6">
                        <div class="form-group">
                            <label for="exampleInputEmail1">Reclamante</label>
                            <asp:TextBox ID="tReclamante" class="form-control" runat="server" ReadOnly="true"></asp:TextBox>
                        </div>

                        <div class="form-group">
                            <label for="exampleInputEmail1">Reclamado</label>
                            <asp:TextBox ID="tReclamado" class="form-control" runat="server" ReadOnly="true"></asp:TextBox>
                        </div>

                        <div class="row">
                            <div class="col-lg-6">
                                <div class="form-group">
                                    <label for="exampleInputFile">Acción que se reclama</label>
                                    <asp:DropDownList ID="cbAccion" runat="server" class="form-control" ReadOnly="true">
                                        <asp:ListItem>Maniobra incorrecta</asp:ListItem>
                                        <asp:ListItem>Adelantamiento ilegal</asp:ListItem>
                                        <asp:ListItem>Atajos reiterados</asp:ListItem>
                                        <asp:ListItem>Infracción en boxes</asp:ListItem>
                                        <asp:ListItem>Otros</asp:ListItem>
                                    </asp:DropDownList>
                                </div>
                                <div class="form-group">
                                    <label for="exampleInputFile">Pérdida de tiempo/posición</label>
                                    <asp:DropDownList ID="cbPerdida" runat="server" class="form-control" ReadOnly="true">
                                        <asp:ListItem>Significativa</asp:ListItem>
                                        <asp:ListItem>Media</asp:ListItem>
                                        <asp:ListItem>Leve</asp:ListItem>
                                    </asp:DropDownList>
                                </div>
                                <div class="form-group">
                                    <label for="exampleInputFile">Daños</label>
                                    <asp:DropDownList ID="cbDanos" runat="server" class="form-control" ReadOnly="true">
                                        <asp:ListItem>Graves</asp:ListItem>
                                        <asp:ListItem>Medios</asp:ListItem>
                                        <asp:ListItem>Leves</asp:ListItem>
                                    </asp:DropDownList>
                                </div>
                            </div>

                            <div class="col-lg-6">
                                <div class="form-group">
                                    <label for="exampleInputFile">Agravantes</label>
                                    <asp:DropDownList ID="cbAgravantes" runat="server" class="form-control" ReadOnly="true">
                                        <asp:ListItem>No devolver posición</asp:ListItem>
                                        <asp:ListItem>Incidente en 1ª vuelta</asp:ListItem>
                                        <asp:ListItem>Incidente en última vuelta</asp:ListItem>
                                        <asp:ListItem>Lag permanente</asp:ListItem>
                                        <asp:ListItem>Otros</asp:ListItem>
                                    </asp:DropDownList>
                                </div>
                                <div class="form-group">
                                    <label for="exampleInputFile">Atenuantes</label>
                                    <asp:DropDownList ID="cbAtenuantes" runat="server" class="form-control" ReadOnly="true">
                                        <asp:ListItem>Pedir perdón en sala</asp:ListItem>
                                        <asp:ListItem>Lag esporádico</asp:ListItem>
                                        <asp:ListItem>Devolver posición</asp:ListItem>
                                        <asp:ListItem>Otros</asp:ListItem>
                                    </asp:DropDownList>
                                </div>
                            </div>

                        </div>
                    </div>

                    <div class="col-lg-6">
                        <div class="form-group">
                            <label for="exampleInputEmail1">Observaciones</label>
                            <asp:TextBox ID="tReclamaciobn" TextMode="MultiLine" class="form-control" runat="server" Height="100px" ReadOnly="true"></asp:TextBox>
                        </div>
                        <div class="form-group">
                            <label for="exampleInputEmail1">Prueba de vídeo (hasta un máximo de 5 enlaces de youtube y de duración entre 30 seg. y 2 minutos)</label>
                            <asp:TextBox ID="tVideo1" class="form-control" runat="server" ReadOnly="true"></asp:TextBox>
                            <asp:TextBox ID="tVideo2" class="form-control" runat="server" ReadOnly="true"></asp:TextBox>
                            <asp:TextBox ID="tVideo3" class="form-control" runat="server" ReadOnly="true"></asp:TextBox>
                            <asp:TextBox ID="tVideo4" class="form-control" runat="server" ReadOnly="true"></asp:TextBox>
                            <asp:TextBox ID="tVideo5" class="form-control" runat="server" ReadOnly="true"></asp:TextBox>
                        </div>
                        <div class="form-group">
                            <label for="exampleInputEmail1">Minuto del incidente en el vídeo (sólo para vídeos de retransmisiones)</label>
                            <asp:TextBox ID="tMinuto" class="form-control" runat="server" ReadOnly="true"></asp:TextBox>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <div class="box box-success">
            <div class="box-header ui-sortable-handle" style="cursor: move;">
                <i class="fa fa-comments-o"></i>
                <h3 class="box-title">Respuestas</h3>
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
                    <asp:TextBox ID="tMensaje" class="form-control" runat="server"></asp:TextBox>
                    <div class="input-group-btn">
                        <asp:Button ID="bEnviar" CssClass="btn btn-success" runat="server" Text="Enviar" OnClick="bEnviar_Click" />
                    </div>
                </div>
            </div>
        </div>

    </section>
</asp:Content>
