using System;
using System.Collections.Generic;
using System.Configuration;  // for ConfigurationManager
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Xml; // for XmlDocument etc.

public partial class vko40_tuntitehtavat_G2559_RSSFEEDS : System.Web.UI.Page
{
    #region TapahtumanKasittelijat
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void btnGetLiiga_Click(object sender, EventArgs e)
    {
        GetFeedsFrom("Liiga");
    }

    protected void btnGetMS_Click(object sender, EventArgs e)
    {
        GetFeedsFrom("MS");
    }
    protected void btnGetIS_Click(object sender, EventArgs e)
    {
        GetFeedsFrom("IS");
    }
    #endregion
    protected void GetFeedsFrom(string FeedSource)
    {
        string url = "";
        switch (FeedSource)
        {
            case "Liiga":
                url = ConfigurationManager.AppSettings["rssfeeditSF"];
                break;
            case "MS":
                url = ConfigurationManager.AppSettings["rssfeeditMS"];
                break;
            case "IS":
                url = ConfigurationManager.AppSettings["rssfeeditIS"];
                break;
            default:
                break;
        }
        // kokeillaan tuleeko oikeasta osoitteesta
        lblBody.Text = url;
        // luetaan XML XmlDocument-olioon
        XmlDocument doc = new XmlDocument();
        myDataSource.DataFile = url;
        doc = myDataSource.GetXmlDocument();
        // 1 vaihe: luetaan channel-elementin title-elementti
        XmlNode node = doc.SelectSingleNode("/rss/channel");
        string otsikko = node["title"].InnerText;
        lblHeader.Text = otsikko;
        // 2 vaihe: loopitetaan item-noodit läpi
        XmlNodeList nodes = doc.SelectNodes("/rss/channel/item");
        int i = 0;
        string rsstitle;
        string rsslink;
        foreach (XmlNode item in nodes)
        {
            i++;
            // uusi rivi Tableen
            TableRow row = new TableRow();
            // riville kaksi solua, ensimmäiseen numero ja toiseen hyperlinkki
            TableCell cell = new TableCell();
            cell.Text = i.ToString();
            // toka solu
            TableCell cell2 = new TableCell();
            rsstitle = item["title"].InnerText;
            rsslink = item["link"].InnerText;
            HyperLink h1 = new HyperLink();
            h1.Text = rsstitle;
            h1.NavigateUrl = rsslink;
            cell2.Controls.Add(h1);
            // lisätään solut riville ja rivi lisätään tauluun
            row.Cells.Add(cell);
            row.Cells.Add(cell2);
            myDataTable.Rows.Add(row);
        }
    }
 
}