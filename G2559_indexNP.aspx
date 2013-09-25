<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="G2559_indexNP.aspx.cs" Inherits="G2559_indexNP" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <h1>VKO 37</h1>
     <div>
        <asp:HyperLink ID="HyperLink5" runat="server" NavigateUrl="~/G2559_index.aspx">Viikkotehtävän 0 ratkaisu</asp:HyperLink><br />
        <asp:HyperLink ID="HyperLink6" runat="server" NavigateUrl="~/G2559_LocalDBDemo.aspx">lehvoja</asp:HyperLink><br />
        
    </div>
    <div>
        <h1>VKO 38</h1>
        <asp:HyperLink ID="HyperLink8" runat="server" NavigateUrl="~/G2559_age.aspx">Iän laskenta Kalenter-komponentilla</asp:HyperLink><br /></div>

        <div><h2>Tehtävät 1 & 2</h2>
        <asp:TextBox ID="txtName" runat="server" Text="Tähän nimesi" ></asp:TextBox>
        <asp:Button ID="Button1" runat="server" Text="Välitä parametrinä" />
        <asp:Button ID="Button2" runat="server" Text="Tallenna sessioniin" />
        <asp:Button ID="Button3" runat="server" Text="Tallenna cookieihin" />

            </div>

    <div>
        <br />
         <asp:HyperLink ID="HyperLinkT1" runat="server" NavigateUrl="~/G2559_Default2.aspx">Viikkotehtävän 1 ratkaisu</asp:HyperLink><br />
    </div>

    <div>
        <br />
        <asp:HyperLink ID="HyperLinkT2" runat="server" NavigateUrl="~/G2559_elakelaskuri.aspx">Viikkotehtävän 2 ratkaisu</asp:HyperLink><br />

    </div>

</asp:Content>

        
