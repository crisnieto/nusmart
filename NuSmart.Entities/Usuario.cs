using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace NuSmart.BE
{
    public class Usuario
    {
        int _id;
        int _dvh;
        string _password;
        string _username;
        Rol rol;

        public string Username { get => _username; set => _username = value; }
        public string Password { get => _password; set => _password = value; }
        public int DVH { get => _dvh; set => _dvh = value; }
        public int ID { get => _id; set => _id = value; }
        public Rol Rol { get => rol; set => rol = value; }

        public override string ToString()
        {
            return this._username;
        }
    }
}
