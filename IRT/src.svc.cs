using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Runtime.Serialization;
using System.ServiceModel;
using System.Text;


namespace IRT
{
    // NOTA: puede usar el comando "Rename" del menú "Refactorizar" para cambiar el nombre de clase "src" en el código, en svc y en el archivo de configuración a la vez.
    // NOTA: para iniciar el Cliente de prueba WCF para probar este servicio, seleccione src.svc o src.svc.cs en el Explorador de soluciones e inicie la depuración.
    public class src : Isrc
    {
        public string GetCampeonatosInscripcion()
        {
            //DL.AppDS ds = new DL.AppDS();
            //DL.AppDSTableAdapters.V_EVENTOSTableAdapter t = new DL.AppDSTableAdapters.V_EVENTOSTableAdapter();
            //t.Fill(ds.V_EVENTOS);

            DL.EventosDS ds = new DL.EventosDS();
            DL.EventosDSTableAdapters.V_EVENTOSTableAdapter t = new DL.EventosDSTableAdapters.V_EVENTOSTableAdapter();
            t.FillByPortadaWebInscripciones(ds.V_EVENTOS);

            return DataTableToJSONWithJSONNet(ds.V_EVENTOS);
        }

        public string DataTableToJSONWithJSONNet(DL.EventosDS.V_EVENTOSDataTable table)
        {
            string JSONString = string.Empty;
            JSONString = JsonConvert.SerializeObject(table);
            return JSONString;
        }

    }

}
