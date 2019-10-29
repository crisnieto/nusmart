using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using NuSmart.BE;
using NuSmart.DAL;

namespace NuSmart.BLL
{
    public class BLLPlato
    {

        DALPlato dalPlato;

        public BLLPlato()
        {
            dalPlato = new DALPlato();
        }

        public List<Plato> obtenerTodos(string tipoAlimento = null)
        {
            BLLAlimento bllAliemento = new BLLAlimento();
            List<Plato> listaPlatos = dalPlato.obtenerTodos(tipoAlimento);
            foreach(Plato plato in listaPlatos)
            {
                plato.Alimentos = bllAliemento.obtenerAlimentosDePlato(plato);
            }

            return listaPlatos;
        }

        public void agregar(Plato plato)
        {
            if(plato.Calorias == 0)
            {
                plato.Calorias = calcularCalorias(plato.Alimentos);
            }
            int id = dalPlato.agregar(plato);

            plato.Id = id;

            dalPlato.asociarAlimentosAPlato(plato);
        }

        public int calcularCalorias(List<Alimento> alimentos)
        {
            int calorias = 0;
            foreach(Alimento alimento in alimentos)
            {
                calorias += alimento.Calorias;
            }
            return calorias;
        }

        public Plato obtenerPlato(int id)
        {
            return dalPlato.obtenerPlato(id);
        }
    }
}
