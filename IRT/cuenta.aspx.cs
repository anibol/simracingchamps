using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace IRT
{
    public partial class cuenta : System.Web.UI.Page
    {
        public bool org = false;
        protected void Page_Load(object sender, EventArgs e)
        {
            org= Request.QueryString["org"] != null;
        }

        protected void bEntrar_Click(object sender, EventArgs e)
        {
            try
            {
                if (Page.IsValid)
                {
                    if (tUsuario.Text != "")
                    {
                        Models.UsuariosDSTableAdapters.USUARIOSTableAdapter t = new Models.UsuariosDSTableAdapters.USUARIOSTableAdapter();
                        Models.UsuariosDS ds = new Models.UsuariosDS();
                        Models.UsuariosDS.USUARIOSRow f = ds.USUARIOS.NewUSUARIOSRow();
                        f.IDUSUARIO = Guid.NewGuid();
                        f.USUARIO = tUsuario.Text;
                        f.FECHAALTA = DateTime.Now;
                        f.PASS = tPass.Text;
                        if (org)
                        {
                            f.NOMBRE = tOrg.Text;
                            f.ORG = true;
                        }
                        else
                        {
                            f.NOMBRE = tNombre.Text;
                            f.ORG = false;
                        }
                        f.APELLIDOS = tApellidos.Text;
                        f.FECHAALTA = DateTime.Now;
                        f.ALIAS = tAlias.Text;
                        f.CODPAIS = cbPais.SelectedValue.ToString();
                        ds.USUARIOS.AddUSUARIOSRow(f);
                        t.Update(f);
                        if (fUpload.HasFile)
                        {
                            if (!Directory.Exists(Server.MapPath("../Content/img/avatar/" + f.IDUSUARIO.ToString())))
                                Directory.CreateDirectory(Server.MapPath("../Content/img/avatar/" + f.IDUSUARIO.ToString()));
                            try
                            {
                                string ruta = Server.MapPath("../Content/img/avatar/" + f.IDUSUARIO.ToString());
                                fUpload.SaveAs(ruta + "/" + fUpload.FileName);
                                f.AVATAR = fUpload.FileName;
                                t.Update(f);
                            }
                            catch (Exception)
                            {
                                Response.Redirect("inicio.aspx?e=e2");
                            }
                        }
                    }
                }
                
            }
            catch (Exception)
            {

                throw;
            }
        }
    }
}