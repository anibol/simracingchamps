<%@ Page Title="" Language="C#" MasterPageFile="~/gestion/irtadmin.Master" AutoEventWireup="true" CodeBehind="noticias.aspx.cs" Inherits="IRT.gestion.noticias" %>

<%@ Register Assembly="CKEditor.NET" Namespace="CKEditor.NET" TagPrefix="CKEditor" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .cke_button_button1 .cke_icon {
            display: none !important; /*without icon*/
        }

        .cke_button_button1 .cke_label {
            display: inline !important; /*show the text label*/
        }


        .cke_button_button2 .cke_icon {
            display: none !important; /*without icon*/
        }

        .cke_button_button2 .cke_label {
            display: inline !important; /*show the text label*/
        }

        .cke_button_button3 .cke_icon {
            display: none !important; /*without icon*/
        }

        .cke_button_button3 .cke_label {
            display: inline !important; /*show the text label*/
        }

        .cke_button_button4 .cke_icon {
            display: none !important; /*without icon*/
        }

        .cke_button_button4 .cke_label {
            display: inline !important; /*show the text label*/
        }
        .cke_button_button5 .cke_icon {
            display: none !important; /*without icon*/
        }

        .cke_button_button5 .cke_label {
            display: inline !important; /*show the text label*/
        }
        .cke_button_button6 .cke_icon {
            display: none !important; /*without icon*/
        }

        .cke_button_button6 .cke_label {
            display: inline !important; /*show the text label*/
        }
        .cke_button_button7 .cke_icon {
            display: none !important; /*without icon*/
        }

        .cke_button_button7 .cke_label {
            display: inline !important; /*show the text label*/
        }
        .cke_button_button8 .cke_icon {
            display: none !important; /*without icon*/
        }

        .cke_button_button8 .cke_label {
            display: inline !important; /*show the text label*/
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <section class="content-header">
        <div class="col-xs-12">
            <div class="row">
                <h1>
                    <asp:Literal ID="Literal1" runat="server" Text="Gestion de noticias"></asp:Literal>&nbsp;<a href="noticias.aspx?id=<%= Request.QueryString["id"].ToString() %>&n=1" class="btn btn-xs btn-success"><asp:Literal ID="Literal7" runat="server" Text="Nueva Noticia"></asp:Literal></a>
                    <small>
                        <asp:Literal ID="Literal2" runat="server" Text="Aqui puedes gestionar las noticias relacionadas con el campeonato"></asp:Literal></small>
                </h1>

                <asp:Literal ID="lblmsg" runat="server" Visible="False" Text="
            &lt;div class=&quot;callout callout-success lead&quot;&gt;
            &lt;h4&gt;!Atención!&lt;/h4&gt;
            &lt;p&gt;Datos actualizados&lt;/p&gt;
        &lt;/div&gt;"></asp:Literal>
                <div id="panerror" class="callout callout-danger lead" runat="server" visible="false">
                    <h4>
                        <asp:Literal ID="lblmsg2" runat="server" Text="¡Error!" meta:resourcekey="lblmsg2Resource1"></asp:Literal></h4>
                    <p>
                        <asp:Literal ID="lblmsg2b" runat="server" Text="Se ha producido un error al guardar los cambios" meta:resourcekey="lblmsg2bResource1"></asp:Literal>
                    </p>
                </div>
            </div>
            <div class="row">
                <div class="col-xs-12">
                    <asp:Label CssClass="alert alert-danger" ID="lblmesg" runat="server" Visible="False"></asp:Label>
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
                            <asp:Literal ID="Literal8" runat="server" Text="Listado de noticias"></asp:Literal></h3>
                    </div>
                    <div class="box-body">
                        <asp:Repeater ID="repNoticias" runat="server">
                            <HeaderTemplate>
                                <table class="table table-bordered table-hover">
                                    <thead>
                                        <tr>
                                            <th>
                                                <asp:Literal ID="Literal13" runat="server" Text="Fecha"></asp:Literal></th>
                                            <th>
                                                <asp:Literal ID="Literal14" runat="server" Text="Título"></asp:Literal></th>
                                            <th>
                                                <asp:Literal ID="Literal15" runat="server" Text="Estado"></asp:Literal></th>
                                            <th>
                                                <asp:Literal ID="Literal17" runat="server" Text="Opciones"></asp:Literal></th>
                                        </tr>
                                    </thead>
                                    <tbody>
                            </HeaderTemplate>
                            <ItemTemplate>
                                <tr>
                                    <td><%# DataBinder.Eval(Container.DataItem,"FECHA") %></td>
                                    <td><%# DataBinder.Eval(Container.DataItem,"TITULO") %></td>
                                    <td><%# DameEstado(DataBinder.Eval(Container.DataItem,"PUBLICADA"),DataBinder.Eval(Container.DataItem,"VALIDADA")) %></td>
                                    <td><a href='noticias.aspx?id=<%= Request.QueryString["id"].ToString() %>&ed=<%# DataBinder.Eval(Container.DataItem,"ID") %>' class="btn btn-xs btn-primary">
                                        <asp:Literal ID="Literal18" runat="server" Text="Editar"></asp:Literal></a>
                                        <a target="_blank" href='../noticia.aspx?ev=<%= Request.QueryString["id"].ToString() %>&id=<%# DataBinder.Eval(Container.DataItem,"ID") %>' class="btn btn-xs btn-success">
                                            <asp:Literal ID="Literal9" runat="server" Text="Preview"></asp:Literal></a>
                                        <% if (Session["usr"].ToString() == "admin@simracingchamps.net")
                                            { %>
                                        <a class="btn btn-xs btn-warning" href="noticias.aspx?id=<%# DataBinder.Eval(Container.DataItem,"ID") %>&v=1&ev=<%= Request.QueryString["id"].ToString() %>">
                                            <asp:Literal ID="Literal31" runat="server" Text="Validar"></asp:Literal></a>
                                        <% } %>
                                    </td>
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
        <asp:Panel ID="panDatos" runat="server" Visible="False">
            <div class="row">
                <div class="col-xs-12">
                    <asp:Label CssClass="label label-info" ID="Label1" runat="server" Visible="False"></asp:Label>
                    <div class="box">
                        <div class="box-header">
                            <h3 class="box-title">
                                <asp:Literal ID="Literal4" runat="server" Text="Añadir/Editar Noticia"></asp:Literal></h3>

                        </div>
                        <!-- /.box-header -->

                        <div class="box-body">
                            <div class="row">
                                <div class="col-xs-12">
                                    <div class="form-group">
                                        <label for="exampleInputPassword1">
                                            <asp:Literal ID="Literal22" runat="server" Text="Título"></asp:Literal>:</label>
                                        <asp:TextBox ID="tTitulo" CssClass="form-control" runat="server" MaxLength="250"></asp:TextBox>
                                    </div>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-xs-12">
                                    <div class="form-group">
                                        <label for="exampleInputPassword1">
                                            <asp:Literal ID="Literal3" runat="server" Text="Noticia"></asp:Literal>:</label>
                                        <CKEditor:CKEditorControl ID="tDescripcion" runat="server"></CKEditor:CKEditorControl>
                                    </div>
                                </div>
                            </div>
                            <div class="row">
                                <p>Una vez adjuntadas las imágenes y guardada la noticia puedes usas los botones del editor "Imagen 1", "Imagen 2", "Imagen 3", "Imagen 4" para incluir en la noticia las imágenes que adjuntes</p>
                                <div class="col-md-4 col-xs-12">
                                    <div class="form-group">
                                        <label for="exampleInputPassword1">
                                            <asp:Literal ID="Literal5" runat="server" Text="Imagen 1 (aparecerá además al principio de la noticia como imágen principal)"></asp:Literal>:</label>
                                        <asp:FileUpload ID="fuFoto1" CssClass="form-control" runat="server" />
                                        <%=fotoactual1 %>
                                    </div>
                                </div>
                                <div class="col-md-4 col-xs-12">
                                    <div class="form-group">
                                        <label for="exampleInputPassword1">
                                            <asp:Literal ID="Literal10" runat="server" Text="Imagen 2"></asp:Literal>:</label>
                                        <asp:FileUpload ID="fuFoto2" CssClass="form-control" runat="server" />
                                        <%=fotoactual2 %>
                                    </div>
                                </div>
                                <div class="col-md-4 col-xs-12">
                                    <div class="form-group">
                                        <label for="exampleInputPassword1">
                                            <asp:Literal ID="Literal11" runat="server" Text="Imagen 3"></asp:Literal>:</label>
                                        <asp:FileUpload ID="fuFoto3" CssClass="form-control" runat="server" />
                                        <%=fotoactual3 %>
                                    </div>
                                </div>
                                <div class="col-md-4 col-xs-12">
                                    <div class="form-group">
                                        <label for="exampleInputPassword1">
                                            <asp:Literal ID="Literal12" runat="server" Text="Imagen 4"></asp:Literal>:</label>
                                        <asp:FileUpload ID="fuFoto4" CssClass="form-control" runat="server" />
                                        <%=fotoactual4 %>
                                    </div>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-md-4 col-xs-12">
                                    <div class="form-group">
                                        <label for="exampleInputPassword1">
                                            <asp:Literal ID="Literal51" runat="server" Text="Imagen 5"></asp:Literal>:</label>
                                        <asp:FileUpload ID="fuFoto5" CssClass="form-control" runat="server" />
                                        <%=fotoactual5 %>
                                    </div>
                                </div>
                                <div class="col-md-4 col-xs-12">
                                    <div class="form-group">
                                        <label for="exampleInputPassword1">
                                            <asp:Literal ID="Literal52" runat="server" Text="Imagen 6"></asp:Literal>:</label>
                                        <asp:FileUpload ID="fuFoto6" CssClass="form-control" runat="server" />
                                        <%=fotoactual6 %>
                                    </div>
                                </div>
                                <div class="col-md-4 col-xs-12">
                                    <div class="form-group">
                                        <label for="exampleInputPassword1">
                                            <asp:Literal ID="Literal54" runat="server" Text="Imagen 7"></asp:Literal>:</label>
                                        <asp:FileUpload ID="fuFoto7" CssClass="form-control" runat="server" />
                                        <%=fotoactual7 %>
                                    </div>
                                </div>
                                <div class="col-md-4 col-xs-12">
                                    <div class="form-group">
                                        <label for="exampleInputPassword1">
                                            <asp:Literal ID="Literal57" runat="server" Text="Imagen 8"></asp:Literal>:</label>
                                        <asp:FileUpload ID="fuFoto8" CssClass="form-control" runat="server" />
                                        <%=fotoactual8 %>
                                    </div>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-xs-6">
                                    <div class="form-group">
                                        <label for="exampleInputPassword1">
                                            <asp:Literal ID="Literal6" runat="server" Text="Video (aparecerá al final de la noticia)"></asp:Literal>:</label>
                                        <asp:TextBox ID="tVideo" CssClass="form-control" runat="server" MaxLength="250"></asp:TextBox>
                                    </div>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-xs-12">
                                    <asp:Button ID="bGuardar" CssClass="btn btn-info" runat="server" Text="Guardar" OnClick="bGuardar_Click" meta:resourcekey="bGuardarResource1" />&nbsp;
                                    <asp:LinkButton ID="bPreview" CssClass="btn btn-success" runat="server" Visible="false" OnClick="bPreview_Click1">Preview</asp:LinkButton>&nbsp;
                                    <asp:Button ID="bPublicar" CssClass="btn btn-info" runat="server" Text="Publicar" Visible="false" OnClick="bPublicar_Click" />&nbsp;
                                    <asp:Button ID="bBorrar" CssClass="btn btn-danger" runat="server" Text="Borrar" Visible="false" OnClick="bBorrar_Click" meta:resourcekey="bBorrarResource1" />
                                    <ajaxToolkit:ConfirmButtonExtender ID="bEliminar_ConfirmButtonExtender" runat="server" BehaviorID="bEliminar_ConfirmButtonExtender" ConfirmText="¿Estás segur@?" TargetControlID="bBorrar" />
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </asp:Panel>
    </section>
</asp:Content>
