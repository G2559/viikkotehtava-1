<%@ Page Language="C#" AutoEventWireup="true" CodeFile="G2559_Valipalaute.aspx.cs" Inherits="Valipalaute" %>

<!DOCTYPE html>

<script runat="server">
    string backgroundColorValipalaute =
         ConfigurationManager.AppSettings["backgroundColorValipalaute"];
</script>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Opintojaksopalaute</title>
    <link href="ValiPalauteTausta.css" rel="stylesheet" type="text/css" />
</head>
<body style="background-color:<%=backgroundColorValipalaute%>">
    <form id="form1" runat="server">
    <div>
<div id="otsikko" align="center">
            <h1>Opintojakson palaute</h1>
            </div>
            <div id="nelio">
                <div id="leftcolumn">
                    <h2 align="center">Anna palaute</h2><br />
                    Pvm: <asp:TextBox ID="txtPvm" runat="server"></asp:TextBox>

                    <asp:RequiredFieldValidator id="RequiredFieldValidator1" runat="server"
                      ControlToValidate="txtPvm"
                      ErrorMessage="!"
                      ForeColor="Red">
                    </asp:RequiredFieldValidator>

                    Nimi :<asp:TextBox ID="txtNimi" runat="server" Width="158px"></asp:TextBox>
                    <br/>

                    <asp:RequiredFieldValidator id="RequiredFieldValidator2" runat="server"
                      ControlToValidate="txtNimi"
                      ErrorMessage="!"
                      ForeColor="Red">
                    </asp:RequiredFieldValidator>

                    Olen oppinut:<asp:TextBox ID="txtOppinut" runat="server" TextMode="MultiLine"></asp:TextBox>
                    <br/>

                    <asp:RequiredFieldValidator id="RequiredFieldValidator3" runat="server"
                      ControlToValidate="txtOppinut"
                      ErrorMessage="!"
                      ForeColor="Red">
                    </asp:RequiredFieldValidator>

                    Haluan oppia:<asp:TextBox ID="txtHaluanoppia" runat="server" TextMode="MultiLine"></asp:TextBox>

                    <asp:RequiredFieldValidator id="RequiredFieldValidator4" runat="server"
                      ControlToValidate="txtHaluanoppia"
                      ErrorMessage="!"
                      ForeColor="Red">
                    </asp:RequiredFieldValidator>
            </div>
                <h2>palaute jatkuu</h2><br />
                Hyvää: <asp:TextBox ID="txtHyvaa" runat="server" TextMode="MultiLine"></asp:TextBox> 

                <asp:RequiredFieldValidator id="RequiredFieldValidator5" runat="server"
                      ControlToValidate="txtHyvaa"
                      ErrorMessage="!"
                      ForeColor="Red">
                    </asp:RequiredFieldValidator>
                <br />

                Parannettavaa: <asp:TextBox ID="txtParannettavaa" runat="server" TextMode="MultiLine"></asp:TextBox>

                <asp:RequiredFieldValidator id="RequiredFieldValidator6" runat="server"
                      ControlToValidate="txtParannettavaa"
                      ErrorMessage="!"
                      ForeColor="Red">
                    </asp:RequiredFieldValidator>
                <br />

                Muuta: <asp:TextBox ID="txtMuuta" runat="server" TextMode="MultiLine"></asp:TextBox>
                 <br />

                <asp:Button ID="btnLaheta" runat="server" Text="Lähetä palaute" OnClick="btnLaheta_Click" />
                </div>
            </div>

        <div>
            <h2> Palautteet</h2> <br />

            <asp:Button ID="btnGetPalautteet" runat="server" Text="Näytä palautteet" OnClick="btnGetPalautteet_Click" CausesValidation="false" />
         
            <asp:GridView ID="gvpalautteet" runat="server" BackColor="#ffffff"></asp:GridView> <br />
                
            <h2>Haettu:  
                <asp:Label ID="lbltulokset" runat="server" Text=""></asp:Label>
                palautetta</h2>
            
        </div>

        </form>
</body>
</html>
