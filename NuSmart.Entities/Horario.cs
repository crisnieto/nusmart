using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace NuSmart.BE
{
    public class Horario
    {
        int id;
        DateTime tiempo;

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

        public DateTime Tiempo
        {
            get
            {
                return tiempo;
            }

            set
            {
                tiempo = default(DateTime).Add(value.TimeOfDay);
            }
        }

        public override string ToString()
        {
            return this.Tiempo.ToShortTimeString();
        }
    }
}
