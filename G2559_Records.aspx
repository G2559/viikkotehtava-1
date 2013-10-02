<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="G2559_Records.aspx.cs" Inherits="G2559_Records" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

<asp:XmlDataSource ID="myRecords" DataFile="~/App_Data/Records.xml" runat="server" TransformFile="~/App_Data/Records.xsl"></asp:XmlDataSource>
<asp:XmlDataSource ID="XmlDataSource1" DataFile="~/App_Data/Records.xml" runat="server" ></asp:XmlDataSource>
 <asp:XmlDataSource ID="XmlDataSource2" DataFile="~/App_Data/Records2.xml" runat="server" ></asp:XmlDataSource>  
    <h1>Osta hyvä veli tai sisko halpa levy</h1>
    <asp:GridView ID="gvlevyt" DataSourceID="myRecords" runat="server" AutoGenerateColumns="true"></asp:GridView>
</asp:Content>

