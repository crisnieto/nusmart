using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.ComponentModel;


namespace NuSmart.BE
{
    public class Rutina
    {
        int id;
        string nombre;
        DiaEjercicio diaEjercicioLunes;
        DiaEjercicio diaEjercicioMartes;
        DiaEjercicio diaEjercicioMiercoles;
        DiaEjercicio diaEjercicioJueves;
        DiaEjercicio diaEjercicioViernes;
        DiaEjercicio diaEjercicioSabado;
        DiaEjercicio diaEjercicioDomingo;

        public Rutina()
        {
            DiaEjercicioLunes = new DiaEjercicio();
            diaEjercicioMartes = new DiaEjercicio();
            diaEjercicioMiercoles = new DiaEjercicio();
            diaEjercicioJueves = new DiaEjercicio();
            DiaEjercicioViernes = new DiaEjercicio();
            DiaEjercicioSabado = new DiaEjercicio();
            diaEjercicioDomingo = new DiaEjercicio();
        }

        public DiaEjercicio DiaEjercicioLunes
        {
            get
            {
                return diaEjercicioLunes;
            }

            set
            {
                diaEjercicioLunes = value;
            }
        }

        public DiaEjercicio DiaEjercicioMartes
        {
            get
            {
                return diaEjercicioMartes;
            }

            set
            {
                diaEjercicioMartes = value;
            }
        }

        public DiaEjercicio DiaEjercicioMiercoles
        {
            get
            {
                return diaEjercicioMiercoles;
            }

            set
            {
                diaEjercicioMiercoles = value;
            }
        }

        public DiaEjercicio DiaEjercicioJueves
        {
            get
            {
                return diaEjercicioJueves;
            }

            set
            {
                diaEjercicioJueves = value;
            }
        }

        public DiaEjercicio DiaEjercicioViernes
        {
            get
            {
                return diaEjercicioViernes;
            }

            set
            {
                diaEjercicioViernes = value;
            }
        }

        public DiaEjercicio DiaEjercicioSabado
        {
            get
            {
                return diaEjercicioSabado;
            }

            set
            {
                diaEjercicioSabado = value;
            }
        }

        public DiaEjercicio DiaEjercicioDomingo
        {
            get
            {
                return diaEjercicioDomingo;
            }

            set
            {
                diaEjercicioDomingo = value;
            }
        }

        [Browsable(false)]
        public int Id
        {
            get
            {
                return id;
            }

            set
            {
                id = value;
            }
        }

        public string Nombre
        {
            get
            {
                return nombre;
            }

            set
            {
                nombre = value;
            }
        }

        public override string ToString()
        {
            return this.nombre;
        }
    }
}
