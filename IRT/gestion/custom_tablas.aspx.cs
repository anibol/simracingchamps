using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace IRT.gestion
{
    public partial class custom_tablas : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {

                if (Session.IsNewSession) Response.Redirect("salir.aspx");

                DL.AuxliaresDS ds = new DL.AuxliaresDS();
                DL.AuxliaresDSTableAdapters.TABLASTableAdapter t = new DL.AuxliaresDSTableAdapters.TABLASTableAdapter();
                t.FillByIDORG(ds.TABLAS, Guid.Parse(Session["idu"].ToString()));
                repCircuitos.DataSource = ds.TABLAS;
                repCircuitos.DataBind();



                if (!IsPostBack)
                {
                    if (Request.QueryString["ed"] != null)
                        Editar();
                    if (Request.QueryString["n"] != null)
                        Nuevo();
                    if (Request.QueryString["o"] != null)
                        lblmsg.Visible = true;
                }


            }
            catch (Exception ex)
            {
                panerror.Visible = true;
            }
        }

        private void Nuevo()
        {
            try
            {
                panCircuitos.Visible = true;
                bBorrar.Visible = false;
            }
            catch (Exception)
            {

            }
        }

        private void Editar()
        {
            try
            {
                panCircuitos.Visible = true;
                DL.AuxliaresDS ds = new DL.AuxliaresDS();
                DL.AuxliaresDSTableAdapters.TABLASTableAdapter t = new DL.AuxliaresDSTableAdapters.TABLASTableAdapter();
                t.FillByID(ds.TABLAS, int.Parse(Request.QueryString["ed"].ToString()), Guid.Parse(Session["idu"].ToString()));
                if (ds.TABLAS.Count > 0)
                {
                    DL.AuxliaresDS.TABLASRow f = ds.TABLAS[0];
                    tNombre.Text = f.TABLA;
                    DL.AuxliaresDSTableAdapters.PUNTOSTableAdapter tp = new DL.AuxliaresDSTableAdapters.PUNTOSTableAdapter();
                    tp.FillByIDTABLA(ds.PUNTOS, f.Id);
                    foreach (DL.AuxliaresDS.PUNTOSRow fila in ds.PUNTOS)
                    {
                        foreach (Control c in panCircuitos.Controls)
                        {
                            if (c is TextBox)
                            {
                                if (((TextBox)c).ID.StartsWith("TextBox") && ((TextBox)c).ID.Replace("TextBox", "") == fila.POSICION.ToString())
                                {
                                    try
                                    {
                                        ((TextBox)c).Text = fila.PUNTOS.ToString();
                                    }
                                    catch { }
                                }
                            }
                        }
                    }
                }
                else
                {
                    panerror.Visible = true;
                    panerror.InnerText = "La tabla no puede cargarse. Ponte en contacto con nosotros. Gracias.";
                }
            }
            catch (Exception)
            {
                panerror.Visible = true;
            }
        }

        protected void bGuardar_Click(object sender, EventArgs e)
        {
            try
            {

                DL.AuxliaresDS ds = new DL.AuxliaresDS();
                DL.AuxliaresDS.TABLASRow f;
                DL.AuxliaresDSTableAdapters.TABLASTableAdapter t = new DL.AuxliaresDSTableAdapters.TABLASTableAdapter();
                DL.AuxliaresDSTableAdapters.PUNTOSTableAdapter tp = new DL.AuxliaresDSTableAdapters.PUNTOSTableAdapter();
                if (Request.QueryString["ed"] == null)
                {
                    f = ds.TABLAS.NewTABLASRow();
                    f.TABLA = tNombre.Text;
                    f.IDORG = Guid.Parse(Session["idu"].ToString());
                    if (Request.QueryString["ed"] == null)
                        ds.TABLAS.AddTABLASRow(f);
                     t.Update(ds);
                    foreach (Control c in panCircuitos.Controls)
                    {
                        if (c is TextBox)
                        {
                            if (((TextBox)c).ID.ToString().StartsWith("TextBox"))
                                tp.Insert(f.Id, int.Parse(((TextBox)c).ID.Replace("TextBox", "")), decimal.Parse(((TextBox)c).Text));
                        }
                    }

                Limpia();
                Response.Redirect("custom_tablas.aspx?o=0", false);
                }
                else
                {
                    DL.AuxliaresDSTableAdapters.QueriesTableAdapter q = new DL.AuxliaresDSTableAdapters.QueriesTableAdapter();
                    if ((int)q.CuentaUsoTablaPuntos(int.Parse(Request.QueryString["ed"].ToString())) == 0)
                    {
                        t.FillByID(ds.TABLAS, int.Parse(Request.QueryString["ed"].ToString()), Guid.Parse(Session["idu"].ToString()));
                        f = ds.TABLAS[0];
                        f.TABLA = tNombre.Text;
                        t.Update(ds);
                        tp.BorrarIDTABLA(f.Id);
                        foreach (Control c in panCircuitos.Controls)
                        {
                            if (c is TextBox)
                            {
                                if (((TextBox)c).ID.ToString().StartsWith("TextBox"))
                                tp.Insert(f.Id, int.Parse(((TextBox)c).ID.Replace("TextBox", "")), decimal.Parse(((TextBox)c).Text));
                            }
                           
                        }
                        Limpia();
                        Response.Redirect("custom_tablas.aspx?o=0", false);
                    }
                    else
                    {
                        panerror.Visible = true;
                        panerror.InnerText = "La tabla no puede editarse porque se ha usado para algún campeonato que tiene resultados publicados. Debes crear una nueva tabla.";
                    }
                }
                
               

            }
            catch (Exception ex)
            {
                panerror.Visible = true;
            }
        }

        private void Limpia()
        {
            try
            {
                tNombre.Text = "";
            }
            catch (Exception)
            {
            }
        }

        protected void bBorrar_Click(object sender, EventArgs e)
        {
            try
            {
                Models.EventosCN cn = new Models.EventosCN();
                DL.AuxliaresDSTableAdapters.QueriesTableAdapter q = new DL.AuxliaresDSTableAdapters.QueriesTableAdapter();
                if ((int)q.CuentaUsoTablaPuntos(int.Parse(Request.QueryString["ed"].ToString())) > 0)
                {
                    panerror.Visible = true;
                    panerror.InnerText = "La tabla no puede editarse porque se ha usado para algún campeonato que tiene resultados publicados. Debes crear una nueva tabla.";
                }
                else
                {
                    DL.AuxliaresDSTableAdapters.TABLASTableAdapter t = new DL.AuxliaresDSTableAdapters.TABLASTableAdapter();
                    if ((int)t.BorrarIDORG(int.Parse(Request.QueryString["ed"].ToString()), Guid.Parse(Session["idu"].ToString())) > 0)
                    {
                        Limpia();
                        Response.Redirect("custom_tablas.aspx?o=0", false);
                    }
                    else
                    {
                        panerror.Visible = true;
                        panerror.InnerText = "La tabla no puede editarse porque se ha usado para algún campeonato que tiene resultados publicados. Debes crear una nueva tabla.";
                    }
                }
            }
            catch (Exception)
            {
                panerror.Visible = true;
            }
        }
    }
}