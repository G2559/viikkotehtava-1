using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Xml;

public partial class Valipalaute : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void btnGetPalautteet_Click(object sender, EventArgs e)
    {
        DataSet ds = new DataSet();
        DataTable dt;
        //dt = new DataTable();
        ds.ReadXml(MapPath("~/App_Data/Palautteet.xml"));
        dt = ds.Tables[0];
        //kytketään kontrolliin
        //GridView1.DataSource = ds; //toimii jos yksi taulu
        gvpalautteet.DataSource = dt;
        gvpalautteet.DataBind();

        lbltulokset.Text = "Näytetty: " + gvpalautteet.Rows.Count.ToString() + " palautetta";
    }
    protected void btnLaheta_Click(object sender, EventArgs e)
    {
        XmlDocument oXmlDocument = new XmlDocument();
        oXmlDocument.Load(@"D:\G2559\viikkotehtava-1\App_Data\Palautteet.xml"); 
        XmlNode oXmlRootNode = oXmlDocument.SelectSingleNode("palautteet"); 
        XmlNode oXmlRecordNode = oXmlRootNode.AppendChild(oXmlDocument.CreateNode(XmlNodeType.Element, "palaute", "")); 
        oXmlRecordNode.AppendChild(oXmlDocument.CreateNode(XmlNodeType.Element, "pvm", "")).InnerText = txtPvm.Text; 
        oXmlRecordNode.AppendChild(oXmlDocument.CreateNode(XmlNodeType.Element, "tekija", "")).InnerText = txtNimi.Text; 
        oXmlRecordNode.AppendChild(oXmlDocument.CreateNode(XmlNodeType.Element, "opittu", "")).InnerText = txtOppinut.Text; 
        oXmlRecordNode.AppendChild(oXmlDocument.CreateNode(XmlNodeType.Element, "haluanoppia", "")).InnerText = txtHaluanoppia.Text; 
        oXmlRecordNode.AppendChild(oXmlDocument.CreateNode(XmlNodeType.Element, "hyvaa", "")).InnerText = txtHyvaa.Text; 
        oXmlRecordNode.AppendChild(oXmlDocument.CreateNode(XmlNodeType.Element, "parannettavaa", "")).InnerText = txtParannettavaa.Text; 
        oXmlRecordNode.AppendChild(oXmlDocument.CreateNode(XmlNodeType.Element, "muuta", "")).InnerText = txtMuuta.Text;
        oXmlDocument.Save(@"D:\G2559\viikkotehtava-1\App_Data\Palautteet.xml");
    }
}