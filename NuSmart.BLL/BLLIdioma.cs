using System.Collections.Generic;
using NuSmart.BE;
using NuSmart.DAL;
using System.Windows.Forms;



namespace NuSmart.BLL
{
    public class BLLIdioma
    {

        DALIdioma dalIdioma;

        public BLLIdioma()
        {
            dalIdioma = new DALIdioma();
        }

        public Idioma establecerIdioma(int idiomaId)
        {
            BLLLeyenda bllLeyenda = new BLLLeyenda();

            //Va a buscar en la BD e instancia el singleton Idioma. Referencio el singleton a la variable idioma
            //para hacerlo mas semantico
            Idioma idioma = dalIdioma.conseguir(idiomaId);
            idioma.Leyendas = bllLeyenda.conseguirLeyendasParaIdioma(idioma.Id);
            return idioma;
        }

        public void Attach(IObserver observer)
        {
            Sesion.Instancia().Observers.Add(observer);

        }

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

        public string conseguirLeyenda(Control control)
        {
            Leyenda leyenda = Sesion.Instancia().IdiomaActual.Leyendas.Find(i => i.Nombre == control.Name);
            if (leyenda != null)
            {
                return leyenda.Texto;
            }
            else
            {
                return control.Text;
            }
        }

        public string conseguirLeyendaMenu(ToolStripMenuItem item)
        {
            Leyenda leyenda = Sesion.Instancia().IdiomaActual.Leyendas.Find(i => i.Nombre == item.Name);
            if (leyenda != null)
            {
                return leyenda.Texto;
            }
            else
            {
                return item.Text;
            }
        }


        public List<Idioma> conseguirIdiomas()
        {
            return dalIdioma.conseguirIdiomas();
        }

        public int guardar(Idioma idioma)
        {
            return dalIdioma.guardar(idioma);
        }

        public int eliminar(int idiomaId)
        {
            return dalIdioma.eliminar(idiomaId);
        }

        public int modificar(Idioma idioma)
        {
            return dalIdioma.modificar(idioma);
        }

    }
}
