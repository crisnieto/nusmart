using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using NuSmart.BE;
using System.Data;
using System.Data.SqlClient;

namespace NuSmart.DAL
{
    public class DALRol
    {
        SqlHelper sqlHelper;

        public DALRol()
        {
            sqlHelper = new SqlHelper();
        }

        public List<Rol> conseguirRolesDeUsuario(Usuario usuario)
        {
            List<Rol> listaRoles = new List<Rol>();
            string textoComando = "select A.permisoID, P.descripcion, P.codigo from JoinUsuarioPermiso A join (select permisoID, descripcion, codigo from Permiso) P " +
                                  "ON(A.permisoID = P.permisoID) where A.permisoID IN(select permisoID from JoinUsuarioPermiso where usuarioID = @USER_ID)";

            List<SqlParameter> lista = new List<SqlParameter>();
            lista.Add(new SqlParameter("@USER_ID", usuario.Id));
            DataTable permisosDS = sqlHelper.ejecutarDataAdapter(textoComando, lista).Tables[0];
            foreach (DataRow i in permisosDS.Rows)
            {
                listaRoles.Add(buscarRecursivamente(Convert.ToInt32(i["permisoID"])));
            }

            return listaRoles;

        }

        public List<Rol> conseguirRoles()
        {
            List<Rol> listaRoles = new List<Rol>();
            try
            {
                foreach (Familia familia in conseguirFamilias())
                {
                    listaRoles.Add(buscarRecursivamente(familia.Id));
                }
            }
            catch (Exception ex)
            {

            }
            listaRoles.AddRange(conseguirPermisosSinPadre());
            return listaRoles;

        }

        public List<Rol> conseguirPermisosSinPadre()
        {
            List<Rol> permisos = new List<Rol>();

            string textoComando = "SELECT t1.permisoID, t1.codigo, t1.descripcion, t2.IdHijoPermiso, t2.IdPadrePermiso " +
                                  "FROM permiso t1  left JOIN Permiso_Jerarquia t2 ON t2.IdPadrePermiso = t1.permisoID " +
                                  "or t2.IdHijoPermiso = t1.permisoID WHERE t2.IdHijoPermiso IS NULL and t2.IdPadrePermiso is null";
            DataTable dt = sqlHelper.ejecutarDataAdapter(textoComando).Tables[0];

            foreach (DataRow dr in dt.Rows)
            {
                Permiso permiso = new Permiso();
                permiso.Codigo = (string)dr["codigo"];
                permiso.Descripcion = (string)dr["descripcion"];
                permiso.Id = (int)dr["permisoId"];
                permisos.Add(permiso);
            }

            return permisos;
        }

        private Familia conseguirFamilia(int permisoId)
        {
            string textoComando = "select A.permisoID, A.codigo, A.descripcion from Permiso A join Permiso_Jerarquia B on (A.permisoID = b.IdPadrePermiso) where B.idPadrePermiso = @ID";
            List<SqlParameter> lista = new List<SqlParameter>();
            lista.Add(new SqlParameter("@ID", permisoId));

            DataTable familiaDt = sqlHelper.ejecutarDataAdapter(textoComando, lista).Tables[0];
            
            if(familiaDt.Rows.Count > 0)
            {
                Familia familia = new Familia();
                familia.Codigo = (string)familiaDt.Rows[0]["codigo"];
                familia.Descripcion = (string)familiaDt.Rows[0]["descripcion"];
                familia.Id = (int)familiaDt.Rows[0]["permisoId"];
                return familia;
            }
            else
            {
                return null;
            }


        }


