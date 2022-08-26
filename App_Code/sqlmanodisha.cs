using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data.SqlClient;
using System.Data;

/// <summary>
/// Summary description for sqlmanodisha
/// </summary>
public class sqlmanodisha
{
    public SqlConnection Getsqlmanodisha()
    {
        SqlConnection conn = new SqlConnection("Data Source=.; Initial Catalog=manodi_db; User ID=xxxxxxx; Password=wE@bT2Chi#9u;");
        return conn;
    }
}