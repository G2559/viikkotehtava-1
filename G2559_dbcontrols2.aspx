<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="G2559_dbcontrols2.aspx.cs" Inherits="G2559_dbcontrols2" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

     <asp:SqlDataSource 
        ID ="srcMovies" 
        ConnectionString="Data Source=eight.labranet.jamk.fi;Initial Catalog=Movie;Persist Security Info=True;User ID=koodari;Password=koodari13"
        SelectCommand="SELECT title, director, year FROM Movies"
        runat="server">
    </asp:SqlDataSource>

    <h1>DataControls to display a single data item</h1>
    <h2>DetailsView -control</h2>
    <p>Näyttää datan HTML-taulussa, tarvittaessa mahdollistaa lisäämisen ja muokkaamisen</p>
    <asp:DetailsView ID="DetailsView" DataSourceID="srcMovies" runat="server" AllowPaging="true" />
        
    <h2>FormView -control</h2>
    <p>Näyttää datan ItemTemplaten avulla</p>
    <asp:FormView ID="FormView1" DataSourceID="srcMovies" runat="server" AllowPaging="true" >
        <ItemTemplate>
            <h3><%#Eval("title")%><br /> directed by <%#Eval("director") %> at year <%#Eval("year") %></h3>
        </ItemTemplate>
    </asp:FormView>
</asp:Content>

