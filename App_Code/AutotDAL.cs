using System;
using System.Collections.Generic;
using System.Configuration;
using System.IO;
using System.Linq;
using System.Web;
using System.Xml;
using System.Xml.XPath;

/// <summary>
/// Summary description for AutotDAL
/// </summary>
public class AutotDAL
{
    string strFileName = string.Empty;

	public AutotDAL()
	{
         
		 // Getting the XML file name at the initialization
        strFileName =  Path.Combine(AppDomain.CurrentDomain.BaseDirectory,ConfigurationManager.AppSettings["DataBasePath"] + "WanhatAutot.xml");
	}

    /// <summary>
    /// This method is used for creating a new employee information in XML file
    /// </summary>
    /// <param name="employee">employee object</param>
    /// <returns>True - Success, False - Failure</returns>
    public bool Create(BLAutot auto)
    {
        try
        {
            // Checking if the file exist
            if (!File.Exists(strFileName))
            {
                // If file does not exist in the database path, create and store an empty Autot node
                XmlTextWriter textWritter = new XmlTextWriter(strFileName, null);
                textWritter.WriteStartDocument();
                textWritter.WriteStartElement("Wanhatautot");
                textWritter.WriteEndElement();
                textWritter.Close();
            }
 
            // Create the XML document by loading the file
            XmlDocument xmlDoc = new XmlDocument();
            xmlDoc.Load(strFileName);
 
            // Creating Auto node
            XmlElement subNode = xmlDoc.CreateElement("Auto");
 
            // Getting the maximum Id based on the XML data already stored
            string strId = CommonMethods.GetMaxValue(xmlDoc, "Wanhatautot" + "/" + "Auto" + "/" + "aid").ToString();
            
            // Adding Id column. Auto generated column
            subNode.AppendChild(CommonMethods.CreateXMLElement(xmlDoc, "aid", strId));
            xmlDoc.DocumentElement.AppendChild(subNode);

            subNode.AppendChild(CommonMethods.CreateXMLElement(xmlDoc, "rekkari", auto.rekkari));
            xmlDoc.DocumentElement.AppendChild(subNode);
 
            subNode.AppendChild(CommonMethods.CreateXMLElement(xmlDoc, "merkki", auto.merkki));
            xmlDoc.DocumentElement.AppendChild(subNode);
 
            subNode.AppendChild(CommonMethods.CreateXMLElement(xmlDoc, "malli", auto.malli));
            xmlDoc.DocumentElement.AppendChild(subNode);
 
            subNode.AppendChild(CommonMethods.CreateXMLElement(xmlDoc, "vm", auto.vm.ToString()));
            xmlDoc.DocumentElement.AppendChild(subNode);

            subNode.AppendChild(CommonMethods.CreateXMLElement(xmlDoc, "myyntiHinta", auto.myyntiHinta.ToString()));
            xmlDoc.DocumentElement.AppendChild(subNode);

            subNode.AppendChild(CommonMethods.CreateXMLElement(xmlDoc, "sisaanOstoHinta", auto.sisaanOstoHinta.ToString()));
            xmlDoc.DocumentElement.AppendChild(subNode);
 
            // Saving the file after adding the new auto node
            xmlDoc.Save(strFileName);
 
            return true;
        }
        catch (Exception ex)
        {
            throw ex;
        }
    }
 
    public bool Update(BLAutot auto)
    {
 
        try
        {
            if (File.Exists(strFileName))
            {
                XmlDocument objXmlDocument = new XmlDocument();
                objXmlDocument.Load(strFileName);
 
                // Getting a particular Auto by selecting using Xpath query
                XmlNode node = objXmlDocument.SelectSingleNode("//Auto[aid='" + auto.aid + "']");
 
                if (node != null)
                {
                    // Assigning all the values
                    node.SelectNodes("aid").Item(0).FirstChild.Value = auto.aid.ToString();
                    node.SelectNodes("rekkari").Item(0).FirstChild.Value = auto.rekkari;
                    node.SelectNodes("malli").Item(0).FirstChild.Value = auto.malli;
                    node.SelectNodes("merkki").Item(0).FirstChild.Value = auto.merkki;
                    node.SelectNodes("vm").Item(0).FirstChild.Value = auto.vm.ToString();
                    node.SelectNodes("myyntiHinta").Item(0).FirstChild.Value = auto.myyntiHinta.ToString();
                    node.SelectNodes("sisaanOstoHinta").Item(0).FirstChild.Value = auto.sisaanOstoHinta.ToString();
                }
                // Saving the file
                objXmlDocument.Save(strFileName);
 
                return true;
            }
            else
            {
                Exception ex = new Exception("Database file does not exist in the folder");
                throw ex;
            }
        }
        catch (Exception ex)
        {
            throw ex;
        }
    }

