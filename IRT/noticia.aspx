<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="noticia.aspx.cs" Inherits="IRT.noticia" meta:resourcekey="PageResource1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        .miboton {
            border-radius: 0px;
            width: 80px;
            color: white;
            font-weight: bold;
            padding: 0px;
            background-color: gainsboro;
        }
    </style>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div id="carousel-area">
        <div id="carousel-slider" class="carousel slide" data-ride="carousel">
            <div class="carousel-inner" role="listbox">
                <%=carrusel %>
            </div>


        </div>
    </div>
    <section id="content" class="section" style="padding-top: 10px">
        <div class="container">
            <div class="row">
                <div class="col-md-12 col-xs-12">
                    <h2 class="section-title" data-wow-delay="0s" style="visibility: visible; -webkit-animation-delay: 0s; -moz-animation-delay: 0s; animation-delay: 0s; text-align: left;">
                        <asp:Literal ID="Literal3" runat="server" Text="Noticias" meta:resourcekey="Literal3Resource1"></asp:Literal></h2>
                </div>
                <div class="col-md-8 col-xs-12" style="padding-top: 10px;">
                    <asp:Repeater ID="repNoticia" runat="server">
                        <ItemTemplate>
                            <div class="blog-post2 single-gallery">
                                <!-- Post feature-inner -->
                                <div class="feature-inner">
                                    <a class="lightbox" href="<%# DameFotoNoticia(DataBinder.Eval(Container.DataItem,"ID"), DataBinder.Eval(Container.DataItem,"IMAGEN")) %>">
                                        <img src="<%# DameFotoNoticia(DataBinder.Eval(Container.DataItem,"ID"), DataBinder.Eval(Container.DataItem,"IMAGEN")) %>" alt=""></a>
                                </div>
                                <!-- End Post feature-inner -->
                                <!-- Post format icon -->
                                <div class="post-format">
                                    <span>
                                        <a href="#"><i class="icon-picture"></i></a>
                                    </span>
                                </div>
                                <!-- Post Content -->
                                <div class="post-content">
                                    <h3 class="post-title"><a href="#"><%# DataBinder.Eval(Container.DataItem,"TITULO") %></a></h3>
                                    <div class="meta">
                                        <span class="meta-part"><a href="#"><i class="icon-user"></i><%# DataBinder.Eval(Container.DataItem,"AUTOR") %></a></span>
                                        <span class="meta-part"><a href="#"><i class="icon-calendar"></i><%# DataBinder.Eval(Container.DataItem,"FECHA") %></a></span>
                                        <span class="meta-part"><a href="#"><i class="icon-event"></i>Blog</a></span>
                                    </div>
                                    <%# DataBinder.Eval(Container.DataItem,"TEXTO") %>
                                     <%# Youtube(DataBinder.Eval(Container.DataItem,"VIDEO")) %>
                                    <p>&nbsp;</p>
                                    <!-- Share social -->
                                    <div class="share">
                                        <div class="social-link">
                                            <span>
                                                <asp:Literal ID="Literal4" runat="server" Text="Compartir" meta:resourcekey="compartir"></asp:Literal></span>
                                            <a class="twitter" target="_blank" data-original-title="twitter" href="https://twitter.com/share?url=http://simracingchamps.net/noticia.aspx?id=<%= Request.QueryString["id"].ToString() %>&ev=<%=Request.QueryString["ev"].ToString() %>" data-toggle="tooltip" data-placement="top"><i class="fa fa-twitter"></i></a>
                                            <a class="facebook" target="_blank" data-original-title="facebook" href="https://www.facebook.com/sharer/sharer.php?u=http://simracingchamps.net/noticia.aspx?id=<%= Request.QueryString["id"].ToString() %>&ev=<%=Request.QueryString["ev"].ToString() %>" data-toggle="tooltip" data-placement="top"><i class="fa fa-facebook"></i></a>
                                            <a class="google" target="_blank" data-original-title="google-plus" href="https://plus.google.com/share?url=http://simracingchamps.net/noticia.aspx?id=<%= Request.QueryString["id"].ToString() %>&ev=<%=Request.QueryString["ev"].ToString() %>" data-toggle="tooltip" data-placement="top"><i class="fa fa-google-plus"></i></a>
                                        </div>

                                    </div>
                                </div>
                                <!-- Post Content -->
                            </div>
                        </ItemTemplate>
                    </asp:Repeater>
                </div>
                <aside id="sidebar" class="col-xs-12 col-md-4 right-sidebar">
                    <div class="widget widget-social">
                        <h5 class="widget-title"><i class="fa fa-info-circle"></i>
                            <asp:Literal ID="Literal1" runat="server" meta:resourcekey="Literal1Resource1" Text="Publica tu campeonato"></asp:Literal></h5>
                        <p>
                            <asp:Literal ID="Literal2" runat="server" meta:resourcekey="Literal2Resource1" Text="Si eres organizador, tienes un equipo o quieres montar una competición con tus amigos, SimRacingChamps te ofrece una herramienta &lt;b&gt;sencilla y gratuita&lt;/b&gt; para la organización de campeonatos de SimRacing.&lt;br /&gt;¿Quieres saber cómo? &lt;a href=&quot;help.aspx&quot;&gt;Sigue estos sencillos pasos&lt;/a&gt;"></asp:Literal>
                        </p>
                    </div>
                    <div class="widget">
                        <h5 class="widget-title"><i class="fa fa-gamepad"></i>
                            <asp:Literal ID="Literal8" runat="server" Text="Publicidad"></asp:Literal></h5>
                        <p><a target="_blank" href="https://www.instant-gaming.com/igr/simracingchamps/">Tus juegos en Instant-Gaming al mejor precio</a></p>
                        <iframe src="https://www.instant-gaming.com/affgames/igr2989455/296x200?prod_ids=2006" scrolling="no" frameborder="0" style="border: 1px solid #ccc; border-radius: 5px; overflow: hidden; width: 296px; height: 200px;" allowtransparency="true"></iframe>
                        <iframe src="https://www.instant-gaming.com/affgames/igr2989455/296x200?prod_ids=891" scrolling="no" frameborder="0" style="border: 1px solid #ccc; border-radius: 5px; overflow: hidden; width: 296px; height: 200px;" allowtransparency="true"></iframe>
                        <iframe src="https://www.instant-gaming.com/affgames/igr2989455/296x200?prod_ids=2143" scrolling="no" frameborder="0" style="border: 1px solid #ccc; border-radius: 5px; overflow: hidden; width: 296px; height: 200px;" allowtransparency="true"></iframe>
                        <script async src="//pagead2.googlesyndication.com/pagead/js/adsbygoogle.js"></script>
                        <!-- SRC_Lateral -->
                        <ins class="adsbygoogle"
                            style="display: block"
                            data-ad-client="ca-pub-1139835080906338"
                            data-ad-slot="3506349370"
                            data-ad-format="auto"></ins>
                        <script>
                            (adsbygoogle = window.adsbygoogle || []).push({});
                        </script>
                    </div>
                    <div class="widget widget-popular-posts">
                        <h5 class="widget-title">Todas las noticias</h5>
                        <ul class="posts-list">
                            <asp:Repeater ID="repTodasNoticias" runat="server">
                                <ItemTemplate>
                                    <li>
                                        <div class="widget-thumb">
                                            <a href="noticia.aspx?id=<%# DataBinder.Eval(Container.DataItem,"ID") %>&ev=<%# DataBinder.Eval(Container.DataItem,"IDEVENTO") %>">
                                                <img style="height: 86px; width: 80px;" src="Content/img/noticias/<%# DataBinder.Eval(Container.DataItem,"ID") %>/<%# DataBinder.Eval(Container.DataItem,"IMAGEN") %>" alt=""></a>
                                        </div>
                                        <div class="widget-content" sstyle="line-height:14px;font-size:13px;">
                                            <a href="noticia.aspx?id=<%# DataBinder.Eval(Container.DataItem,"ID") %>&ev=<%# DataBinder.Eval(Container.DataItem,"IDEVENTO") %>"><%# DataBinder.Eval(Container.DataItem,"TITULO") %></a>
                                            <span><i class="icon-user"></i><%# DataBinder.Eval(Container.DataItem,"AUTOR") %></span>
                                            <span><i class="icon-calendar"></i><%# DataBinder.Eval(Container.DataItem,"FECHA") %></span>
                                        </div>
                                        <div class="clearfix"></div>
                                    </li>
                                </ItemTemplate>
                            </asp:Repeater>
                        </ul>
                    </div>
                </aside>
            </div>
        </div>
    </section>

</asp:Content>
