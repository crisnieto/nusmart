﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using NuSmart.BE;
using NuSmart.DAL;

namespace NuSmart.BLL
{
    public class BLLFamilia
    {
        DALRol dalRol;

        public BLLFamilia()
        {
            dalRol = new DALRol();
        }

        public List<Familia> conseguirFamilias()
        {
            return dalRol.conseguirFamilias();
        }


    }
}
