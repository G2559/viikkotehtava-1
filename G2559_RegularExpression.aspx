<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="G2559_RegularExpression.aspx.cs" Inherits="G2559_RegularExpression" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">



    
    <form id="form1" method="post">
        <div>
        Nimi:
        <input name="txtNimi" type="text" />       
        <asp:Label ID="lblValidoi1" runat="server"></asp:Label>
         
        </div>
        <div>
        Sposti:
        <input name="txtSposti" type="text"/>
        <asp:Label ID="lblValidoi2" runat="server"></asp:Label> <br />
        <input name="btnSposti" type="Submit" value="Validoi"/>

        </div>
    </form>
    



</asp:Content>

