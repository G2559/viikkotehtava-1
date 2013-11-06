<%@ Page Language="C#" AutoEventWireup="true" CodeFile="G2559_smliiga_paivitys.aspx.cs" Inherits="G2559_smliiga_paivitys" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server" method="post">
         <asp:sqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>" SelectCommand="SELECT * FROM [Pisteet]"></asp:sqlDataSource>
        <h1>Lisää pelaajia</h1>
    <div>
        Sukunimi:
        <asp:TextBox ID="txtSukunimi" runat="server"></asp:TextBox>
        <br />
        Etunimi:
        <asp:TextBox ID="txtEtunimi" runat="server"></asp:TextBox>     
        <br />
        <asp:Button ID="btnLisaa" Text="Lisää" runat="server" OnClick="btnLisaa_Click" />
        
        <br />

            
    </div>
    </form>
</body>
</html>
