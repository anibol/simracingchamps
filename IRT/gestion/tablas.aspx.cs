using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace IRT.gestion
{
    public partial class tablas : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                DL.AuxliaresDS ds = new DL.AuxliaresDS();
                DL.AuxliaresDSTableAdapters.TABLASTableAdapter t = new DL.AuxliaresDSTableAdapters.TABLASTableAdapter();
                DL.AuxliaresDSTableAdapters.PUNTOSTableAdapter p = new DL.AuxliaresDSTableAdapters.PUNTOSTableAdapter();
                t.Fill(ds.TABLAS);
                p.Fill(ds.PUNTOS);
                repTablas.DataSource = ds.TABLAS;
                ds.Relations.Add("myrelation", ds.TABLAS.IdColumn, ds.PUNTOS.IDTABLAColumn);
                Page.DataBind();
            }
            catch (Exception)
            {

                throw;
            }
        }
    }
}