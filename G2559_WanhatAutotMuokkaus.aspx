<%@ Page Language="C#" AutoEventWireup="true" CodeFile="G2559_WanhatAutotMuokkaus.aspx.cs" Inherits="G2559_WanhatAutotMuokkaus" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Wanhat autot</title>
    <link href="auto.css" rel="stylesheet" type="text/css" />
</head>
<body>
    <form id="form1" runat="server">
        <div>
<div id="otsikko" align="center">
        <h1>Wanhoja autoja</h1>
    </div>
            <div id="nelio">
                <div id="sisalto">
    <table>
        <tr>
            <td>aid</td>
            <td><asp:TextBox ID="txtaid" runat="server" Width="120px" ReadOnly="true"></asp:TextBox> </td>
            <td style="width:100px"></td><td></td>
          
            <td>rekkari</td>
            <td><asp:TextBox ID="txtrekkari" runat="server" Width="120px" ></asp:TextBox> </td>
            <td class="auto-style1"><asp:RequiredFieldValidator ID="rfvrekkari" runat="server" ControlToValidate="txtrekkari" 
            SetFocusOnError="true" ValidationGroup="Save" ForeColor="Red" Display="Dynamic">*</asp:RequiredFieldValidator></td>
            <td><asp:CustomValidator runat="server" ID="cvRekkari" ControlToValidate="txtrekkari" 
            SetFocusOnError="true" ValidationGroup="Save" OnServerValidate="cusCustom_ServerValidate" 
            ForeColor="Red" Display="Dynamic" ErrorMessage="Virheellinen rekisteritunnus (muotoa AAA-333)" /></td>          
            

        </tr>
        <tr>
            <td>merkki</td>
            <td><asp:TextBox ID="txtmerkki" runat="server" Width="120px" ></asp:TextBox> </td>
            <td style="width:100px"><asp:RequiredFieldValidator ID="rfvmerkki" runat="server" ControlToValidate="txtmerkki" 
                SetFocusOnError="true" ValidationGroup="Save" ForeColor="Red" Display="Dynamic">*</asp:RequiredFieldValidator></td>
            <td></td>
            
            <td>malli</td>
            <td><asp:TextBox ID="txtmalli" runat="server" Width="120px" ></asp:TextBox> </td>
            <td class="auto-style1"><asp:RequiredFieldValidator ID="rfvInsertMerkki" runat="server" ControlToValidate="txtmalli" 
                SetFocusOnError="true" ValidationGroup="Save" ForeColor="Red" Display="Dynamic">*</asp:RequiredFieldValidator></td>

           
        </tr>
        <tr>
            <td>vm</td>
            <td><asp:TextBox ID="txtvm" runat="server" Width="120px" ></asp:TextBox> </td>
            <td style="width:100px"><asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtvm" 
                SetFocusOnError="true" ValidationGroup="Save" ForeColor="Red" Display="Dynamic">*</asp:RequiredFieldValidator></td>
            <td><asp:CustomValidator runat="server" ID="cvVm" ControlToValidate="txtvm" 
                SetFocusOnError="true" ValidationGroup="Save" OnServerValidate="cvVuosimalli_ServerValidate" 
                ForeColor="Red" Display="Dynamic" ErrorMessage="Syötä vuosi" /></td>
            

            <td>myyntiHinta</td>
            <td><asp:TextBox ID="txtmyyntiHinta" runat="server" Width="120px" ></asp:TextBox> </td>
            <td class="auto-style1"><asp:RequiredFieldValidator ID="rfvmyyntiHinta" runat="server" ControlToValidate="txtmyyntiHinta" 
                SetFocusOnError="true" ValidationGroup="Save" ForeColor="Red" Display="Dynamic">*</asp:RequiredFieldValidator></td>
            <td><asp:CustomValidator runat="server" ID="cvMyyntihinta" ControlToValidate="txtmyyntiHinta" 
                SetFocusOnError="true" ValidationGroup="Save" OnServerValidate="cvMyyntihinta_ServerValidate" 
                ForeColor="Red" Display="Dynamic" ErrorMessage="Syötä hinta" /></td>

        </tr>
        <tr>           
            <td>sisaanOstoHinta</td>
            <td><asp:TextBox ID="txtsisaanOstoHinta" runat="server" Width="120px" ></asp:TextBox> </td>
            <td style="width:100px"><asp:RequiredFieldValidator ID="rfvsisaanOstoHinta" runat="server" ControlToValidate="txtsisaanOstoHinta" 
                SetFocusOnError="true" ValidationGroup="Save" ForeColor="Red" Display="Dynamic">*</asp:RequiredFieldValidator></td>
            <td><asp:CustomValidator runat="server" ID="cvOstohinta" ControlToValidate="txtsisaanOstoHinta" 
                SetFocusOnError="true" ValidationGroup="Save" OnServerValidate="cvMyyntihinta_ServerValidate" 
                ForeColor="Red" Display="Dynamic" ErrorMessage="Syötä hinta" /></td>
            
            <td>&nbsp;</td>

        </tr>
        <tr>
            <td colspan="5" style="text-align:center">
                <asp:Button ID="btnSave" runat="server" Width="100px" Text="Save" onclick="btnSave_Click" ValidationGroup="Save" />
                <asp:Button ID="btnClear" runat="server" Width="100px" Text="Clear" CausesValidation="false" onclick="btnClear_Click" />
            </td>
        </tr>
        <tr>
            <td colspan="5">
                <asp:Label runat="server" ID="lblMessage" Text="" ></asp:Label>
                <asp:HiddenField ID="hndId" runat="server" Value="" />
            </td>
        </tr>
    </table>
