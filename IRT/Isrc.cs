using System;
using System.Collections.Generic;
using System.Linq;
using System.Runtime.Serialization;
using System.ServiceModel;
using System.Text;
using System.Web.Script.Services;
using Newtonsoft.Json;

namespace IRT
{
    // NOTA: puede usar el comando "Rename" del menú "Refactorizar" para cambiar el nombre de interfaz "Isrc" en el código y en el archivo de configuración a la vez.
    [ServiceContract]
    public interface Isrc
    {
        
        [OperationContract]
        string GetCampeonatosInscripcion();
    }


    

}