    public bool Delete(string aid)
    {
        try
        {
            if (File.Exists(strFileName))
            {
                XmlDocument objXmlDocument = new XmlDocument();
                objXmlDocument.Load(strFileName);
 
                XmlNode node = objXmlDocument.SelectSingleNode("//Auto[aid='" + aid + "']");
 
                if (node != null)
                {
                    objXmlDocument.ChildNodes[1].RemoveChild(node);
                }
                objXmlDocument.Save(strFileName);
 
                return true;
            }
            else
            {
                Exception ex = new Exception("Database file does not exist in the folder");
                throw ex;
            }
        }
        catch (Exception ex)
        {
            throw ex;
        }
    }
 

    public IList<BLAutot> GetAll()
    {
        try
        {
            if (File.Exists(strFileName))
            {
                // Loading the file into XPath document
                XPathDocument doc = new XPathDocument(strFileName);
                XPathNavigator nav = doc.CreateNavigator();
 
                XPathExpression exp = nav.Compile("/Wanhatautot/Auto"); // Getting all autot
 
                // Sorting the records by aid
                exp.AddSort("aid", System.Xml.XPath.XmlSortOrder.Ascending, System.Xml.XPath.XmlCaseOrder.None, "", System.Xml.XPath.XmlDataType.Text);
 
                XPathNodeIterator iterator = nav.Select(exp);
                IList<BLAutot> objAutot = new List<BLAutot>();
 
                while (iterator.MoveNext())
                {
                    XPathNavigator nav2 = iterator.Current.Clone();

                    BLAutot objAuto = new BLAutot();
                    objAuto.aid = Convert.ToInt64(nav2.Select("//Auto").Current.SelectSingleNode("aid").InnerXml);
                    objAuto.rekkari = nav2.Select("//Auto").Current.SelectSingleNode("rekkari").InnerXml;
                    objAuto.merkki = nav2.Select("//Auto").Current.SelectSingleNode("merkki").InnerXml;
                    objAuto.malli = nav2.Select("//Auto").Current.SelectSingleNode("malli").InnerXml;
                    objAuto.vm = Convert.ToInt32(nav2.Select("//Auto").Current.SelectSingleNode("vm").InnerXml);
                    objAuto.myyntiHinta = Convert.ToInt64(nav2.Select("//Auto").Current.SelectSingleNode("myyntiHinta").InnerXml);
                    objAuto.sisaanOstoHinta = Convert.ToInt64(nav2.Select("//Auto").Current.SelectSingleNode("sisaanOstoHinta").InnerXml);

                    objAutot.Add(objAuto);
                }
                return objAutot;
            }
        }
        catch (Exception ex)
        {
            throw ex;
        }
        return null;
    }
 
    public BLAutot Get(string aid)
    {
        try
        {
            if (File.Exists(strFileName))
            {
                BLAutot objAuto = new BLAutot();
 
                XPathDocument doc = new XPathDocument(strFileName);
                XPathNavigator nav = doc.CreateNavigator();
                XPathNodeIterator iterator;
 
                iterator = nav.Select("//Auto[aid='" + aid + "']");
 
                while (iterator.MoveNext())
                {
                    XPathNavigator nav2 = iterator.Current.Clone();

                    objAuto.aid = Convert.ToInt64(nav2.Select("//Auto").Current.SelectSingleNode("aid").InnerXml);
                    objAuto.rekkari = nav2.Select("//Auto").Current.SelectSingleNode("rekkari").InnerXml;
                    objAuto.merkki = nav2.Select("//Auto").Current.SelectSingleNode("merkki").InnerXml;
                    objAuto.malli = nav2.Select("//Auto").Current.SelectSingleNode("malli").InnerXml;
                    objAuto.vm = Convert.ToInt32(nav2.Select("//Auto").Current.SelectSingleNode("vm").InnerXml);
                    objAuto.myyntiHinta = Convert.ToInt64(nav2.Select("//Auto").Current.SelectSingleNode("myyntiHinta").InnerXml);
                    objAuto.sisaanOstoHinta = Convert.ToInt64(nav2.Select("//Auto").Current.SelectSingleNode("sisaanOstoHinta").InnerXml);
                }
                return objAuto;
            }
        }
        catch (Exception ex)
        {
            throw ex;
        }
        return null;
    }
}