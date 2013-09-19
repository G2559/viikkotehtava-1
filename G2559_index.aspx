<%@ Page Language="C#" AutoEventWireup="true" CodeFile="G2559_index.aspx.cs" Inherits="G2559_index" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Index</title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl="~/G2559_index.aspx">Viikkotehtävän 0 ratkaisu</asp:HyperLink><br />
        <asp:HyperLink ID="HyperLink2" runat="server" NavigateUrl="~/G2559_LocalDBDemo.aspx">lehvoja</asp:HyperLink><br />
        <asp:HyperLink ID="HyperLink3" runat="server" NavigateUrl="~/G2559_index.aspx">Viikkotehtävän 0 ratkaisu</asp:HyperLink><br />
        
    </div>
    <div>
        <h1>VKO 38</h1>
        <asp:HyperLink ID="HyperLink4" runat="server" NavigateUrl="~/G2559_age.aspx">Iän laskenta kalenterilla</asp:HyperLink><br /></div>
    </form>
</body>
</html>
