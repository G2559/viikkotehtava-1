<%@ Page Language="C#" AutoEventWireup="true" CodeFile="G2559_authWanhatAutot.aspx.cs" Inherits="G2559_authWanhatAutot" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Wanhat autot</title>
    <link href="auto.css" rel="stylesheet" type="text/css" />
    <style type="text/css">
        .auto-style1 {
            width: 100px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
    <div>
<div id="otsikko" align="center">
        <h1>Wanhoja autoja</h1>
    </div>
            <div id="nelio">
                <div id="sisalto">
                    <h2>VE1</h2>
    <table>
    <tr><td>Käyttäjä: <asp:TextBox ID="txtKayttaja" runat="server" Width="120px" ></asp:TextBox> </td>
        <td> <asp:RequiredFieldValidator ID="rfvUser" ErrorMessage="Anna käyttäjä" ControlToValidate="txtKayttaja" runat="server" /></td>
        
        <td>Salasana: <asp:TextBox ID="txtSala" TextMode="Password" runat="server" Width="120px" ></asp:TextBox></td>
        <td> <asp:RequiredFieldValidator ID="rfvSala" ErrorMessage="Anna salasana" ControlToValidate="txtSala" runat="server" /></td>

        <td><asp:Button ID="btnKirjaudu" runat="server" Width="100px" Text="Kirjaudu" onClick="btnKirjaudu_Click" /></td>
    </tr>
    <tr>
        <td><asp:Label ID="lblKirjautuminen" runat="server"></asp:Label></td>
    </tr>

    </table>

                    <h2>VE2</h2>
                    <table>
    <tr><td>Käyttäjä: <asp:TextBox ID="txtHashkayttaja" runat="server" Width="120px" ></asp:TextBox> </td>
        <td> <asp:RequiredFieldValidator ID="rfvHashUser" ErrorMessage="Anna käyttäjä" ControlToValidate="txtHashkayttaja" runat="server" /></td>

        <td>Salasana: <asp:TextBox ID="txtHashsala" TextMode="Password" runat="server" Width="120px" ></asp:TextBox></td>
         <td> <asp:RequiredFieldValidator ID="rfvHashSala" ErrorMessage="Anna salasana" ControlToValidate="txtHashsala" runat="server" /></td>
        </tr>
        <tr>
        <td><asp:Button ID="btnHashkirjaudu" runat="server" Width="100px" Text="Kirjaudu" CausesValidation="false" onClick="btnHashkirjaudu_Click" /></td>
    </tr>
    <tr>
        <td><asp:Label ID="lblHashkirjautuminen" runat="server"></asp:Label></td>
    </tr>

    </table>


</div>
<div>
    <asp:GridView ID="grdViewAuto" runat="server"
        AllowPaging="True" AutoGenerateColumns="False" TabIndex="1"
        DataKeyNames="aid" Width="100%" BackColor="White" GridLines="Vertical"
        CellPadding="3" BorderStyle="None" BorderWidth="1px" BorderColor="#999999"
        OnRowDataBound="grdViewAuto_RowDataBound"
        OnPageIndexChanging="grdViewAuto_PageIndexChanging">
        <Columns>
            <asp:BoundField DataField="aid" HeaderText="aid" />
            <asp:BoundField DataField="rekkari" HeaderText="rekkari" />
            <asp:BoundField DataField="merkki" HeaderText="merkki" />
            <asp:BoundField DataField="malli" HeaderText="malli" />
            <asp:BoundField DataField="vm" HeaderText="vm" />
            <asp:BoundField DataField="myyntiHinta" HeaderText="myyntiHinta" />
            <asp:BoundField DataField="sisaanOstoHinta" HeaderText="sisaanOstoHinta" />
        </Columns>
        <RowStyle BackColor="#EEEEEE" ForeColor="Black" />
        <FooterStyle BackColor="#CCCCCC" ForeColor="Black" />
        <PagerStyle BackColor="#999999" ForeColor="Black" HorizontalAlign="Right" />
        <SelectedRowStyle BackColor="#008A8C" Font-Bold="true" ForeColor="White" />
        <HeaderStyle BackColor="#000084" Font-Bold="True" ForeColor="White" />
        <AlternatingRowStyle BackColor="#DCDCDC" />
    </asp:GridView>
        </div>
    </div>
    </form>
</body>
</html>
