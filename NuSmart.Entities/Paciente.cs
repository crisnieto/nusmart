﻿using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace NuSmart.BE
{
    public class Paciente
    {
        private int _id;
        private string _email;
        private int _telefono;
        private string _nombre;
        private string _apellido;
        private int _dni;
        private string _sexo;
        private string _habitos;
        private bool _eliminado;
        private DateTime _fechaNacimiento;

        [Browsable(false)]
        public int Id
        {
            get
            {
                return _id;
            }

            set
            {
                _id = value;
            }
        }

        public string Email
        {
            get
            {
                return _email;
            }

            set
            {
                _email = value;
            }
        }

        public int Telefono
        {
            get
            {
                return _telefono;
            }

            set
            {
                _telefono = value;
            }
        }

        public string Nombre
        {
            get
            {
                return _nombre;
            }

            set
            {
                _nombre = value;
            }
        }

        public string Apellido
        {
            get
            {
                return _apellido;
            }

            set
            {
                _apellido = value;
            }
        }

        public int Dni
        {
            get
            {
                return _dni;
            }

            set
            {
                _dni = value;
            }
        }

        public string Sexo
        {
            get
            {
                return _sexo;
            }

            set
            {
                _sexo = value;
            }
        }

        public string Habitos
        {
            get
            {
                return _habitos;
            }

            set
            {
                _habitos = value;
            }
        }

        [Browsable(false)]
        public bool Eliminado
        {
            get
            {
                return _eliminado;
            }

            set
            {
                _eliminado = value;
            }
        }

        public DateTime FechaNacimiento
        {
            get
            {
                return _fechaNacimiento;
            }

            set
            {
                _fechaNacimiento = value;
            }
        }

        public int Edad()
        {
            var hoy = DateTime.Today;
            int edad = hoy.Year - FechaNacimiento.Year;
            if (FechaNacimiento.Date > hoy.AddYears(-edad)) edad--;
            return edad;
        }

        public override string ToString()
        {
            return this.Nombre + " " + this.Apellido;
        }
    }
}