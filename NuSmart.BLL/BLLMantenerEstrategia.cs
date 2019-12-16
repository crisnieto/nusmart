using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using NuSmart.BE;

namespace NuSmart.BLL
{
    public class BLLMantenerEstrategia : BLLDietaEstrategia
    {
        public override Dieta calcularDietaAutomatica(List<Plato> platos)
        {
            int caloriasDiariasMaximas = 2200;
            int caloriasDiarasMinimas = 1800;

            Dieta dieta = new Dieta();
            calcularPlatosdeDia(caloriasDiarasMinimas, caloriasDiariasMaximas, dieta.Lunes, new List<Plato>(platos));
            calcularPlatosdeDia(caloriasDiarasMinimas, caloriasDiariasMaximas, dieta.Martes, new List<Plato>(platos));
            calcularPlatosdeDia(caloriasDiarasMinimas, caloriasDiariasMaximas, dieta.Miercoles, new List<Plato>(platos));
            calcularPlatosdeDia(caloriasDiarasMinimas, caloriasDiariasMaximas, dieta.Jueves, new List<Plato>(platos));
            calcularPlatosdeDia(caloriasDiarasMinimas, caloriasDiariasMaximas, dieta.Viernes, new List<Plato>(platos));
            calcularPlatosdeDia(caloriasDiarasMinimas, caloriasDiariasMaximas, dieta.Sabado, new List<Plato>(platos));
            calcularPlatosdeDia(caloriasDiarasMinimas, caloriasDiariasMaximas, dieta.Domingo, new List<Plato>(platos));

            dieta.EsAutomatica = true;
            dieta.Nombre = "Dieta generada para mantener peso";
            crearNuevaBitacora("Calculo Dieta Automatica", "Se produjo un calculo de dieta para mantener peso", Criticidad.Baja);

            return dieta;
        }
    }
}
