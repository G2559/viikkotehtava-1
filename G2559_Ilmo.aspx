<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Ilmo.aspx.cs" Inherits="Ilmo" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <title>Syksyn 2013 ilmottautumiset</title>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <asp:SqlDataSource ID="srcIlmot"
        ConnectionString="Data Source=eight.labranet.jamk.fi;Initial Catalog=DemoxOy;Persist Security Info=True;User ID=koodari;Password=koodari13"
        SelectCommand="SELECT asioid, lastname, firstname, date FROM lasnaolot WHERE course like 'IIO13200%' ORDER BY asioid" runat="server">
        </asp:SqlDataSource>

    <asp:SqlDataSource ID="SqlDataSource1"
        ConnectionString="Data Source=eight.labranet.jamk.fi;Initial Catalog=DemoxOy;Persist Security Info=True;User ID=koodari;Password=koodari13"
        SelectCommand="SELECT DISTINCT course FROM lasnaolot" runat="server">
        </asp:SqlDataSource>
    

    <form id="form1" method="post">
    <br />
    Sukunimi: <asp:TextBox ID="txtSukunimi" runat="server"></asp:TextBox>

        <asp:RequiredFieldValidator id="RequiredFieldValidator1" runat="server"
                      ControlToValidate="txtSukunimi"
                      ErrorMessage="Vain kirjaimia!"
                      ForeColor="Red">
                    </asp:RequiredFieldValidator>

        <br />

    Opintojakso: <asp:DropDownList ID="DropDownIlmot" runat="server"
             AutoPostBack="True" DataSourceID="SqlDataSource1" DataTextField="course"></asp:DropDownList><br />
    <asp:Button ID="btnHae" Text="Hae" runat="server" OnClick="btnHae_Click" />

    </form>


    <h2>Syksyn läsnäolot</h2>
    <asp:GridView runat="server" DataSourceID="srcIlmot"></asp:GridView>
</asp:Content>

