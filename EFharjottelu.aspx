<%@ Page Language="C#" AutoEventWireup="true" CodeFile="EFharjottelu.aspx.cs" Inherits="EFharjottelu" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <asp:GridView ID="GridView1" runat="server" AllowSorting="True" AutoGenerateColumns="False" DataKeyNames="id" DataSourceID="EntityDataSource1">
            <Columns>
                <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" />
                <asp:BoundField DataField="id" HeaderText="id" ReadOnly="True" SortExpression="id" />
                <asp:BoundField DataField="nimi" HeaderText="nimi" SortExpression="nimi" />
                <asp:BoundField DataField="hinta" HeaderText="hinta" SortExpression="hinta" />
            </Columns>
        </asp:GridView>
        <asp:EntityDataSource ID="EntityDataSource1" runat="server" ConnectionString="name=koeharjotteluEntities" DefaultContainerName="koeharjotteluEntities" EnableDelete="True" EnableFlattening="False" EnableInsert="True" EnableUpdate="True" EntitySetName="vehkeet">
        </asp:EntityDataSource>
    </div>
    </form>
</body>
</html>