        private Rol buscarRecursivamente(int permisoId, Rol familiaSuperior = null)
        {
            string textoComando = "select A.IdPadrePermiso, A.IdHijoPermiso, P.codigo, P.descripcion, C.codigoPadre, C.descripcionPadre " +
                                  "from Permiso_Jerarquia A JOIN(select permisoID, codigo, descripcion from Permiso) P " +
                                  "ON(A.IdHijoPermiso = P.permisoID) " +
                                  "JOIN(select permisoID, codigo as codigoPadre, descripcion as descripcionPadre from Permiso) C " +
                                  "ON(A.IdPadrePermiso = C.permisoID) where A.IdPadrePermiso = @PERMISO_ID;";

            List<SqlParameter> lista = new List<SqlParameter>();
            lista.Add(new SqlParameter("@PERMISO_ID", permisoId));
            DataTable permisosHijosDT = sqlHelper.ejecutarDataAdapter(textoComando, lista).Tables[0];

            Familia familia = conseguirFamilia(permisoId);

            if (conseguirFamilia(permisoId) != null)
            {
                if (familiaSuperior != null)
                {
                    familiaSuperior.agregar(familia);
                }

                if (permisosHijosDT.Rows.Count > 0)
                {
                    //Significa que tiene hijos
                    /*
                    Console.WriteLine("Encontre una familia con hijos!");
                    Familia familia = new Familia();
                    familia.Id = Convert.ToInt32(permisosHijosDT.Rows[0]["IdPadrePermiso"]);
                    familia.Codigo = Convert.ToString(permisosHijosDT.Rows[0]["codigoPadre"]);
                    familia.Descripcion = Convert.ToString(permisosHijosDT.Rows[0]["descripcionPadre"]);
                    */

                    //Si tengo una familia sobre la familia actual. Si no, es la primera familia.


                    //Entonces busco recursivamente ahora
                    
                    foreach (DataRow i in permisosHijosDT.Rows)
                    {
                        Console.WriteLine("Busco recursivamente para la familia " + Convert.ToString(permisosHijosDT.Rows[0]["codigoPadre"]));
                        buscarRecursivamente(Convert.ToInt32(i["IdHijoPermiso"]), familia);
                    }
                }
                
                return familia;
            }
            else
            {
                //Significa que es un permiso sin hijo, una hoja del arbol.
                Console.WriteLine("Encontre una hoja!");
                string textoComandoParaHijo = "select permisoID, codigo, descripcion from Permiso where permisoID = @PERMISO_ID";
                List<SqlParameter> listaParametroHijo = new List<SqlParameter>();
                listaParametroHijo.Add(new SqlParameter("@PERMISO_ID", permisoId));
                DataRow permisoDR = sqlHelper.ejecutarDataAdapter(textoComandoParaHijo, listaParametroHijo).Tables[0].Rows[0];


                Permiso permiso = new Permiso();
                permiso.Codigo = Convert.ToString(permisoDR["codigo"]);
                permiso.Descripcion = Convert.ToString(permisoDR["descripcion"]);
                permiso.Id = Convert.ToInt32(permisoDR["permisoID"]);

                //Si tengo una familiaSuperior, agrego el permiso a ella
                if (familiaSuperior != null)
                {
                    familiaSuperior.agregar(permiso);
                }

                Console.WriteLine("Hoja: " + Convert.ToString(permisoDR["codigo"]));
                return permiso;
            }
        }


        public List<Familia> conseguirFamilias()
        {
            string textoComando = "select distinct A.IdPadrePermiso, B.codigo, B.descripcion from Permiso_Jerarquia A JOIN Permiso B ON (A.IdPadrePermiso = B.permisoID)";
            DataTable dt = sqlHelper.ejecutarDataAdapter(textoComando).Tables[0];

            List<Familia> listaFamilia = new List<Familia>();

            foreach (DataRow dr in dt.Rows)
            {
                Familia familia = new Familia();
                familia.Codigo = (string)dr["codigo"];
                familia.Id = (int)dr["idPadrePermiso"];
                familia.Descripcion = (string)dr["descripcion"];
                listaFamilia.Add(familia);
            }

            return listaFamilia;
        }


        public void eliminar()
        {

        }

        public void insertar()
        {

        }

        public bool validarCodigoDeRol(string codigo)
        {
            //Verifico que no existan duplicados de Código
            string textoComando = "select codigo from Permiso where codigo = @CODIGO";
            List<SqlParameter> lista = new List<SqlParameter>();
            lista.Add(new SqlParameter("@CODIGO", codigo));
            return sqlHelper.ejecutarDataAdapter(textoComando, lista).Tables[0].Rows.Count == 0;
        }

