using System;
using System.Collections.Generic;
using System.Data;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace IRT.gestion
{
    public partial class inscritos : System.Web.UI.Page
    {
        Models.EventosCN cn = new Models.EventosCN();
        public string cochescad = "", cochescad2 = "";
        public bool esf1 = false, dorsal = false, skin = false, comunidades=false;
        private const string ASCENDING = " ASC";
        private const string DESCENDING = " DESC";

        public SortDirection GridViewSortDirection
        {
            get
            {
                if (ViewState["sortDirection"] == null)
                    ViewState["sortDirection"] = SortDirection.Ascending;

                return (SortDirection)ViewState["sortDirection"];
            }
            set { ViewState["sortDirection"] = value; }
        }

        protected void GridView_Sorting(object sender, GridViewSortEventArgs e)
        {
            string sortExpression = e.SortExpression;

            if (GridViewSortDirection == SortDirection.Ascending)
            {
                GridViewSortDirection = SortDirection.Descending;
                CargaDatos(sortExpression, DESCENDING);
            }
            else
            {
                GridViewSortDirection = SortDirection.Ascending;
                CargaDatos(sortExpression, ASCENDING);
            }

        }


        public string DameAvatar(object idu, object avatar)
        {
            try
            {
                if (avatar.ToString() != "isracetime_user.jpg")
                    return "../Content/img/avatar/" + idu.ToString() + "/" + avatar.ToString();
                else
                    return "../Content/img/avatar/isracetime_user.jpg";
            }
            catch (Exception)
            {
                return "../Content/img/avatar/isracetime_user.jpg";
            }
        }

        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                if (Session.IsNewSession) Response.Redirect("salir.aspx");
                DL.EventosDS.EVENTOSRow evento = cn.CargaEvento(int.Parse(Request.QueryString["id"].ToString()));
                esf1 = (evento.IDJUEGO == 9 || evento.IDJUEGO == 12 || evento.IDJUEGO == 15);
                comunidades = (evento.TIPO == 3 || evento.TIPO == 4) && (bool)Session["super"];
                if (!IsPostBack)
                {
                    var culture = System.Globalization.CultureInfo.CurrentCulture;
                    if (culture.TwoLetterISOLanguageName != "es")
                    {
                        cbDivision.DataTextField = "EN";
                        cbSplit.DataTextField = "EN";
                        dgDatos.Columns[16].Visible = false;
                        dgDatos.Columns[17].Visible = true;
                        dgDatos.Columns[18].Visible = false;
                        dgDatos.Columns[19].Visible = true;
                    }                   

                    if (cn.EsMio(int.Parse(Request.QueryString["id"].ToString()), Session["idu"].ToString()) || (bool)Session["super"])
                    {
                        if (!evento.IsDORSALNull() && evento.DORSAL)
                        {
                            dorsal = true;
                            dgDatos.Columns[20].Visible = true;
                        }
                        if (!evento.IsSKINSNull() && evento.SKINS)
                        {
                            skin = true;
                            dgDatos.Columns[21].Visible = true;
                        }
                        CargaDatos("INSCRITO", ASCENDING);
                       
                    }
                    else
                        Response.Redirect("inicio.aspx", false);
                }
                if (Request.QueryString["o"] != null)
                {
                    lblmesg.Visible = true;
                    lblmesg.CssClass = "alert alert-success";
                    lblmesg.Text = "Inscritos copiados correctamente";
                }
                if (Request.QueryString["c"] != null)
                {
                    lblmesg.Visible = true;
                    lblmesg.CssClass = "alert alert-success";
                    lblmesg.Text = Resources.Global.insc_coches;
                }
            
                DL.EventosDS ds = new DL.EventosDS();
                DL.EventosDSTableAdapters.V_ETAPAS_COCHESTableAdapter tc = new DL.EventosDSTableAdapters.V_ETAPAS_COCHESTableAdapter();
                DL.EventosDSTableAdapters.V_ETAPASTableAdapter vet = new DL.EventosDSTableAdapters.V_ETAPASTableAdapter();
                vet.FillByIDEVENTO(ds.V_ETAPAS, int.Parse(Request.QueryString["id"].ToString()));
                bool primero = false;
                cochescad = "";cochescad2 = "";
                if (esf1 )
                {                    
                    tc.Fill(ds.V_ETAPAS_COCHES, ds.V_ETAPAS[0].ID);
                    cochescad += "<select class='form-control' name='cb-" + ds.V_ETAPAS[0].ID.ToString() + "'>";
                    cochescad2 += "<select class='form-control' name='cb2-" + ds.V_ETAPAS[0].ID.ToString() + "'>";
                    foreach (DL.EventosDS.V_ETAPAS_COCHESRow coche in ds.V_ETAPAS_COCHES)
                    {
                        if (!primero)
                        {
                            cochescad += "<option selected='selected' value='" + coche.ID.ToString() + "'>" + coche.COCHE + "</option>";
                            cochescad2 += "<option selected='selected' value='" + coche.ID.ToString() + "'>" + coche.COCHE + "</option>";
                            primero = true;
                        }
                        else
                        {
                            cochescad += "<option value='" + coche.ID.ToString() + "'>" + coche.COCHE + "</option>";
                            cochescad2 += "<option value='" + coche.ID.ToString() + "'>" + coche.COCHE + "</option>";
                        }
                    }
                    cochescad += "</select>";
                    cochescad2 += "</select>";
                }
                else
                {
                    foreach (DL.EventosDS.V_ETAPASRow etapa in ds.V_ETAPAS)
                    {
                        cochescad += "<tr><td>" + etapa.FECHA.ToShortDateString() + "</td><td>" + etapa.CIRCUITO + "</td><td><select name='cb-" + etapa.ID.ToString() + "'>";
                        cochescad2 += "<tr><td>" + etapa.FECHA.ToShortDateString() + "</td><td>" + etapa.CIRCUITO + "</td><td><select name='cb2-" + etapa.ID.ToString() + "'>";
                        tc.Fill(ds.V_ETAPAS_COCHES, etapa.ID);
                        foreach (DL.EventosDS.V_ETAPAS_COCHESRow coche in ds.V_ETAPAS_COCHES)
                        {
                            if (!primero)
                            {
                                cochescad += "<option selected='selected' value='" + coche.ID.ToString() + "'>" + coche.COCHE + "</option>";
                                cochescad2 += "<option selected='selected' value='" + coche.ID.ToString() + "'>" + coche.COCHE + "</option>";
                                primero = true;
                            }
                            else
                            {
                                cochescad += "<option value='" + coche.ID.ToString() + "'>" + coche.COCHE + "</option>";
                                cochescad2 += "<option value='" + coche.ID.ToString() + "'>" + coche.COCHE + "</option>";
                            }
                        }
                        cochescad += "</select></td></tr>";
                        cochescad2 += "</select></td></tr>";
                        primero = false;
                    }
                }
               
            }
            catch (Exception)
            {

                throw;
            }
        }

        private void CargaDatos(string sortexpression, string direccion)
        {
            try
            {
                DL.EventosDS ds = new DL.EventosDS();
                DL.EventosDSTableAdapters.V_INSCRIPCIONESTableAdapter t = new DL.EventosDSTableAdapters.V_INSCRIPCIONESTableAdapter();
                t.Fill(ds.V_INSCRIPCIONES, int.Parse(Request.QueryString["id"].ToString()));
                dgDatos.Columns[10].Visible = esf1;
                dgDatos.Columns[15].Visible = !esf1;
                DataTable dt = ds.V_INSCRIPCIONES;

                DataView dv = new DataView(dt);
                dv.Sort = sortexpression + direccion;

                dgDatos.DataSource = dv;
                dgDatos.DataBind();


                //DL.EventosDSTableAdapters.EVENTOSTableAdapter te = new DL.EventosDSTableAdapters.EVENTOSTableAdapter();
                //te.FillByPublicadosCopia(ds.EVENTOS, Guid.Parse(Session["idu"].ToString()), int.Parse(Request.QueryString["id"].ToString()));
                //cbCampeonatos.DataSource = ds;
                //cbCampeonatos.DataMember = "EVENTOS";
                //cbCampeonatos.DataTextField = "EVENTO";
                //cbCampeonatos.DataValueField = "ID";
                //cbCampeonatos.DataBind();

            }
            catch (Exception)
            {

                throw;
            }
        }

        protected void bAplicar_Click(object sender, EventArgs e)
        {
            try
            {
                DL.EventosDSTableAdapters.EVENTOS_INSCRIPCIONESTableAdapter t = new DL.EventosDSTableAdapters.EVENTOS_INSCRIPCIONESTableAdapter();
                foreach (GridViewRow row in dgDatos.Rows)
                {
                    // Access the CheckBox
                    CheckBox cb = (CheckBox)row.FindControl("chSelector");
                    if (cb != null && cb.Checked)
                    {
                        // Delete row! (Well, not really...)
                        // First, get the ProductID for the selected row
                        int elto = Convert.ToInt32(dgDatos.DataKeys[row.RowIndex].Value);
                        t.ActualizaInscrito(int.Parse(cbDivision.SelectedValue.ToString()), int.Parse(cbSplit.SelectedValue.ToString()), elto);

                    }
                }
                CargaDatos("INSCRITO", ASCENDING);
                Page.DataBind();

            }
            catch (Exception)
            {

                throw;
            }
        }

        protected void bInscribir_Click(object sender, EventArgs e)
        {
            try
            {
                DL.UsuariosDSTableAdapters.USUARIOSTableAdapter t = new DL.UsuariosDSTableAdapters.USUARIOSTableAdapter();
                DL.EventosDSTableAdapters.EVENTOS_INSCRIPCIONES_COCHESTableAdapter t2 = new DL.EventosDSTableAdapters.EVENTOS_INSCRIPCIONES_COCHESTableAdapter();
                DL.EventosDSTableAdapters.EVENTOS_RESULTADOSTableAdapter tres = new DL.EventosDSTableAdapters.EVENTOS_RESULTADOSTableAdapter();
                DL.UsuariosDS ds = new DL.UsuariosDS();
                DL.EventosDS.EVENTOSRow evento = cn.CargaEvento(int.Parse(Request.QueryString["id"].ToString()));
                DL.EventosDS eds = new DL.EventosDS();
                DL.EventosDSTableAdapters.V_ETAPASTableAdapter vet = new DL.EventosDSTableAdapters.V_ETAPASTableAdapter();
                t.FillByUSUARIO(ds.USUARIOS, tUsuario.Text);
                if (ds.USUARIOS.Count == 1)
                {
                    Models.EventosCN cn = new Models.EventosCN();
                    if (!cn.EstaInscrito(ds.USUARIOS[0].IDUSUARIO.ToString(), int.Parse(Request.QueryString["id"].ToString())))
                    {
                        //if (cn.EsMultiCoche(int.Parse(Request.QueryString["id"].ToString())))
                        //{
                        int id = cn.InscribeUsuario2(ds.USUARIOS[0].IDUSUARIO.ToString(), int.Parse(Request.QueryString["id"].ToString()), tDorsal.Text, fuSkin.FileName);
                        if (id > 0)
                        {
                            if (fuSkin.HasFile)
                            {
                                if (!Directory.Exists(Server.MapPath("../Content/img/avatar/" + ds.USUARIOS[0].IDUSUARIO.ToString())))
                                    Directory.CreateDirectory(Server.MapPath("../Content/img/avatar/" + ds.USUARIOS[0].ToString()));
                                try
                                {
                                    string ruta = Server.MapPath("../Content/img/avatar/" + ds.USUARIOS[0].IDUSUARIO.ToString());
                                    try
                                    {
                                        if (File.Exists(ruta + "/" + cn.RemoveSpecialCharacters(fuSkin.FileName)))
                                            File.Delete(ruta + "/" + cn.RemoveSpecialCharacters(fuSkin.FileName));
                                    }
                                    catch (Exception)
                                    {
                                    }
                                    fuSkin.SaveAs(ruta + "/" + cn.RemoveSpecialCharacters(fuSkin.FileName));
                                }
                                catch (Exception)
                                {
                                    Response.Redirect("inicio.aspx?e=e2");
                                }
                            }

                            vet.FillByIDEVENTO(eds.V_ETAPAS, int.Parse(Request.QueryString["id"].ToString()));
                            bool hayres = (int)tres.HayResultados(evento.ID)>0;
                            for (int i = 0; i <= Request.Form.Count - 1; i++)
                            {
                                if (Request.Form.Keys[i].ToString().IndexOf("cb-") != -1)
                                {
                                    string[] aux = Request.Form.Keys[i].ToString().Split('-');
                                    //if (evento.IDJUEGO == 9 || evento.IDJUEGO == 12)
                                    //{
                                    //    //foreach (DL.EventosDS.V_ETAPASRow etapa in eds.V_ETAPAS)
                                    //    //{
                                    //        t2.Insert(int.Parse(aux[1]), ds.USUARIOS[0].IDUSUARIO, int.Parse(Request.Form[i].ToString()), id);
                                    //    //    if (hayres)
                                    //    //        tres.Insert(id, evento.ID, etapa.ID, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 3, "");
                                    //    //}
                                    //}
                                    //else
                                    //{
                                        t2.Insert(int.Parse(aux[1]), ds.USUARIOS[0].IDUSUARIO, int.Parse(Request.Form[i].ToString()), id);
                                        
                                    //}
                                }
                            }

                            foreach (DL.EventosDS.V_ETAPASRow etapa in eds.V_ETAPAS)
                            {
                                //if ((evento.IDJUEGO == 9 || evento.IDJUEGO == 12) && hayres && (int)tres.HayResultadosEtapa(etapa.IDEVENTO, etapa.ID) > 0)
                                //{
                                //    tres.Insert(id, evento.ID, etapa.ID, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 3, "");
                                //}
                                //else
                                //{
                                    if (hayres && (int)tres.HayResultadosEtapa(etapa.IDEVENTO, etapa.ID) > 0)
                                        tres.Insert(id, evento.ID, etapa.ID, 0, 9999, 0, 0, 0, 0, 0, 0, 0, 0, 3, "");
                                //}
                            }
                            if (comunidades)
                            {
                                ds.USUARIOS[0].IDCOMUNIDAD = int.Parse(cbComunidad.SelectedValue.ToString());
                                t.Update(ds.USUARIOS[0]);
                            }
                            lblmesg.Visible = true;
                            lblmesg.Text = Resources.Global.insc_inscribe;
                            CargaDatos("INSCRITO", ASCENDING);
                        }
                        else
                        {
                            lblmesg.Visible = true;
                            lblmesg.Text = Resources.Global.inscr_error;
                        }
                        //}
                        //else if (cn.InscribeUsuario(ds.USUARIOS[0].IDUSUARIO.ToString(), int.Parse(Request.QueryString["id"].ToString())))
                        //{
                        //    lblmensaje.Visible = true;
                        //    lblmensaje.Text = "Piloto inscrito correctamente";
                        //    CargaDatos("INSCRITO", ASCENDING);
                        //}
                    }
                    else
                    {
                        lblmesg.Visible = true;
                        lblmesg.Text = Resources.Global.inscr_ya;
                    }

                }
                else
                {
                    lblmesg.Visible = true;
                    lblmesg.Text = Resources.Global.inscr_noexiste;
                }
            }
            catch (Exception)
            {

                throw;
            }
        }

        protected void bEliminar_Click(object sender, EventArgs e)
        {
            try
            {
                DL.EventosDSTableAdapters.EVENTOS_INSCRIPCIONESTableAdapter t = new DL.EventosDSTableAdapters.EVENTOS_INSCRIPCIONESTableAdapter();
                foreach (GridViewRow row in dgDatos.Rows)
                {
                    // Access the CheckBox
                    CheckBox cb = (CheckBox)row.FindControl("chSelector");
                    if (cb != null && cb.Checked)
                    {
                        // Delete row! (Well, not really...)
                        // First, get the ProductID for the selected row
                        int elto = Convert.ToInt32(dgDatos.DataKeys[row.RowIndex].Value);
                        t.BorrarInscrito(elto, int.Parse(Request.QueryString["id"].ToString()));

                    }
                }
                CargaDatos("INSCRITO", ASCENDING);
                Page.DataBind();
            }
            catch (Exception)
            {

                throw;
            }
        }

        protected void grdData_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            dgDatos.PageIndex = e.NewPageIndex;
            CargaDatos("INSCRITO", ASCENDING);
        }

        protected void bCopiar_Click(object sender, EventArgs e)
        {
            //try
            //{
            //    if (cbCampeonatos.SelectedIndex>=0)
            //    {
            //        int idinscrito = 0;
            //        Models.EventosCN cn = new Models.EventosCN();
            //        DL.EventosDS ds = new DL.EventosDS();
            //        DL.EventosDSTableAdapters.V_INSCRIPCIONESTableAdapter t = new DL.EventosDSTableAdapters.V_INSCRIPCIONESTableAdapter();
            //        DL.EventosDSTableAdapters.EVENTOS_INSCRIPCIONESTableAdapter ti = new DL.EventosDSTableAdapters.EVENTOS_INSCRIPCIONESTableAdapter();
            //        DL.EventosDSTableAdapters.EVENTOS_INSCRIPCIONES_COCHESTableAdapter tc = new DL.EventosDSTableAdapters.EVENTOS_INSCRIPCIONES_COCHESTableAdapter();
            //        DL.EventosDSTableAdapters.V_ETAPASTableAdapter te = new DL.EventosDSTableAdapters.V_ETAPASTableAdapter();
            //        t.Fill(ds.V_INSCRIPCIONES, int.Parse(cbCampeonatos.SelectedValue.ToString()));
            //        te.FillByIDEVENTO(ds.V_ETAPAS, int.Parse(Request.QueryString["id"].ToString()));
            //        if (ds.V_ETAPAS.Count > 0)
            //        {
            //            foreach (DL.EventosDS.V_INSCRIPCIONESRow fila in ds.V_INSCRIPCIONES)
            //            {
            //                idinscrito = cn.InscribeUsuario3(fila.IDUSUARIO, int.Parse(Request.QueryString["id"].ToString()), fila.IDDIVISION, fila.IDSPLIT);
            //                if (idinscrito != 0)
            //                {
            //                    tc.FillByIDINSCRIPCION(ds.EVENTOS_INSCRIPCIONES_COCHES, fila.ID);
            //                    foreach (DL.EventosDS.V_ETAPASRow etapa in ds.V_ETAPAS)
            //                        tc.Insert(etapa.ID, fila.IDUSUARIO, ds.EVENTOS_INSCRIPCIONES_COCHES[0].IDJUEGOCOCHE, idinscrito);
            //                }
            //            }
            //            Response.Redirect("inscritos.aspx?id=" + int.Parse(Request.QueryString["id"].ToString()) + "&o=0", false);
            //        }
            //        else
            //        {
            //            lblmesg.Visible = true;
            //            lblmesg.CssClass = "alert alert-danger";
            //            lblmesg.Text = "Error, debes añadir primero las carreras al campeonato";
            //        }
            //    }
            //    else
            //    {
            //        lblmesg.Visible = true;
            //        lblmesg.CssClass = "alert alert-danger";
            //        lblmesg.Text = "Error, no has seleccionado ningún campeonato";
            //    }
            //}
            //catch (Exception)
            //{

            //    throw;
            //}
        }

        public string DameSkin(object idusuario, object skin)
        {
            try
            {
                if (skin != null && skin.ToString() != "")
                {
                    return "<a target='_blank' href='../Content/img/avatar/" + idusuario.ToString() + "/" + skin.ToString() + "'>Skin</a>";
                }
                else
                    return "";
            }
            catch (Exception)
            {

                throw;
            }
        }

        public string DameCoches(object id)
        {
            try
            {
                string cad = "";
                DL.EventosDS ds = new DL.EventosDS();
                DL.EventosDSTableAdapters.V_INSCRITOS_COCHESTableAdapter t = new DL.EventosDSTableAdapters.V_INSCRITOS_COCHESTableAdapter();
                t.Fill(ds.V_INSCRITOS_COCHES, int.Parse(Request.QueryString["id"].ToString()), int.Parse(id.ToString()));
                cad = "<div class='row collapse' style='padding: 10px' id='PC" + id.ToString() + "'>";
                foreach (DL.EventosDS.V_INSCRITOS_COCHESRow fila in ds.V_INSCRITOS_COCHES)
                {
                    cad += fila.CIRCUITO + ": " + fila.COCHE + "<br>";
                }
                return cad + "</div>";
            }
            catch (Exception)
            {
                return "";
            }
        }

        protected void btnCambiaCoche_Click(object sender, EventArgs e)
        {
            try
            {
                DL.EventosDSTableAdapters.EVENTOS_INSCRIPCIONESTableAdapter t = new DL.EventosDSTableAdapters.EVENTOS_INSCRIPCIONESTableAdapter();
                DL.EventosDSTableAdapters.EVENTOS_INSCRIPCIONES_COCHESTableAdapter t2 = new DL.EventosDSTableAdapters.EVENTOS_INSCRIPCIONES_COCHESTableAdapter();
                DL.EventosDS.EVENTOSRow evento = cn.CargaEvento(int.Parse(Request.QueryString["id"].ToString()));
                DL.EventosDS eds = new DL.EventosDS();

                foreach (GridViewRow row in dgDatos.Rows)
                {
                    // Access the CheckBox
                    CheckBox cb = (CheckBox)row.FindControl("chSelector");
                    if (cb != null && cb.Checked)
                    {
                        // Delete row! (Well, not really...)
                        // First, get the ProductID for the selected row
                        int elto = Convert.ToInt32(dgDatos.DataKeys[row.RowIndex].Value);

                        for (int i = 0; i <= Request.Form.Count - 1; i++)
                        {
                            if (Request.Form.Keys[i].ToString().IndexOf("cb2-") != -1)
                            {
                                string[] aux = Request.Form.Keys[i].ToString().Split('-');
                                if (evento.IDJUEGO == 9 || evento.IDJUEGO == 12 || evento.IDJUEGO == 15)
                                {
                                    DL.EventosDSTableAdapters.V_ETAPASTableAdapter vet = new DL.EventosDSTableAdapters.V_ETAPASTableAdapter();
                                    vet.FillByIDEVENTO(eds.V_ETAPAS, int.Parse(Request.QueryString["id"].ToString()));
                                    foreach (DL.EventosDS.V_ETAPASRow etapa in eds.V_ETAPAS)
                                    {
                                        if ((int)t2.ExisteRegistro(elto, etapa.ID) > 0)
                                            t2.CambiaCoche(int.Parse(Request.Form[i].ToString()), elto, etapa.ID);
                                        else
                                        {
                                            string idusuario = cn.DameUsuarioInscripcion(elto);
                                            if (idusuario != "")
                                                t2.Insert(etapa.ID, Guid.Parse(idusuario), int.Parse(Request.Form[i].ToString()), elto);
                                        }
                                    }
                                }
                                else
                                    t2.CambiaCoche(int.Parse(Request.Form[i].ToString()), elto, int.Parse(aux[1]));

                            }
                        }

                    }
                }
                Response.Redirect("inscritos.aspx?id=" + Request.QueryString["id"].ToString() + "&c=0", false);
            }
            catch (Exception)
            {

                throw;
            }
        }
    }
}