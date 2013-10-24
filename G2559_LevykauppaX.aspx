<%@ Page Language="C#" AutoEventWireup="true" CodeFile="G2559_LevykauppaX.aspx.cs" Inherits="LevykauppaX" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">

    <title></title>
    <link href="levykauppa.css" rel="stylesheet" type="text/css" />
</head>
<body>
    <form id="form1" runat="server">
        <img src="images/levykauppa.JPG" />
 
        <asp:XmlDataSource ID="xmlLevyt" runat="server" DataFile="~/App_Data/LevykauppaX.xml" XPath="Records//genre//record"></asp:XmlDataSource>
        <asp:DataList ID="DataListLevyt" runat="server" DataSourceID="xmlLevyt">
            <ItemTemplate>
                <div id="kuva">
                <img src="images/<%# Eval("ISBN")%>.jpg" />  
                 </div>
                <div id="tiedot">    
                <h2><%# Eval("Artist") %> : <%# Eval("Title") %></h2> <br />
                <b>ISBN:</b> 
                <asp:HyperLink ID="hype1" runat="server" NavigateUrl='<%# "~/G2559_LevykauppaX_lisasivu.aspx?ISBN=" + Eval("ISBN").ToString()%>'><%# Eval("ISBN") %></asp:HyperLink> <br />
                <b>Hinta:</b> <%# Eval("Price") %>
                    </div> 
            </ItemTemplate>
        </asp:DataList>

    </form>
</body>
</html>