        public int agregarAFamilia(Rol rolPadre, Rol rolHijo)
        {
            string textoComandoNuevo = "insert into Permiso (descripcion, codigo) values (@DESCRIPCION, @CODIGO)";
            List<SqlParameter> listaNuevo = new List<SqlParameter>();
            listaNuevo.Add(new SqlParameter("@DESCRIPCION", rolHijo.Descripcion));
            listaNuevo.Add(new SqlParameter("@CODIGO", rolHijo.Codigo));


            string textoComandoAsociar = "insert into Permiso_Jerarquia(IdPadrePermiso, IdHijoPermiso) values " +
                                         "(@IDPADRE, (select permisoID from Permiso where codigo = @CODIGO))";

            List<SqlParameter> listaAsociar = new List<SqlParameter>();
            listaAsociar.Add(new SqlParameter("@IDPADRE", rolPadre.Id));
            listaAsociar.Add(new SqlParameter("@CODIGO", rolHijo.Codigo));

            Dictionary<string, List<SqlParameter>> comandosTransaccionales = new Dictionary<string, List<SqlParameter>>();
            comandosTransaccionales.Add(textoComandoNuevo, listaNuevo);
            comandosTransaccionales.Add(textoComandoAsociar, listaAsociar);

            return sqlHelper.ejecutarTransaccion(comandosTransaccionales);
        }

        public int eliminarRecursivamente(int id)
        {
            string textoComandoHijos = "select idhijopermiso from permiso_jerarquia where IdPadrePermiso = @IDPadre";
            List<SqlParameter> lista = new List<SqlParameter>();
            lista.Add(new SqlParameter("@IDPadre", id));

            DataTable hijos = sqlHelper.ejecutarDataAdapter(textoComandoHijos, lista).Tables[0];

            foreach (DataRow dr in hijos.Rows)
            {
                eliminarRecursivamente((int)dr["idHijoPermiso"]);
            }

            string textoEliminarAsociación = "delete from permiso_jerarquia where IdHijoPermiso = @ID";
            List<SqlParameter> listaEliminarAsociacion = new List<SqlParameter>();
            listaEliminarAsociacion.Add(new SqlParameter("@ID", id));
            sqlHelper.ejecutarNonQuery(textoEliminarAsociación, listaEliminarAsociacion);

            string textoEliminarPadre = "delete from permiso where permisoId = @ID";
            List<SqlParameter> listaEliminar = new List<SqlParameter>();
            listaEliminar.Add(new SqlParameter("@ID", id));
            return sqlHelper.ejecutarNonQuery(textoEliminarPadre, listaEliminar);
        }


        public Rol conseguirRol(string codigo)
        {
            string textoComando = "select PermisoId, Codigo, Descripcion from Permiso where codigo = @CODIGO";
            List<SqlParameter> lista = new List<SqlParameter>();
            lista.Add(new SqlParameter("@CODIGO", codigo));
            DataTable dt = sqlHelper.ejecutarDataAdapter(textoComando, lista).Tables[0];

            Permiso permiso = new Permiso();

            permiso.Codigo = (string)dt.Rows[0]["codigo"];
            permiso.Descripcion = (string)dt.Rows[0]["descripcion"];
            permiso.Id = (int)dt.Rows[0]["permisoId"];

            return permiso;
        }

        public bool crearFamilia(Familia familia, Familia familiaPadre = null)
        {
            string textoComando = "insert into PERMISO (codigo, descripcion) OUTPUT Inserted.PermisoId VALUES (@CODIGO, @DESCRIPCION)";
            List<SqlParameter> lista = new List<SqlParameter>();
            lista.Add(new SqlParameter("@CODIGO", familia.Codigo));
            lista.Add(new SqlParameter("@DESCRIPCION", familia.Descripcion));
            sqlHelper.ejecutarNonQuery(textoComando, lista);

            Rol rolCreado = conseguirRol(familia.Codigo);


            if (familiaPadre != null)
            {
                textoComando = "insert into permiso_jerarquia (IdPadrePermiso, IdHijoPermiso) VALUES (@IDPADRE, @IDHIJO)";
                lista = new List<SqlParameter>();
                lista.Add(new SqlParameter("@IDPADRE", familiaPadre.Id));
                lista.Add(new SqlParameter("@IDHIJO", rolCreado.Id));
                sqlHelper.ejecutarNonQuery(textoComando, lista);
            }


            textoComando = "insert into permiso_jerarquia (IdPadrePermiso, IdHijoPermiso) VALUES (@IDPADRE, @IDHIJO)";
            lista = new List<SqlParameter>();
            lista.Add(new SqlParameter("@IDPADRE", rolCreado.Id));
            lista.Add(new SqlParameter("@IDHIJO", DBNull.Value));

            return Convert.ToBoolean(sqlHelper.ejecutarNonQuery(textoComando, lista));



        }

    }
}
