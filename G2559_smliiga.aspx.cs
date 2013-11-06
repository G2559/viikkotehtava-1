using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.OleDb;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class G2559_smliiga : System.Web.UI.Page
{
    DataTable dt;
    DataSet ds;
    DataView dv;
    bool joukkuefilter = false;
    protected void Page_Load(object sender, EventArgs e)
    {
        var db = System.Configuration.ConfigurationManager.ConnectionStrings["ConnectionString"];
        // SqlConnection con = new SqlConnection(db);
        OleDbConnection Conn = new OleDbConnection(db.ToString());

        using (Conn)
        {
            Conn.Open();
            OleDbCommand cmd = new OleDbCommand("SELECT * FROM Pisteet", Conn);
            OleDbDataAdapter oDA = new OleDbDataAdapter(cmd);
            dt = new DataTable();
            oDA.Fill(dt);
        }
        if (dv == null)
        {
            dv = dt.DefaultView;
        }
        gvArticle.DataSource = dv;
        gvArticle.DataBind();
        //       drpjoukkueet.DataSource ;
        if (!IsPostBack)
        {

            DataTable ddt;
            ddt = dt.DefaultView.ToTable(true, "Seura");
            DataRow row2 = ddt.NewRow();
            row2["Seura"] = "Kaikki";
            ddt.Rows.InsertAt(row2, 0);
            drpjoukkueet.DataSource = ddt.DefaultView;
            drpjoukkueet.DataTextField = "Seura";
            drpjoukkueet.DataBind();

            DataTable tb;
            tb = dt.DefaultView.ToTable(true, "pelipaikka");

            DataRow row3 = tb.NewRow();
            row3["pelipaikka"] = "Kaikki";
            tb.Rows.InsertAt(row3, 0);

            drppelipaikka.DataSource = tb.DefaultView;
            drppelipaikka.DataTextField = "pelipaikka";
            drppelipaikka.DataBind();


        }
    }


    protected void drpjoukkueet_SelectedIndexChanged(object sender, EventArgs e)
    {
        joukkuefilter = true;
        if (drpjoukkueet.SelectedValue == "Kaikki")
        {
            dv.RowFilter = createfilter();
            gvArticle.DataSource = dv;
            gvArticle.DataBind();
            return;

        }
        //DataTable dt;
        // dt = ds.Tables[0];
        dv = dt.DefaultView;

        // if (drpjoukkueet.SelectedValue != "Kaikki")
        //{
        dv.RowFilter = createfilter();
        // dv.RowFilter = string.Format("Joukkue like '%{0}%'", drpjoukkueet.SelectedValue);
        //}
        dv.Sort = "sukunimi asc";
        gvArticle.DataSource = dv;
        gvArticle.DataBind();
    }


    private const string ASCENDING = " ASC";
    private const string DESCENDING = " DESC";


    public SortDirection GridViewSortDirection
    {
        get
        {
            if (ViewState["sortDirection"] == null)
                ViewState["sortDirection"] = SortDirection.Ascending;

            return (SortDirection)ViewState["sortDirection"];
        }
        set { ViewState["sortDirection"] = value; }
    }


    protected void gvArticle_Sorting(object sender, GridViewSortEventArgs e)
    {

        string sortExpression = e.SortExpression;

        if (GridViewSortDirection == SortDirection.Ascending)
        {
            GridViewSortDirection = SortDirection.Descending;
            SortGridView(sortExpression, DESCENDING);
        }
        else
        {
            GridViewSortDirection = SortDirection.Ascending;
            SortGridView(sortExpression, ASCENDING);
        }

    }

    private void SortGridView(string sortExpression, string direction)
    {
        //  You can cache the DataTable for improving performance
        string filter = "";

        //dv = new DataView(dt);
        if (drpjoukkueet.SelectedIndex != 0)
        {
            filter += string.Format("Seura like '%{0}%'", drpjoukkueet.SelectedValue);
        }
        if (drppelipaikka.SelectedIndex != 0)
        {
            if (filter.Length > 0)
                filter += " and ";
            filter += string.Format("pelipaikka like '{0}'", drppelipaikka.SelectedValue);
        }
        dv.RowFilter = filter;
        dv.Sort = sortExpression + direction;

        gvArticle.DataSource = dv;
        gvArticle.DataBind();
    }

    protected void drppelipaikka_SelectedIndexChanged(object sender, EventArgs e)
    {
        if (drppelipaikka.SelectedValue == "Kaikki")
        {


            dv.RowFilter = createfilter();
            gvArticle.DataSource = dv;
            gvArticle.DataBind();

            return;
        }
        dv = dt.DefaultView;

        // if (drpjoukkueet.SelectedValue != "Kaikki")
        //{

        //dv.RowFilter = string.Format("PP like '{0}'", drppelipaikka.SelectedValue);
        dv.RowFilter = createfilter();

        //}
        dv.Sort = "pisteet desc";
        gvArticle.DataSource = dv;
        gvArticle.DataBind();
    }
    protected void Button1_Click(object sender, EventArgs e)
    {

        joukkuefilter = false;
        drpjoukkueet.SelectedIndex = -1;
        drppelipaikka.SelectedIndex = -1;
        dv = dt.DefaultView;
        gvArticle.DataSource = dv;
        gvArticle.DataBind();
    }

    private string createfilter()
    {
        string filter = "";

        //dv = new DataView(dt);
        if (drpjoukkueet.SelectedIndex != 0)
        {
            filter += string.Format("Seura like '%{0}%'", drpjoukkueet.SelectedValue);
        }
        if (drppelipaikka.SelectedIndex != 0)
        {
            if (filter.Length > 0)
                filter += " and ";
            filter += string.Format("pelipaikka like '{0}'", drppelipaikka.SelectedValue);
        }
        return filter;
    }
    protected void EditPlayer(object sender, GridViewEditEventArgs e)
    {

        gvArticle.EditIndex = e.NewEditIndex;
        gvArticle.DataSource = dv;

        gvArticle.DataBind() ;


    }
    protected void CancelEdit(object sender, GridViewCancelEditEventArgs e)
    {

        gvArticle.EditIndex = -1;
        gvArticle.DataSource = dv;

        gvArticle.DataBind();

    }

    protected void UpdatePlayer(object sender, GridViewUpdateEventArgs e)
    {
      
   
        string CustomerID = ((Label)gvArticle.Rows[e.RowIndex].FindControl("id")).Text;

        string Name = ((TextBox)gvArticle.Rows[e.RowIndex]

                            .FindControl("txtContactName")).Text;

        string Company = ((TextBox)gvArticle.Rows[e.RowIndex]

                            .FindControl("txtCompany")).Text;

        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString);

        SqlCommand cmd = new SqlCommand();

        cmd.CommandType = CommandType.Text;

        cmd.CommandText = "update customers set ContactName=@ContactName," +

         "CompanyName=@CompanyName where CustomerID=@CustomerID;" +

         "select CustomerID,ContactName,CompanyName from customers";

        cmd.Parameters.Add("@CustomerID", SqlDbType.VarChar).Value = CustomerID;

        cmd.Parameters.Add("@ContactName", SqlDbType.VarChar).Value = Name;

        cmd.Parameters.Add("@CompanyName", SqlDbType.VarChar).Value = Company;

        gvArticle.EditIndex = -1;

        gvArticle.DataSource = dv;
        gvArticle.DataBind();

    }
}