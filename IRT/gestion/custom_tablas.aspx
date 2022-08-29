<%@ Page Title="" Language="C#" MasterPageFile="~/gestion/irtadmin.Master" AutoEventWireup="true" CodeBehind="custom_tablas.aspx.cs" Inherits="IRT.gestion.custom_tablas" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <section class="content-header">
        <h1>
            <asp:Literal ID="Literal6" runat="server" Text="Gestión de Tablas de Puntos" ></asp:Literal>&nbsp;<a href="custom_tablas.aspx?n=1" class="btn btn-xs btn-success"><asp:Literal ID="Literal5" runat="server" Text="Nueva Tabla"></asp:Literal></a>
        </h1>
        <ol class="breadcrumb">
            <li class="active">
                <asp:Literal ID="Literal1" runat="server" Text="Ayuda" meta:resourcekey="Literal1Resource1"></asp:Literal></li>
        </ol>

        <asp:Literal ID="lblmsg" runat="server" Visible="False" Text="
            &lt;div class=&quot;callout callout-success lead&quot;&gt;
            &lt;h4&gt;!Atención!&lt;/h4&gt;
            &lt;p&gt;Datos actualizados&lt;/p&gt;
        &lt;/div&gt;
        "
            meta:resourcekey="lblmsgResource1"></asp:Literal>
        <div id="panerror" class="callout callout-danger lead" runat="server" visible="false">
            <h4>
                <asp:Literal ID="lblmsg2" runat="server" Text="¡Error!" meta:resourcekey="lblmsg2Resource1"></asp:Literal></h4>
            <p>
                <asp:Literal ID="lblmsg2b" runat="server" Text="Se ha producido un error al guardar los cambios" meta:resourcekey="lblmsg2bResource1"></asp:Literal></p>
        </div>
    </section>

    <section class="content">

        <div class="row">
            <div class="col-xs-12">
                <asp:Label CssClass="label label-info" ID="lblmesg" runat="server" Visible="False" meta:resourcekey="lblmesgResource1"></asp:Label>
                <div class="box">
                    <div class="box-header">
                        <h3 class="box-title">
                            <asp:Literal ID="Literal2" runat="server" Text="Listado de Tablas de Puntos"></asp:Literal></h3>
                    </div>
                    <div class="box-body">
                        <asp:Repeater ID="repCircuitos" runat="server">
                            <HeaderTemplate>
                                <table class="table table-bordered table-hover">
                                    <thead>
                                        <tr>
                                            <th>
                                                <asp:Literal ID="Literal13" runat="server" Text="Tabla" meta:resourcekey="Literal13Resource1"></asp:Literal></th>
                                            <th>
                                                <asp:Literal ID="Literal17" runat="server" Text="Opciones" meta:resourcekey="Literal17Resource1"></asp:Literal></th>
                                        </tr>
                                    </thead>
                                    <tbody>
                            </HeaderTemplate>
                            <ItemTemplate>
                                <tr>
                                    <td><%# DataBinder.Eval(Container.DataItem,"TABLA") %></td>
                                    <td><a href='custom_tablas.aspx?ed=<%# DataBinder.Eval(Container.DataItem,"ID") %>' class="btn btn-xs btn-primary">
                                        <asp:Literal ID="Literal18" runat="server" Text="Editar" meta:resourcekey="Literal18Resource1"></asp:Literal></a></td>
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
                    <asp:Label CssClass="label label-info" ID="Label1" runat="server" Visible="False" meta:resourcekey="Label1Resource1"></asp:Label>
                    <div class="box">
                        <div class="box-header">
                            <h3 class="box-title">
                                <asp:Literal ID="Literal4" runat="server" Text="Añadir/Editar Tabla" meta:resourcekey="Literal4Resource1"></asp:Literal></h3>
                        </div>
                        <!-- /.box-header -->

                        <div class="box-body">
                            <div class="row">
                                <div class="col-xs-8">
                                    <div class="form-group">
                                        <label for="exampleInputPassword1">
                                            <asp:Literal ID="Literal22" runat="server" Text="Tabla"></asp:Literal>:</label>
                                        <asp:TextBox ID="tNombre" CssClass="form-control" runat="server" MaxLength="250" meta:resourcekey="tNombreResource1"></asp:TextBox>
                                    </div>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-xs-12">
                                    <div class="form-group">
                                        <table>
                                            <thead>
                                                <tr>
                                                    <th>Posición</th>
                                                    <th>Puntos</th>
                                                </tr>
                                            </thead>
                                            <tbody>
                                                <tr>
                                                    <td>1</td>
                                                    <td>
                                                        <asp:TextBox ID="TextBox1" CssClass="form-control" runat="server" MaxLength="250" Text="0"></asp:TextBox></td>
                                                </tr>
                                                <tr>
                                                    <td>2</td>
                                                    <td>
                                                        <asp:TextBox ID="TextBox2" CssClass="form-control" runat="server" MaxLength="250" Text="0"></asp:TextBox></td>
                                                </tr><tr>
                                                    <td>3</td>
                                                    <td>
                                                        <asp:TextBox ID="TextBox3" CssClass="form-control" runat="server" MaxLength="250" Text="0"></asp:TextBox></td>
                                                </tr><tr>
                                                    <td>4</td>
                                                    <td>
                                                        <asp:TextBox ID="TextBox4" CssClass="form-control" runat="server" MaxLength="250" Text="0"></asp:TextBox></td>
                                                </tr><tr>
                                                    <td>5</td>
                                                    <td>
                                                        <asp:TextBox ID="TextBox5" CssClass="form-control" runat="server" MaxLength="250" Text="0"></asp:TextBox></td>
                                                </tr><tr>
                                                    <td>6</td>
                                                    <td>
                                                        <asp:TextBox ID="TextBox6" CssClass="form-control" runat="server" MaxLength="250" Text="0"></asp:TextBox></td>
                                                </tr><tr>
                                                    <td>7</td>
                                                    <td>
                                                        <asp:TextBox ID="TextBox7" CssClass="form-control" runat="server" MaxLength="250" Text="0"></asp:TextBox></td>
                                                </tr><tr>
                                                    <td>8</td>
                                                    <td>
                                                        <asp:TextBox ID="TextBox8" CssClass="form-control" runat="server" MaxLength="250" Text="0"></asp:TextBox></td>
                                                </tr><tr>
                                                    <td>9</td>
                                                    <td>
                                                        <asp:TextBox ID="TextBox9" CssClass="form-control" runat="server" MaxLength="250" Text="0"></asp:TextBox></td>
                                                </tr><tr>
                                                    <td>10</td>
                                                    <td>
                                                        <asp:TextBox ID="TextBox10" CssClass="form-control" runat="server" MaxLength="250" Text="0"></asp:TextBox></td>
                                                </tr><tr>
                                                    <td>11</td>
                                                    <td>
                                                        <asp:TextBox ID="TextBox11" CssClass="form-control" runat="server" MaxLength="250" Text="0"></asp:TextBox></td>
                                                </tr><tr>
                                                    <td>12</td>
                                                    <td>
                                                        <asp:TextBox ID="TextBox12" CssClass="form-control" runat="server" MaxLength="250" Text="0"></asp:TextBox></td>
                                                </tr><tr>
                                                    <td>13</td>
                                                    <td>
                                                        <asp:TextBox ID="TextBox13" CssClass="form-control" runat="server" MaxLength="250" Text="0"></asp:TextBox></td>
                                                </tr><tr>
                                                    <td>14</td>
                                                    <td>
                                                        <asp:TextBox ID="TextBox14" CssClass="form-control" runat="server" MaxLength="250" Text="0"></asp:TextBox></td>
                                                </tr><tr>
                                                    <td>15</td>
                                                    <td>
                                                        <asp:TextBox ID="TextBox15" CssClass="form-control" runat="server" MaxLength="250" Text="0"></asp:TextBox></td>
                                                </tr><tr>
                                                    <td>16</td>
                                                    <td>
                                                        <asp:TextBox ID="TextBox16" CssClass="form-control" runat="server" MaxLength="250" Text="0"></asp:TextBox></td>
                                                </tr><tr>
                                                    <td>17</td>
                                                    <td>
                                                        <asp:TextBox ID="TextBox17" CssClass="form-control" runat="server" MaxLength="250" Text="0"></asp:TextBox></td>
                                                </tr><tr>
                                                    <td>18</td>
                                                    <td>
                                                        <asp:TextBox ID="TextBox18" CssClass="form-control" runat="server" MaxLength="250" Text="0"></asp:TextBox></td>
                                                </tr><tr>
                                                    <td>19</td>
                                                    <td>
                                                        <asp:TextBox ID="TextBox19" CssClass="form-control" runat="server" MaxLength="250" Text="0"></asp:TextBox></td>
                                                </tr><tr>
                                                    <td>20</td>
                                                    <td>
                                                        <asp:TextBox ID="TextBox20" CssClass="form-control" runat="server" MaxLength="250" Text="0"></asp:TextBox></td>
                                                </tr><tr>
                                                    <td>21</td>
                                                    <td>
                                                        <asp:TextBox ID="TextBox21" CssClass="form-control" runat="server" MaxLength="250" Text="0"></asp:TextBox></td>
                                                </tr><tr>
                                                    <td>22</td>
                                                    <td>
                                                        <asp:TextBox ID="TextBox22" CssClass="form-control" runat="server" MaxLength="250" Text="0"></asp:TextBox></td>
                                                </tr><tr>
                                                    <td>23</td>
                                                    <td>
                                                        <asp:TextBox ID="TextBox23" CssClass="form-control" runat="server" MaxLength="250" Text="0"></asp:TextBox></td>
                                                </tr><tr>
                                                    <td>24</td>
                                                    <td>
                                                        <asp:TextBox ID="TextBox24" CssClass="form-control" runat="server" MaxLength="250" Text="0"></asp:TextBox></td>
                                                </tr><tr>
                                                    <td>25</td>
                                                    <td>
                                                        <asp:TextBox ID="TextBox25" CssClass="form-control" runat="server" MaxLength="250" Text="0"></asp:TextBox></td>
                                                </tr><tr>
                                                    <td>26</td>
                                                    <td>
                                                        <asp:TextBox ID="TextBox26" CssClass="form-control" runat="server" MaxLength="250" Text="0"></asp:TextBox></td>
                                                </tr><tr>
                                                    <td>27</td>
                                                    <td>
                                                        <asp:TextBox ID="TextBox27" CssClass="form-control" runat="server" MaxLength="250" Text="0"></asp:TextBox></td>
                                                </tr><tr>
                                                    <td>28</td>
                                                    <td>
                                                        <asp:TextBox ID="TextBox28" CssClass="form-control" runat="server" MaxLength="250" Text="0"></asp:TextBox></td>
                                                </tr><tr>
                                                    <td>29</td>
                                                    <td>
                                                        <asp:TextBox ID="TextBox29" CssClass="form-control" runat="server" MaxLength="250" Text="0"></asp:TextBox></td>
                                                </tr><tr>
                                                    <td>30</td>
                                                    <td>
                                                        <asp:TextBox ID="TextBox30" CssClass="form-control" runat="server" MaxLength="250" Text="0"></asp:TextBox></td>
                                                </tr><tr>
                                                    <td>31</td>
                                                    <td>
                                                        <asp:TextBox ID="TextBox31" CssClass="form-control" runat="server" MaxLength="250" Text="0"></asp:TextBox></td>
                                                </tr><tr>
                                                    <td>32</td>
                                                    <td>
                                                        <asp:TextBox ID="TextBox32" CssClass="form-control" runat="server" MaxLength="250" Text="0"></asp:TextBox></td>
                                                </tr><tr>
                                                    <td>33</td>
                                                    <td>
                                                        <asp:TextBox ID="TextBox33" CssClass="form-control" runat="server" MaxLength="250" Text="0"></asp:TextBox></td>
                                                </tr><tr>
                                                    <td>34</td>
                                                    <td>
                                                        <asp:TextBox ID="TextBox34" CssClass="form-control" runat="server" MaxLength="250" Text="0"></asp:TextBox></td>
                                                </tr><tr>
                                                    <td>35</td>
                                                    <td>
                                                        <asp:TextBox ID="TextBox35" CssClass="form-control" runat="server" MaxLength="250" Text="0"></asp:TextBox></td>
                                                </tr><tr>
                                                    <td>36</td>
                                                    <td>
                                                        <asp:TextBox ID="TextBox36" CssClass="form-control" runat="server" MaxLength="250" Text="0"></asp:TextBox></td>
                                                </tr><tr>
                                                    <td>37</td>
                                                    <td>
                                                        <asp:TextBox ID="TextBox37" CssClass="form-control" runat="server" MaxLength="250" Text="0"></asp:TextBox></td>
                                                </tr><tr>
                                                    <td>38</td>
                                                    <td>
                                                        <asp:TextBox ID="TextBox38" CssClass="form-control" runat="server" MaxLength="250" Text="0"></asp:TextBox></td>
                                                </tr><tr>
                                                    <td>39</td>
                                                    <td>
                                                        <asp:TextBox ID="TextBox39" CssClass="form-control" runat="server" MaxLength="250" Text="0"></asp:TextBox></td>
                                                </tr><tr>
                                                    <td>40</td>
                                                    <td>
                                                        <asp:TextBox ID="TextBox40" CssClass="form-control" runat="server" MaxLength="250" Text="0"></asp:TextBox></td>
                                                </tr><tr>
                                                    <td>41</td>
                                                    <td>
                                                        <asp:TextBox ID="TextBox41" CssClass="form-control" runat="server" MaxLength="250" Text="0"></asp:TextBox></td>
                                                </tr><tr>
                                                    <td>42</td>
                                                    <td>
                                                        <asp:TextBox ID="TextBox42" CssClass="form-control" runat="server" MaxLength="250" Text="0"></asp:TextBox></td>
                                                </tr><tr>
                                                    <td>43</td>
                                                    <td>
                                                        <asp:TextBox ID="TextBox43" CssClass="form-control" runat="server" MaxLength="250" Text="0"></asp:TextBox></td>
                                                </tr><tr>
                                                    <td>44</td>
                                                    <td>
                                                        <asp:TextBox ID="TextBox44" CssClass="form-control" runat="server" MaxLength="250" Text="0"></asp:TextBox></td>
                                                </tr><tr>
                                                    <td>45</td>
                                                    <td>
                                                        <asp:TextBox ID="TextBox45" CssClass="form-control" runat="server" MaxLength="250" Text="0"></asp:TextBox></td>
                                                </tr><tr>
                                                    <td>46</td>
                                                    <td>
                                                        <asp:TextBox ID="TextBox46" CssClass="form-control" runat="server" MaxLength="250" Text="0"></asp:TextBox></td>
                                                </tr><tr>
                                                    <td>47</td>
                                                    <td>
                                                        <asp:TextBox ID="TextBox47" CssClass="form-control" runat="server" MaxLength="250" Text="0"></asp:TextBox></td>
                                                </tr><tr>
                                                    <td>48</td>
                                                    <td>
                                                        <asp:TextBox ID="TextBox48" CssClass="form-control" runat="server" MaxLength="250" Text="0"></asp:TextBox></td>
                                                </tr><tr>
                                                    <td>49</td>
                                                    <td>
                                                        <asp:TextBox ID="TextBox49" CssClass="form-control" runat="server" MaxLength="250" Text="0"></asp:TextBox></td>
                                                </tr><tr>
                                                    <td>50</td>
                                                    <td>
                                                        <asp:TextBox ID="TextBox50" CssClass="form-control" runat="server" MaxLength="250" Text="0"></asp:TextBox></td>
                                                </tr>
                                            </tbody>
                                        </table>
                                    </div>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-xs-12">
                                    <asp:Button ID="bGuardar" CssClass="btn btn-info" runat="server" Text="Guardar" OnClick="bGuardar_Click" meta:resourcekey="bGuardarResource1" />&nbsp;
                                    <asp:Button ID="bBorrar" CssClass="btn btn-danger" runat="server" Text="Borrar" OnClick="bBorrar_Click" meta:resourcekey="bBorrarResource1" />
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

