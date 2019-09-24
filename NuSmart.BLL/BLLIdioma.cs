using System.Collections.Generic;
using NuSmart.BE;
using NuSmart.DAL;
using System.Windows.Forms;
using System;


namespace NuSmart.BLL
{
    public class BLLIdioma
    {

        DALIdioma dalIdioma;

        public BLLIdioma()
        {
            dalIdioma = new DALIdioma();
        }

        /// <summary>
        /// 
        /// </summary>
        /// <param name="idiomaId"></param>
        /// <returns></returns>
        public Idioma establecerIdioma(int idiomaId)
        {
            BLLLeyenda bllLeyenda = new BLLLeyenda();

            //Va a buscar en la BD e instancia el singleton Idioma. Referencio el singleton a la variable idioma
            //para hacerlo mas semantico
            Idioma idioma = dalIdioma.conseguir(idiomaId);
            idioma.Leyendas = bllLeyenda.conseguirLeyendasParaIdioma(idioma.Id);
            return idioma;
        }

        /// <summary>
        /// Attach agrega entidades que cumplan con la interfaz IObserver (FormObservers en este caso) a la lista de Observers de la Sesion
        /// </summary>
        /// <param name="observer"></param>
        public void Attach(IObserver observer)
        {
            Sesion.Instancia().Observers.Add(observer);

        }

        /// <summary>
        /// Detach remueve entidades de la lista de observers de la sesion 
        /// </summary>
        /// <param name="observer"></param>
        public void Detach(IObserver observer)
        {
            Sesion.Instancia().Observers.Remove(observer);
        }

        public void Notify()
        {
            foreach (BE.IObserver observer in Sesion.Instancia().Observers)
            {
                observer.Actualizar();
            }
        }

        /// <summary>
        /// conseguirLeyenda se encarga de retornar el texto de la leyenda traducida en base al idioma cargado actual en la Sesion.
        /// Si no se tiene una leyenda para ese control, se deja el atributo Text del control como se encuentra por default.
        /// </summary>
        /// <param name="control"></param>
        public void conseguirLeyenda(Control control)
        {
            Leyenda leyenda = Sesion.Instancia().IdiomaActual.Leyendas.Find(i => i.NombreControl == control.Name);
            if (leyenda != null)
            {
                control.Text =  leyenda.Texto;
                if (control.HasChildren)
                {
                    foreach (Control controlHijo in control.Controls)
                    {
                        conseguirLeyenda(controlHijo);
                    }
                }
            }
        }


        /// <summary>
        /// conseguirLeyendaMenu se encarga de conseguir y actualizar los textos de los controles relativos a los Menu en base
        /// al idioma cargado en la Sesion.
        /// </summary>
        /// <param name="item"></param>
        /// <returns></returns>
        public string conseguirLeyendaMenu(ToolStripMenuItem item)
        {
            Leyenda leyenda = Sesion.Instancia().IdiomaActual.Leyendas.Find(i => i.NombreControl == item.Name);
            if (leyenda != null)
            {
                return leyenda.Texto;
            }
            else
            {
                return item.Text;
            }
        }


        /// <summary>
        /// conseguirIdioma obtiene todos los idiomas disponibles
        /// </summary>
        /// <returns></returns>
        public List<Idioma> conseguirIdiomas()
        {
            return dalIdioma.conseguirIdiomas();
        }

        /// <summary>
        /// guardar se encarga de enviar a guardar a la DAL el idioma a guardar
        /// </summary>
        /// <param name="idioma"></param>
        /// <returns></returns>
        public int guardar(Idioma idioma)
        {
            Sesion.Instancia().verificarPermiso("OP80");
            return dalIdioma.guardar(idioma);
        }

        /// <summary>
        /// eliminar se encarga de enviar para eliminar a la DAL un idioma
        /// </summary>
        /// <param name="idiomaId"></param>
        /// <returns></returns>
        public int eliminar(int idiomaId)
        {
            Sesion.Instancia().verificarPermiso("OP82");
            return dalIdioma.eliminar(idiomaId);
        }

        /// <summary>
        /// modificar se encarga de solicitar a la DAL la modificacion de un idioma recibido por parametro.
        /// </summary>
        /// <param name="idioma"></param>
        /// <returns></returns>
        public int modificar(Idioma idioma)
        {
            Sesion.Instancia().verificarPermiso("OP81");
            return dalIdioma.modificar(idioma);           
        }

    }
}
