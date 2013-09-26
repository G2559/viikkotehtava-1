<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="G2559_SqlDataSource.aspx.cs" Inherits="G2559_SqlDataSource" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">


    <asp:SqlDataSource 
        ID ="srcMovies" 
        ConnectionString="Data Source=eight.labranet.jamk.fi;Initial Catalog=Movie;Persist Security Info=True;User ID=koodari;Password=koodari13"
        SelectCommand="SELECT title, director, year FROM Movies"
        runat="server">
    </asp:SqlDataSource>

    <asp:GridView ID="GridView1" DataSourceID="srcMovies" runat="server" />
    
    <h2>DataList kontrolli</h2>
    <p>DataList esittää datan HTML-taulussa, määritetään esitettävä data ItemTemplatella</p>

    <asp:DataList ID="DataList1" DataSourceID="srcMovies" runat="server">
        <ItemTemplate>Elokuvan <%#Eval("title") %> on ohjannut <%#Eval("director") %>
        </ItemTemplate>
    </asp:DataList>

    <h2>Repeater -kontrolli</h2>
    <p>Repeater näyttää datarivejä käyttäen templatea, ei renderöi automaattisesti HTML-taulua</p>
    <asp:Repeater ID="Repeater1" DataSourceID="srcMovies" runat="server">
        <ItemTemplate>
            Movie <%#Eval("title")%> directed by <b><%#Eval("director") %></b><br />
        </ItemTemplate>
    </asp:Repeater>

    <h2>ListView -kontrolli</h2>
    <p>Tämäkin näyttää datarivejä käyttäen templatea, tukee sorttausta, sivutusta ja datan editointia</p>
    <asp:ListView ID="ListView1" DataSourceID="srcMovies" runat="server">
        <LayoutTemplate>
            <div id="itemPlaceholder" runat="server" />
            <asp:DataPager ID="pager1" PageSize="4" runat="server">
                <Fields>
                    <asp:NumericPagerField />
                </Fields>
            </asp:DataPager>
        </LayoutTemplate>
        <ItemTemplate>
            <b>Movie <%#Eval("title")%> </b> directed by <%#Eval("director") %><br />
        </ItemTemplate>
    </asp:ListView>


</asp:Content>

