using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace IRT
{
    public partial class recover : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
        }

        protected void bEntrar_Click(object sender, EventArgs e)
        {
            try
            {
                if (tUsuario.Text != "")
                {
                    Models.EventosCN cn = new Models.EventosCN();
                    DL.UsuariosDS ds = new DL.UsuariosDS();
                    DL.UsuariosDSTableAdapters.USUARIOSTableAdapter t = new DL.UsuariosDSTableAdapters.USUARIOSTableAdapter();
                    t.FillByUSUARIO(ds.USUARIOS, tUsuario.Text);
                    if (ds.USUARIOS.Count == 0)
                    {
                        lblmsg2.CssClass = "label label-danger";
                        lblmsg2.Text = "El usuario indicado no existe";
                        return;
                    }

                    string password = Membership.GeneratePassword(12, 0);
                    if ((int)t.ActualizaPass(cn.Encrypt(password), tUsuario.Text) > 0)
                    {
                        if (cn.SendRecover(tUsuario.Text, password))
                        {                            
                            lblmsg2.CssClass = "label label-success";
                            lblmsg2.Text = "Se te ha enviado un correo con una nueva contraseña. Gracias.";

                        }
                        else
                        {
                            lblmsg2.CssClass = "label label-danger";
                            lblmsg2.Text = "Se ha producido un error. Por favor, inténtalo más tarde. Gracias";
                        }
                        panMensaje.Visible = true;
                    }
                    else
                    {
                        lblmsg2.CssClass = "label label-danger";
                        lblmsg2.Text = "Se ha producido un error. Por favor, inténtalo más tarde. Gracias";
                        panMensaje.Visible = true;
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