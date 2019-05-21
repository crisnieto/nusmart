using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace NuSmart.BE
{
    public class Nutricionista
    {
        int _id;
        string _nombre;
        string _apellido;
        string _matricula;
        int _dni;
        string _especializacion;
        Usuario usuario;
        string _sexo;
        int _dvh;

        public string Nombre { get => _nombre; set => _nombre = value; }
        public string Apellido { get => _apellido; set => _apellido = value; }
        public string Matricula { get => _matricula; set => _matricula = value; }
        public int Dni { get => _dni; set => _dni = value; }
        public string Especializacion { get => _especializacion; set => _especializacion = value; }
        public Usuario Usuario { get => usuario; set => usuario = value; }
        public string Sexo { get => _sexo; set => _sexo = value; }
        public int Dvh { get => _dvh; set => _dvh = value; }
        public int Id { get => _id; set => _id = value; }
    }
}
