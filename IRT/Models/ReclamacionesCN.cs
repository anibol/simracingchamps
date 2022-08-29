using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using DL;

namespace IRT.Models
{
    public class ReclamacionesCN
    {
        public ReclamacionesDS.EVENTOS_RECLAMACIONESRow CargaReclamacion(int id, string idusuario)
        {
            try
            {
                DL.ReclamacionesDS ds = new ReclamacionesDS();
                DL.ReclamacionesDSTableAdapters.EVENTOS_RECLAMACIONESTableAdapter t = new DL.ReclamacionesDSTableAdapters.EVENTOS_RECLAMACIONESTableAdapter();
                t.FillByID(ds.EVENTOS_RECLAMACIONES, id, Guid.Parse(idusuario));
                return ds.EVENTOS_RECLAMACIONES[0];
            }
            catch (Exception)
            {
                return null;
            }
        }
        
    }
}