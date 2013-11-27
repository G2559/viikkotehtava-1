<%@ Page Language="C#" AutoEventWireup="true" CodeFile="G2559_WanhatAutotAsiakasEF.aspx.cs" Inherits="G2559_WanhatAutotAsiakasEF" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Asiakkaan autot</title>
    <link href="auto.css" rel="stylesheet" type="text/css" />
</head>
<body>
    <form id="form1" runat="server">
    <div id="nelio">
        <asp:EntityDataSource ID="EntityDataSource1" runat="server" ConnectionString="name=autokantaEntities" DefaultContainerName="autokantaEntities" EnableFlattening="False" EntitySetName="Auto" EntityTypeFilter="Auto" Select="it.[rekkari], it.[merkki], it.[malli], it.[vm], it.[myyntiHinta]">
        </asp:EntityDataSource>
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
        <asp:GridView ID="gvAuto" runat="server" DataSourceID="EntityDataSource1" AutoGenerateColumns="False">
            <Columns>
                <asp:BoundField DataField="rekkari" HeaderText="rekkari" ReadOnly="True" SortExpression="rekkari" />
                <asp:BoundField DataField="merkki" HeaderText="merkki" ReadOnly="True" SortExpression="merkki" />
                <asp:BoundField DataField="malli" HeaderText="malli" ReadOnly="True" SortExpression="malli" />
                <asp:BoundField DataField="vm" HeaderText="vm" ReadOnly="True" SortExpression="vm" />
                <asp:BoundField DataField="myyntiHinta" HeaderText="myyntiHinta" ReadOnly="True" SortExpression="myyntiHinta" />
            </Columns>
        </asp:GridView>
        <br />
        <asp:TextBox ID="txtmerkki" runat="server"></asp:TextBox>
        <asp:Button ID="btnHae" runat="server" Text="Hae" OnClick="btnHae_Click" />
    </div>
    </form>
</body>
</html>
