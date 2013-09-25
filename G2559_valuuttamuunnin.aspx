<%@ Page Title="IIO13200 Tehtava 1" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="G2559_valuuttamuunnin.aspx.cs" Inherits="G2559_valuuttamuunnin" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <br/>
    Terve: <asp:TextBox ID="txtUser" runat="server" Enabled="False"></asp:TextBox><br/>
    Muunnan bitcoinit euroiksi, anna BitCoinien määrä: <asp:TextBox ID="txtCurrency" runat="server"></asp:TextBox>
    <asp:Button ID="Button1" runat="server" OnClick="Button1_Click" Text="Muunna" />
    <br />
    <asp:Label ID="lblCurrency" runat="server" Text="..." /><br/>
    <asp:ListBox ID="lstOne" runat="server"></asp:ListBox>
    <asp:ListBox ID="lstTwo" runat="server" EnableViewState="False"></asp:ListBox>
</asp:Content>



