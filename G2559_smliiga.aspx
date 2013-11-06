<%@ Page Language="C#" AutoEventWireup="true" CodeFile="G2559_smliiga.aspx.cs" Inherits="G2559_smliiga" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    
    </div>
</body>
</html>
<asp:dropdownlist ID="drpjoukkueet" runat="server"  AutoPostBack="True"  OnSelectedIndexChanged="drpjoukkueet_SelectedIndexChanged"></asp:dropdownlist>
<asp:dropdownlist ID="drppelipaikka"  AutoPostBack="True" runat="server" OnSelectedIndexChanged="drppelipaikka_SelectedIndexChanged"></asp:dropdownlist>
    <asp:Button ID="Button1" runat="server" OnClick="Button1_Click" style="height: 26px" Text="Näytä kaikki" />
<asp:GridView ID="gvArticle" runat="server"  AllowSorting="True" OnSorting="gvArticle_Sorting" onrowediting="EditPlayer"  onrowupdating="UpdatePlayer"  onrowcancelingedit="CancelEdit" AutoGenerateEditButton="True">
<columns>
                <asp:BoundField  ReadOnly="True" 
                                HeaderText="sukunimi"
                                DataField="sukunimi"
                                SortExpression="sukunimi"/>
</columns>
</asp:GridView>
    <asp:sqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>" SelectCommand="SELECT * FROM [Pisteet]"></asp:sqlDataSource>
   
</form>

