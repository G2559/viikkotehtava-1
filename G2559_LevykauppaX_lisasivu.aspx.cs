using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Xml;

public partial class G2559_LevykauppaX_lisasivu : System.Web.UI.Page
{

    protected void Page_Load(object sender, EventArgs e)
    {
        String s = Request.QueryString["ISBN"];
        xmlLevyt.XPath = "Records//genre//record";
        XmlDocument doc = xmlLevyt.GetXmlDocument();

        XmlNodeList nodes = doc.SelectNodes("//Records//genre//record[@ISBN='" + Request.QueryString["ISBN"] + "']");
        XmlNode node = nodes.Item(0);

        DataListLevyt.DataSource = node;
        DataListLevyt.DataBind();

        lblArtist.Text = node.Attributes["Artist"].Value;
        lblRecord.Text = node.Attributes["Title"].Value;
        lblISBN.Text = node.Attributes["ISBN"].Value;
        lblPrice.Text = node.Attributes["Price"].Value;
        imgLevy.ImageUrl = "images/" + s + ".jpg";

    }

    
}