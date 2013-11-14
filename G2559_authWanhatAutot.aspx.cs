using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Security.Cryptography;
using System.Xml;
using System.Text;

public partial class G2559_authWanhatAutot : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack)
        {
            BindGrid();

        }
    }

    private void BindGrid()
    {
        AutotDAL objAutoDAL = new AutotDAL();
        grdViewAuto.DataSource = objAutoDAL.GetAll();
        grdViewAuto.DataBind();
    }

    protected void grdViewAuto_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        if (e.Row.RowType == DataControlRowType.DataRow)
        {
            e.Row.Cells[1].Attributes.Add("onclick", "return confirm('Are you sure want to delete?')");
        }
    }

    protected void grdViewAuto_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        grdViewAuto.PageIndex = e.NewPageIndex;
        grdViewAuto.SelectedIndex = -1;
        BindGrid();
    }

    protected void btnKirjaudu_Click(object sender, EventArgs e)
    {
        if (FormsAuthentication.Authenticate(this.txtKayttaja.Text, this.txtSala.Text))
        {
            FormsAuthentication.SetAuthCookie(this.txtKayttaja.Text, false);
            FormsAuthentication.RedirectFromLoginPage(this.txtKayttaja.Text, false);
        }
        else
        {
            lblKirjautuminen.Text = "Invalid login details. Please try again.";
        }
    }

    protected void btnHashkirjaudu_Click(object sender, EventArgs e)
    {
        XmlDocument doc = new XmlDocument();
        doc.Load(Server.MapPath("~/App_Data/Tunnukset.xml"));
        String hash = txtHashkayttaja.Text + txtHashsala.Text;
        var md5 = MD5.Create();
        byte[] hashed = md5.ComputeHash(Encoding.UTF8.GetBytes(hash));

        //create new instance of StringBuilder to save hashed data
        StringBuilder returnValue = new StringBuilder();

        //loop for each byte and add it to StringBuilder
        for (int i = 0; i < hashed.Length; i++)
        {
            returnValue.Append(hashed[i].ToString());
        }

        // return hexadecimal string
        var  hashash = returnValue.ToString();
        foreach (XmlNode node in doc.SelectNodes("//Tunnukset"))
        {
            String username = node.SelectSingleNode("//kayttaja").InnerText;
            String password = node.SelectSingleNode("//sala").InnerText;
     
        
            if(username == txtHashkayttaja.Text && password == hashash)
            {
                Response.Redirect("G2559_WanhatAutotMuokkaus.aspx");
            }
            else
            {
                lblHashkirjautuminen.Text = "Invalid login details. Please try again."; 
            }
}


    }
}