<%@ Page Language="C#" AutoEventWireup="true" CodeFile="G2559_LevykauppaX_lisasivu.aspx.cs" Inherits="G2559_LevykauppaX_lisasivu" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link href="levykauppa.css" rel="stylesheet" type="text/css" />
</head>
<body>
    <form id="form1" runat="server">
         <img src="images/levykauppa.JPG" />
         
                <div> <asp:image ID="imgLevy" runat="server"></asp:image></div>
                <b><asp:Label ID="lblArtist" runat="server"></asp:Label></b> :
                <b><asp:Label ID="lblRecord" runat="server"></asp:Label></b> <br />
                <b>ISBN:</b> <asp:Label ID="lblISBN" runat="server"></asp:Label> <br />              
                <b>Hinta:</b> <asp:Label ID="lblPrice" runat="server"></asp:Label> <br /> 
                <b>Levyn biisit:</b> <br /> 
        
         <asp:XmlDataSource ID="xmlLevyt" runat="server" DataFile="~/App_Data/LevykauppaX.xml" XPath="Records//genre//record"></asp:XmlDataSource>
        <asp:DataList ID="DataListLevyt" runat="server" >             
             <ItemTemplate>                     
                <%# ((System.Xml.XmlNode)Container.DataItem).Attributes["name"].Value %> <br />

            </ItemTemplate>
        </asp:DataList>     
    </form>
</body>
</html>