</div>
<div>
    <asp:GridView ID="grdViewAuto" runat="server"
        AllowPaging="True" AutoGenerateColumns="False" TabIndex="1"
        DataKeyNames="aid" Width="100%" BackColor="White" GridLines="Vertical"
        CellPadding="3" BorderStyle="None" BorderWidth="1px" BorderColor="#999999"
        OnRowDataBound="grdViewAuto_RowDataBound"
        OnPageIndexChanging="grdViewAuto_PageIndexChanging"
        onselectedindexchanging="grdViewAuto_SelectedIndexChanging"
        onrowdeleting="grdViewAuto_RowDeleting">
        <Columns>
            <asp:CommandField ShowSelectButton="True" HeaderText="Select" ItemStyle-HorizontalAlign="Center" />
            <asp:CommandField ShowDeleteButton="True" HeaderText="Delete" ItemStyle-HorizontalAlign="Center" />
            <asp:BoundField DataField="aid" HeaderText="aid" />
            <asp:BoundField DataField="rekkari" HeaderText="rekkari" />
            <asp:BoundField DataField="merkki" HeaderText="merkki" />
            <asp:BoundField DataField="malli" HeaderText="malli" />
            <asp:BoundField DataField="vm" HeaderText="vm" />
            <asp:BoundField DataField="myyntiHinta" HeaderText="myyntiHinta" />
            <asp:BoundField DataField="sisaanOstoHinta" HeaderText="sisaanOstoHinta" />
        </Columns>
        <RowStyle BackColor="#EEEEEE" ForeColor="Black" />
        <FooterStyle BackColor="#CCCCCC" ForeColor="Black" />
        <PagerStyle BackColor="#999999" ForeColor="Black" HorizontalAlign="Right" />
        <SelectedRowStyle BackColor="#008A8C" Font-Bold="true" ForeColor="White" />
        <HeaderStyle BackColor="#000084" Font-Bold="True" ForeColor="White" />
        <AlternatingRowStyle BackColor="#DCDCDC" />
    </asp:GridView>
        </div>
    </div>
    </form>
</body>
</html>
