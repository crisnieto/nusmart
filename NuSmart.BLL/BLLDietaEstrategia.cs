using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using NuSmart.BE;

namespace NuSmart.BLL
{
    public abstract class BLLDietaEstrategia : BLLBase
    {

        public abstract Dieta calcularDietaAutomatica(List<Plato> platos);

        public void calcularPlatosdeDia(int min, int max, DiaAlimenticio dia, List<Plato> platos)
        {
            Randomizer.Shuffle(platos);
            double porcentajeDesayuno = 0.20;
            double porcentajeColacion = 0.10;
            double porcentajeAlmuerzo = 0.30;
            double porcentajeMerienda = 0.15;
            double porcentajeCena = 0.25;
            bool continueLoop = false;

            do
            {
                foreach (Plato plato in platos.ToList())
                {
                    if (plato.EsDesayuno && dia.Desayuno.Calorias == 0)
                    {
                        if (plato.Calorias >= min * porcentajeDesayuno && plato.Calorias <= max * porcentajeDesayuno)
                        {
                            dia.Desayuno = plato;
                            platos.Remove(plato);
                            continue;
                        }
                    }
                    if (plato.EsColacion && dia.Colacion.Calorias == 0)
                    {
                        if (plato.Calorias >= min * porcentajeColacion && plato.Calorias <= max * porcentajeColacion)
                        {
                            dia.Colacion = plato;
                            platos.Remove(plato);
                            continue;
                        }
                    }
                    if (plato.EsPlatoPrincipal && dia.Almuerzo.Calorias == 0)
                    {
                        if (plato.Calorias >= min * porcentajeAlmuerzo && plato.Calorias <= max * porcentajeAlmuerzo)
                        {
                            dia.Almuerzo = plato;
                            platos.Remove(plato);
                            continue;
                        }
                    }
                    if (plato.EsMerienda && dia.Merienda.Calorias == 0)
                    {
                        if (plato.Calorias >= min * porcentajeMerienda && plato.Calorias <= max * porcentajeMerienda)
                        {
                            dia.Merienda = plato;
                            platos.Remove(plato);
                            continue;
                        }
                    }
                    if (plato.EsPlatoPrincipal && dia.Cena.Calorias == 0)
                    {
                        if (plato.Calorias >= min * porcentajeCena && plato.Calorias <= max * porcentajeCena)
                        {
                            dia.Cena = plato;
                            platos.Remove(plato);
                            continue;
                        }
                    }
                }
                max = max + 100;
                min = min > 0 ? min - 100 : min;

                if (dia.Desayuno.Calorias == 0 || dia.Colacion.Calorias == 0 || dia.Almuerzo.Calorias == 0 || dia.Merienda.Calorias == 0 || dia.Cena.Calorias == 0)
                {
                    continueLoop = true;
                }

            } while (max <= 3500 && continueLoop);

        }
    }
}
