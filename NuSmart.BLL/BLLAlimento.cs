using System;
using System.Collections.Generic;
using NuSmart.BE;
using NuSmart.DAL;

namespace NuSmart.BLL
{
    public class BLLAlimento
    {
        DALAlimento dalAlimento;

        public BLLAlimento()
        {
            dalAlimento = new DALAlimento();
        }

        public void agregar(Alimento alimento)
        {
            dalAlimento.agregar(alimento);
        }

        public List<Alimento> obtenerTodos()
        {
            return dalAlimento.obtenerTodos();
        }

        public List<Alimento> obtenerAlimentosDePlato(Plato plato)
        {
            return dalAlimento.obtenerAlimentosDePlato(plato);
        }

        public List<Alimento> buscarPorNombre(String nombre)
        {
            return dalAlimento.buscar(nombre);
        }
    }
}
