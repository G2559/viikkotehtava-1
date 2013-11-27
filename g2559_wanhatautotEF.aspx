<%@ Page Language="C#" AutoEventWireup="true" CodeFile="g2559_wanhatautotEF.aspx.cs" Inherits="g2559_wanhatautotEF" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Jinta-Roupin autot</title>
    <link href="auto.css" rel="stylesheet" type="text/css" />
</head>
<body>
    <form id="form1" runat="server">
    <div>
    
    </div>
        <div id="nelio">
        <asp:GridView ID="GridView1" runat="server" AllowSorting="True" AutoGenerateColumns="False" DataKeyNames="aid" DataSourceID="EntityDataSource1">
            <Columns>
                <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" />
                <asp:BoundField DataField="aid" HeaderText="aid" ReadOnly="True" SortExpression="aid" />
                <asp:BoundField DataField="rekkari" HeaderText="rekkari" SortExpression="rekkari" />
                <asp:BoundField DataField="merkki" HeaderText="merkki" SortExpression="merkki" />
                <asp:BoundField DataField="malli" HeaderText="malli" SortExpression="malli" />
                <asp:BoundField DataField="vm" HeaderText="vm" SortExpression="vm" />
                <asp:BoundField DataField="myyntiHinta" HeaderText="myyntiHinta" SortExpression="myyntiHinta" />
                <asp:BoundField DataField="sisaanOstoHinta" HeaderText="sisaanOstoHinta" SortExpression="sisaanOstoHinta" />
            </Columns>
        </asp:GridView>
        <asp:EntityDataSource ID="EntityDataSource1" runat="server" ConnectionString="name=autokantaEntities" DefaultContainerName="autokantaEntities" EnableDelete="True" EnableFlattening="False" EnableInsert="True" EnableUpdate="True" EntitySetName="Auto" EntityTypeFilter="Auto">
        </asp:EntityDataSource>
        <asp:FormView ID="FormView1" DefaultMode="Insert" runat="server" DataKeyNames="aid" DataSourceID="EntityDataSource1">
            
            <InsertItemTemplate>
                aid:
                <asp:TextBox ID="aidTextBox" runat="server" Text='<%# Bind("aid") %>' />
                <br />
                rekkari:
                <asp:TextBox ID="rekkariTextBox" runat="server" Text='<%# Bind("rekkari") %>' />
                <br />
                merkki:
                <asp:TextBox ID="merkkiTextBox" runat="server" Text='<%# Bind("merkki") %>' />
                <br />
                malli:
                <asp:TextBox ID="malliTextBox" runat="server" Text='<%# Bind("malli") %>' />
                <br />
                vm:
                <asp:TextBox ID="vmTextBox" runat="server" Text='<%# Bind("vm") %>' />
                <br />
                myyntiHinta:
                <asp:TextBox ID="myyntiHintaTextBox" runat="server" Text='<%# Bind("myyntiHinta") %>' />
                <br />
                sisaanOstoHinta:
                <asp:TextBox ID="sisaanOstoHintaTextBox" runat="server" Text='<%# Bind("sisaanOstoHinta") %>' />
                <br />
                <asp:LinkButton ID="InsertButton" runat="server" CausesValidation="True" CommandName="Insert" Text="Insert" />
                &nbsp;<asp:LinkButton ID="InsertCancelButton" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancel" />
            </InsertItemTemplate>
            <ItemTemplate>
                aid:
                <asp:Label ID="aidLabel" runat="server" Text='<%# Eval("aid") %>' />
                <br />
                rekkari:
                <asp:Label ID="rekkariLabel" runat="server" Text='<%# Bind("rekkari") %>' />
                <br />
                merkki:
                <asp:Label ID="merkkiLabel" runat="server" Text='<%# Bind("merkki") %>' />
                <br />
                malli:
                <asp:Label ID="malliLabel" runat="server" Text='<%# Bind("malli") %>' />
                <br />
                vm:
                <asp:Label ID="vmLabel" runat="server" Text='<%# Bind("vm") %>' />
                <br />
                myyntiHinta:
                <asp:Label ID="myyntiHintaLabel" runat="server" Text='<%# Bind("myyntiHinta") %>' />
                <br />
                sisaanOstoHinta:
                <asp:Label ID="sisaanOstoHintaLabel" runat="server" Text='<%# Bind("sisaanOstoHinta") %>' />
                <br />
                <asp:LinkButton ID="EditButton" runat="server" CausesValidation="False" CommandName="Edit" Text="Edit" />
                &nbsp;<asp:LinkButton ID="DeleteButton" runat="server" CausesValidation="False" CommandName="Delete" Text="Delete" />
                &nbsp;<asp:LinkButton ID="NewButton" runat="server" CausesValidation="False" CommandName="New" Text="New" />
            </ItemTemplate>
        </asp:FormView>
            </div>
    </form>
</body>
</html>
