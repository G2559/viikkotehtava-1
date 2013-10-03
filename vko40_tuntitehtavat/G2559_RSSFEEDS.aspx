<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="G2559_RSSFEEDS.aspx.cs" Inherits="vko40_tuntitehtavat_G2559_RSSFEEDS" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
   <asp:XmlDataSource ID="myDataSource" runat="server"
       XPath="rss/channel/item" />

    <asp:Button ID="btnGetMS" runat="server"
        OnClick="btnGetMS_Click" Text="Microsoft" />
    <asp:Button ID="btnIS" runat="server"
        OnClick="btnGetIS_Click" Text="IltaSanomat" />
     <asp:Button ID="btnGetLiiga" runat="server"
        OnClick="btnGetLiiga_Click" Text="Liiga" />
    <h1><asp:Label ID="lblHeader" runat="server" Text="..." /></h1>
    <asp:Label ID="lblBody" runat="server" Text="..." />
    <asp:Table ID="myDataTable" runat="server" />

        <asp:XmlDataSource ID="XmlDataSource2" runat="server" DataFile="<%$ AppSettings:rssFeeditSF %>"
        TransformFile="~/App_Data/rssfeeds.xsl" XPath="rss/channel/item" />
        <asp:GridView ID="myGridView" runat="server" DataSourceID="XmlDataSource2" AutoGenerateColumns="true" />
</asp:Content>
