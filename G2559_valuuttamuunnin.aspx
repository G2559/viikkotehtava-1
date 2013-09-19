<%@ Page Title="IIO13200 Tehtava 1" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="G2559_valuuttamuunnin.aspx.cs" Inherits="G2559_valuuttamuunnin" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

    </br>
    Terve: <asp:TextBox ID="txtUser" runat="server"></asp:TextBox></br>
    Muunnan BitCoinit euroiksi, anna BitCoinien määrä: 
    <asp:TextBox ID="txtCurrency" runat="server"></asp:TextBox></br><asp:Button ID="Button1" runat="server" Text="Muunna" />
   <asp:Label ID="lblCurrency" runat="server" Text="..." /></br> 
    <asp:ListBox ID="lstOne" runat="server"></asp:ListBox>
    <asp:ListBox ID="lstTwo" runat="server"></asp:ListBox>
</asp:Content>



