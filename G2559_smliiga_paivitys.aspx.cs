using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.Common;
using System.Data.OleDb;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class G2559_smliiga_paivitys : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {


    }

    protected void btnLisaa_Click(object sender, EventArgs e)
    {
        /*
        OleDbConnection conn = new OleDbConnection();
        conn.ConnectionString = @"Provider=Microsoft.ACE.OLEDB.12.0;Data Source=D:\desktop\kouluhommia\dotnet\viikkotehtava-1\App_Data\SMLiiga.accdb";

        String sukunimi = txtSukunimi.Text;
        String etunimi = txtEtunimi.Text;

        OleDbCommand cmd = new OleDbCommand("INSERT into Pisteet (sukunimi, etunimi) Values(@sukunimi, @etunimi)");
        cmd.Connection = conn;

        conn.Open();

        if (conn.State == ConnectionState.Open)
        {
            cmd.Parameters.Add("@sukunimi", OleDbType.VarChar).Value = sukunimi;
            cmd.Parameters.Add("@etunimi", OleDbType.VarChar).Value = etunimi;


            try
            {
                cmd.ExecuteNonQuery();
  
                conn.Close();
            }
            catch (OleDbException ex)
            {

                conn.Close();
            }
        }
        else
        {

        }
        
    }
*/




        string provider = ConfigurationManager.ConnectionStrings["ConnectionString"].ProviderName;
/*
        DbProviderFactory factory = DbProviderFactories.GetFactory(provider);

        //Open Connection
        DbConnection conn = factory.CreateConnection();

        //Assign Connection String
        conn.ConnectionString = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
        //Connection Open
        conn.Open();

        //Initialize Command
        DbCommand comm = conn.CreateCommand();
        //Tell command which connection it will use
        comm.Connection = conn;
        //Give command SQL to execute
        comm.CommandText = "Insert into Pisteet(sukunimi, etunimi) values(@sukunimi, @etunimi)";

      //  string sukunimi = "ffasdfa";
       // string etunimi = "fsadf";
        SqlParameter sukunimi = new SqlParameter("@sukunimi", SqlDbType.VarChar);
        sukunimi.Value = txtSukunimi.Text;
        comm.Parameters.Add(sukunimi);


        SqlParameter etunimi = new SqlParameter("@etunimi", SqlDbType.VarChar);
        etunimi.Value = txtEtunimi.Text;
        comm.Parameters.Add(etunimi);

        //Execute command get back result via reader
        int totalCount = comm.ExecuteNonQuery();

        conn.Close();

*/
        
            OleDbConnection conn = new OleDbConnection();

            conn.ConnectionString = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;

            String etunimi = txtEtunimi.Text;
            String sukunimi = txtSukunimi.Text;

            OleDbCommand cmd = new OleDbCommand("Insert into Pisteet(sukunimi, etunimi, id) values(@sukunimi, @etunimi, @id)");
            cmd.Connection = conn;
            Random k = new Random();
            int id = k.Next(1000);
            id += 400;
            conn.Open();

            if (conn.State == ConnectionState.Open)
            {
                cmd.Parameters.Add("@etunimi", OleDbType.VarChar).Value = etunimi;
                cmd.Parameters.Add("@sukunimi", OleDbType.VarChar).Value = sukunimi;
                cmd.Parameters.Add("@id", OleDbType.SmallInt).Value = id;

                try
                {
                    cmd.ExecuteNonQuery();

                    conn.Close();
                }
                catch (OleDbException ex)
                {

                    conn.Close();
                }
            }
  
        }


}
